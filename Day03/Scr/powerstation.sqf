if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Foot patrols
private "_g";
_g = [getMarkerPos "ps1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps1", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps2", 800, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps1", 1000, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps2", 200, 3, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps1", 600, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

// Static	
private "_p";
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL gmg1,[],0,"SERGEANT"]; _p setDir 320; _p moveInGunner gmg1; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL taa1,[],0,"CORPORAL"]; _p setDir 45; _p moveInGunner taa1; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL hmg1,[],0,"PRIVATE"]; _p setDir 270; _p moveInGunner hmg1; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL hmg3,[],0,"PRIVATE"]; _p setDir 180; _p moveInGunner hmg3; sleep .05;
_g = CreateGroup EAST;
_p = _g createUnit ["O_Soldier_F",getPosASL cp5,[],0,"CORPORAL"]; _p setDir 300; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL cp5,[],0,"PRIVATE"]; _p setDir 110; sleep .05;

// Cleanup Map
private "_q";
_q = nearestObjects [getMarkerPos "CleanUp", ["car"], 1300];
while {true} do {	{deleteVehicle _x} forEach _q};	


