/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: (Create) Vehicle patrol script
Author: Whiztler
Script version: 1.04

Game type: N/A
File: ADF_fnc_vehiclePatrol.sqf
****************************************************************
This is a vehicle patrol function. 

INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";


*** PATROL ONLY ***

in the init of the vehicle:
[
	group,				// Group name - Name of the group.
	position,				// Array or Position - E.g. getMarkerPos "Spawn" -or- Position Player
	radius,				// Number - Radius from the start position in which a waypoint is created
	waypoints,			// Number - Number of waypoint for the patrol
	waypoint type,			// String. Info: https://community.bistudio.com/wiki/Waypoint_types
	behaviour,			// String. Info: https://community.bistudio.com/wiki/setWaypointBehaviour
	combat mode,			// String. Info: https://community.bistudio.com/wiki/setWaypointCombatMode
	speed,				// String. Info: https://community.bistudio.com/wiki/waypointSpeed
	completion radius		// Number. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
] call ADF_fnc_vehiclePatrol;

Example for scripted vehicles:
[_grp, _myPosition, 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
[_c, "PatrolMarker", 1000, 6, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

Notes
The function looks for roads. If no nearby road is found a waypoint is created in the 'field'. Make sure the
initial position is close to roads (or on a road) and roads are within the radius. 
Keep the radius below 1500 else the script might take a long time to search for suitable locations.
The patrol start position and the vehicle spawn position do not need to be the same, e.g.:

_c = createGroup INDEPENDENT;
_v = [getMarkerPos _spawnPos, markerDir _spawnPos, "I_G_Offroad_01_F", _c] call BIS_fnc_spawnVehicle;
[_c, getMarkerPos _patrolPos, 1000, 6, "MOVE", "SAFE", "RED", "LIMITED",25] call ADF_fnc_vehiclePatrol;

Note this function requires the ADF_fnc_position.sqf and ADF_fnc_distance.sqf to be loaded:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";

*** CREATE VEHICLE + PATROL ***

[side, "vehicleClass", "SpawnMarker", "PatrolMarker", 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_createVehiclePatrol;

For example:
[INDEPENDENT, "I_G_Offroad_01_F", "mSpawn", "mPatrol", 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_createVehiclePatrol;

Note this function requires the ADF_fnc_position.sqf and ADF_fnc_distance.sqf to be loaded:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";

****************************************************************/

// Functions init
diag_log "ADF RPT: Init - executing ADF_fnc_vehiclePatrol.sqf"; // Reporting. Do NOT edit/remove

ADF_fnc_vehiclePatrolTest = true; // for performance debugging. Use in combination with ADF_debug (true)

ADF_fnc_addRoadWaypoint = {
	// init	
	params ["_g","_p","_r","_c","_t","_b","_m","_s","_cr"];	
	private ["_wp","_i","_rx"];
	_rx = _r / _c; // radius divided by number of waypoints
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - WP radius: %1 (%2 / %3)",_rx, _r, _c]};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - passed pos (before check): %1",_p]};
	_p = [_p] call ADF_fnc_checkPosition;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - passed pos (after check): %1",_p]};
	_rd = [];

	// Find road position within the parameters (near to the random position)
	for "_i" from 1 to 4 do {
		private ["_pos"];
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - pos before ADF_fnc_randomPos: %1",_p]};
		_pos = [_p, _r, random 360] call ADF_fnc_randomPos;
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - pos after ADF_fnc_randomPos: %1",_pos]};
		_rd = [_pos,_rx] call ADF_fnc_roadPos;		
		if (isOnRoad _rd) exitWith {true};
		_rx = _rx + 250;
		if (_i == 3) then {_rx = _rx + 500};
	};
	
	// Create the waypoint
	_wp = _g addWaypoint [_rd, 0];
	
	// add the waypoint parameters
	_wp setWaypointType _t;
	_wp setWaypointBehaviour _b;
	_wp setWaypointCombatMode _m;
	_wp setWaypointSpeed _s;
	_wp setWaypointCompletionRadius _cr;
	
	// return the waypoint
	_wp 
};

ADF_fnc_vehiclePatrol = {
	_debugStart = diag_tickTime;	
	
	// Init
	params [
		"_g",
		"_p",
		["_r", 750,[0]],
		["_c", 4, [0]],
		["_t", ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER"], [""]],
		["_b", ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"], [""]],
		["_m", ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"], [""]],
		["_s", ["UNCHANGED","LIMITED","NORMAL","FULL"], [""]],
		["_cr",25,[0]]
	];
	private ["_a"];
	_a = [_g,_p,_r,_c,_t,_b,_m,_s,_cr];
	
	// Loop through the number of waypoints needed
	for "_i" from 0 to (_c - 1) do {
		_a call ADF_fnc_addRoadWaypoint;
		if (ADF_debug) then {diag_log " "; diag_log format ["ADF Debug: ADF_fnc_vehiclePatrol - called ADF_fnc_addRoadWaypoint for WP %1",_i]};
	};
	
	// Add a cycle waypoint
	_cycle =+ _a;
	_cycle set [4, "CYCLE"];
	_cycle call ADF_fnc_addRoadWaypoint;
	if (ADF_debug) then {diag_log " "; diag_log "ADF Debug: ADF_fnc_vehiclePatrol - called ADF_fnc_addRoadWaypoint for cycle WP"};

	// Remove the spawn/start waypoint
	deleteWaypoint ((waypoints _g) select 0);
	
	// Debug
	_debugStop = diag_tickTime;
	if (ADF_Debug && ADF_fnc_vehiclePatrolTest) then {diag_log format ["ADF Debug: ADF_fnc_vehiclePatrol - %1",_debugStart - _debugStop]};
};

ADF_fnc_createVehiclePatrol = {
	_debugStart = diag_tickTime;
	
	// Init
	params [
		["_gs", [WEST, EAST, INDEPENDENT], [EAST]],
		["_vc", "", [""]],
		"_vs",
		"_vp",
		["_r", 750,[0]],
		["_c", 4, [0]],
		["_t", ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER"], [""]],
		["_b", ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"], [""]],
		["_m", ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"], [""]],
		["_s", ["UNCHANGED","LIMITED","NORMAL","FULL"], [""]],
		["_cr",25,[0]]
	];	
	private ["_g","_ps","_pp","_v","_vd","_a"];
	
	//Create the vehicle
	_g 	= createGroup _gs;
	_ps 	= [_vs] call ADF_fnc_checkPosition;
	_pp 	= [_vp] call ADF_fnc_checkPosition;
	_vd	= if (typeName _vs == "STRING") then {markerDir _vs} else {random 360};
	_v 	= [_ps, _vd, _vc, _g] call BIS_fnc_spawnVehicle;
	
	// Array to pass
	_a = [_g,_pp,_r,_c,_t,_b,_m,_s,_cr];	
	
	// Loop through the number of waypoints needed
	for "_i" from 0 to (_c - 1) do {_a call ADF_fnc_addRoadWaypoint;};
	
	// Add a cycle waypoint
	_cycle =+ _a;
	_cycle set [4, "CYCLE"];
	_cycle call ADF_fnc_addRoadWaypoint;

	// Remove the spawn/start waypoint if not the same as the spawn location
	if (_vs == _vp) then {deleteWaypoint ((waypoints _g) select 0)};
	
	// Debug
	_debugStop = diag_tickTime;
	if (ADF_Debug && ADF_fnc_vehiclePatrolTest) then {diag_log format ["ADF Debug: ADF_fnc_createVehiclePatrol DIAG: %1",_debugStart - _debugStop]};
};

/***************************************************
PERF DEBUGGING

Island: ALTIS
Params: [_c, getMarkerPos _spawnPos, 2500, 6, "MOVE", "SAFE", "RED", "LIMITED",25]
Perf  0.0930176 (1 searches)

Island: ZARGABAD
Params: [_c, getMarkerPos _spawnPos, 2500, 6, "MOVE", "SAFE", "RED", "LIMITED",25]
Perf  0.821045 (1 searches)

Island: TAKISTAN
[INDEPENDENT, "I_G_Offroad_01_F", "mSpawn", "mPatrol", 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25]
Perf  0.653076 (1 searches)

Island: CHERNARUS
[INDEPENDENT, "I_G_Offroad_01_F", "mSpawn", "mPatrol", 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25]
Perf  0.755005 (2 search(es)

Island: CHERNARUS
[INDEPENDENT, "I_G_Offroad_01_F", "mSpawn", "mPatrol", 2000, 7, "MOVE", "SAFE", "RED", "LIMITED", 25]
Perf  1.06201 (1 search(es)

Island: ALTIS
[INDEPENDENT, "I_G_Offroad_01_F", "mSpawn", "mPatrol", 2500, 7, "MOVE", "SAFE", "RED", "LIMITED", 25]
Perf  0.493958 (1 search(es)

Island: ALTIS
[INDEPENDENT, "I_G_Offroad_01_F", "mSpawn", "mPatrol", 5000, 8, "MOVE", "SAFE", "RED", "NORMAL", 25]
Perf  0.890015 (1 search(es)
***************************************************/