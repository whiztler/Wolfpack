/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Dynamic Spawned Groups (DSG) - Foot Patrols
Author: Whiztler
Script version: 1.3

Game type: n/a
File: ADF_DSG-FootPatrols.sqf
****************************************************************
This script uses the CBA Task Patrol function. CBA is required!

Instructions:

Place an empty marker on the map and name it marker1. This is where the group spawns.
It also is the centre of the patrol area. Do the same for the markers of the other two
groups: marker2, marker3.
****************************************************************/

// Create local vars for all connected clients:
_g = []; // Infantry group/section/squad variable

// Groups are created by/on the HC or server and visible for all clients.
if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server
call ADF_fnc_missionBalance; // call the mission balancer

///// Group 1: 2 pax recon patrol
If (ADF_MB_lite || ADF_MB_normal || ADF_MB_heavy) then { // Mission Balancer: Lite, Normal; or Heavy
// Create a CSAT Recon Sentry group
_g = [
	getMarkerPos "marker1", // "marker1" is the location where the group is created
	EAST, // The side of the group
	(configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry") // See http://community.bistudio.com/wiki/Ambient_Combat_Manager_-_Group_types for different types of groups.
] call BIS_fnc_spawnGroup; // Function that creates the group

	// Set patrol options
	[
		_g, // Group local variable (does not need to be unique)
		getMarkerPos "marker1", // This is where the group will start patrolling. 
		125, // The radius in meters that determines the patrol size area.
		6, // The number of waypoints generated (use 4 to max 12 for really large areas. 5-7 is a good number.)
		"MOVE", // Waypoint type. ("MOVE", "DESTROY", "SAD", "SENTRY", "GUARD")
		"SAFE", // Behaviour type. ("CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH")
		"YELLOW", // Combat mode. ("BLUE" (Never fire), "GREEN" (Hold fire - defend only), "WHITE" (Hold fire, engage at will), "YELLOW" (Fire at will), "RED" (Fire at will, engage at will))
		"LIMITED", // Waypoint patrol speed. ("LIMITED", "NORMAL", "FULL")
		"COLUMN", // Patrol formation. ("COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND")
		"this spawn CBA_fnc_taskSearchHouse", // Units will search houses (does not work afaik)
		[1,4,9]
	] call CBA_fnc_taskPatrol; // Function (CBA) to create the patrol options
	sleep .035; // Procedural sleep
};

///// Group 2: 4 pax fire team "OIA_InfTeam"
If (ADF_MB_lite) then { // Mission Balancer: Lite only
	_g = [getMarkerPos "marker2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "marker2", 150, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
	sleep .035;
};

///// Group 3: 9 pax infantry squad "OIA_InfSquad"
If (ADF_MB_lite || ADF_MB_normal) then { // Mission Balancer: Lite or Normal
	_g = [getMarkerPos "marker3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "marker3", 150, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
	sleep .035;
};
