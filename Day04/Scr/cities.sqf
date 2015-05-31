// City patrols/Fortify Spawn on Demand / Despawn
// Cities, 500 radius

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// tCities1 (Panagia)
if ((isNil "g1a") && (isNil "g1b") && (_this select 0 == "1A")) exitWith {
	g1a = [getPos tCities1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g1a, getPos tCities1, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g1b = [getPos tCities1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g1b, getPos tCities1, 200, 3, true] call CBA_fnc_taskDefend;
};
if (_this select 0 == "1B") exitWith {
	if !(isNil "g1a") then {{deleteVehicle _x} forEach units g1a; deleteGroup g1a; g1a = nil}; sleep 0.05;
	if !(isNil "g1b") then {{deleteVehicle _x} forEach units g1b; deleteGroup g1b; g1b = nil};
};

// tCities2 (Faronaki)
if ((isNil "g2a") && (isNil "g2b") && (_this select 0 == "2A")) exitWith {
	g2a = [getPos tCities2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g2a, getPos tCities2, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g2b = [getPos tCities2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g2b, getPos tCities2, 500, 3, true] call CBA_fnc_taskDefend;
};
if (_this select 0 == "2B") exitWith {
	if !(isNil "g2a") then {{deleteVehicle _x} forEach units g2a; deleteGroup g2a; g2a = nil}; sleep 0.05;
	if !(isNil "g2b") then {{deleteVehicle _x} forEach units g2b; deleteGroup g2b; g2b = nil};
};

// tCities3 (Chalkeia)
if ((isNil "g3a") && (isNil "g3b") && (isNil "g3c") &&  (isNil "g3d") && (_this select 0 == "3A")) exitWith {
	g3a = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g3a, getPos tCities3, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g3b = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g3b, getPos tCities3, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g3c = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g3c, getPos tCities3, 300, 3, true] call CBA_fnc_taskDefend; sleep 3;
	g3d = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g3d, getPos tCities3, 300, 3, true] call CBA_fnc_taskDefend;
};
if (_this select 0 == "3B") exitWith {
	if !(isNil "g3a") then {{deleteVehicle _x} forEach units g3a; deleteGroup g3a; g3a = nil}; sleep 0.05;
	if !(isNil "g3b") then {{deleteVehicle _x} forEach units g3b; deleteGroup g3b; g3b = nil}; sleep 0.05;
	if !(isNil "g3c") then {{deleteVehicle _x} forEach units g3c; deleteGroup g3c; g3c = nil}; sleep 0.05;
	if !(isNil "g3d") then {{deleteVehicle _x} forEach units g3d; deleteGroup g3d; g3d = nil};
};

// tCities4 (Dorida)
if ((isNil "g4a") && (isNil "g4b") && (isNil "g4c") && (_this select 0 == "4A")) exitWith {
	g4a = [getPos tCities4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g4a, getPos tCities4, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g4b = [getPos tCities4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g4b, getPos tCities4, 300, 3, true] call CBA_fnc_taskDefend; sleep 3;
	g4c = [getPos tCities4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup; 
	[g4c, getPos tCities4, 300, 3, true] call CBA_fnc_taskDefend;	
};
if (_this select 0 == "4B") exitWith {
	if !(isNil "g4a") then {{deleteVehicle _x} forEach units g4a; deleteGroup g4a; g4a = nil}; sleep 0.05;
	if !(isNil "g4b") then {{deleteVehicle _x} forEach units g4b; deleteGroup g4b; g4b = nil}; sleep 0.05;
	if !(isNil "g4c") then {{deleteVehicle _x} forEach units g4c; deleteGroup g4c; g4c = nil};
};

// Pyrgos patrols and fortification
if ((isNil "gPa") && (isNil "gPb") && (isNil "gPc") && (isNil "gPd") && (isNil "gPe") && (isNil "gPf") && (isNil "gPg") && (_this select 0 == "5A")) exitWith {
	gPa = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gPa, getPos vPyrgosFlag, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	gPb = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gPb, getPos vPyrgosFlag, 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	gPc = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[gPc, getPos vPyrgosFlag, 500, 3, true] call CBA_fnc_taskDefend; sleep 3;
	gPd = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[gPd, getPos vPyrgosFlag, 500, 3, true] call CBA_fnc_taskDefend; sleep 3;
	gPe = [getmarkerpos "PyrVeh", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> "OIA_MotInf_GMGTeam")] call BIS_fnc_spawnGroup;
	[gPe, getPos vPyrgosFlag, 700, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 20;
	gPf = [getmarkerpos "PyrVeh", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> "OIA_MotInf_GMGTeam")] call BIS_fnc_spawnGroup;
	[gPf, getPos vPyrgosFlag, 700, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 3;
	gPg = [getmarkerpos "mABC", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gPg, getmarkerpos "mABC", 100, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
};
if (_this select 0 == "5B") exitWith {
	if !(isNil "gPa") then {{deleteVehicle _x} forEach units gPa; deleteGroup gPa; gPa = nil}; sleep 0.05;
	if !(isNil "gPb") then {{deleteVehicle _x} forEach units gPb; deleteGroup gPb; gPb = nil}; sleep 0.05;
	if !(isNil "gPc") then {{deleteVehicle _x} forEach units gPc; deleteGroup gPc; gPc = nil}; sleep 0.05;
	if !(isNil "gPd") then {{deleteVehicle _x} forEach units gPd; deleteGroup gPd; gPd = nil}; sleep 0.05;
	if !(isNil "gPe") then {{deleteVehicle _x} forEach units gPe; deleteGroup gPe; gPe = nil}; sleep 0.05;
	if !(isNil "gPf") then {{deleteVehicle _x} forEach units gPf; deleteGroup gPf; gPf = nil}; sleep 0.05;	
	if !(isNil "gPg") then {{deleteVehicle _x} forEach units gPg; deleteGroup gPg; gPg = nil};
};	

// tCities5 (Charkia)
if ((isNil "g6a") && (isNil "g6b") && (isNil "g6c") &&  (isNil "g6d") && (isNil "g6e") && (_this select 0 == "6A")) exitWith {
	g6a = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g6a, getPos tCities6, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g6b = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g6b, getPos tCities6, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g6c = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g6c, getPos tCities6, 300, 3, true] call CBA_fnc_taskDefend; sleep 3;
	g6d = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g6d, getPos tCities6, 300, 3, true] call CBA_fnc_taskDefend; sleep 3;
	g6e = [getPos tABC2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[g6e, getPos tABC2, 100, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
};
if (_this select 0 == "6B") exitWith {
	if !(isNil "g6a") then {{deleteVehicle _x} forEach units g6a; deleteGroup g6a; g6a = nil}; sleep 0.05;
	if !(isNil "g6b") then {{deleteVehicle _x} forEach units g6b; deleteGroup g6b; g6b = nil}; sleep 0.05;
	if !(isNil "g6c") then {{deleteVehicle _x} forEach units g6c; deleteGroup g6c; g6c = nil}; sleep 0.05;
	if !(isNil "g6d") then {{deleteVehicle _x} forEach units g6d; deleteGroup g6d; g6d = nil}; sleep 0.05;
	if !(isNil "g6e") then {{deleteVehicle _x} forEach units g6e; deleteGroup g6e; g6e = nil}; 
};

