// City patrols/Fortify Spawn on Demand / Despawn
// Cities, 500 radius

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// tCities1 (Panagia)
if ((isNil "g1a") && (isNil "g1b") && (_this select 0 == "1A")) exitWith {
	g1a = [getPos tCities1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g1a, getPos tCities1, 300, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	g1b = [getPos tCities1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g1b, getPos tCities1, 200, 3, true] call ADF_fnc_defendArea;
};
if (_this select 0 == "1B") exitWith {
	if !(isNil "g1a") then {{deleteVehicle _x} forEach units g1a; deleteGroup g1a; g1a = nil};
	if !(isNil "g1b") then {{deleteVehicle _x} forEach units g1b; deleteGroup g1b; g1b = nil};
};

// tCities2 (Faronaki)
if ((isNil "g2a") && (isNil "g2b") && (_this select 0 == "2A")) exitWith {
	g2a = [getPos tCities2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g2a, getPos tCities2, 300, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	g2b = [getPos tCities2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g2b, getPos tCities2, 500, 3, true] call ADF_fnc_defendArea;
};
if (_this select 0 == "2B") exitWith {
	if !(isNil "g2a") then {{deleteVehicle _x} forEach units g2a; deleteGroup g2a; g2a = nil};
	if !(isNil "g2b") then {{deleteVehicle _x} forEach units g2b; deleteGroup g2b; g2b = nil};
};

// tCities3 (Chalkeia)
if ((isNil "g3a") && (isNil "g3b") && (isNil "g3c") &&  (isNil "g3d") && (_this select 0 == "3A")) exitWith {
	g3a = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g3a, getPos tCities3, 300, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	g3b = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g3b, getPos tCities3, 300, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	g3c = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g3c, getPos tCities3, 300, 3, true] call ADF_fnc_defendArea;
	g3d = [getPos tCities3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g3d, getPos tCities3, 300, 3, true] call ADF_fnc_defendArea;
};
if (_this select 0 == "3B") exitWith {
	if !(isNil "g3a") then {{deleteVehicle _x} forEach units g3a; deleteGroup g3a; g3a = nil};
	if !(isNil "g3b") then {{deleteVehicle _x} forEach units g3b; deleteGroup g3b; g3b = nil};
	if !(isNil "g3c") then {{deleteVehicle _x} forEach units g3c; deleteGroup g3c; g3c = nil};
	if !(isNil "g3d") then {{deleteVehicle _x} forEach units g3d; deleteGroup g3d; g3d = nil};
};

// tCities4 (Dorida)
if ((isNil "g4a") && (isNil "g4b") && (isNil "g4c") && (_this select 0 == "4A")) exitWith {
	g4a = [getPos tCities4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g4a, getPos tCities4, 300, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	g4b = [getPos tCities4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g4b, getPos tCities4, 300, 3, true] call ADF_fnc_defendArea;
	g4c = [getPos tCities4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup; 
	[g4c, getPos tCities4, 300, 3, true] call ADF_fnc_defendArea;	
};
if (_this select 0 == "4B") exitWith {
	if !(isNil "g4a") then {{deleteVehicle _x} forEach units g4a; deleteGroup g4a; g4a = nil};
	if !(isNil "g4b") then {{deleteVehicle _x} forEach units g4b; deleteGroup g4b; g4b = nil};
	if !(isNil "g4c") then {{deleteVehicle _x} forEach units g4c; deleteGroup g4c; g4c = nil};
};

// Pyrgos patrols and fortification
if ((isNil "gPa") && (isNil "gPb") && (isNil "gPc") && (isNil "gPd") && (isNil "gPe") && (isNil "gPf") && (isNil "gPg") && (_this select 0 == "5A")) exitWith {
	gPa = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gPa, getPos vPyrgosFlag, 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	gPb = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gPb, getPos vPyrgosFlag, 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	gPc = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[gPc, getPos vPyrgosFlag, 500, 3, true] call ADF_fnc_defendArea;
	gPd = [getPos vPyrgosFlag, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[gPd, getPos vPyrgosFlag, 500, 3, true] call ADF_fnc_defendArea;
	gPe = [getmarkerpos "PyrVeh", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> "OIA_MotInf_GMGTeam")] call BIS_fnc_spawnGroup;
	[gPe, getPos vPyrgosFlag, 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	gPf = [getmarkerpos "PyrVeh", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> "OIA_MotInf_GMGTeam")] call BIS_fnc_spawnGroup;
	[gPf, getPos vPyrgosFlag, 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	gPg = [getmarkerpos "mABC", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gPg, getmarkerpos "mABC", 100, 3, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "5B") exitWith {
	if !(isNil "gPa") then {{deleteVehicle _x} forEach units gPa; deleteGroup gPa; gPa = nil};
	if !(isNil "gPb") then {{deleteVehicle _x} forEach units gPb; deleteGroup gPb; gPb = nil};
	if !(isNil "gPc") then {{deleteVehicle _x} forEach units gPc; deleteGroup gPc; gPc = nil};
	if !(isNil "gPd") then {{deleteVehicle _x} forEach units gPd; deleteGroup gPd; gPd = nil};
	if !(isNil "gPe") then {{deleteVehicle _x} forEach units gPe; deleteGroup gPe; gPe = nil};
	if !(isNil "gPf") then {{deleteVehicle _x} forEach units gPf; deleteGroup gPf; gPf = nil};	
	if !(isNil "gPg") then {{deleteVehicle _x} forEach units gPg; deleteGroup gPg; gPg = nil};
};	

// tCities5 (Charkia)
if ((isNil "g6a") && (isNil "g6b") && (isNil "g6c") &&  (isNil "g6d") && (isNil "g6e") && (_this select 0 == "6A")) exitWith {
	g6a = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g6a, getPos tCities6, 300, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	g6b = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g6b, getPos tCities6, 300, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
	g6c = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g6c, getPos tCities6, 300, 3, true] call ADF_fnc_defendArea; sleep 3;
	g6d = [getPos tCities6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g6d, getPos tCities6, 300, 3, true] call ADF_fnc_defendArea; sleep 3;
	g6e = [getPos tABC2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[g6e, getPos tABC2, 100, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
};
if (_this select 0 == "6B") exitWith {
	if !(isNil "g6a") then {{deleteVehicle _x} forEach units g6a; deleteGroup g6a; g6a = nil};
	if !(isNil "g6b") then {{deleteVehicle _x} forEach units g6b; deleteGroup g6b; g6b = nil};
	if !(isNil "g6c") then {{deleteVehicle _x} forEach units g6c; deleteGroup g6c; g6c = nil};
	if !(isNil "g6d") then {{deleteVehicle _x} forEach units g6d; deleteGroup g6d; g6d = nil};
	if !(isNil "g6e") then {{deleteVehicle _x} forEach units g6e; deleteGroup g6e; g6e = nil}; 
};

