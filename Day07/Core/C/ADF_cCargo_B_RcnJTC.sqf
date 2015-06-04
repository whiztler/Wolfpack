/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Crate Cargo Script (BLUEFOR) - Recon/JTAC teams
Author: Whiztler
Script version: 1.9

Game type: n/a
File: ADF_cCargo_B_RcnJTC.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_RcnJTC.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

_crate = _this select 0;
_crate allowDamage false;

if (!isServer) exitWith {};
// Init	
_wpn = 3; 	// Regular Weapons
_spw = 2; 	// Special Purpose Weapons
_lau = 1;	// Launchers
_mag = 10;	// Magazines
_dem = 5;	// Demo/Explosives
_mis = 1;	// Missiles/Rockets
_itm = 5;	// Items
_uni = 5;	// Uniform/Vest/Backpack/etc

// Settings 
clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

ADF_init_vars = false;
waitUntil {ADF_init_vars};

// Primary weapon
_crate addWeaponCargoGlobal ["arifle_MX_GL_F", _wpn]; // GL
_crate addWeaponCargoGlobal ["srifle_EBR_SOS_F", _wpn]; // Marksman
_crate addWeaponCargoGlobal ["arifle_MXM_RCO_pointer_snds_F", _spw]; // Marksman
_crate addWeaponCargoGlobal ["srifle_LRR_LRPS_F", _spw]; // Sniper
_crate addWeaponCargoGlobal ["srifle_LRR_SOS_F", _spw]; // Sniper
		
// Secondary weapon
_crate addWeaponCargoGlobal ["hgun_Pistol_heavy_01_snds_F", _wpn];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", _mag];

	_crate addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", 10];
	_crate addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", 10];
	
	_crate addMagazineCargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer_Dim", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_SD", 10];	
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_M118LR_Mag", 10];
} else {
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["7Rnd_408_Mag", _mag]; // Sniper
	_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman EBR
};
_crate addMagazineCargoGlobal ["130Rnd_338_Mag", 10];

// Magazines secondary weapon
_crate addMagazineCargoGlobal ["11Rnd_45ACP_Mag", _mag];

// Launchers

// Rockets/Missiles

// Demo/Explosives
_crate addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", _dem];
_crate addMagazineCargoGlobal ["APERSMine_Range_Mag", _itm];
_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", _itm];
_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", _itm];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Cellphone",1];
	_crate addItemCargoGlobal ["ACE_Clacker",_itm];
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
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_smg_01", 5];  
	_crate addItemCargoGlobal ["ACE_muzzle_mzls_smg_02", 5];	 	
};

// GL Ammo
_crate addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokeYellow_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokeBlue_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokeOrange_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareGreen_F", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareRed_F", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareYellow_F", _mag];
 
// Grenades/Chemlights
_crate addMagazineCargoGlobal ["MiniGrenade", _mag]; 	 
_crate addMagazineCargoGlobal ["SmokeShell", _mag]; 	 
_crate addMagazineCargoGlobal ["SmokeShellGreen", _mag]; 	 
_crate addMagazineCargoGlobal ["SmokeShellRed", _mag]; 
_crate addMagazineCargoGlobal ["SmokeShellYellow", _mag]; 
_crate addMagazineCargoGlobal ["SmokeShellPurple", _mag]; 
_crate addMagazineCargoGlobal ["SmokeShellBlue", _mag]; 
_crate addMagazineCargoGlobal ["SmokeShellOrange", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_green", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_red", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_yellow", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_blue", _mag]; 
_crate addMagazineCargoGlobal ["B_IR_Grenade", _mag];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_HandFlare_White",_mag];
	_crate addItemCargoGlobal ["ACE_HandFlare_Red",_mag];
	_crate addItemCargoGlobal ["ACE_HandFlare_Green",_mag];
	_crate addItemCargoGlobal ["ACE_HandFlare_Yellow",_mag];
};

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_EarPlugs",15];
	_crate addItemCargoGlobal ["ace_mapTools",_itm]
};

// Medical Items
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_fieldDressing",_mag];
	_crate addItemCargoGlobal ["ACE_personalAidKit",1];
	_crate addItemCargoGlobal ["ACE_morphine",10];
	_crate addItemCargoGlobal ["ACE_epinephrine",_itm];
} else {
	_crate addItemCargoGlobal ["FirstAidKit",_mag];
	_crate addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_crate addWeaponCargoGlobal ["LaserDesignator", _itm];
_crate addWeaponCargoGlobal ["RangeFinder", _itm];
_crate addItemCargoGlobal ["G_Tatical_Clear", _itm];
_crate addItemCargoGlobal ["NVGoggles", _itm];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Vector",_itm];
	_crate addItemCargoGlobal ["ACE_Kestrel",_itm];			
};	

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_crate addItemCargoGlobal ["ACRE_PRC343", _itm];
	_crate addItemCargoGlobal ["ACRE_PRC148", 3];
};
if (ADF_mod_TFAR) then {
	_crate addItemCargoGlobal ["tf_anprc152", _itm];
	//_crate addItemCargoGlobal ["tf_rt1523g", 3];
	_crate addBackpackCargoGlobal ["tf_rt1523g", 3];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_crate addItemCargoGlobal ["ItemRadio", _itm]};
if (ADF_mod_CTAB) then {
	_crate addItemCargoGlobal ["ItemAndroid", 3];
	_crate addItemCargoGlobal ["ItemcTab", 1];
	_crate addItemCargoGlobal ["ItemcTabHCam",_itm];		
};

// Gear kit (not working from crates/veh)
_crate addBackpackCargoGlobal ["B_Carryall_Base", _uni];
_crate addBackpackCargoGlobal ["B_AssaultPack_blk", _uni];
_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", _uni];
_crate addItemCargoGlobal ["V_Chestrig_blk", _uni];

// Misc items
_crate addItemCargoGlobal ["ItemGPS", _itm];
_crate addItemCargoGlobal ["ItemMap", _itm];
_crate addItemCargoGlobal ["ItemWatch", _itm];
_crate addItemCargoGlobal ["ItemCompass", _itm];
_crate addItemCargoGlobal ["LaserBatteries", _itm];
_crate addItemCargoGlobal ["ToolKit", _itm];

_crate addItemCargoGlobal ["B_Static_Designator_01_weapon_F", 1];	
