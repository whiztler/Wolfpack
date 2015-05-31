// Specific sites/locations Spawn on Demand / Despawn

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

// Edessa Checkpoint
if ((isNil "g50") && (isNil "g51") && (_this select 0 == "1A")) exitWith {
	g50 = [getMarkerPos "mEdessa", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g50, getMarkerPos "mEdessa", 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 3;
	g51 = [getMarkerPos "mEdessa", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[g51, getMarkerPos "mEdessa", 200, 3, true] call CBA_fnc_taskDefend;

};
if (_this select 0 == "1B") exitWith {
	if !(isNil "g50") then {{deleteVehicle _x} forEach units g50; deleteGroup g50; g50 = nil}; sleep 0.035;
	if !(isNil "g51") then {{deleteVehicle _x} forEach units g51; deleteGroup g51; g51 = nil};
};

