/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Transport Truck
Author: Whiztler
Script version: 2.0

Game type: n/a
File: ADF_vCargo_B_TruckTrpt.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_TruckTrpt.sqf";

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
_vSupply addWeaponCargoGlobal ["arifle_MX_GL_F", 2]; // GL

if (ADF_mod_ACE3) then {
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 25];
} else {
	_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 25]
};

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];

// GL Ammo
_vSupply addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 5];

// Grenades
_vSupply addMagazineCargoGlobal ["HandGrenade", 5]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 5]; 	 

// Medical Items
_vSupply addItemCargoGlobal ["FirstAidKit", 5];

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 2];
