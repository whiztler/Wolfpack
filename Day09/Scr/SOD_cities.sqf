// City patrols/Fortify Spawn on Demand / Despawn
// Cities, 500 radius

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

// tCities1
if ((isNil "gC1a") && (isNil "gC1b") && (isNil "gC1c") && (isNil "gC1d") && (isNil "gC1e") && (isNil "gC1f") && (_this select 0 == "1A")) exitWith {
	gC1a = [getMarkerPos "mCityEIP1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1a, getMarkerPos "mCityEIP1", 300, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.035;
	gC1b = [getMarkerPos "mCityEIP2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1b, getMarkerPos "mCityEIP2", 300, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.035;	
	gC1c = [getMarkerPos "mCityEIP3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1c, getMarkerPos "mCityEIP3", 300, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.035;	
// Depot	
	gC1d = [getMarkerPos "mDepot", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1d, getMarkerPos "mDepot", 250, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.035;
	gC1e = [getMarkerPos "mDepot", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1e, getMarkerPos "mDepot", 200, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.035;	
	gC1f = [getMarkerPos "mDepot", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gC1f, getMarkerPos "mDepot", 100, 3, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.035;	
};
if (_this select 0 == "1B") exitWith {
	if !(isNil "gC1a") then {{deleteVehicle _x} forEach units gC1a; deleteGroup gC1a; gC1a = nil}; sleep 0.035;
	if !(isNil "gC1b") then {{deleteVehicle _x} forEach units gC1b; deleteGroup gC1b; gC1b = nil}; sleep 0.035;
	if !(isNil "gC1c") then {{deleteVehicle _x} forEach units gC1c; deleteGroup gC1c; gC1c = nil}; sleep 0.035;
	if !(isNil "gC1d") then {{deleteVehicle _x} forEach units gC1d; deleteGroup gC1d; gC1d = nil}; sleep 0.035;
	if !(isNil "gC1e") then {{deleteVehicle _x} forEach units gC1e; deleteGroup gC1e; gC1e = nil}; sleep 0.035;
	if !(isNil "gC1f") then {{deleteVehicle _x} forEach units gC1f; deleteGroup gC1f; gC1f = nil}; sleep 0.035;
};
