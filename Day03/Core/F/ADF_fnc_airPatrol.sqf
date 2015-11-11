/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: air patrol script
Author: Whiztler
Script version: 1.00

Game type: N/A
File: ADF_fnc_airPatrol.sqf
****************************************************************
This is an patrol function for aircraft. You can use it on pre-existing groups
or the function can create the group for you as well

INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";

*** PATROL ONLY ***

Config:
[
	group,				// Group name - Name of the group.
	position,				// Marker or Trigger Placed on water!
	radius,				// Number - Radius from the start position in which a waypoint is created
	Altitude,				// At which altitude should the aircraft patrol (above groud/sea level in meters)
	waypoints,			// Number - Number of waypoint for the patrol
	waypoint type,			// String. Info: https://community.bistudio.com/wiki/Waypoint_types
	behaviour,			// String. Info: https://community.bistudio.com/wiki/setWaypointBehaviour
	combat mode,			// String. Info: https://community.bistudio.com/wiki/setWaypointCombatMode
	speed,				// String. Info: https://community.bistudio.com/wiki/waypointSpeed
	formation,			// String. Info: https://community.bistudio.com/wiki/waypointFormation
	completion radius		// Number. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
] call ADF_fnc_airPatrol;

Example for scripted groups:
[_grp, _Position, 1000, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_airPatrol;
[_grp, getMarkerPos "PatrolMarker", 1000, 100, 6, "MOVE", "SAFE", "RED", "LIMITED","FILE", 250] call ADF_fnc_airPatrol;

Notes

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";

*** CREATE GROUP + PATROL ***

Config:
[
	Spawn position,		// E.g. getMarkerPos "Spawn" -or- Position Player
	Patrol position,		// E.g. getMarkerPos "Patrol" -or- Position Player
	side,				// WEST, EAST or INDEPENDENT
	Aircraft,				// Number:
						// 1 - Unarmed transport helicopter
						// 2 - Armed transport helicopter
						// 3 - Attack helicopter
						// 4 - Fighter jet
						// 5 - UAV
	radius,				// Number - Radius from the start position in which a waypoint is created
	Altitude,				// Number - At which altitude should the aircraft patrol (above groud/sea level in meters)	
	waypoints,			// Number - Number of waypoint for the patrol
	waypoint type,			// String. Info: https://community.bistudio.com/wiki/Waypoint_types
	behaviour,			// String. Info: https://community.bistudio.com/wiki/setWaypointBehaviour
	combat mode,			// String. Info: https://community.bistudio.com/wiki/setWaypointCombatMode
	speed,				// String. Info: https://community.bistudio.com/wiki/waypointSpeed
	formation,			// String. Info: https://community.bistudio.com/wiki/waypointFormation
	completion radius		// Number. Info: https://community.bistudio.com/wiki/setWaypointCompletionRadius
] call ADF_fnc_createAirPatrol;

Example for scripted groups:
[_spawnPos, PatrolPos, WEST, 1, 2500, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_createAirPatrol;
[getMarkerPos "myMarker", getMarkerPos "PatrolMarker", EAST, 2, 3500, 50, 6, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_createAirPatrol;

Notes

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
****************************************************************/

ADF_fnc_addAirWaypoint = {
	// init	
	params ["_g","_p","_r","_t","_b","_m","_s","_f","_cr"];
	private ["_wp"];

	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - WP radius: %1",_r]};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (before check): %1",_p]};
	_p = [_p] call ADF_fnc_checkPosition;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_addWaypoint - passed pos (after check): %1",_p]};
	
	_p = [_p, _r, ((random 180) + (random 180))] call ADF_fnc_randomPos;				
	
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


ADF_fnc_airPatrol = {
	params [
		"_g",
		"_p",
		["_r",2500,[0]],
		["_h",100,[0]],
		["_c",4,[0]],
		["_t", ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER"], [""]],
		["_b", ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"], [""]],
		["_m", ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"], [""]],
		["_s", ["UNCHANGED","LIMITED","NORMAL","FULL"], [""]],
		["_f", ["NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"], [""]],
		["_cr",250,[0]]
	];
	private ["_a","_i","_cx","_gl"];

	_a = [_g,_p,_r,_t,_b,_m,_s,_f,_cr];

	// Loop through the number of waypoints needed
	for "_i" from 0 to _c do {
		_a call ADF_fnc_addAirWaypoint;
		if (ADF_debug) then {diag_log " "; diag_log format ["ADF Debug: ADF_fnc_airPatrol - called ADF_fnc_addAirWaypoint for WP %1",_i]};
	};
	
	// Add a cycle waypoint
	_cx =+ _a;
	_cx set [3, "CYCLE"];
	_cx call ADF_fnc_addWaterWaypoint;
	if (ADF_debug) then {diag_log " "; diag_log "ADF Debug: ADF_fnc_airPatrol - called ADF_fnc_addAirWaypoint for cycle WP"};

	// Remove the spawn/start waypoint
	deleteWaypoint ((waypoints _g) select 0);
	
	// Set the patrol altitude
	_gl = leader _g;
	(vehicle _gl) flyInHeight _h;
};

ADF_fnc_createAirPatrol = {
	// Init
	params [
		"_vs",
		"_vp",
		["_gs", [WEST, EAST, INDEPENDENT], [WEST]],
		["_gc", 1,[0]],
		["_r",2500,[0]],
		["_h",100,[0]],		
		["_c",4,[0]],
		["_t", ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER"], [""]],
		["_b", ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"], [""]],
		["_m", ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"], [""]],
		["_s", ["UNCHANGED","LIMITED","NORMAL","FULL"], [""]],
		["_f", ["NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"], [""]],
		["_cr",5,[0]]
	];
	private ["_g","_v","_vc"];
	_vc	= "";

	_ps 	= [_vs] call ADF_fnc_checkPosition;
	_pp 	= [_vp] call ADF_fnc_checkPosition;	

	if (_gs == WEST) then {
		switch (_gc) do {
			case 1: {_vc = ["B_Heli_Light_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_unarmed_green_F"] call BIS_fnc_selectRandom};
			case 2: {_vc = ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_Heli_Transport_03_black_F"] call BIS_fnc_selectRandom};
			case 3: {_vc = ["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"] call BIS_fnc_selectRandom};
			case 4: {_vc = "B_Plane_CAS_01_F"};
			case 5: {_vc = "B_UAV_02_CAS_F"};
		}
	};
	if (_gs == EAST) then {
		switch (_gc) do {		
			case 1: {_vc = ["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Transport_04_black_F"] call BIS_fnc_selectRandom};
			case 2: {_vc = ["O_Heli_Light_02_F","O_Heli_Light_02_v2_F"] call BIS_fnc_selectRandom};
			case 3: {_vc = ["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F"] call BIS_fnc_selectRandom};
			case 4: {_vc = "O_Plane_CAS_02_F"};
			case 5: {_vc = "O_UAV_02_CAS_F"};
		};
	};
	if (_gs == INDEPENDENT) then {
		switch (_gc) do {
			case 1: {_vc = ["I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F"] call BIS_fnc_selectRandom};
			case 2: {_vc = "I_Heli_light_03_F"};
			case 3: {_vc = "I_Heli_light_03_F"};
			case 4: {_vc = ["I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F"] call BIS_fnc_selectRandom};
			case 5: {_vc = "I_UAV_02_CAS_F"};
		};
	};
	
	_g = createGroup _gs;
	_v 	= [_ps, (random 360), _vc, _g] call BIS_fnc_spawnVehicle;

	[_g, _pp, _r, _h, _c, _t, _b, _m, _s , _f , _cr] call ADF_fnc_airPatrol;
	
	true	
};