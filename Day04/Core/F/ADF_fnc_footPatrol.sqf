/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: foot patrol script
Author: Whiztler
Script version: 1.02

Game type: N/A
File: ADF_fnc_footPatrol.sqf
****************************************************************
This is an infantry foot patrol function. You can use it on pre-existing groups
or the function can create the group for you as well

INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";

*** PATROL ONLY ***

Config:
[
	group,				// Group name - Name of the group.
	position,				// Array or Position - E.g. getMarkerPos "Spawn" -or- Position Player
	radius,				// Number - Radius from the start position in which a waypoint is created
	waypoints,			// Number - Number of waypoint for the patrol
	waypoint type,			// String. Info: https://community.bistudio.com/wiki/Waypoint_types
	behaviour,			// String. Info: https://community.bistudio.com/wiki/setWaypointBehaviour
	combat mode,			// String. Info: https://community.bistudio.com/wiki/setWaypointCombatMode
	speed,				// String. Info: https://community.bistudio.com/wiki/waypointSpeed
	formation,			// String. Info: https://community.bistudio.com/wiki/waypointFormation
	completion radius		// Number. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
] call ADF_fnc_footPatrol;

Example for scripted groups:
[_grp, _Position, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
[_grp, getMarkerPos "PatrolMarker", 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;

Notes

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";

*** CREATE GROUP + PATROL ***

Config:
[
	position,				// Marker, Object or Trigger. E.g.. getMarkerPos "Spawn" -or- "SpawnPos" -or- MyObject
	side,				// WEST, EAST or INDEPENDENT
	group size,			// 2 (sentry), 4 (fireteam), 8 squad
	weapons squad,			// TRUE or FALSE
	radius,				// Number - Radius from the start position in which a waypoint is created
	waypoints,			// Number - Number of waypoint for the patrol
	waypoint type,			// String. Info: https://community.bistudio.com/wiki/Waypoint_types
	behaviour,			// String. Info: https://community.bistudio.com/wiki/setWaypointBehaviour
	combat mode,			// String. Info: https://community.bistudio.com/wiki/setWaypointCombatMode
	speed,				// String. Info: https://community.bistudio.com/wiki/waypointSpeed
	formation,			// String. Info: https://community.bistudio.com/wiki/waypointFormation
	completion radius		// Number. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
] call ADF_fnc_createFootPatrol;

Example for scripted groups:
[_spawnPos, WEST, 6, FALSE, 300, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_createFootPatrol;
[getMarkerPos "myMarker", EAST, 8, TRUE, 500, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_createFootPatrol;

Notes

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
****************************************************************/

ADF_fnc_addLandWaypoint = {
	// init	
	params ["_g","_p","_r","_t","_b","_m","_s","_f","_cr"];
	private ["_wp"];

	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - WP radius: %1",_r]};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (before check): %1",_p]};
	_p = [_p] call ADF_fnc_checkPosition;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (after check): %1",_p]};

	// Find a position within the parameters (near to the random position)
	for "_i" from 1 to 3 do {
		private ["_pos"];		
		_pos = [_p, _r, random 360] call ADF_fnc_randomPos;				
		if !(surfaceIsWater _pos) exitWith {_p = _pos};
		_r = _r + 25;
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


ADF_fnc_footPatrol = {
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
		_a call ADF_fnc_addLandWaypoint;
		if (ADF_debug) then {diag_log " "; diag_log format ["ADF Debug: ADF_fnc_footPatrol - called ADF_fnc_addLandWaypoint for WP %1",_i]};
	};
	
	// Add a cycle waypoint
	_cx =+ _a;
	_cx set [3, "CYCLE"];
	_cx call ADF_fnc_addLandWaypoint;
	if (ADF_debug) then {diag_log " "; diag_log "ADF Debug: ADF_fnc_footPatrol - called ADF_fnc_addLandWaypoint for cycle WP"};

	// Remove the spawn/start waypoint
	deleteWaypoint ((waypoints _g) select 0);
};

ADF_fnc_createFootPatrol = {
	// Init
	params [
		"_p",
		["_gs", [WEST, EAST, INDEPENDENT], [WEST]],
		["_gc", 5,[0]],
		["_gw", FALSE, [FALSE]],
		["_r",250,[0]],
		["_c",4,[0]],
		["_t", ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER"], [""]],
		["_b", ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"], [""]],
		["_m", ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"], [""]],
		["_s", ["UNCHANGED","LIMITED","NORMAL","FULL"], [""]],
		["_f", ["NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"], [""]],
		["_cr",5,[0]]
	];
	private ["_g","_gSize","_gSide","_gFact","_gID","_gStr"];
	_gID		= "";
	_gSide	= "";
	_gFact	= "";
	
	// check group size/type
	switch (_gc) do {
		case 1;
		case 2: {_gSize = "InfSentry"};
		case 3;
		case 4;
		case 5: {_gSize = "InfTeam"};
		case 6;
		case 7;
		case 8: {if (_gw) then {_gSize = "InfSquad_Weapons"} else {_gSize = "InfSquad"}};		
		default {_gSize = "InfTeam"};
	};
	
	switch (_gs) do {
		case WEST:		{_gSide = "WEST"; _gFact = "BLU_F"; _gID = "BUS_"};
		case EAST: 		{_gSide = "EAST"; _gFact = "OPF_F"; _gID = "OIA_"};
		case INDEPENDENT:	{_gSide = "INDEP"; _gFact = "IND_F"; _gID = "HAF_"};
	};
	
	_gStr = _gID + _gSize;

	//Create the group
	_g = [_p, _gs, (configFile >> "CfgGroups" >> _gSide >> _gFact >> "Infantry" >> _gStr)] call BIS_fnc_spawnGroup;

	[_g, _p, _r, _c, _t, _b, _m, _s , _f , _cr] call ADF_fnc_footPatrol;
	
	true	
};