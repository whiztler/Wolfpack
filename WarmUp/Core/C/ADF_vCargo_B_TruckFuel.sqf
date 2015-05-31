/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Fuel Truck
Author: Whiztler
Script version: 1.9

Game type: n/a
File: ADF_vCargo_B_TruckFuel.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_TruckFuel.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

// Init
_vAmmo = _this select 0;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

ADF_init_vars = false;
waitUntil {ADF_init_vars};

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 5];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Clacker",1];
	_vAmmo addItemCargoGlobal ["ACE_wirecutter",1];
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vAmmo addItemCargoGlobal ["ACRE_PRC343", 2];
	_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vAmmo addItemCargoGlobal ["tf_anprc152", 2];
	//_vAmmo addItemCargoGlobal ["tf_rt1523g", 3];
	_vAmmo addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vAmmo addItemCargoGlobal ["ItemRadio", 2]};
/*if (ADF_mod_CTAB) then {
	_vAmmo addItemCargoGlobal ["ItemAndroid", 1];	
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",1];
};*/


// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 3]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 2]; 	 

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 2];

// Misc items
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ACE_EarPlugs",2]};

//hintSilent "vAmmo loaded."; // For debug only.