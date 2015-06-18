// City patrols/Fortify Spawn on Demand / Despawn
// Cities, 1000 radius

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// tRodopoli
if ((isNil "gC1a") && (isNil "gC1b") && (isNil "gC1c") && (isNil "gC1d") && (isNil "gC1e") && (isNil "gC1f") && (_this select 0 == "1A")) exitWith {
	gC1a = [getPos tRodopoli, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1a, getPos tRodopoli, 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
	gC1b = [getPos tRodopoli, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1b, getPos tRodopoli, 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;	
	gC1c = [getPos tRodopoli, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1c, getPos tRodopoli, 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;	

	gC1d = [getMarkerPos "mRodopoliEIF1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[gC1d, getMarkerPos "mRodopoliEIF1", 150, 3, true] call CBA_fnc_taskDefend;
	gC1e = [getMarkerPos "mRodopoliEIF2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[gC1e, getMarkerPos "mRodopoliEIF2", 150, 3, true] call CBA_fnc_taskDefend;
	gC1f = [getMarkerPos "mRodopoliEIF3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[gC1f, getMarkerPos "mRodopoliEIF3", 150, 3, true] call CBA_fnc_taskDefend;
};

if (_this select 0 == "1B") exitWith {
	if !(isNil "gC1a") then {{deleteVehicle _x} forEach units gC1a; deleteGroup gC1a; gC1a = nil};
	if !(isNil "gC1b") then {{deleteVehicle _x} forEach units gC1b; deleteGroup gC1b; gC1b = nil};
	if !(isNil "gC1c") then {{deleteVehicle _x} forEach units gC1c; deleteGroup gC1c; gC1c = nil};
	if !(isNil "gC1d") then {{deleteVehicle _x} forEach units gC1d; deleteGroup gC1d; gC1d = nil};
	if !(isNil "gC1e") then {{deleteVehicle _x} forEach units gC1e; deleteGroup gC1e; gC1e = nil};
	if !(isNil "gC1f") then {{deleteVehicle _x} forEach units gC1f; deleteGroup gC1f; gC1f = nil};
};


if ((isNil "gC2a") && (isNil "gC2b") && (isNil "gC2c") && (isNil "gC2d") && (isNil "gC2e") && (isNil "gC2f") && (_this select 0 == "2A")) exitWith {
	gC2a = [getPos tParos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC2a, getPos tParos, 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
	gC2b = [getPos tParos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC2b, getPos tParos, 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;	
	gC2c = [getPos tParos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC2c, getPos tParos, 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;	

	gC2d = [getMarkerPos "mParosEIF1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[gC2d, getMarkerPos "mParosEIF1", 150, 3, true] call CBA_fnc_taskDefend;
	gC2e = [getMarkerPos "mParosEIF2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[gC2e, getMarkerPos "mParosEIF2", 150, 3, true] call CBA_fnc_taskDefend;
	gC2f = [getMarkerPos "mParosEIF3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[gC2f, getMarkerPos "mParosEIF3", 150, 3, true] call CBA_fnc_taskDefend;
};

if (_this select 0 == "2B") exitWith {
	if !(isNil "gC2a") then {{deleteVehicle _x} forEach units gC2a; deleteGroup gC2a; gC2a = nil};
	if !(isNil "gC2b") then {{deleteVehicle _x} forEach units gC2b; deleteGroup gC2b; gC2b = nil};
	if !(isNil "gC2c") then {{deleteVehicle _x} forEach units gC2c; deleteGroup gC2c; gC2c = nil};
	if !(isNil "gC2d") then {{deleteVehicle _x} forEach units gC2d; deleteGroup gC2d; gC2d = nil};
	if !(isNil "gC2e") then {{deleteVehicle _x} forEach units gC2e; deleteGroup gC2e; gC2e = nil};
	if !(isNil "gC2f") then {{deleteVehicle _x} forEach units gC2f; deleteGroup gC2f; gC2f = nil};
};
