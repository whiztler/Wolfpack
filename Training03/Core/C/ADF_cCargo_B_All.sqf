/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Crate Cargo Script (BLUEFOR) - All  items/weapons
Author: Whiztler
Script version: 1.4

Game type: n/a
File: ADF_cCargo_B_All.sqf
****************************************************************
NOTE: THIS LOADS A LOT OF ITEMS!!!

Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_All.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle Cargo. 
****************************************************************/

sleep 5; // let other scripts settle in

_crate = _this select 0;
_crate allowDamage false;

if (isServer) then {
	// Init
	_wpn = 10; 	// Regular Weapons
	_spw = 5; 	// Special Purpose Weapons
	_lau = 5;	// Launchers
	_mag = 50;	// Magazines
	_dem = 25;	// Demo/Explosives
	_mis = 10;	// Missiles/Rockets
	_itm = 10;	// Items
	_uni = 5;	// Uniform/Vest/Backpack/etc

	// Settings 
	clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
	clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init

	// Primary weapon
	_crate addWeaponCargoGlobal ["arifle_MX_F", _wpn];
	_crate addWeaponCargoGlobal ["arifle_MXC_F", _wpn]; // Compact
	_crate addWeaponCargoGlobal ["arifle_MX_GL_F", _wpn]; // GL
	_crate addWeaponCargoGlobal ["arifle_MX_SW_F", _wpn]; // LMG
	_crate addWeaponCargoGlobal ["arifle_MXM_F", _wpn]; // Marksman
	_crate addWeaponCargoGlobal ["srifle_EBR_SOS_F", _wpn]; // Marksman
	_crate addWeaponCargoGlobal ["arifle_MX_RCO_pointer_snds_F", _wpn]; // Marksman
	_crate addWeaponCargoGlobal ["arifle_MXM_RCO_pointer_snds_F", _spw]; // Marksman
	_crate addWeaponCargoGlobal ["srifle_LRR_LRPS_F", _spw]; // Sniper
	_crate addWeaponCargoGlobal ["srifle_LRR_SOS_F", _spw]; // Sniper
	_crate addWeaponCargoGlobal ["LMG_mk200_f", _spw]; // MG
	_crate addWeaponCargoGlobal ["arifle_SDAR_F", _spw]; // Divers
			
	// Secondary weapon
	_crate addWeaponCargoGlobal ["hgun_P07_F", _wpn];
	_crate addWeaponCargoGlobal ["hgun_Pistol_heavy_01_snds_F", _wpn];

	// Magazines primary weapon
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", _mag]; // LMG
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", _mag]; // LMG
	_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", _mag]; // MG
	_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", _mag]; // MG
	_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman EBR
	_crate addMagazineCargoGlobal ["7Rnd_408_Mag", _mag]; // Sniper
	_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _mag]; // SDAR

	// Magazines secondary weapon
	_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", _mag];
	_crate addMagazineCargoGlobal ["11Rnd_45ACP_Mag", _mag];

	// Launchers
	_crate addweaponCargoGlobal ["launch_NLAW_F", _lau];
	_crate addWeaponCargoGlobal ["launch_B_Titan_F", _lau];
	_crate addWeaponCargoGlobal ["launch_B_Titan_short_F", _lau];

	// Rockets/Missiles
	_crate addMagazineCargoGlobal ["NLAW_F", _mis];
	_crate addMagazineCargoGlobal ["Titan_AT", _mis];
	_crate addMagazineCargoGlobal ["Titan_AP", _mis];
	_crate addMagazineCargoGlobal ["Titan_AA", _mis];

	// Demo/Explosives
	_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["ATMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", _dem];
	_crate addMagazineCargoGlobal ["APERSMine_Range_Mag", _itm];
	_crate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", _itm];
	_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", _itm];
	_crate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", _itm];
	_crate addItemCargoGlobal ["MineDetector", _itm];

	// Weapon mountings
	_crate addItemCargoGlobal ["acc_pointer_IR", _itm];
	_crate addItemCargoGlobal ["optic_ACO", _itm];
	_crate addItemCargoGlobal ["optic_DMS", _itm];
	_crate addItemCargoGlobal ["optic_NVS", _itm];
	_crate addItemCargoGlobal ["optic_MRCO", _itm];
	_crate addItemCargoGlobal ["optic_SOS", _itm];
	_crate addItemCargoGlobal ["optic_Holosight", _itm];
	_crate addItemCargoGlobal ["optic_Nightstalker", _itm];
	_crate addItemCargoGlobal ["optic_tws", _itm];
	_crate addItemCargoGlobal ["optic_tws_mg", _itm];
	_crate addItemCargoGlobal ["optic_MRD", _itm]; // .45 Handgun
	_crate addItemCargoGlobal ["acc_flashlight", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_H_MG", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_B", _itm];
	_crate addItemCargoGlobal ["muzzle_snds_L", _itm];

	// GL Ammo
	_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeYellow_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeYellow_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeBlue_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeOrange_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_SmokeOrange_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareGreen_F", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareGreen_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareRed_F", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareRed_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareYellow_F", _mag];
	_crate addMagazineCargoGlobal ["3Rnd_UGL_FlareYellow_F", _mag];
	 
	// Grenades/Chemlights
	_crate addMagazineCargoGlobal ["HandGrenade", _mag]; 	 
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

	// Medical Items
	_crate addItemCargoGlobal ["FirstAidKit", _itm];
	_crate addItemCargoGlobal ["Medikit", _itm];

	// Optical/Bino's/Goggles
	_crate addWeaponCargoGlobal ["LaserDesignator", _itm];
	_crate addWeaponCargoGlobal ["RangeFinder", _itm];
	_crate addWeaponCargoGlobal ["Binocular", _itm];
	_crate addItemCargoGlobal ["G_Tatical_Clear", _itm];
	_crate addItemCargoGlobal ["G_Shades_Black" ,_itm];
	_crate addItemCargoGlobal ["NVGoggles", _itm];

	// ACRE and cTAB
	_crate addItemCargoGlobal ["ItemRadio", _itm];
	_crate addItemCargoGlobal ["ACRE_PRC148", _itm];
	_crate addItemCargoGlobal ["ACRE_PRC119", _itm];
	_crate addItemCargoGlobal ["ItemcTab", _itm];
	_crate addItemCargoGlobal ["ItemAndroid", _itm];

	// Gear kit (not working from crates/veh)
	_crate addBackpackCargoGlobal ["B_Carryall_Base", _uni];
	_crate addBackpackCargoGlobal ["B_AssaultPack_blk", _uni];
	_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", _uni];


	// Misc items
	_crate addItemCargoGlobal ["ItemGPS", _itm];
	_crate addItemCargoGlobal ["ItemMap", _itm];
	_crate addItemCargoGlobal ["ItemWatch", _itm];
	_crate addItemCargoGlobal ["ItemCompass", _itm];
	_crate addItemCargoGlobal ["LaserBatteries", _itm];
	_crate addItemCargoGlobal ["ToolKit", _itm];
	_crate addWeaponCargoGlobal ["B_UavTerminal", _itm];
};