zbe_deleteUnitsNotLeaderFnc = {
	{deleteVehicle _x} forEach units _this - [leader _this];
};

zbe_deleteUnitsNotLeader = {
	{_x call zbe_deleteunitsnotleaderfnc} forEach allGroups;
};

zbe_cache = {
	_toCache = (units _group) - [(_leader)];
	{
		if (!(isPlayer _x) && {!("driver" in assignedVehicleRole _x)}) then {
			_x enableSimulationglobal false;
			_x hideObjectglobal true;
			_x disableAI "FSM"; // ADF 1.42
		};
	} forEach _toCache;
};

zbe_unCache = {
	{
		if (!(isPlayer _x) && {!("driver" in assignedVehicleRole _x)}) then {
			_x enableSimulationglobal true;
			_x hideObjectglobal false;
			_x enableAI "FSM";  // ADF 1.42
		};
	} forEach _toCache;
};

zbe_closestUnit = {
	private["_units", "_unit", "_dist", "_udist"];
	_units = _this select 0;
	_unit = _this select 1;
	_dist = 10^5;
	{
		_udist = _x distance2D _unit; // ADF 1.42
		if (_udist < _dist) then {_dist = _udist;};
	} forEach _units;
	_dist;
};

/* = {
	private ["_zbe_leader","_trigUnits"];
	_zbe_leader = _this select 0;
	_trigUnits = [];
		{if ((((side _x) getFriend (side _zbe_leader)) <= 0.6)) then {
		_trigUnits set [count _trigUnits, leader _x];
                };
        } forEach allGroups;
        _trigUnits = _trigUnits + ([] call BIS_fnc_listPlayers);
        _trigUnits;
};Old function that is no longer used, left here for reference*/

zbe_setPosLight = {
	{
		_testpos = (formationPosition _x);
		if (!(isNil "_testpos") && (count _testpos > 0)) then {
			if (!(isPlayer _x) && (vehicle _x == _x)) then {_x setPos _testpos;};
		};
	} forEach _toCache;
};

zbe_setPosFull = {
	{
		_testpos = (formationPosition _x);
		if (!(isNil "_testpos") && (count _testpos > 0)) then {
			if (!(isPlayer _x) && (vehicle _x == _x)) then {
				_x setPos _testpos;
				_x allowDamage false;
				[_x]	spawn {sleep 3;(_this select 0) allowDamage true;};
			};
		};
	} forEach _toCache;
};

zbe_removeDead = {
	{
		if !(alive _x) then {
			_x enableSimulation true;
			_x hideObject false;
			if (zbe_debug) then {diag_log format ["ZBE_Cache %1 died while cached from group %2, uncaching and removing from cache loop",_x,_group];};
			_toCache = _toCache - [_x];
		};
	} forEach _toCache;
};

zbe_cacheEvent = {
	({_x distance _leader < _distance} count zbe_players > 0) || !isNull (_leader findNearestEnemy _leader)
};

zbe_vehicleCache = {
	_vehicle enableSimulationGlobal false;
};

zbe_vehicleUncache = {
	_vehicle enableSimulationGlobal true;
};