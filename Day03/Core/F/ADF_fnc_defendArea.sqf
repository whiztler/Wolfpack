/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Defend area script
Author: Whiztler
Script version: 1.11

Game type: N/A
File: ADF_fnc_defendArea.sqf
****************************************************************
This is a defend/garrison script based on CBA_fnc_taskDefend by Rommel.
The script garrisons units in empty buildings, static weapons and vehicle
turrets.
Units that have not been garrisoned will go on patrol in the assigned
(radius) area.

INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";

Config:
[
	group,				// Group name - Name of the group.
	position,				// Array or Position - E.g. getMarkerPos "Spawn" -or- Position Player
	radius				// Number - Radius from the start position in which a waypoint is created
] call ADF_fnc_defendArea;

Example for scripted groups:
[_grp, _Position, 100] call ADF_fnc_defendArea;
[_grp, getMarkerPos "PatrolMarker", 75] call ADF_fnc_defendArea;

Notes

Lock (all) the vehicle to prevent AI's from populating the turret/static weapon

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_defendArea.sqf"; // Reporting. Do NOT edit/remove

ADF_fnc_buildingArr = {
	// init	
	params [["_p", [0,0,0], [[]], [3]],["_r",10,[0]]];
	private ["_b", "_bp", "_be"];	

	// Create the building array
	_b = nearestObjects [_p, ["building"], _r];
	if (count _b == 0) exitWith {[]};	
	
	// Check if building can be entered. Then check if the building has garrison positions. If no position available, remove the building from the array
	{
		_x setVariable ["ADF_garrPos", 0];
		_be = [_x] call BIS_fnc_isBuildingEnterable;
		_bp = [_x] call BIS_fnc_buildingPositions; 

		if (!_be || (count _bp == 0)) then {_b = _b - [_x]};
		_x setVariable ["ADF_garrPos", count _bp];
		
	} forEach _b;
	
	// return the building array
	_b
};

ADF_fnc_getTurrets = {
	// init
	params [["_p", [0,0,0], [[]], [3]],["_r",10,[0]]];
	private ["_t", "_a"];
	_t = [];
	_a = [];	
	
	// Create array of empty static turrets
	{_t append nearestObjects [_p, [_x], _r]} forEach ["TANK", "APC", "CAR", "StaticWeapon"];
	// Remove already populated turrest from the array
	{if ((_x emptyPositions "gunner") > 0 && ((count crew _x) == 0 && (locked _x) != 2)) then {_a append [_x]}} forEach _t;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea - Turrets array: %1", _a]};
	
	// return turrets array
	_a
};

ADF_fnc_setGarrison = {
	// init
	params ["_u", ["_p", [0,0,0], [[]], [3]],"_b"];
	
	// Move the unit inside the predefined building position
	_u doMove _p;
	sleep 5;
	waitUntil {unitReady _u};	
	//_u setPosATL [_p select 0, _p select 1, ( _p select 2) + .15]; // Direct placement without movement.
	_u disableAI "move";
	_u setUnitPos "UP";
	// Attempt to make the unit face outside 
	_u setDir (([_u, _b] call BIS_fnc_dirTo) - 180);
	doStop _u;
	
	_u setVariable ["ADF_garrSetBuilding", [true,_p]];
	
	waitUntil {sleep 1; !(unitReady _u)};
	_u enableAI "move";
};

ADF_fnc_setTurretGunner = {
	// init
	params ["_u"];
	
	// Increase gunner skill so they are more responsive to approaching enemies
	_u setSkill ["spotDistance",.7 + (random .3)];
	_u setSkill ["spotTime",.7 + (random .3)];
	_u setSkill ["aimingAccuracy",.5 + (random .5)];
	_u setSkill ["aimingSpeed",.5 + (random .5)];
	_u setCombatMode "YELLOW";

	true
};

ADF_fnc_defendAreaPatrol = {
	params ["_i", "_g", "_p", "_r"];
	private ["_gt","_u","_a"];

	// Init
	_u	= units _g;
	_a	= [];
	
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendAreaPatrol - Group units: %1", _u]};
	
	// Check if the unit is garrisoned
	{
		if !(_x getVariable ["ADF_garrSet", true]) then {
			_a append [_x];
			if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendAreaPatrol - Unit: %1 -- ADF_garrSet: %2", _x, _x getVariable "ADF_garrSet"]};
		}
	} forEach _u;	
	
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendAreaPatrol - # garrisoned units: %1 -- # patrol units: %2 -- Patrol units: %3", _i, count _a, _a]};
	
	// Create a new group for not-garrisoned units 
	_gt = createGroup (side _g);
	{[_x] joinSilent _gt} forEach _a;
	
	if (_r < 75) then {_r = 75};
	[_gt, _p, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
	_gt setVariable ["ADF_hc_garrison_ADF",false];
	_gt enableAttack true;
};

ADF_fnc_defendArea = {	
	params ["_g", "_p", ["_r",10,[0]]];
	private ["_a", "_b", "_bs", "_bp", "_t", "_u", "_c", "_ct", "_i", "_ADF_perfDiagStart", "_ADF_perfDiagStop"];
	
	// init
	_ADF_perfDiagStart = diag_tickTime;
	
	_a 	= [];
	_u	= units _g;
	_c	= count _u;
	_i	= 0;
	_l	= 0;	
	
	_p	= [_p] call ADF_fnc_checkPosition;
	_bs	= [_p,_r] call ADF_fnc_buildingArr;
	_t	= [_p,_r] call ADF_fnc_getTurrets;

	if (ADF_debug) then {
		diag_log format ["ADF Debug: ADF_fnc_defendArea - Group: %1 -- # units: %2", _g, _c];
		diag_log format ["ADF Debug: ADF_fnc_defendArea - Turrets found: %1", (count _t)];
	};
	
	_g enableAttack false;

	
	// Modified CBA_fnc_taskDefend by Rommel et all	
	{		
		// init
		_ct	= (count _t) - 1;
		_l = _l + 1;
		_x setVariable ["ADF_garrSet", false];
		
		if ((_ct > -1) && (_x != leader _g)) then {
			_x assignAsGunner (_t select _ct);
			_x moveInGunner (_t select _ct);
			[_x] call ADF_fnc_setTurretGunner;
			_t resize _ct;
			_x setVariable ["ADF_garrSet", true];
			_i = _i + 1;
		} else {
			if (count _bs > 0) then {
				private ["_b", "_bp", "_p"];
				_b = _bs call BIS_fnc_selectRandom;
				_p = _b getVariable "ADF_garrPos";
				if (isNil "_p") then {_p = 0};	
				
				if (_p > 0) then {
					_bp = floor (random _p);
					_p = _p - 1;
										
					if (_p == 0) then {
						_bs = _bs - [_b];
						_b setVariable ["ADF_garrPos", 0];
					} else {
						_b setVariable ["ADF_garrPos", _p];
					};
					
					[_x, _b buildingPos _bp, _b] spawn ADF_fnc_setGarrison;
					
					_x setVariable ["ADF_garrSet", true];
					_a append [[_x,_b buildingPos _bp]];
					_i = _i + 1;
				} else {if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea - No positions found for unit %1 (nr. %2)", _x, _l]}};
			};
		};
	} forEach _u;

	{_x setVariable ["ADF_garrPos", nil]} forEach _bs;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea - Unit garrisson array: %1", _a]};

	// Set HC loadbalancing variables
	_g setVariable ["ADF_hc_garrison_ADF", true];
	_g setVariable ["ADF_hc_garrisonArr", _a];
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea - ADF_hc_garrisonArr set for group: %1 -- array: %2", _g, _a]};

	// Non garrisoned units patrol the area	
	waitUntil {_c == _l};
	if (_i < _c) then {[_i, _g, _p, _r] spawn ADF_fnc_defendAreaPatrol};

	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea processed (DIAG: %1)", _ADF_perfDiagStop - _ADF_perfDiagStart]};
};

ADF_fnc_defendArea_HC = {
	// init
	params ["_a"];
	private ["_c","_i"];
	
	_c = count _a;
	if (_c == 0) exitWith {};
	_g = group ((_a select 0) select 0);	
	
	if (ADF_debug) then {diag_log "----------------------------------------------------------------------"; diag_log format ["ADF Debug: ADF_fnc_defendArea_HC - group: %1 -- array count: %2 -- array: %3", _g, _c, _a]};
	
	// reapply garrison position for each unit
	for "_i" from 0 to (_c - 1) do {
		private ["_u", "_ua", "_up"];
		_ua = _a select _i;
		_u	= _ua select 0;
		_up	= _ua select 1;
		
		_u setPosATL [_up select 0, _up select 1, ( _up select 2) + .15]; // Direct placement without movement.
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea_HC - SetPosATL for unit: %1 -- position: %2", _u, _up]};
		_u disableAI "move";
		_u setUnitPos "UP";
		doStop _u;
		
		waitUntil {sleep 1; !(unitReady _u)};
		_u enableAI "move";
	};
};