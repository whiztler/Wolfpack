/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: foot patrol script
Author: Whiztler
Script version: 1.09

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
	Search buildings		// TRUE / FALSE: search buildings within a 50 meter radius upon waypoint completion. Default = false
] call ADF_fnc_footPatrol;

Example for scripted groups:
[_grp, _Position, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, TRUE] call ADF_fnc_footPatrol;
[_grp, getMarkerPos "PatrolMarker", 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, FALSE] call ADF_fnc_footPatrol;

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
	Search buildings		// TRUE / FALSE: search buildings within a 50 meter radius upon waypoint completion. Default = false
] call ADF_fnc_createFootPatrol;

Example for scripted groups:
[_spawnPos, WEST, 6, FALSE, 300, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, TRUE] call ADF_fnc_createFootPatrol;
[getMarkerPos "myMarker", EAST, 8, TRUE, 500, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, FALSE] call ADF_fnc_createFootPatrol;

Notes

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
****************************************************************/

ADF_fnc_addLandWaypoint = {
	// init	
	params ["_g", "_p", "_r", "_t", "_b", "_m", "_s", "_f", "_cr", "_sb"];
	private ["_wp"];

	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - WP radius: %1",_r]};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (before check): %1",_p]};
	_p = [_p] call ADF_fnc_checkPosition;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (after check): %1",_p]};

	// Find a position within the parameters (near to the random position)
	for "_i" from 1 to 3 do {
		private ["_pos","_d"];
		_d = random 360;
		_pos = [_p, _r, _d] call ADF_fnc_randomPos;				
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
	if (_sb) then {_wp setWaypointStatements ["TRUE", "this spawn ADF_fnc_searchBuilding"]};	
	
	// return the waypoint
	_wp 
};


ADF_fnc_footPatrol = {
	params [
		"_g",
		"_p",
		["_r", 250, [0]],
		["_c", 4, [0]],
		["_t", ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD", "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "LOITER"], [""]],
		["_b", ["UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"], [""]],
		["_m", ["NO CHANGE", "BLUE", "GREEN", "WHITE", "YELLOW", "RED"], [""]],
		["_s", ["UNCHANGED", "LIMITED", "NORMAL", "FULL"], [""]],
		["_f", ["NO CHANGE", "COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND"], [""]],
		["_cr", 5, [0]],
		["_sb", false, [false]]
	];
	private ["_a", "_i", "_cx"];

	_a = [_g, _p, _r, _t, _b, _m, _s, _f, _cr, _sb];

	// Loop through the number of waypoints needed
	for "_i" from 0 to (_c - 1) do {
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
		["_t", ["MOVE", "DESTROY", "GETIN", "SAD", "JOIN", "LEADER", "GETOUT", "CYCLE", "LOAD", "UNLOAD", "TR UNLOAD", "HOLD", "SENTRY", "GUARD", "TALK", "SCRIPTED", "SUPPORT", "GETIN NEAREST", "DISMISS", "LOITER"], [""]],
		["_b", ["UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"], [""]],
		["_m", ["NO CHANGE", "BLUE", "GREEN", "WHITE", "YELLOW", "RED"], [""]],
		["_s", ["UNCHANGED", "LIMITED", "NORMAL", "FULL"], [""]],
		["_f", ["NO CHANGE", "COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND"], [""]],
		["_cr",5,[0]],
		["_sb", false, [false]]
	];
	private ["_g", "_gSize", "_gSide", "_gFact", "_gID", "_gStr"];
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

	[_g, _p, _r, _c, _t, _b, _m, _s, _f, _cr, _sb] call ADF_fnc_footPatrol;
	
	true	
};

ADF_fnc_searchBuilding = {
	params ["_a"];
	private ["_l", "_p", "_b", "_s", "_d", "_bp", "_i"];
	
	// init
	_g 	= group _a;
	_g lockwp true;
	_l	= leader _g;
	_p	= getPosASL _l;
	_s 	= 60; // maximum search time in seconds
	_d	= 50; // maximum distance unit to building to search
	
	if !(local _g) exitWith {if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - Group %1 -- Ownership changed. Current owner ID: %2 [EXITING]", _g, groupOwner _g]}};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - starting. Time: %1 (search timer: %2 seconds) -- Max. search distance: %3 meters", time, _s, _d]};
	
	// Check the closest building and verify that the diatance group leader, building is less than 50 meters
	_b	= nearestBuilding _p;
	if ((isNil "_b") || (_b == objNull) || ((_p distance (getPosASL _b)) > _d)) exitWith {
		_g lockwp false;
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - No results for group: %1 -- Building: %2 (distance: %4) -- Position group loader: %3", _g, _b, _p, round (_l distance _b)]};
	};
	
	// Get the building positions within the building
	_bp = [_b, 5] call BIS_fnc_buildingPositions;
	_bc = (count _bp);
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - Group: %1 -- Building: %2 (distance: %5) -- Positions: %3 (max: %4)", _g, _b, count _bp, _bc, round (_l distance _b)]};
	
	// Order the leader to search max 4 of the building positions within the building.
	for "_i" from 0 to _bc do {
		private ["_z"];
		_z = time + _s;
		if !(local _g) exitWith {if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - Group %1 -- Ownership changed. Current owner ID: %2", _g, groupOwner _g]}};
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - Time: %1 (max time: %2)", time, _z]};
		if (_i == _bc) exitWith {if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - Group: %1 -- Last position reached. Position: %2", _g, _i]}; _g lockwp false};
		_l commandMove (_b buildingPos _i);
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - SEARCHING Position: %1", _i]};		
		if (time > _z) exitWith {if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - Group: %1 -- Search timer (%2 seconds) ran out: %3 seconds. Time: %4", _g, _s, time - _z, time]}; _g lockwp false};
		waitUntil {sleep 1; unitready _l || !(local _g)};
		if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_searchBuilding - Finished Searching Position: %1 -- Time: %2", _i, time]};
	};	
};
