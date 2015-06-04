/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car Infantry Fire Team
Author: Whiztler
Script version: 1.9

Game type: n/a
File: ADF_vCargo_B_CarIFT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_CarIFT.sqf";

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

// Primary weapon
_vAmmo addWeaponCargoGlobal ["arifle_MX_F", 2]; // R
_vAmmo addWeaponCargoGlobal ["arifle_MX_GL_F", 1]; // GL
_vAmmo addWeaponCargoGlobal ["arifle_MX_SW_F", 1]; // LMG

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 25];
} else {
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 30]
};
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", 3]; // LMG
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 3]; // LMG

// Launchers
_vAmmo addweaponCargoGlobal ["launch_NLAW_F", 1];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["NLAW_F", 2];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 3];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
_vAmmo addMagazineCargoGlobal ["ATMine_Range_Mag", 1];
_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 2];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Clacker",2];
	_vAmmo addItemCargoGlobal ["ACE_Cellphone",1];
	_vAmmo addItemCargoGlobal ["ACE_M26_Clacker",1];
	_vAmmo addItemCargoGlobal ["ACE_DefusalKit",1];
	_vAmmo addItemCargoGlobal ["ACE_wirecutter",1];
};	

// Weapon mountings
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 5];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 5];	
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_2D", 5];
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_PIP", 5];
} else {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 5];
	_vAmmo addItemCargoGlobal ["optic_ACO", 5];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 5];
};

// GL Ammo
_vAmmo addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 5];
_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 3];
_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 1]; 

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 3]; 
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_White",5];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Red",1];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Green",1];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Yellow",1];
	_vAmmo addItemCargoGlobal ["ACE_M84",5];
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vAmmo addItemCargoGlobal ["ACRE_PRC343", 5];
	_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vAmmo addItemCargoGlobal ["tf_anprc152", 5];
	//_vAmmo addItemCargoGlobal ["tf_rt1523g", 3];
	_vAmmo addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vAmmo addItemCargoGlobal ["ItemRadio", 5]};
/*if (ADF_mod_CTAB) then {
	_vAmmo addItemCargoGlobal ["ItemAndroid", 1];
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",5];
};*/

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_EarPlugs",5];
	_vAmmo addItemCargoGlobal ["ace_mapTools",2];
	_vAmmo addItemCargoGlobal ["ACE_CableTie",5]
};

// Medical Items
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_fieldDressing",10];
	_vAmmo addItemCargoGlobal ["ACE_personalAidKit",1];
	_vAmmo addItemCargoGlobal ["ACE_morphine",5];
	_vAmmo addItemCargoGlobal ["ACE_epinephrine",5];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV",1];
} else {
	_vAmmo addItemCargoGlobal ["FirstAidKit",10];
	_vAmmo addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Binocular", 1];
_vAmmo addItemCargoGlobal ["NVGoggles", 5];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Vector",1];		
};	

// Gear kit 
_vAmmo addBackpackCargoGlobal ["B_Carryall_Base", 2];
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 3];

if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_UAVBattery", 1];
};