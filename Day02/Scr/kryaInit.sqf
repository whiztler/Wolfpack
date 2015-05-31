_grp		= [];
_c 		= [];
_v 		= [];

if (isServer) then {deleteMarker "popcorn";};

if (!ADF_HC_execute) exitWith {};

// Foot patrols
_grp = [getMarkerPos "kp1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "kp1", 700, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 2;

// Tech veh patrols
_c = createGroup EAST;
_v = [getMarkerPos "v1a", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v1b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v1b", 1000, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 3;

_c = createGroup EAST;
_v = [getMarkerPos "v2a", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 3;

_c = createGroup EAST;
_v = [getMarkerPos "v3a", 90, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1200, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 10;

_c = createGroup EAST;
_v = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNAP = _v select 0;
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wpc = _c addWaypoint [getMarkerPos "mNP5", 0]; _wpc setWaypointType "CYCLE"; _wpc setWaypointBehaviour "SAFE"; _wpc setWaypointSpeed "NORMAL";
_wpc setWaypointStatements ["true", "if (wpExfil == 1) then {this setDamage 1;};"];
sleep 1;

