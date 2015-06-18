/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Storm vehicle loadout (arti)
Author: Whiztler
Script version: 1.5

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
_vAmmo = _this select 0;

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vAmmo addWeaponCargoGlobal ["arifle_MX_F", 2]; // R

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 5];
} else {
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 5]
};

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Clacker",1];	
};	

// Vehicle Ammunition
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_shells", 5];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_Flare_white", 2];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_Smoke_white", 2];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_guided", 5];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_LG", 5];

// Weapon mountings
_vAmmo addItemCargoGlobal ["acc_pointer_IR", 2];
_vAmmo addItemCargoGlobal ["optic_ACO", 3];
_vAmmo addItemCargoGlobal ["acc_flashlight", 2];

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 3]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 2]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 2]; 
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_White",5];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Red",1];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Green",1];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Yellow",1];
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vAmmo addItemCargoGlobal ["ACRE_PRC343", 3];
	_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vAmmo addItemCargoGlobal ["tf_anprc152", 3];
	//_vAmmo addItemCargoGlobal ["tf_rt1523g", 3];
	_vAmmo addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vAmmo addItemCargoGlobal ["ItemRadio", 5]};
/*if (ADF_mod_CTAB) then {
	_vAmmo addItemCargoGlobal ["ItemAndroid", 1];
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",3];
};*/

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_EarPlugs",5];
	_vAmmo addItemCargoGlobal ["ace_mapTools",3];
	_vAmmo addItemCargoGlobal ["ACE_CableTie",5]
};

// Medical Items
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_fieldDressing",5];
	_vAmmo addItemCargoGlobal ["ACE_personalAidKit",1];
	_vAmmo addItemCargoGlobal ["ACE_morphine",2];
} else {
	_vAmmo addItemCargoGlobal ["FirstAidKit",5];
	_vAmmo addItemCargoGlobal ["Medikit",1];
};