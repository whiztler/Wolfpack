/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: sea patrol script
Author: Whiztler
Script version: 1.00

Game type: N/A
File: ADF_fnc_seaPatrol.sqf
****************************************************************
This is an patrol function for boats. You can use it on pre-existing groups
or the function can create the group for you as well

INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";

*** PATROL ONLY ***

Config:
[
	group,				// Group name - Name of the group.
	position,				// Marker or Trigger Placed on water!
	radius,				// Number - Radius from the start position in which a waypoint is created
	waypoints,			// Number - Number of waypoint for the patrol
	waypoint type,			// String. Info: https://community.bistudio.com/wiki/Waypoint_types
	behaviour,			// String. Info: https://community.bistudio.com/wiki/setWaypointBehaviour
	combat mode,			// String. Info: https://community.bistudio.com/wiki/setWaypointCombatMode
	speed,				// String. Info: https://community.bistudio.com/wiki/waypointSpeed
	formation,			// String. Info: https://community.bistudio.com/wiki/waypointFormation
	completion radius		// Number. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
] call ADF_fnc_seaPatrol;

Example for scripted groups:
[_grp, _Position, 1000, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_seaPatrol;
[_grp, getMarkerPos "PatrolMarker", 1000, 6, "MOVE", "SAFE", "RED", "LIMITED","FILE",5] call ADF_fnc_seaPatrol;

Notes

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";

*** CREATE GROUP + PATROL ***

Config:
[
	Spawn position,		// E.g. getMarkerPos "Spawn" -or- Position Player
	Patrol position,		// E.g. getMarkerPos "Patrol" -or- Position Player
	side,				// WEST, EAST or INDEPENDENT
	Vessel,				// 1 - speedboat minigun
						// 2 - assault boat (RHIB)
	Gunners,				// TRUE - driver + gunners
						// FALSE  driver only
	radius,				// Number - Radius from the start position in which a waypoint is created
	waypoints,			// Number - Number of waypoint for the patrol
	waypoint type,			// String. Info: https://community.bistudio.com/wiki/Waypoint_types
	behaviour,			// String. Info: https://community.bistudio.com/wiki/setWaypointBehaviour
	combat mode,			// String. Info: https://community.bistudio.com/wiki/setWaypointCombatMode
	speed,				// String. Info: https://community.bistudio.com/wiki/waypointSpeed
	formation,			// String. Info: https://community.bistudio.com/wiki/waypointFormation
	completion radius		// Number. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
] call ADF_fnc_createSeaPatrol;

Example for scripted groups:
[_spawnPos, PatrolPos, WEST, 1, FALSE, 300, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_createSeaPatrol;
[getMarkerPos "myMarker", getMarkerPos "PatrolMarker", EAST, 2, FALSE, 500, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_createSeaPatrol;

Notes

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
****************************************************************/

ADF_fnc_addWaterWaypoint = {
	// init	
	params ["_g","_p","_r","_t","_b","_m","_s","_f","_cr"];
	private ["_wp"];

	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - WP radius: %1",_r]};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (before check): %1",_p]};
	_p = [_p] call ADF_fnc_checkPosition;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (after check): %1",_p]};

	// Find a position within the parameters (near to the random position)
	for "_i" from 1 to 10 do {
		private ["_pos"];		
		_pos = [_p, _r, random 360] call ADF_fnc_randomPos;				
		if (surfaceIsWater _pos) exitWith {_p = _pos};
		_r = _r + 50;
	};
	
	// Create the waypoint
	_wp = _g addWaypoint [_p, 0];
	
	// add the waypoint parameters
	_wp setWaypointType _t;
	_wp setWaypointBehaviour _b;
	_wp setWaypointCombatMode _m;
	_wp setWaypointSpeed _s;
	_wp setWaypointFormation _f;
	_wp setWaypointCompletionRadius _cr;
	
	// return the waypoint
	_wp 
};


ADF_fnc_seaPatrol = {
	params [
		"_g",
		"_p",
		["_r",250,[0]],
		["_c",4,[0]],
		["_t", ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER"], [""]],
		["_b", ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"], [""]],
		["_m", ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"], [""]],
		["_s", ["UNCHANGED","LIMITED","NORMAL","FULL"], [""]],
		["_f", ["NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"], [""]],
		["_cr",5,[0]]
	];
	private ["_a","_i","_cx"];

	_a = [_g,_p,_r,_t,_b,_m,_s,_f,_cr];

	// Loop through the number of waypoints needed
	for "_i" from 0 to _c do {
		_a call ADF_fnc_addWaterWaypoint;
		if (ADF_debug) then {diag_log " "; diag_log format ["ADF Debug: ADF_fnc_seaPatrol - called ADF_fnc_addWaterWaypoint for WP %1",_i]};
	};
	
	// Add a cycle waypoint
	_cx =+ _a;
	_cx set [3, "CYCLE"];
	_cx call ADF_fnc_addWaterWaypoint;
	if (ADF_debug) then {diag_log " "; diag_log "ADF Debug: ADF_fnc_seaPatrol - called ADF_fnc_addWaterWaypoint for cycle WP"};

	// Remove the spawn/start waypoint
	deleteWaypoint ((waypoints _g) select 0);
};

ADF_fnc_createSeaPatrol = {
	// Init
	params [
		"_vs",
		"_vp",
		["_gs", [WEST, EAST, INDEPENDENT], [WEST]],
		["_gc", 1,[0]],
		["_gt", TRUE, [TRUE]],
		["_r",1000,[0]],
		["_c",4,[0]],
		["_t", ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER"], [""]],
		["_b", ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"], [""]],
		["_m", ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"], [""]],
		["_s", ["UNCHANGED","LIMITED","NORMAL","FULL"], [""]],
		["_f", ["NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"], [""]],
		["_cr",5,[0]]
	];
	private ["_g","_v","_vc","_cc","_bc","_i"];
	_vc	= "";
	_cc	= "";
	if (_gc == 2) then {_gt = FALSE};
	
	_ps 	= [_vs] call ADF_fnc_checkPosition;
	_pp 	= [_vp] call ADF_fnc_checkPosition;	

	if (_gs == WEST) then {
		if (_gc == 1) then {_vc = "B_Boat_Armed_01_minigun_F"} else {_vc = "B_Boat_Transport_01_F";};
		_cc = "B_Soldier_F";
	};
	if (_gs == EAST) then {
		if (_gc == 1) then {_vc = "O_Boat_Armed_01_hmg_F"} else {_vc = "O_Boat_Transport_01_F";};
		_cc = "O_Soldier_F";
	};
	if (_gs == INDEPENDENT) then {
		if (_gc == 1) then {_vc = "I_Boat_Armed_01_minigun_F"} else {_vc = "I_Boat_Transport_01_F";};
		_cc = "I_Soldier_F";
	};
	
	_v = createVehicle [_vc, _ps, [], 0, "NONE"];
	
	//Create the boat crew and assign to the position with the vessel
	_g	= createGroup _gs;
	_bc	= _g createUnit [_cc, _ps, [], 0, "CORPORAL"]; _bc moveInDriver _v;
	
	if (_gt) then {
		_bc	= _g createUnit [_cc, _ps, [], 0, "SERGEANT"]; _bc moveInCommander _v;
		_bc	= _g createUnit [_cc, _ps, [], 0, "SOLDIER"]; _bc moveInGunner _v;
	} else {
		for "_i" from 1 to 3 do {
			_bc = _g createUnit [_cc, _ps, [], 0, "SOLDIER"]; _bc moveInCargo _v;
		};	
	};

	[_g, _pp, _r, _c, _t, _b, _m, _s , _f , _cr] call ADF_fnc_seaPatrol;
	
	true	
};