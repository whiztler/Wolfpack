_g = []; _c = []; _p = []; _v = [];

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Crew the static positions
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"SERGEANT"]; _p setDir 180; _p moveInGunner oStat_1; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"CORPORAL"]; _p setDir 330; _p moveInGunner oStat_2; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_3; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_4; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_5; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_6; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_7; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_8; sleep 1;

// Foot patrols
_g = [getMarkerPos "mP1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mP1", 350, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 3;
_g = [getMarkerPos "mP2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mP2", 350, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 3;
_g = [getMarkerPos "mP3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mP3", 350, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 3;
_g = [getMarkerPos "mP4", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mP4", 350, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 3;
_g = [getMarkerPos "mP5", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mP5", 350, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 3;;
_g = [getMarkerPos "mP6", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mP6", 350, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep 3;	

// (Tech) veh patrols
_c = createGroup EAST;
_v = [getMarkerPos "vSpawn1", 45, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "vSpawn1", 1000, 7, "MOVE", "SAFE", "WHITE", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 3;
_c = createGroup EAST;
_v = [getMarkerPos "vSpawn2", 45, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "vSpawn2", 1000, 7, "MOVE", "SAFE", "WHITE", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 3;
_c = createGroup EAST;
_v = [getMarkerPos "vSpawn3", 45, "O_Truck_02_transport_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "vSpawn3", 1500, 7, "MOVE", "SAFE", "WHITE", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 3;
_c = createGroup EAST;
_v = [getMarkerPos "vSpawn4", 45, "O_APC_Wheeled_02_rcws_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "vSpawn4", 1500, 7, "MOVE", "SAFE", "WHITE", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 3;
	
