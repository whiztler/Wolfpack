// City patrols/Fortify Spawn on Demand / Despawn
// Cities, 600 radius

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Frini
if ((isNil "g1a") && (isNil "g1b") && (isNil "g1c") && (_this select 0 == "1A")) exitWith {
	g1a = [getPos tFriniCity, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g1a, getPos tFriniCity, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.05;
	g1b = [getPos tFriniCity, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[g1b, getPos tFriniCity, 300, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 0.05;	
	g1c = [getPos tFriniCity, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[g1c, getPos tFriniCity, 200, 2, true] call CBA_fnc_taskDefend;
	// Sentries
	g1d = CreateGroup EAST; 
	_p = g1d createUnit ["O_Soldier_F",getPosASL tFriniCity,[],0,"SERGEANT"]; _p setDir 40; _p moveInGunner vFrini_1; sleep .05;
	_p = g1d createUnit ["O_Soldier_F",getPosASL tFriniCity,[],0,"CORPORAL"]; _p setDir 180; _p moveInGunner vFrini_2; sleep .05;
};
if (_this select 0 == "1B") exitWith {
	if !(isNil "g1a") then {{deleteVehicle _x} forEach units g1a; deleteGroup g1a; g1a = nil}; sleep 0.05;
	if !(isNil "g1b") then {{deleteVehicle _x} forEach units g1b; deleteGroup g1b; g1b = nil}; sleep 0.05;
	if !(isNil "g1c") then {{deleteVehicle _x} forEach units g1c; deleteGroup g1c; g1c = nil}; sleep 0.05;
	if !(isNil "g1d") then {{deleteVehicle _x} forEach units g1d; deleteGroup g1d; g1d = nil}; sleep 0.05;
};


