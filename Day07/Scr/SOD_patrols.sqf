// Foot patrols Spawn on Demand / Despawn
// Countryside, 500 radius

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

// tFP1 (trigger Foot Patrols 1)
if ((isNil "g1") && (_this select 0 == "1A")) exitWith {
	g1 = [getPos tFP1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[g1, getPos tFP1, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "1B") exitWith {if !(isNil "g1") then {{deleteVehicle _x} forEach units g1; deleteGroup g1; g1 = nil};};

// tFP2
if ((isNil "g2") && (_this select 0 == "2A")) exitWith {
	g2 = [getPos tFP2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g2, getPos tFP2, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "2B") exitWith {if !(isNil "g2") then {{deleteVehicle _x} forEach units g2; deleteGroup g2; g2 = nil};};

// tFP3
if ((isNil "g3") && (_this select 0 == "3A")) exitWith {
	g3 = [getPos tFP3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g3, getPos tFP3, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "3B") exitWith {if !(isNil "g3") then {{deleteVehicle _x} forEach units g3; deleteGroup g3; g3 = nil};};

// tFP4
if ((isNil "g4") && (_this select 0 == "4A")) exitWith {
	g4 = [getPos tFP4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[g4, getPos tFP4, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "4B") exitWith {if !(isNil "g4") then {{deleteVehicle _x} forEach units g4; deleteGroup g4; g4 = nil};};

// tFP5
if ((isNil "g5") && (_this select 0 == "5A")) exitWith {
	g5 = [getPos tFP5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconSentry")] call BIS_fnc_spawnGroup;
	[g5, getPos tFP5, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "5B") exitWith {if !(isNil "g5") then {{deleteVehicle _x} forEach units g5; deleteGroup g5; g5 = nil};};

// tFP6
if ((isNil "g6") && (_this select 0 == "6A")) exitWith {
	g6 = [getPos tFP6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[g6, getPos tFP6, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "6B") exitWith {if !(isNil "g6") then {{deleteVehicle _x} forEach units g6; deleteGroup g6; g6 = nil};};

// tFP7
if ((isNil "g7") && (_this select 0 == "7A")) exitWith {
	g7 = [getPos tFP7, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[g7, getPos tFP7, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "7B") exitWith {if !(isNil "g7") then {{deleteVehicle _x} forEach units g7; deleteGroup g7; g7 = nil};};

