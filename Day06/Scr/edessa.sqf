if (isServer) then {deleteMarker "mManila";};
if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

// Sentries
private ["_g","_p"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_1,[],0,"SERGEANT"]; _p setDir 40; _p moveInGunner sHmg_1; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_2,[],0,"CORPORAL"]; _p setDir 180; _p moveInGunner sHmg_2; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_3,[],0,"Private"]; _p setDir 350; _p moveInGunner sHmg_3; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_1,[],0,"Private"]; _p moveInGunner sAA_1; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_2,[],0,"Private"]; _p moveInGunner sAA_2; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_3,[],0,"Private"]; _p moveInGunner sAA_3; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_4,[],0,"Private"]; _p moveInGunner sAA_4; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_5,[],0,"Private"]; _p moveInGunner sAA_5; 

// Riga CP
_g = [getPos RigaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos RigaCP, 50, 2, true] call ADF_fnc_defendArea;

// Drimea CP
_g = [getPos DrimeaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos DrimeaCP, 50, 2, true] call ADF_fnc_defendArea;	


	


