/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car Infantry Fire Team
Author: Whiztler
Script version: 2.0

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
if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_vSupply = _this select 0;

// Settings 
clearWeaponCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vSupply addWeaponCargoGlobal ["arifle_MX_F", 1]; // R
_vSupply addWeaponCargoGlobal ["arifle_MX_GL_F", 1]; // GL

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 15];
} else {
	_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 30]
};

// Launchers
_vSupply addweaponCargoGlobal ["launch_NLAW_F", 1];

// Rockets/Missiles
if (!ADF_mod_ACE3) then {_vSupply addMagazineCargoGlobal ["NLAW_F", 2]};

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 3];
_vSupply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Clacker",1];
	_vSupply addItemCargoGlobal ["ACE_Cellphone",1];
	_vSupply addItemCargoGlobal ["ACE_M26_Clacker",1];
	_vSupply addItemCargoGlobal ["ACE_DefusalKit",1];
	_vSupply addItemCargoGlobal ["ACE_wirecutter",1];
};	

// Weapon mountings
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 2];
	_vSupply addItemCargoGlobal ["acc_flashlight", 2];	
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_2D", 2];
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_PIP", 2];
} else {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 2];
	_vSupply addItemCargoGlobal ["optic_ACO", 2];
	_vSupply addItemCargoGlobal ["acc_flashlight", 2];
};

// GL Ammo
_vSupply addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 5];
_vSupply addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 3];
_vSupply addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 1]; 
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HuntIR_M203",3];
	_vSupply addItemCargoGlobal ["ACE_HuntIR_monitor",1];
};

// Grenades
_vSupply addMagazineCargoGlobal ["HandGrenade", 10]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 10]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellGreen", 5]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellRed", 3]; 
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HandFlare_White",5];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Red",1];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Green",1];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Yellow",1];
	_vSupply addItemCargoGlobal ["ACE_M84",5]; // ACE3 094	
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vSupply addItemCargoGlobal ["ACRE_PRC343", 2];
	_vSupply addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vSupply addItemCargoGlobal ["tf_anprc152", 1];
	_vSupply addItemCargoGlobal ["tf_microdagr", 1];
	//_vSupply addItemCargoGlobal ["tf_rt1523g", 3];
	_vSupply addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vSupply addItemCargoGlobal ["ItemRadio", 2]};
/*if (ADF_mod_CTAB) then {
	_vSupply addItemCargoGlobal ["ItemAndroid", 1];
	_vSupply addItemCargoGlobal ["ItemcTabHCam",5];
};*/

// ACE3 Specific	
if (ADF_mod_ACE3) then {_vSupply addItemCargoGlobal ["ACE_EarPlugs",2]};
if (ADF_mod_ACE3) then {_vSupply addItemCargoGlobal ["ace_mapTools",2]};
if (ADF_mod_ACE3) then {_vSupply addItemCargoGlobal ["ACE_CableTie",2]};

// Medical Items
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_fieldDressing",25];
	_vSupply addItemCargoGlobal ["ACE_packingBandage",5];
	_vSupply addItemCargoGlobal ["ACE_elasticBandage",5];
	_vSupply addItemCargoGlobal ["ACE_quikclot",5];
	_vSupply addItemCargoGlobal ["ACE_tourniquet",5];
	_vSupply addItemCargoGlobal ["ACE_personalAidKit",3];
	_vSupply addItemCargoGlobal ["ACE_morphine",20];
	_vSupply addItemCargoGlobal ["ACE_epinephrine",10];
	_vSupply addItemCargoGlobal ["ACE_atropine",10];
	_vSupply addItemCargoGlobal ["ACE_bloodIV",5];
	_vSupply addItemCargoGlobal ["ACE_bloodIV_500",10];
	_vSupply addItemCargoGlobal ["ACE_bloodIV_250",10];
	_vSupply addItemCargoGlobal ["ACE_plasmaIV",5];
	_vSupply addItemCargoGlobal ["ACE_plasmaIV_500",10];
	_vSupply addItemCargoGlobal ["ACE_plasmaIV_250",10];
	_vSupply addItemCargoGlobal ["ACE_salineIV",5];
	_vSupply addItemCargoGlobal ["ACE_salineIV_500",10];
	_vSupply addItemCargoGlobal ["ACE_salineIV_250",10];	
	_vSupply addItemCargoGlobal ["ACE_bodyBag",10];	
} else {
	_vSupply addItemCargoGlobal ["FirstAidKit",10];
	_vSupply addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vSupply addWeaponCargoGlobal ["Binocular", 1];
_vSupply addItemCargoGlobal ["NVGoggles", 5];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Vector",1];		
};	

// Gear kit 
_vSupply addBackpackCargoGlobal ["B_AssaultPack_rgr_Medic", 1];
_vSupply addBackpackCargoGlobal ["B_AssaultPack_blk", 1];

if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_UAVBattery", 1];
	_vSupply addItemCargoGlobal ["ACE_TacticalLadder_Pack", 1];
};

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 2];