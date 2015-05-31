// Foot patrols Spawn on Demand / Despawn
// Countryside, 500 radius

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// tFP1 (trigger Foot Patrols 1)
if ((isNil "g1") && (_this select 0 == "1A")) exitWith {
	g1 = [getPos tFP1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g1, getPos tFP1, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "1B") exitWith {if !(isNil "g1") then {{deleteVehicle _x} forEach units g1; deleteGroup g1; g1 = nil};};

// tFP2
if ((isNil "g2") && (_this select 0 == "2A")) exitWith {
	g2 = [getPos tFP2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g2, getPos tFP2, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "2B") exitWith {if !(isNil "g2") then {{deleteVehicle _x} forEach units g2; deleteGroup g2; g2 = nil};};

// tFP3
if ((isNil "g3") && (_this select 0 == "3A")) exitWith {
	g3 = [getPos tFP3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g3, getPos tFP3, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "3B") exitWith {if !(isNil "g3") then {{deleteVehicle _x} forEach units g3; deleteGroup g3; g3 = nil};};

// tFP4
if ((isNil "g4") && (_this select 0 == "4A")) exitWith {
	g4 = [getPos tFP4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g4, getPos tFP4, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "4B") exitWith {if !(isNil "g4") then {{deleteVehicle _x} forEach units g4; deleteGroup g4; g4 = nil};};

// tFP5
if ((isNil "g5") && (_this select 0 == "5A")) exitWith {
	g5 = [getPos tFP5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g5, getPos tFP5, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "5B") exitWith {if !(isNil "g5") then {{deleteVehicle _x} forEach units g5; deleteGroup g5; g5 = nil};};

// tFP6
if ((isNil "g6") && (_this select 0 == "6A")) exitWith {
	g6 = [getPos tFP6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g6, getPos tFP6, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "6B") exitWith {if !(isNil "g6") then {{deleteVehicle _x} forEach units g6; deleteGroup g6; g6 = nil};};

// tFP7
if ((isNil "g7") && (_this select 0 == "7A")) exitWith {
	g7 = [getPos tFP7, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g7, getPos tFP7, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "7B") exitWith {if !(isNil "g7") then {{deleteVehicle _x} forEach units g7; deleteGroup g7; g7 = nil};};

// tFP8
if ((isNil "g8") && (_this select 0 == "8A")) exitWith {
	g8 = [getPos tFP8, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g8, getPos tFP8, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "8B") exitWith {if !(isNil "g8") then {{deleteVehicle _x} forEach units g8; deleteGroup g8; g8 = nil};};

// tFP9
if ((isNil "g9") && (_this select 0 == "9A")) exitWith {
	g9 = [getPos tFP9, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g9, getPos tFP9, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "9B") exitWith {if !(isNil "g9") then {{deleteVehicle _x} forEach units g9; deleteGroup g9; g9 = nil};};

// tFP10
if ((isNil "g10") && (_this select 0 == "10A")) exitWith {
	g10 = [getPos tFP10, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g10, getPos tFP10, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;};
if (_this select 0 == "10B") exitWith {if !(isNil "g10") then {{deleteVehicle _x} forEach units g10; deleteGroup g10; g10 = nil};};
