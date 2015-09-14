/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: (Create) Vehicle patrol script
Author: Whiztler
Script version: 1.04

Game type: N/A
File: ADF_fnc_vehiclePatrol.sqf
****************************************************************
This is a vehicle patrol function. You can use it on pre-created
(editor or scripter) vehicles or the function can create the vehicle
as well.

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

Example for editor placed vehicles:
[group this, "MyMarker", 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

Example for scripted vehicles:
[_grp, _myPosition, 800, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
[_c, "PatrolMarker", 1000, 6, "MOVE", "SAFE", "RED", "LIMITED",25] call ADF_fnc_vehiclePatrol;

Notes
The function looks for roads. If no nearby road is found a waypoint is created in the 'field'. Make sure the
initial position is close to roads (or on a road) and roads are within the radius. 
Keep the radius below 1500 else the script might take a long time to search for suitable locations.
The patrol start position and the vehicle spawn position do not need to be the same, e.g.:

_c = createGroup INDEPENDENT;
_v = [getMarkerPos _spawnPos, markerDir _spawnPos, "I_G_Offroad_01_F", _c] call BIS_fnc_spawnVehicle;
[_c, getMarkerPos _patrolPos, 1000, 6, "MOVE", "SAFE", "RED", "LIMITED",25] call ADF_fnc_vehiclePatrol;

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
if !(isNil "ADF_fnc_vehiclePatrolExec") exitWith {};
ADF_fnc_vehiclePatrolExec = true;
// These functions require the ADF_fnc_position.sqf to be loaded. Check if already loaded
if (isNil "ADF_fnc_positionExec") then {call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf"};

ADF_fnc_vehiclePatrolTest = true; // for performance debugging. Use in combination with ADF_debug (true)

ADF_fnc_addRoadWaypoint = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	// init	
	params ["_g","_p","_r","_c","_t","_b","_m","_s","_cr"];
	private ["_wp","_i","_rx"];
	_rx = _r / _c; // radius divided by number of waypoints
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - WP radius: %1",_rx]};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - passed pos (before check): %1",_p]};
	_p = _p call ADF_fnc_checkPosition;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - passed pos (after check): %1",_p]};
	_rd = [];

	// Find road position within the parameters (near to the random position)
	for "_i" from 1 to 4 do {
		private ["_pos"];
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - pos before ADF_fnc_randomPos: %1",_p]};
		_pos = [_p, _r, random 360] call ADF_fnc_randomPos;
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addRoadWaypoint - pos after ADF_fnc_randomPos: %1",_pos]};
		_rd = [_pos,_rx] call ADF_fnc_roadPos;		
		if (isOnRoad _rd) exitWith {ADF_VPS = [_i,_rx]};
		_rx = _rx + 250;
		if (_i == 3) then {_rx = _rx + 500};
		ADF_VPS = [_i,_rx];
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
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	_debugStart = diag_tickTime;	
	
	// Init
	params ["_g","_p","_r","_c","_t","_b","_m","_s","_cr"];
	private ["_a"];
	_a = [_g,_p,_r,_c,_t,_b,_m,_s,_cr];
	
	// Loop through the number of waypoints needed
	for "_i" from 0 to _c do {_a call ADF_fnc_addRoadWaypoint;};
	
	// Add a cycle waypoint
	_cycle =+ _a;
	_cycle set [4, "CYCLE"];
	_cycle call ADF_fnc_addRoadWaypoint;

	// Remove the spawn/start waypoint
	deleteWaypoint ((waypoints _g) select 0);
	
	// Debug
	_debugStop = diag_tickTime;
	if (ADF_Debug && ADF_fnc_vehiclePatrolTest) then {diag_log format ["ADF Debug: ADF_fnc_vehiclePatrol - %1 -- %2 search(es)",_debugStart - _debugStop, ADF_VPS select 0]};
	
	// Destroy vars not needed anymore
	ADF_VPS = nil;
};

ADF_fnc_createVehiclePatrol = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	_debugStart = diag_tickTime;
	
	// Init
	params ["_gs","_vc","_vm","_vd","_vp","_r","_c","_t","_b","_m","_s","_cr"];
	private ["_v","_a"];
	
	//Create the vehicle
	_g 	= createGroup _gs;
	_p 	= _vm call ADF_fnc_checkPosition;
	_vd	= if (typeName _vm == "STRING") then {markerDir _vm} else {getDir _vm};
	_v 	= [getMarkerPos _p, _vd, _vc, _g] call BIS_fnc_spawnVehicle;
	
	// Array to pass
	_a = [_g,_vp,_r,_c,_t,_b,_m,_s,_cr];	
	
	// Loop through the number of waypoints needed
	for "_i" from 0 to _c do {_a call ADF_fnc_addRoadWaypoint;};
	
	// Add a cycle waypoint
	_cycle =+ _a;
	_cycle set [4, "CYCLE"];
	_cycle call ADF_fnc_addRoadWaypoint;

	// Remove the spawn/start waypoint if not the same as the spawn location
	if (_vm == _vp) then {deleteWaypoint ((waypoints _g) select 0)};
	
	// Debug
	_debugStop = diag_tickTime;
	if (ADF_Debug && ADF_fnc_vehiclePatrolTest) then {
		diag_log "--------------------------------------------------------------------------------------";
		diag_log format ["ADF Debug: ADF_fnc_createVehiclePatrol - %1 (%2 search(es) - radius: )",_debugStart - _debugStop, ADF_VPS select 0, ADF_VPS select 1];
		diag_log "--------------------------------------------------------------------------------------";
	};
	
	// Destroy vars not needed anymore
	ADF_VPS = nil;
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