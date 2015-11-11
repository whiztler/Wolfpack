if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
if (!WP_convoyStarted) then {[180] execVM "Scr\convoy.sqf"}; // in case the RV has not been triggered.
WP_convoyStarted = true; publicVariable "WP_convoyStarted";

// Foot patrols
private "_g";
_g = [getMarkerPos "ap1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap1", 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ap2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap2", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ap3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap3", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "a4", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap4", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "a5", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap5", 200, 3, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

// Foot patrols (city)
_g = [getMarkerPos "kp1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "kp1", 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "kp2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "kp2", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "kp3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "kp3", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

// Tech veh patrols
private ["_c","_v","_wp"];
_c = createGroup EAST;
_v = [getMarkerPos "v1a", 90, "O_G_Offroad_01_armed_F", _c] call BIS_fnc_spawnVehicle;
vTP1 = _v select 0;
_wp = _c addWaypoint [getMarkerPos "v1b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v1b", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "v2a", 100, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
vTP2 = _v select 0;
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "v3a", 90, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;
vTP3 = _v select 0;
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

sleep 10;
_c = createGroup EAST;
_v = [getMarkerPos "v2a", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "v3a", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;