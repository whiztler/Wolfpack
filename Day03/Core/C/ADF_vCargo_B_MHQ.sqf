/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car General Loadout
Author: Whiztler
Script version: 1.11

Game type: n/a
File: ADF_vCargo_B_MHQ.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_MHQ.sqf";

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
_vAmmo addWeaponCargoGlobal ["arifle_MX_F", 1]; // R
_vAmmo addWeaponCargoGlobal ["arifle_MX_GL_F", 1]; // GL
_vAmmo addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
_vAmmo addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 50];
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", 10];	
	_vAmmo addMagazineCargoGlobal ["130Rnd_338_Mag", 10];	
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer_Dim", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk319_Mod_0_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 10];
} else {
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 50];
	_vAmmo addMagazineCargoGlobal ["130Rnd_338_Mag", 10];	
	_vAmmo addMagazineCargoGlobal ["7Rnd_408_Mag", 10]; 
	_vAmmo addMagazineCargoGlobal ["20Rnd_762x51_Mag", 15]; 
	_vAmmo addMagazineCargoGlobal ["10Rnd_338_Mag", 10];
};

_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 10]; // LMG
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 5]; // MG
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 5]; // MG

// Launchers
_vAmmo addweaponCargoGlobal ["launch_NLAW_F", 2];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["NLAW_F", 10];


// GL Ammo
_vAmmo addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
_vAmmo addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 10];
_vAmmo addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];	

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Cellphone",1];
	_vAmmo addItemCargoGlobal ["ACE_Clacker",2];
	_vAmmo addItemCargoGlobal ["ACE_M26_Clacker",2]; 
	_vAmmo addItemCargoGlobal ["ACE_DefusalKit",2];
	_vAmmo addItemCargoGlobal ["ACE_wirecutter",2];
};

if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ACE_SpareBarrel", 2]};

// Weapon mountings
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 1];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 1];	
	_vAmmo addItemCargoGlobal ["ACE_optic_Hamr_2D", 1];
	_vAmmo addItemCargoGlobal ["ACE_optic_Hamr_PIP", 1];
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_2D", 1];
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_PIP", 1];
	_vAmmo addItemCargoGlobal ["ACE_optic_MRCO_2D", 1];
	// Sniper/Marksman
	_vAmmo addItemCargoGlobal ["ACE_optic_SOS_2D", 1];
	_vAmmo addItemCargoGlobal ["ACE_optic_SOS_PIP", 1];
	_vAmmo addItemCargoGlobal ["ACE_optic_LRPS_2D", 1];	
	_vAmmo addItemCargoGlobal ["ACE_optic_LRPS_PIP", 1];	
} else {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 1];
	_vAmmo addItemCargoGlobal ["optic_ACO", 1];
	_vAmmo addItemCargoGlobal ["optic_NVS", 1];
	_vAmmo addItemCargoGlobal ["optic_Hamr", 1];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 1];
};
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_smg_01", 5];  
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_smg_02", 5];	 	
};

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 15]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 3]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 3]; 
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_White",10];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Red",3];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Green",3];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Yellow",3];
	_vAmmo addItemCargoGlobal ["ACE_M84",5]; 
};

// Optical/Bino's/Goggles
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Vector",3];		
	_vAmmo addItemCargoGlobal ["ACE_Kestrel",1];		
} else {		
	_vAmmo addWeaponCargoGlobal ["Binocular", 3];
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
if (ADF_mod_CTAB) then {
	_vAmmo addItemCargoGlobal ["ItemAndroid", 1];
	_vAmmo addItemCargoGlobal ["ItemcTab", 1];
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",5];
};

// ACE3 Specific	
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ACE_EarPlugs",5]};
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ace_mapTools",3]};
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ACE_CableTie",5]}; 

// Medical Items
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_fieldDressing",50];
	_vAmmo addItemCargoGlobal ["ACE_packingBandage",30];
	_vAmmo addItemCargoGlobal ["ACE_elasticBandage",30];
	_vAmmo addItemCargoGlobal ["ACE_quikclot",30];
	_vAmmo addItemCargoGlobal ["ACE_tourniquet",5];
	_vAmmo addItemCargoGlobal ["ACE_surgicalKit",2];
	_vAmmo addItemCargoGlobal ["ACE_personalAidKit",5];
	_vAmmo addItemCargoGlobal ["ACE_morphine",35];
	_vAmmo addItemCargoGlobal ["ACE_epinephrine",25];
	_vAmmo addItemCargoGlobal ["ACE_atropine",25];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV",5];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV_500",10];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV_250",15];
	_vAmmo addItemCargoGlobal ["ACE_plasmaIV",5];
	_vAmmo addItemCargoGlobal ["ACE_plasmaIV_500",10];
	_vAmmo addItemCargoGlobal ["ACE_plasmaIV_250",15];
	_vAmmo addItemCargoGlobal ["ACE_salineIV",5];
	_vAmmo addItemCargoGlobal ["ACE_salineIV_500",10];
	_vAmmo addItemCargoGlobal ["ACE_salineIV_250",15];	
	_vAmmo addItemCargoGlobal ["ACE_bodyBag",15];	
} else {
	_vAmmo addItemCargoGlobal ["FirstAidKit",50];
	_vAmmo addItemCargoGlobal ["Medikit",2];
};

if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_UAVBattery", 2];
};

// Gear kit 
_vAmmo addBackpackCargoGlobal ["B_Carryall_Base", 3];
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 5];