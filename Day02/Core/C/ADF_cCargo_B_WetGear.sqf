/****************************************************************
ARMA Mission Development Framework
ADF version: 1.10 / JUN 2014

Script: Crate Cargo Script (BLUEFOR) - SpecOps items/weapons (Wolf)
Author: Whiztler
Script version: 1.5

Game type: n/a
File: ADF_cCargo_B_WetGear.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_WetGear.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

_crate = _this select 0;
_crate allowDamage false;

if (isServer) exitWith {};
// Init	
_wpn = 10; 	// Regular Weapons
_mag = 40;	// Magazines
_uni = 10;	// Uniform/Vest/Backpack/etc

// Settings 
clearWeaponCargo _crate; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

ADF_init_vars = false;
waitUntil {ADF_init_vars};

// Primary weapon
_crate addWeaponCargoGlobal ["arifle_SDAR_F", _wpn]; // Divers

// Magazines primary weapon
_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _mag]; // SDAR

// Diving Gear
_crate addBackpackCargoGlobal ["B_Carryall_mcamo", _uni];

_crate addItemCargoGlobal ["U_B_Wetsuit", _uni];
_crate addItemCargoGlobal ["G_Diving", _uni];
_crate addItemCargoGlobal ["V_RebreatherIR", _uni];	


