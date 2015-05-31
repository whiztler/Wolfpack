_g	= [];
_c 	= [];
_v 	= [];

if (isServer) then {
	[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
	[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
};

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

ADF_fnc_DeleteVehicles = {
	private ["_vehToDelete"];
	_vehToDelete = _this select 0;	
	{
		{deleteVehicle _x} forEach crew (vehicle _x) + [(vehicle _x)];
	} forEach _vehToDelete;
	true
};

// T100 convoy

[] spawn {
	sleep 500;
	_c = createGroup EAST; 
	_v = [getMarkerPos "mT100_spawn", markerDir "mT100_spawn", "O_MBT_02_cannon_F", _c] call BIS_fnc_spawnVehicle; armConvoy_1 = _v select 0; 
	_v = [(armConvoy_1 modelToWorld [0,-15,0]), getDir armConvoy_1, "O_MBT_02_cannon_F", _c] call BIS_fnc_spawnVehicle; armConvoy_2 = _v select 0;
	_c setCombatMode "GREEN";
	_wp = _c addWaypoint [getMarkerPos "mT100_1",0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_2",1]; _wp setWaypointType "MOVE"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_3",2]; _wp setWaypointType "MOVE"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_4",3]; _wp setWaypointType "MOVE"; 
	_wp = _c addWaypoint [getMarkerPos "mT100_5",4]; _wp setWaypointType "MOVE"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_end",5]; _wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true", "[[armConvoy_1,armConvoy_2]] call ADF_fnc_DeleteVehicles"];
	
	while {!(isNil "armConvoy_1")} do {
		armConvoy_1 limitSpeed 30;		
		armConvoy_2 limitSpeed (speed armConvoy_1);	
		sleep 1;
	};
};

// Foot patrols

_g = [getMarkerPos "p1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "p1", 700, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

_g = [getMarkerPos "p2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "p2", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

_g = [getMarkerPos "p3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "p3", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

_g = [getMarkerPos "p4", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "p4", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

_g = [getMarkerPos "p5", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "p5", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

_g = [getMarkerPos "p6", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "p6", 700, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

// Tech veh patrols

_c = createGroup EAST;
_v = [getMarkerPos "v1a", 90, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v1b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v1b", 1500, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

_c = createGroup EAST;
_v = [getMarkerPos "v2a", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 0.035;

_c = createGroup EAST;
_v = [getMarkerPos "v3a", 90, "O_Truck_02_transport_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;

_g = [getMarkerPos "v3a", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
_g = _g; { _x assignAsCargo (_v select 0); _x moveInCargo (_v select 0);} foreach units _g;
sleep 0.5;
_g = [getMarkerPos "v3a", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
_g = _g; { _x assignAsCargo (_v select 0); _x moveInCargo (_v select 0);} foreach units _g;