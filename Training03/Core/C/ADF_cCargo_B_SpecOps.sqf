/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Crate Cargo Script (BLUEFOR) - SpecOps items/weapons 
Author: Whiztler
Script version: 2.1

Game type: n/a
File: ADF_cCargo_B_SpecOps.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_crate = _this select 0;
_crate allowDamage false;
_wpn = 12; 	// Regular Weapons
_spw = 1; 	// Special Purpose Weapons
_lau = 1;	// Launchers
_mag = 50;	// Magazines
_gre = 10;	// Grenades
_dem = 20;	// Demo/Explosives
_mis = 2;	// Missiles/Rockets
_itm = 5;	// Items
_uni = 5;	// Uniform/Vest/Backpack/etc

// Settings 
clearWeaponCargo _crate; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init


// Primary weapon
_crate addWeaponCargoGlobal ["arifle_MX_Black_F", _wpn];
_crate addWeaponCargoGlobal ["arifle_MX_GL_Black_Hamr_pointer_F", _spw]; // GL
_crate addWeaponCargoGlobal ["arifle_MX_SW_Black_F", _spw]; // LMG
_crate addWeaponCargoGlobal ["arifle_MXM_Black_F", _spw]; // Marksman
_crate addWeaponCargoGlobal ["srifle_EBR_SOS_F", _spw]; // Marksman
_crate addWeaponCargoGlobal ["srifle_DMR_02_F", _spw]; // Marksman
_crate addWeaponCargoGlobal ["arifle_SDAR_F", _wpn]; // Divers
		
// Secondary weapon
_crate addWeaponCargoGlobal ["hgun_Pistol_heavy_01_snds_F", _wpn];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", _mag];
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65x47_Scenar_mag", 10]; //MXM
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65_Creedmor_mag", 10]; //MXM
	
	_crate addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", _mag];
	_crate addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", _mag];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer_Dim", _mag];
	_crate addMagazineCargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_M118LR_Mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", 10];
} else {
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman
	_crate addMagazineCargoGlobal ["10Rnd_338_Mag", _mag]; // Marksman
};
_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _mag]; // SDAR

// Magazines secondary weapon
_crate addMagazineCargoGlobal ["11Rnd_45ACP_Mag", _mag];

// Launchers
_crate addWeaponCargoGlobal ["launch_B_Titan_short_F", _lau];

// Rockets/Missiles
_crate addMagazineCargoGlobal ["Titan_AT", _mis];

// Demo/Explosives
_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", _dem];
_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];
_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", _itm];
_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", _itm];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Clacker",_itm];
	_crate addItemCargoGlobal ["ACE_Cellphone",1];
	_crate addItemCargoGlobal ["ACE_DefusalKit",_itm];
	_crate addItemCargoGlobal ["ACE_wirecutter",_itm];
};	

// Weapon mountings
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["acc_pointer_IR", _itm];
	_crate addItemCargoGlobal ["acc_flashlight", _itm];	
	_crate addItemCargoGlobal ["ACE_optic_Hamr_2D", _itm];
	_crate addItemCargoGlobal ["ACE_optic_Hamr_PIP", _itm];
	_crate addItemCargoGlobal ["ACE_optic_Arco_2D", _itm];
	_crate addItemCargoGlobal ["ACE_optic_Arco_PIP", _itm];
	_crate addItemCargoGlobal ["ACE_optic_MRCO_2D", _itm];
	_crate addItemCargoGlobal ["optic_Nightstalker", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H_MG", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_B", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_L", _itm];	
	// Sniper/Marksman
	_crate addItemCargoGlobal ["ACE_optic_SOS_2D", 1];
	_crate addItemCargoGlobal ["ACE_optic_SOS_PIP", 1];
	_crate addItemCargoGlobal ["ACE_optic_LRPS_2D", 1];	
	_crate addItemCargoGlobal ["ACE_optic_LRPS_PIP", 1];

	_crate addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_smg_01", 5];  
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_smg_02", 5];	 	
} else {
	_crate addItemCargoGlobal ["acc_pointer_IR", _itm];
	_crate addItemCargoGlobal ["optic_ACO", _itm];
	_crate addItemCargoGlobal ["optic_NVS", _itm];
	_crate addItemCargoGlobal ["optic_MRCO", _itm];
	_crate addItemCargoGlobal ["optic_SOS", _itm];
	_crate addItemCargoGlobal ["optic_Nightstalker", _itm];
	_crate addItemCargoGlobal ["optic_MRD", _itm]; // .45 Handgun
	_crate addItemCargoGlobal ["acc_flashlight", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H_MG", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_B", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_L", _itm];
	_crate addItemCargoGlobal ["acc_flashlight", _itm];
};

// GL Ammo
_crate addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_SmokeYellow_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_SmokeBlue_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_SmokeOrange_Grenade_shell", _gre];
_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", _gre];
_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", _gre];
_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareGreen_F", _gre];
_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareRed_F", _gre];
_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareYellow_F", _gre];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_HuntIR_M203",10];
	_crate addItemCargoGlobal ["ACE_HuntIR_monitor",2];
};
 
// Grenades/Chemlights
_crate addMagazineCargoGlobal ["MiniGrenade", _gre]; 	 
_crate addMagazineCargoGlobal ["SmokeShell", _mag]; 	 
_crate addMagazineCargoGlobal ["SmokeShellGreen", _gre]; 	 
_crate addMagazineCargoGlobal ["SmokeShellRed", _gre]; 
_crate addMagazineCargoGlobal ["SmokeShellYellow", _gre]; 
_crate addMagazineCargoGlobal ["SmokeShellPurple", _gre]; 
_crate addMagazineCargoGlobal ["SmokeShellBlue", _gre]; 
_crate addMagazineCargoGlobal ["SmokeShellOrange", _gre]; 
_crate addMagazineCargoGlobal ["Chemlight_green", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_red", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_yellow", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_blue", _mag]; 
_crate addMagazineCargoGlobal ["B_IR_Grenade", _gre]; 
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_HandFlare_White",_mag];
	_crate addItemCargoGlobal ["ACE_HandFlare_Red",_mag];
	_crate addItemCargoGlobal ["ACE_HandFlare_Green",_mag];
	_crate addItemCargoGlobal ["ACE_HandFlare_Yellow",_mag];
};	

// Medical Items
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_fieldDressing",25];
	_crate addItemCargoGlobal ["ACE_packingBandage",25];
	_crate addItemCargoGlobal ["ACE_elasticBandage",25];
	_crate addItemCargoGlobal ["ACE_quikclot",25];
	_crate addItemCargoGlobal ["ACE_tourniquet",5];
	_crate addItemCargoGlobal ["ACE_surgicalKit",1];
	_crate addItemCargoGlobal ["ACE_personalAidKit",3];
	_crate addItemCargoGlobal ["ACE_morphine",15];
	_crate addItemCargoGlobal ["ACE_epinephrine",10];
	_crate addItemCargoGlobal ["ACE_atropine",10];
	_crate addItemCargoGlobal ["ACE_bloodIV",5];
	_crate addItemCargoGlobal ["ACE_bloodIV_500",10];
	_crate addItemCargoGlobal ["ACE_bloodIV_250",10];
	_crate addItemCargoGlobal ["ACE_plasmaIV",5];
	_crate addItemCargoGlobal ["ACE_plasmaIV_500",10];
	_crate addItemCargoGlobal ["ACE_plasmaIV_250",10];
	_crate addItemCargoGlobal ["ACE_salineIV",5];
	_crate addItemCargoGlobal ["ACE_salineIV_500",10];
	_crate addItemCargoGlobal ["ACE_salineIV_250",10];	
	_crate addItemCargoGlobal ["ACE_bodyBag",5];	
} else {
	_crate addItemCargoGlobal ["FirstAidKit",_mag];
	_crate addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Vector",_itm];
	_crate addItemCargoGlobal ["ACE_Kestrel4500",_itm];
	_crate addItemCargoGlobal ["ACE_RangeCard",_itm];		
	_crate addItemCargoGlobal ["ACE_ATragMX",_itm];		
	_crate addItemCargoGlobal ["ace_spottingscope",2];		
	_crate addItemCargoGlobal ["ace_mx2a",1];		
	_crate addItemCargoGlobal ["ace_yardage450",1];		
	_crate addItemCargoGlobal ["ace_dagr",_itm];			
} else {
	_crate addWeaponCargoGlobal ["RangeFinder", _itm];
	_crate addWeaponCargoGlobal ["Binocular", _itm];
};
_crate addItemCargoGlobal ["NVGoggles", _itm];

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_crate addItemCargoGlobal ["ACRE_PRC343", _itm];
	_crate addItemCargoGlobal ["ACRE_PRC148", 5];
};
if (ADF_mod_TFAR) then {
	_crate addItemCargoGlobal ["tf_anprc152", _itm];
	//_crate addItemCargoGlobal ["tf_rt1523g", 3];
	_crate addBackpackCargoGlobal ["tf_rt1523g_black", 3];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_crate addItemCargoGlobal ["ItemRadio", _itm]};
if (ADF_mod_CTAB) then {
	_crate addItemCargoGlobal ["ItemcTab", 1];
	_crate addItemCargoGlobal ["ItemAndroid", 3];
	_crate addItemCargoGlobal ["ItemcTabHCam",_itm];
};

// Gear kit
_crate addBackpackCargoGlobal ["B_AssaultPack_blk", _uni];
_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", _uni];
_crate addItemCargoGlobal ["U_I_G_Story_Protagonist_F", _itm];
_crate addItemCargoGlobal ["V_Chestrig_blk", _uni];

// Misc items
_crate addItemCargoGlobal ["ItemGPS", _itm];
_crate addItemCargoGlobal ["ItemMap", _itm];
_crate addItemCargoGlobal ["ItemWatch", _itm];
_crate addItemCargoGlobal ["ItemCompass", _itm];
_crate addItemCargoGlobal ["LaserBatteries", _itm];
_crate addWeaponCargoGlobal ["B_UavTerminal", _uni];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_UAVBattery", 2];
	_crate addItemCargoGlobal ["ACE_EarPlugs",15];
	_crate addItemCargoGlobal ["ace_mapTools",_itm]
};