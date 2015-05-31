#include "ADF_JIP.sqf"

_g = []; _p = [];

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

// Sentries
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_1,[],0,"SERGEANT"]; _p setDir 40; _p moveInGunner sHmg_1; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_2,[],0,"CORPORAL"]; _p setDir 180; _p moveInGunner sHmg_2; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_3,[],0,"Private"]; _p setDir 350; _p moveInGunner sHmg_3; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_1,[],0,"Private"]; _p moveInGunner sAA_1; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_2,[],0,"Private"]; _p moveInGunner sAA_2; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_3,[],0,"Private"]; _p moveInGunner sAA_3; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_4,[],0,"Private"]; _p moveInGunner sAA_4; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_5,[],0,"Private"]; _p moveInGunner sAA_5; sleep .05;

// Riga CP
_g = [getPos RigaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos RigaCP, 50, 2, true] call CBA_fnc_taskDefend;  sleep .05;

// Drimea CP
_g = [getPos DrimeaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos DrimeaCP, 50, 2, true] call CBA_fnc_taskDefend;	

deleteMarker "mManila";
	


