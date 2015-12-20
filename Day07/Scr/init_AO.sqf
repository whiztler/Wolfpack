diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

private ["_c","_g","_v","_wp","_p"];
// Naval Patrols
_c = createGroup EAST;
_v = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";

// Chalkeia Bay beach patrol
_g = [getMarkerPos "mP1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
_wp = _g addWaypoint [getMarkerPos "mP1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getMarkerPos "mP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getMarkerPos "mP3", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";	

// Road patrols
for "_i" from 1 to 3 do {
	private ["_c","_v","_vc","_p"];
	_c = createGroup EAST;
	_p = format ["mVP%1",_i];
	_p = getMarkerPos _p;
	_vc = ["O_MRAP_02_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F"] call BIS_fnc_selectRandom;
	_v = [_p, 90, _vc, _c] call BIS_fnc_spawnVehicle;
	[_c, _p, 3000, 5, "MOVE", "SAFE", "RED", "LIMITED", 50] call ADF_fnc_vehiclePatrol;
};
sleep 20;
for "_i" from 1 to 3 do {
	private ["_c","_v","_vc","_p"];
	_c = createGroup EAST;
	_p = format ["mVP%1",_i];
	_p = getMarkerPos _p;
	_vc = ["O_MRAP_02_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F"] call BIS_fnc_selectRandom;
	_v = [_p, 90, _vc, _c] call BIS_fnc_spawnVehicle;
	[_c, _p, 3000, 5, "MOVE", "SAFE", "RED", "LIMITED", 50] call ADF_fnc_vehiclePatrol;
};

// Naval Static Patrols
_c = createGroup EAST;
_v = [getMarkerPos "mNS1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
_c = createGroup EAST;
_v = [getMarkerPos "mNS2", 90, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;

_g = createGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL oStat_1,[],0,"SERGEANT"]; _p setDir 40; _p moveInGunner oStat_1;
_p = _g createUnit ["O_Soldier_F",getPosASL oStat_2,[],0,"CORPORAL"]; _p setDir 180; _p moveInGunner oStat_2;
_p = _g createUnit ["O_Soldier_F",getPosASL bridgeCP,[],0,"PRIVATE"]; _p setDir 180; _p moveInGunner bridgeCP; // Irfit @ Bridge CP

// U12 patrols
_g = [getPosASL oU12_CP1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
_wp = _g addWaypoint [getPosASL oU12_CP1, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP3, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP4, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP6, 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";

_g = [getPosASL oU12_CP4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
_wp = _g addWaypoint [getPosASL oU12_CP4, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP6, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP1, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP3, 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";

// U12 CP's
_g = [getPosASL oU12_CP1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP1, 7, 2, true] call ADF_fnc_defendArea;
_g = [getPosASL oU12_CP2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP2, 7, 2, true] call ADF_fnc_defendArea;
_g = [getPosASL oU12_CP3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP3, 7, 2, true] call ADF_fnc_defendArea;
_g = [getPosASL oU12_CP4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP4, 7, 2, true] call ADF_fnc_defendArea;
_g = [getPosASL oU12_CP5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP5, 7, 2, true] call ADF_fnc_defendArea;
_g = [getPosASL oU12_CP6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP6, 7, 2, true] call ADF_fnc_defendArea;

// Checkpoints
for "_i" from 1 to 3 do {
	private ["_p","_g"];
	_p = format ["mCP_%1",_i];
	_p = getMarkerPos _p;
	_g = [_p, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
	[_g, _p, 50, 2, true] call ADF_fnc_defendArea;
};

// U12 OP
private "_g";
_g = [getPosASL oU12_OP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_OP, 150, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;

ADF_init_AO = true; publicVariable "ADF_init_AO";