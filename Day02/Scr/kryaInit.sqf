if (isServer) then {deleteMarker "popcorn";};
if (!ADF_HC_execute) exitWith {};

private ["_g","_c","_v","_wp","_wpc"];
// Foot patrols
_g = [getMarkerPos "kp1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "kp1", 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

// Tech veh patrols
_c = createGroup EAST;
_v = [getMarkerPos "v1a", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v1b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v1b", 1000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "v2a", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 6, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "v3a", 90, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1200, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNAP = _v select 0;
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wpc = _c addWaypoint [getMarkerPos "mNP5", 0]; _wpc setWaypointType "CYCLE"; _wpc setWaypointBehaviour "SAFE"; _wpc setWaypointSpeed "NORMAL";
_wpc setWaypointStatements ["true", "if (wpExfil == 1 && isServer) then {vNAP setDamage 1;};"];
sleep 1;

