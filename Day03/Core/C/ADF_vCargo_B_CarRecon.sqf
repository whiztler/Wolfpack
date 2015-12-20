/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Vehicle Cargo Script (BLUEFOR) - Car Recon/Specop Teams
Author: Whiztler
Script version: 1.5

Game type: n/a
File: ADF_vCargo_B_CarRecon.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_CarRecon.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_vSupply = _this select 0;
_mag = 25;

// Settings 
clearWeaponCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vSupply; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vSupply addWeaponCargoGlobal ["srifle_EBR_DMS_pointer_snds_F", 1]; // Marksman
_vSupply addWeaponCargoGlobal ["arifle_MX_ACO_pointer_snds_F", 1];
_vSupply addWeaponCargoGlobal ["srifle_EBR_SOS_F", 1]; // Marksman
_vSupply addWeaponCargoGlobal ["srifle_LRR_LRPS_F", 1]; // Sniper
_vSupply addWeaponCargoGlobal ["srifle_DMR_06_camo_khs_F", 1]; // Sharpshooter

// Secondary weapon
_vSupply addWeaponCargoGlobal ["hgun_P07_snds_F", 1];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", _mag];
	
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", _mag];
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", _mag];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_SD", _mag];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", _mag];
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer_Dim", 10];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", 10];
	
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk319_Mod_0_Mag", 10];
	_vSupply addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 10];
} else {
	_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_vSupply addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman
	_vSupply addMagazineCargoGlobal ["10Rnd_338_Mag", _mag]; // Marksman
	_vSupply addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _mag]; // SDAR
};

// Magazines secondary weapon
_vSupply addMagazineCargoGlobal ["16Rnd_9x21_Mag", 5];

// Launchers
_vSupply addWeaponCargoGlobal ["launch_B_Titan_short_F", 1];

// Rockets/Missiles
_vSupply addMagazineCargoGlobal ["Titan_AT", 1];
_vSupply addMagazineCargoGlobal ["Titan_AP", 1];

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
_vSupply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 2];
_vSupply addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 2];
_vSupply addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 2];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Clacker",2];
	_vSupply addItemCargoGlobal ["ACE_Cellphone",1];
	_vSupply addItemCargoGlobal ["ACE_M26_Clacker",1];
	_vSupply addItemCargoGlobal ["ACE_DefusalKit",1];
	_vSupply addItemCargoGlobal ["ACE_wirecutter",1];
};

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
	_vSupply addItemCargoGlobal ["muzzle_snds_H", 1];
	_vSupply addItemCargoGlobal ["muzzle_snds_B", 1];
	_vSupply addItemCargoGlobal ["muzzle_snds_L", 1];	
	_vSupply addItemCargoGlobal ["optic_Nightstalker", 1];
} else {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 1];
	_vSupply addItemCargoGlobal ["optic_ACO", 1];
	_vSupply addItemCargoGlobal ["optic_NVS", 1];
	_vSupply addItemCargoGlobal ["optic_MRCO", 1];
	_vSupply addItemCargoGlobal ["optic_SOS", 1];
	_vSupply addItemCargoGlobal ["optic_Nightstalker", 1];
	_vSupply addItemCargoGlobal ["acc_flashlight", 1];
	_vSupply addItemCargoGlobal ["muzzle_snds_H", 1];
	_vSupply addItemCargoGlobal ["muzzle_snds_B", 1];
	_vSupply addItemCargoGlobal ["muzzle_snds_L", 1];
};
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 	
};

// GL Ammo
_vSupply addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 5];
_vSupply addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 5]; 
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HuntIR_M203",5];
	_vSupply addItemCargoGlobal ["ACE_HuntIR_monitor",1];
};

// Grenades
_vSupply addMagazineCargoGlobal ["MiniGrenade", 10]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 10]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellGreen", 5]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellRed", 5]; 

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_EarPlugs",5];
	_vSupply addItemCargoGlobal ["ace_mapTools",5];
	_vSupply addItemCargoGlobal ["ACE_CableTie",5];
	_vSupply addItemCargoGlobal ["ACE_UAVBattery", 1];
	_vSupply addItemCargoGlobal ["ACE_TacticalLadder_Pack", 1];
};

// Medical Items
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_fieldDressing",25];
	_vSupply addItemCargoGlobal ["ACE_personalAidKit",1];
	_vSupply addItemCargoGlobal ["ACE_morphine",10];
	_vSupply addItemCargoGlobal ["ACE_epinephrine",5];
} else {
	_vSupply addItemCargoGlobal ["FirstAidKit",25];
	_vSupply addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vSupply addWeaponCargoGlobal ["Rangefinder", 1];
_vSupply addWeaponCargoGlobal ["Laserdesignator", 1];
_vSupply addWeaponCargoGlobal ["Binocular", 1];
_vSupply addItemCargoGlobal ["G_Tatical_Clear", 1];
_vSupply addItemCargoGlobal ["G_Shades_Black" ,1];
_vSupply addItemCargoGlobal ["NVGoggles", 2];

if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Vector",2];		
	_vSupply addItemCargoGlobal ["ACE_Kestrel4500",1];		
	_vSupply addItemCargoGlobal ["ACE_RangeCard",1];		
	_vSupply addItemCargoGlobal ["ACE_ATragMX",1];		
	_vSupply addItemCargoGlobal ["ACE_TacticalLadder_Pack",1];		
};	

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vSupply addItemCargoGlobal ["ACRE_PRC343", 5];
	_vSupply addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vSupply addItemCargoGlobal ["tf_anprc152", 1];
	//_vSupply addItemCargoGlobal ["tf_rt1523g", 3];
	_vSupply addBackpackCargoGlobal ["tf_rt1523g_black", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vSupply addItemCargoGlobal ["ItemRadio", 5]};
if (ADF_mod_CTAB) then {
	_vSupply addItemCargoGlobal ["ItemcTab", 1];
	_vSupply addItemCargoGlobal ["ItemAndroid", 1];
	_vSupply addItemCargoGlobal ["ItemcTabHCam",5];
};

// Gear kit (not working from crates/veh)
_vSupply addBackpackCargoGlobal ["B_AssaultPack_blk", 1];

// Misc items
_vSupply addItemCargoGlobal ["ItemGPS", 1];
_vSupply addItemCargoGlobal ["Laserbatteries", 3];
_vSupply addItemCargoGlobal ["B_Static_Designator_01_weapon_F", 1];

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 2];
