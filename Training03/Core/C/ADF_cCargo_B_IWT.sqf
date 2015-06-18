/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Crate Cargo Script (BLUEFOR) - Infantry Weapons Team (Fox)
Author: Whiztler
Script version: 1.7

Game type: n/a
File: ADF_cCargo_B_IWT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_IWT.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_crate = _this select 0;
_crate allowDamage false;
_wpn = 1; 	// Regular Weapons
_spw = 2; 	// Special Purpose Weapons
_lau = 2;	// Launchers
_mag = 20;	// Magazines
_dem = 5;	// Demo/Explosives
_mis = 10;	// Missiles/Rockets
_itm = 3;	// Items
_uni = 5;	// Uniform/Vest/Backpack/etc

// Settings 
clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init



// Primary weapon
_crate addWeaponCargoGlobal ["arifle_MX_F", _wpn];
_crate addWeaponCargoGlobal ["arifle_MX_GL_F", _wpn]; // GL
_crate addWeaponCargoGlobal ["srifle_EBR_SOS_F", _wpn]; // Marksman
_crate addWeaponCargoGlobal ["srifle_LRR_LRPS_F", 1]; // Sniper
_crate addWeaponCargoGlobal ["srifle_DMR_06_camo_khs_F", 1]; // Sharpshooter
_crate addWeaponCargoGlobal ["LMG_mk200_f", _spw]; // MG
_crate addWeaponCargoGlobal ["MMG_02_sand_RCO_LP_F", _spw]; // MG
		
// Secondary weapon
_crate addWeaponCargoGlobal ["hgun_P07_F", 3];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 50];
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65x47_Scenar_mag", 10]; // MXM
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65_Creedmor_mag", 10]; // MXM
	
	_crate addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", 10]; 
	_crate addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", 10];	
	
	_crate addMagazineCargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer_Dim", 10];
	_crate addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_crate addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk319_Mod_0_Mag", 10];
	_crate addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 10];
	
	_crate addMagazineCargoGlobal ["ACE_100Rnd_65x39_caseless_mag_Tracer_Dim", 10];
	_crate addMagazineCargoGlobal ["ACE_200Rnd_65x39_cased_Box_Tracer_Dim", 10];
} else {
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["130Rnd_338_Mag", 10];
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", _mag]; // LMG
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", _mag]; // LMG
	_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", _mag]; // MG
	_crate addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", _mag]; // MG
	_crate addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman
};

_crate addMagazineCargoGlobal ["7Rnd_408_Mag", _mag]; // Sniper

_crate addMagazineCargoGlobal ["500Rnd_127x99_mag", 3]; // HMG
_crate addMagazineCargoGlobal ["40Rnd_20mm_g_belt", 3]; // GMG

// Magazines secondary weapon
_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", 10];

// Launchers
_crate addWeaponCargoGlobal ["launch_B_Titan_F", _lau];
_crate addWeaponCargoGlobal ["launch_B_Titan_short_F", _lau];

// Rockets/Missiles
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
_crate addItemCargoGlobal ["MineDetector", 1];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Clacker",_dem];
	_crate addItemCargoGlobal ["ACE_Cellphone",1];
	_crate addItemCargoGlobal ["ACE_M26_Clacker",_dem];
	_crate addItemCargoGlobal ["ACE_DeadManSwitch",_dem];
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
	// Sniper/Marksman
	_crate addItemCargoGlobal ["ACE_optic_SOS_2D", 1];
	_crate addItemCargoGlobal ["ACE_optic_SOS_PIP", 1];
	_crate addItemCargoGlobal ["ACE_optic_LRPS_2D", 1];	
	_crate addItemCargoGlobal ["ACE_optic_LRPS_PIP", 1];	
} else {
	_crate addItemCargoGlobal ["acc_pointer_IR", _itm];
	_crate addItemCargoGlobal ["optic_ACO", _itm];
	_crate addItemCargoGlobal ["optic_NVS", 1];
	_crate addItemCargoGlobal ["optic_Hamr", _itm];
	_crate addItemCargoGlobal ["acc_flashlight", _itm];
};
if (ADF_mod_ACE3) then {_crate addItemCargoGlobal ["ACE_SpareBarrel", _itm]};


// GL Ammo
_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareGreen_F", _mag];
_crate addMagazineCargoGlobal ["UGL_FlareRed_F", _mag];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_HuntIR_M203",10];
	_crate addItemCargoGlobal ["ACE_HuntIR_monitor",2];
};
 
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
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_HandFlare_White",10];
	_crate addItemCargoGlobal ["ACE_HandFlare_Red",3];
	_crate addItemCargoGlobal ["ACE_HandFlare_Green",3];
	_crate addItemCargoGlobal ["ACE_HandFlare_Yellow",3];
};	

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_EarPlugs",15];
	_crate addItemCargoGlobal ["ace_mapTools",_itm];
};	

// Medical Items
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_fieldDressing",_mag];
	_crate addItemCargoGlobal ["ACE_personalAidKit",1];
	_crate addItemCargoGlobal ["ACE_morphine",15];
	_crate addItemCargoGlobal ["ACE_epinephrine",5];
} else {
	_crate addItemCargoGlobal ["FirstAidKit",_mag];
	_crate addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_crate addWeaponCargoGlobal ["RangeFinder", 1];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Vector",3];		
} else {		
	_crate addWeaponCargoGlobal ["Binocular", 3];
};
_crate addItemCargoGlobal ["G_Tatical_Clear", _itm];
_crate addItemCargoGlobal ["NVGoggles", _itm];

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_crate addItemCargoGlobal ["ACRE_PRC343", 5];
	_crate addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_crate addItemCargoGlobal ["tf_anprc152", 5];
	//_crate addItemCargoGlobal ["tf_rt1523g", 3];
	_crate addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_crate addItemCargoGlobal ["ItemRadio", 5]};
if (ADF_mod_CTAB) then {
	_crate addItemCargoGlobal ["ItemAndroid", 1];
	_crate addItemCargoGlobal ["ItemcTabHCam",10];
};

// Gear kit (not working from crates/veh)
_crate addBackpackCargoGlobal ["B_Carryall_Base", _uni];
_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", _uni];

// Misc items
_crate addItemCargoGlobal ["ItemGPS", 1];
_crate addItemCargoGlobal ["ItemMap", _itm];
_crate addItemCargoGlobal ["ItemWatch", _itm];
_crate addItemCargoGlobal ["ItemCompass", _itm];
_crate addItemCargoGlobal ["ToolKit", _itm];
_crate addWeaponCargoGlobal ["B_UavTerminal", 1];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_UAVBattery", 2];
	_crate addItemCargoGlobal ["ACE_Kestrel4500",1];
	_crate addItemCargoGlobal ["ace_yardage450", 1];
	_crate addItemCargoGlobal ["ace_mx2a", 1];
};		



