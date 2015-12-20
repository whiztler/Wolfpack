/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Virtual Arsenal SUpply function
Author: Whiztler
Script version: 0.1

Game type: n/a
File: ADF_fnc_ASL.sqf
****************************************************************
W.I.P.
****************************************************************/

params ["_ADF_supplyCargo","_ADF_supplyVehicle"];
["AmmoboxInit",[_ADF_supplyCargo,false,{true}]] spawn BIS_fnc_arsenal;
 
 
/*********** PRIMARY WEAPON & MAGAZINES ***********/

// WEAPON: Infantry Fire Team units
_ADF_asl_IFT_priWpn = [
	"arifle_MX_F",
	"arifle_MX_GL_F",
	"arifle_MX_SW_F" // No comma after last array entry!!
];

// MAGAZINES: Infantry Fire Team units
_ADF_asl_IFT_priWpnMag = [
	"30Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_mag_Tracer",
	"100Rnd_65x39_caseless_mag_tracer",
	"100Rnd_65x39_caseless_mag" // No comma after last array entry!!
];


/*********** SECONDARY WEAPON & MAGAZINES ***********/

// WEAPON: Infantry, Cavalry, Air units
_ADF_asl_ALL_secWpn = [
	"hgun_P07_F" // No comma after last array entry!!
];

// MAGAZINES: Infantry, Cavalry, Air units
_ADF_asl_ALL_secWpnMag = [
	"16Rnd_9x21_Mag" // No comma after last array entry!!
];


/*********** LAUNCHERS ***********/

// TUBES: Infantry Fire Team units
_ADF_asl_IFT_Tubes = [
	"launch_NLAW_F" // No comma after last array entry!!
];

// ROCKETS/MISSLES: Infantry Fire Team units
_ADF_asl_IFT_TubesAmmo = [
	"NLAW_F" // No comma after last array entry!!
];


/*********** DEMO/EXPLOSIVES ***********/

// Infantry units
_ADF_asl_IF_demoEquip = [
	"DemoCharge_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"ATMine_Range_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"MineDetector" // No comma after last array entry!!
];

[_ADF_supplyCargo,((backpackCargo _ADF_supplyCargo) + _ADF_asl_IFT_backpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_ADF_supplyCargo,(magazineCargo _ADF_supplyCargo) + _ADF_asl_IFT_priWpnMag + _ADF_asl_ALL_secWpnMag] call BIS_fnc_addVirtualMagazineCargo;
[_ADF_supplyCargo,((weaponCargo _ADF_supplyCargo) + _ADF_asl_IFT_priWpn + _ADF_asl_ALL_secWpn)] call BIS_fnc_addVirtualWeaponCargo;
[_ADF_supplyCargo,((itemCargo _ADF_supplyCargo) + _ADF_asl_IF_demoEquip)] call BIS_fnc_addVirtualItemCargo;
