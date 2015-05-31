_grp 	= [];
_c 		= [];
_v 		= [];

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Foot patrols
_grp = [getMarkerPos "ap1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap1", 700, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep .05;

_grp = [getMarkerPos "ap2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap2", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep .05;

_grp = [getMarkerPos "ap3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap3", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep .05;

_grp = [getMarkerPos "a4", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap4", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep .05;

_grp = [getMarkerPos "a5", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap5", 200, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep .05;

// Foot patrols (city)

_grp = [getMarkerPos "kp1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "kp1", 700, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 2;

_grp = [getMarkerPos "kp2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "kp2", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 2;

_grp = [getMarkerPos "kp3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "kp3", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 2;

// Tech veh patrols

_c = createGroup EAST;
_v = [getMarkerPos "v1a", 90, "O_G_Offroad_01_armed_F", _c] call BIS_fnc_spawnVehicle;
vTP1 = _v select 0;
_wp = _c addWaypoint [getMarkerPos "v1b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v1b", 1500, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 3;

_c = createGroup EAST;
_v = [getMarkerPos "v2a", 100, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
vTP2 = _v select 0;
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 3;

_c = createGroup EAST;
_v = [getMarkerPos "v3a", 90, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;
vTP3 = _v select 0;
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 3;	

_c = createGroup EAST;
_v = [getMarkerPos "v2a", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 3;

_c = createGroup EAST;
_v = [getMarkerPos "v1a", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;