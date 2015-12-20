/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

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
if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_vSupply = _this select 0;

// Settings 
clearWeaponCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init

// Magazines primary weapon
_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 5];

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Clacker",1];
	_vSupply addItemCargoGlobal ["ACE_wirecutter",1];
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vSupply addItemCargoGlobal ["ACRE_PRC343", 2];
	_vSupply addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vSupply addItemCargoGlobal ["tf_anprc152", 2];
	//_vSupply addItemCargoGlobal ["tf_rt1523g", 3];
	_vSupply addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vSupply addItemCargoGlobal ["ItemRadio", 2]};
/*if (ADF_mod_CTAB) then {
	_vSupply addItemCargoGlobal ["ItemAndroid", 1];	
	_vSupply addItemCargoGlobal ["ItemcTabHCam",1];
};*/


// Grenades
_vSupply addMagazineCargoGlobal ["HandGrenade", 3]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 2]; 	 

// Medical Items
_vSupply addItemCargoGlobal ["FirstAidKit", 2];

// Misc items
if (ADF_mod_ACE3) then {_vSupply addItemCargoGlobal ["ACE_EarPlugs",2]};

//hintSilent "vAmmo loaded."; // For debug only.

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 2];