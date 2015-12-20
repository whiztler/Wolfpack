// Specific sites/locations Spawn on Demand / Despawn

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server
params ["_t"];

// Edessa Checkpoint
if ((isNil "g50") && (isNil "g51") && (_t == "1A")) exitWith {
	g50 = [getMarkerPos "mEdessa", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g50, getMarkerPos "mEdessa", 250, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	g51 = [getMarkerPos "mEdessa", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g51, getMarkerPos "mEdessa", 200, 3, true] call ADF_fnc_defendArea;
};
if (_t == "1B") exitWith {
	if !(isNil "g50") then {{deleteVehicle _x} forEach units g50; deleteGroup g50; g50 = nil};
	if !(isNil "g51") then {{deleteVehicle _x} forEach units g51; deleteGroup g51; g51 = nil};
};

