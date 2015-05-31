/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Vehicle Cargo Script (BLUEFOR) - Medical Truck/Ambulance
Author: Whiztler
Script version: 1.9

Game type: n/a
File: ADF_vCargo_B_TruckMedi.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_TruckMedi.sqf";

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
if (ADF_mod_ACE3) then {
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 5];
} else {
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 5]
};

// Grenades
_vAmmo addMagazineCargoGlobal ["SmokeShell", 25]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 50];
_vAmmo addMagazineCargoGlobal ["SmokeShellYellow", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellPurple", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellBlue", 10];
_vAmmo addMagazineCargoGlobal ["SmokeShellOrange", 10];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
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
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vAmmo addItemCargoGlobal ["ItemRadio", 6]};
/*if (ADF_mod_CTAB) then {
	_vAmmo addItemCargoGlobal ["ItemAndroid", 1];
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",2];
};*/

// ACE3 Specific	
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ACE_EarPlugs",5]};
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ace_mapTools",2]};
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ACE_CableTie",5]}; // ACE3 094

// Medical Items
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_fieldDressing",150];
	_vAmmo addItemCargoGlobal ["ACE_packingBandage",50];
	_vAmmo addItemCargoGlobal ["ACE_elasticBandage",50];
	_vAmmo addItemCargoGlobal ["ACE_quikclot",25];
	_vAmmo addItemCargoGlobal ["ACE_tourniquet",25];
	_vAmmo addItemCargoGlobal ["ACE_surgicalKit",5];
	_vAmmo addItemCargoGlobal ["ACE_personalAidKit",25];
	_vAmmo addItemCargoGlobal ["ACE_morphine",50];
	_vAmmo addItemCargoGlobal ["ACE_epinephrine",50];
	_vAmmo addItemCargoGlobal ["ACE_atropine",50];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV",25];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV_500",35];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV_250",50];
	_vAmmo addItemCargoGlobal ["ACE_plasmaIV",25];
	_vAmmo addItemCargoGlobal ["ACE_plasmaIV_500",35];
	_vAmmo addItemCargoGlobal ["ACE_plasmaIV_250",50];
	_vAmmo addItemCargoGlobal ["ACE_salineIV",25];
	_vAmmo addItemCargoGlobal ["ACE_salineIV_500",35];
	_vAmmo addItemCargoGlobal ["ACE_salineIV_250",50];	
	_vAmmo addItemCargoGlobal ["ACE_bodyBag",50];	
} else {
	_vAmmo addItemCargoGlobal ["FirstAidKit",150];
	_vAmmo addItemCargoGlobal ["Medikit",5];
};

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Rangefinder", 1];
_vAmmo addItemCargoGlobal ["NVGoggles", 3];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Vector",1];		
};	

// Gear kit 
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_rgr_Medic", 3];
