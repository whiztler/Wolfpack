/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Crate Cargo Script (BLUEFOR) - Demolition
Author: Whiztler
Script version: 1.3

Game type: n/a
File: ADF_cCargo_B_Demo.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_Demo.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_crate = _this select 0;
_crate allowDamage false;
_dem = 25;
_itm = 5;

// Settings 
clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

// Demo/Explosives
_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", _dem];
_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];
_crate addMagazineCargoGlobal ["ATMine_Range_Mag", _dem];
_crate addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", _dem];
_crate addMagazineCargoGlobal ["APERSMine_Range_Mag", _dem];
_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", _dem];
_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", _dem];
_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", _dem];
_crate addItemCargoGlobal ["MineDetector", 2];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Clacker",_itm];
	_crate addItemCargoGlobal ["ACE_Cellphone",_itm];
	_crate addItemCargoGlobal ["ACE_M26_Clacker",_itm];
	_crate addItemCargoGlobal ["ACE_DeadManSwitch",_itm];
	_crate addItemCargoGlobal ["ACE_DefusalKit",_itm];
	_crate addItemCargoGlobal ["ACE_wirecutter",_itm];	
};


