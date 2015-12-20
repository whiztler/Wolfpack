/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car General Loadout
Author: Whiztler
Script version: 1.6

Game type: n/a
File: ADF_vCargo_B_CarART.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_CarART.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

// Init
if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_vSupply = _this select 0;

// Settings 
clearWeaponCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vSupply addWeaponCargoGlobal ["arifle_MX_F", 2]; // R

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 10];
} else {
	_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 15]
};

// GL Ammo
_vSupply addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 5];
_vSupply addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 3];
_vSupply addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 2];	

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Clacker",1];
	_vSupply addItemCargoGlobal ["ACE_DefusalKit",1];
	_vSupply addItemCargoGlobal ["ACE_wirecutter",1];
};	

// Weapon mountings
_vSupply addItemCargoGlobal ["acc_pointer_IR", 2];
_vSupply addItemCargoGlobal ["optic_ACO", 3];
_vSupply addItemCargoGlobal ["acc_flashlight", 2];

// Grenades
_vSupply addMagazineCargoGlobal ["HandGrenade", 5]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 3]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellGreen", 2]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellRed", 2]; 
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HandFlare_White",5];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Red",1];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Green",1];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Yellow",1];
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vSupply addItemCargoGlobal ["ACRE_PRC343", 4];
	_vSupply addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vSupply addItemCargoGlobal ["tf_anprc152", 4];
	_vSupply addItemCargoGlobal ["tf_microdagr", 4];
	//_vSupply addItemCargoGlobal ["tf_rt1523g", 3];
	_vSupply addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vSupply addItemCargoGlobal ["ItemRadio", 5]};
/*if (ADF_mod_CTAB) then {
	_vSupply addItemCargoGlobal ["ItemAndroid", 1];
	_vSupply addItemCargoGlobal ["ItemcTabHCam",4];
};*/

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_EarPlugs",5];
	_vSupply addItemCargoGlobal ["ace_mapTools",1];
	_vSupply addItemCargoGlobal ["ACE_CableTie",5];
	_vSupply addItemCargoGlobal ["ACE_UAVBattery", 1];
}; // ACE3 094


// Medical Items
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_fieldDressing",10];
	_vSupply addItemCargoGlobal ["ACE_personalAidKit",1];
	_vSupply addItemCargoGlobal ["ACE_morphine",5];
} else {
	_vSupply addItemCargoGlobal ["FirstAidKit",10];
	_vSupply addItemCargoGlobal ["Medikit",1];
};

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 2];