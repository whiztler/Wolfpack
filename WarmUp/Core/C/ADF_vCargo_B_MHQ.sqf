/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car General Loadout
Author: Whiztler
Script version: 1.3

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
_vSupply addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
_vSupply addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 50];
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", 10];	
	_vSupply addMagazineCargoGlobal ["130Rnd_338_Mag", 10];	
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer_Dim", 10];
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk319_Mod_0_Mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 10];
} else {
	_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 50];
	_vSupply addMagazineCargoGlobal ["130Rnd_338_Mag", 10];	
	_vSupply addMagazineCargoGlobal ["7Rnd_408_Mag", 10]; 
	_vSupply addMagazineCargoGlobal ["20Rnd_762x51_Mag", 15]; 
	_vSupply addMagazineCargoGlobal ["10Rnd_338_Mag", 10];
};

_vSupply addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 10]; // LMG
_vSupply addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 5]; // MG
_vSupply addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 5]; // MG

// Launchers
_vSupply addweaponCargoGlobal ["launch_NLAW_F", 2];

// Rockets/Missiles
if (!ADF_mod_ACE3) then {_vSupply addMagazineCargoGlobal ["NLAW_F", 10]};


// GL Ammo
_vSupply addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
_vSupply addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 10];
_vSupply addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];	

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Cellphone",1];
	_vSupply addItemCargoGlobal ["ACE_Clacker",2];
	_vSupply addItemCargoGlobal ["ACE_M26_Clacker",2]; 
	_vSupply addItemCargoGlobal ["ACE_DefusalKit",2];
	_vSupply addItemCargoGlobal ["ACE_wirecutter",2];
};

if (ADF_mod_ACE3) then {_vSupply addItemCargoGlobal ["ACE_SpareBarrel", 2]};

// Weapon mountings
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 1];
	_vSupply addItemCargoGlobal ["acc_flashlight", 1];	
	_vSupply addItemCargoGlobal ["ACE_optic_Hamr_2D", 1];
	_vSupply addItemCargoGlobal ["ACE_optic_Hamr_PIP", 1];
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_2D", 1];
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_PIP", 1];
	_vSupply addItemCargoGlobal ["ACE_optic_MRCO_2D", 1];
	// Sniper/Marksman
	_vSupply addItemCargoGlobal ["ACE_optic_SOS_2D", 1];
	_vSupply addItemCargoGlobal ["ACE_optic_SOS_PIP", 1];
	_vSupply addItemCargoGlobal ["ACE_optic_LRPS_2D", 1];	
	_vSupply addItemCargoGlobal ["ACE_optic_LRPS_PIP", 1];	
} else {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 1];
	_vSupply addItemCargoGlobal ["optic_ACO", 1];
	_vSupply addItemCargoGlobal ["optic_NVS", 1];
	_vSupply addItemCargoGlobal ["optic_Hamr", 1];
	_vSupply addItemCargoGlobal ["acc_flashlight", 1];
};
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_smg_01", 5];  
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_smg_02", 5];	 	
};

// Grenades
_vSupply addMagazineCargoGlobal ["HandGrenade", 15]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 5]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellGreen", 3]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellRed", 3]; 
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HandFlare_White",10];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Red",3];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Green",3];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Yellow",3];
	_vSupply addItemCargoGlobal ["ACE_M84",5];
	_vSupply addItemCargoGlobal ["ACE_HuntIR_M203",3];
	_vSupply addItemCargoGlobal ["ACE_HuntIR_monitor",1];	
};

// Optical/Bino's/Goggles
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Vector",3];		
	_vSupply addItemCargoGlobal ["ACE_Kestrel4500",1];		
	_vSupply addItemCargoGlobal ["ace_mx2a",1];		
	_vSupply addItemCargoGlobal ["ace_yardage450",1];		
} else {		
	_vSupply addWeaponCargoGlobal ["Binocular", 3];
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vSupply addItemCargoGlobal ["ACRE_PRC343", 5];
	_vSupply addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vSupply addItemCargoGlobal ["tf_anprc152", 5];
	//_vSupply addItemCargoGlobal ["tf_rt1523g", 3];
	_vSupply addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vSupply addItemCargoGlobal ["ItemRadio", 5]};
if (ADF_mod_CTAB) then {
	_vSupply addItemCargoGlobal ["ItemAndroid", 1];
	_vSupply addItemCargoGlobal ["ItemcTab", 1];
	_vSupply addItemCargoGlobal ["ItemcTabHCam",5];
};

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_EarPlugs",15];
	_vSupply addItemCargoGlobal ["ace_mapTools",10];
	_vSupply addItemCargoGlobal ["ACE_CableTie",15];
	_vSupply addItemCargoGlobal ["ACE_UAVBattery",3];
	_vSupply addItemCargoGlobal ["ACE_TacticalLadder_Pack",1];
}; 

// Medical Items
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_fieldDressing",50];
	_vSupply addItemCargoGlobal ["ACE_packingBandage",30];
	_vSupply addItemCargoGlobal ["ACE_elasticBandage",30];
	_vSupply addItemCargoGlobal ["ACE_quikclot",30];
	_vSupply addItemCargoGlobal ["ACE_tourniquet",5];
	_vSupply addItemCargoGlobal ["ACE_surgicalKit",2];
	_vSupply addItemCargoGlobal ["ACE_personalAidKit",5];
	_vSupply addItemCargoGlobal ["ACE_morphine",35];
	_vSupply addItemCargoGlobal ["ACE_epinephrine",25];
	_vSupply addItemCargoGlobal ["ACE_atropine",25];
	_vSupply addItemCargoGlobal ["ACE_bloodIV",5];
	_vSupply addItemCargoGlobal ["ACE_bloodIV_500",10];
	_vSupply addItemCargoGlobal ["ACE_bloodIV_250",15];
	_vSupply addItemCargoGlobal ["ACE_plasmaIV",5];
	_vSupply addItemCargoGlobal ["ACE_plasmaIV_500",10];
	_vSupply addItemCargoGlobal ["ACE_plasmaIV_250",15];
	_vSupply addItemCargoGlobal ["ACE_salineIV",5];
	_vSupply addItemCargoGlobal ["ACE_salineIV_500",10];
	_vSupply addItemCargoGlobal ["ACE_salineIV_250",15];	
	_vSupply addItemCargoGlobal ["ACE_bodyBag",15];	
} else {
	_vSupply addItemCargoGlobal ["FirstAidKit",50];
	_vSupply addItemCargoGlobal ["Medikit",2];
};

// Gear kit 
_vSupply addBackpackCargoGlobal ["B_Carryall_Base", 3];
_vSupply addBackpackCargoGlobal ["B_AssaultPack_blk", 5];

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 5];