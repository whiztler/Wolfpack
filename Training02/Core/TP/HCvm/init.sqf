//	@file Name: vehicleManagerHC.sqf > Core\TP\HCvm\init.sqf
//	@file Author: AgentRev

// Edits by Whiztler ADF v1.39 B13

// This script will massively increase server FPS for missions with a lot of vehicles and players.
// It must be spawned or execVM'd once on the headless client

// If you decide to use this in another mission, a little mention in the credits would be appreciated :) - AgentRev


#define MAIN_LOOP_INTERVAL 3
#define LOOP_QUANTITY_PER_FRAME (50 / MAIN_LOOP_INTERVAL) // 16.67 = roughly 2500 vehicles updated every 3s
#define MIN_INIT_TIME 60
#define LOGGING_INTERVAL (5*60)
#define DISABLE_DISTANCE_VEHICLE 2000
#define DISABLE_DISTANCE_THING 1000

A3W_fnc_enableSimulationGlobal = {
	private ["_object", "_simul"];
	_object = _this select 0;
	_simul = _this select 1;

	if (typeName _object == "STRING") then { _object = objectFromNetId _object };

	if (isServer) then {
		_object enableSimulationGlobal _simul;
	};
};

A3W_fnc_loopSpread = {
	private ["_code", "_array", "_interval", "_oldCount", "_totalTime", "_qtyPerFrame", "_forceNonScheduled", "_newCount", "_maxQtyPerFrame", "_i", "_jCount", "_callFSM", "_j"];
	_code = _this select 0;
	_array = _this select 1;
	_interval = _this select 2;
	_oldCount = if (count _this > 3) then { _this select 3 } else { 0 };
	_totalTime = if (count _this > 4) then { _this select 4 } else { 0 };
	_qtyPerFrame = if (count _this > 5) then { _this select 5 } else { 10 };
	_forceNonScheduled = if (count _this > 6) then { _this select 6 } else { false };
	_newCount = count _array;
	_maxQtyPerFrame = if (count _this > 7) then { _this select 7 } else { _newCount };

	// Ajusting the _qtyPerFrame so as to spread processing as evenly as possible over the loop interval
	if (_oldCount > 0 && _totalTime > 0) then 	{
		_qtyPerFrame = _maxQtyPerFrame min ceil ((_qtyPerFrame / (_interval / _totalTime)) * (_newCount / _oldCount));
	};

	for "_i" from 0 to (_newCount - 1) step _qtyPerFrame do {
		if (_i >= _newCount) exitWith {};
		_jCount = (_qtyPerFrame min (_newCount - _i)) - 1;

		if (_forceNonScheduled) then {
			_callFSM = [[_array, _code, _i, _jCount],
			{
				_array = _this select 0;
				_code = _this select 1;
				_i = _this select 2;
				_jCount = _this select 3;

				for "_j" from 0 to _jCount do {
					(_array select (_i + _j)) call _code;
				};
			}] execFSM "Core\TP\HCvm\call.fsm";
			waitUntil {completedFSM _callFSM};
		}
		else {
			for "_j" from 0 to _jCount do {
				(_array select (_i + _j)) call _code;
			};
		};

		uiSleep 0.01;
	};
	_qtyPerFrame
};

A3W_vehicleManagerEventCode = {
	_vehicle = _this select 0;
	if (!simulationEnabled _vehicle) then { [_vehicle, true] call A3W_fnc_enableSimulationGlobal };
	_vehicle setVariable ["fpsFix_simulationCooloff", diag_tickTime + 23];
} call mf_compile;

A3W_vehicleManagerHC = {
	scopeName "vehicleManagerCall";
	private ["_vehicle", "_initTime", "_minDist", "_tryEnable", "_playerClose"];
	_vehicle = _this;

	_initTime = _vehicle getVariable ["fpsFix_initTime", 0];

	if (_initTime == 0) then 	{
		_initTime = diag_tickTime;
		_vehicle setVariable ["fpsFix_initTime", _initTime];
		_vehicle setVariable ["fpsFix_skip", !simulationEnabled _vehicle]; // don't touch vehicle if simulation is already disabled
	};

	if (diag_tickTime - _initTime < MIN_INIT_TIME || _vehicle getVariable ["fpsFix_skip", false]) exitWith {};

	switch (true) do 	{
		case (_vehicle isKindOf "Man"):          { breakOut "vehicleManagerCall" };
		case (_vehicle isKindOf "AllVehicles"):  { _minDist = DISABLE_DISTANCE_VEHICLE };
		case (_vehicle isKindOf "Thing"):        { _minDist = DISABLE_DISTANCE_THING };
		default                                  { breakOut "vehicleManagerCall" };
	};

	_tryEnable = true;
	_playerClose = false;

	{
		if (_x distance _vehicle <= _minDist) exitWith {_playerClose = true;};
	} forEach A3W_allPlayers;

	if (!_playerClose) then {
		if (count crew _vehicle == 0 &&
		   {_vehicle getVariable ["fpsFix_simulationCooloff", 0] < diag_tickTime &&
		    vectorMagnitude velocity _vehicle < 0.1 &&
		    (getPos _vehicle) select 2 < 1}) then 	{
			[_vehicle, false] call A3W_fnc_enableSimulationGlobal;
			_tryEnable = false;
		};
	};

	if (_tryEnable && !simulationEnabled _vehicle) then {
		[_vehicle, true] call fn_enableSimulationServer;
	};

	if !(_vehicle getVariable ["fpsFix_eventHandlers", false]) then {
		if (_vehicle isKindOf "AllVehicles") then {
			_vehicle addEventHandler ["GetIn", A3W_vehicleManagerEventCode];
		};

		if (_vehicle isKindOf "Thing") then {
			_vehicle addEventHandler ["EpeContactStart", A3W_vehicleManagerEventCode];
		};

		_vehicle addEventHandler ["Explosion", A3W_vehicleManagerEventCode];
		_vehicle addEventHandler ["Killed", A3W_vehicleManagerEventCode];
		_vehicle setVariable ["fpsFix_eventHandlers", true];
	};
};

A3W_fnc_allPlayers = {
	#define ADD_IF_PLAYER { if (isPlayer _x) then {_players pushBack _x }}

	private "_players";
	_players = [];
	ADD_IF_PLAYER forEach playableUnits;
	ADD_IF_PLAYER forEach allDeadMen;
	_players
};

_loopQty = LOOP_QUANTITY_PER_FRAME;
_oldCount = 0;
_totalTime = 0;
_lastLog = 0;

waitUntil {ADF_missionInit};

while {true} do {
	_startTime = diag_tickTime;
	_entities = entities "All";
	A3W_allPlayers = call A3W_fnc_allPlayers;

	_loopQty = [A3W_vehicleManagerHC, _entities, MAIN_LOOP_INTERVAL, _oldCount, _totalTime, _loopQty, true] call A3W_fnc_loopSpread;

	_oldCount = count _entities;

	if (_lastLog == 0 || diag_tickTime - _lastLog >= LOGGING_INTERVAL) then {
		diag_log format ["ADF RPT - HC vehicle mgt: %1 cached entities out of %2", {!simulationEnabled _x} count _entities, _oldCount];
		_lastLog = diag_tickTime;
	};

	_totalTime = diag_tickTime - _startTime;
	uiSleep (MAIN_LOOP_INTERVAL - _totalTime);
};