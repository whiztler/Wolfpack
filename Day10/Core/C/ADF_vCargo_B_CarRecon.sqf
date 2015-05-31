/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Vehicle Cargo Script (BLUEFOR) - Car Recon/Specop Teams
Author: Whiztler
Script version: 1.4

Game type: n/a
File: ADF_vCargo_B_CarRecon.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_CarRecon.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

// Init
_vAmmo = _this select 0;
_mag = 25;

if (!isServer) exitWith {};

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

ADF_init_vars = false;
waitUntil {ADF_init_vars};

// Primary weapon
_vAmmo addWeaponCargoGlobal ["srifle_EBR_DMS_pointer_snds_F", 1]; // Marksman
_vAmmo addWeaponCargoGlobal ["arifle_MX_ACO_pointer_snds_F", 1];
_vAmmo addWeaponCargoGlobal ["srifle_EBR_SOS_F", 1]; // Marksman
_vAmmo addWeaponCargoGlobal ["srifle_LRR_LRPS_F", 1]; // Sniper
_vAmmo addWeaponCargoGlobal ["srifle_DMR_06_camo_khs_F", 1]; // Sharpshooter

// Secondary weapon
_vAmmo addWeaponCargoGlobal ["hgun_P07_snds_F", 1];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", _mag];
	
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_338_API526_Mag", _mag];
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_338_300gr_HPBT_Mag", _mag];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_SD", _mag];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", _mag];
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_762x54_Tracer_mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mag_Tracer_Dim", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag", 10];
	
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_10Rnd_762x51_Mk319_Mod_0_Mag", 10];
	_vAmmo addMagazineCargoGlobal ["ACE_20Rnd_762x51_Mk319_Mod_0_Mag", 10];
} else {
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_vAmmo addMagazineCargoGlobal ["20Rnd_762x51_Mag", _mag]; // Marksman
	_vAmmo addMagazineCargoGlobal ["10Rnd_338_Mag", _mag]; // Marksman
	_vAmmo addMagazineCargoGlobal ["30Rnd_556x45_Stanag", _mag]; // SDAR
};

// Magazines secondary weapon
_vAmmo addMagazineCargoGlobal ["16Rnd_9x21_Mag", 5];

// Launchers
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_short_F", 1];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["Titan_AT", 1];
_vAmmo addMagazineCargoGlobal ["Titan_AP", 1];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 2];
_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 2];
_vAmmo addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 2];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Clacker",2];
	_vAmmo addItemCargoGlobal ["ACE_Cellphone",1];
	_vAmmo addItemCargoGlobal ["ACE_M26_Clacker",1];
	_vAmmo addItemCargoGlobal ["ACE_DefusalKit",1];
	_vAmmo addItemCargoGlobal ["ACE_wirecutter",1];
};

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
	_vAmmo addItemCargoGlobal ["muzzle_snds_H", 1];
	_vAmmo addItemCargoGlobal ["muzzle_snds_B", 1];
	_vAmmo addItemCargoGlobal ["muzzle_snds_L", 1];	
	_vAmmo addItemCargoGlobal ["optic_Nightstalker", 1];
} else {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 1];
	_vAmmo addItemCargoGlobal ["optic_ACO", 1];
	_vAmmo addItemCargoGlobal ["optic_NVS", 1];
	_vAmmo addItemCargoGlobal ["optic_MRCO", 1];
	_vAmmo addItemCargoGlobal ["optic_SOS", 1];
	_vAmmo addItemCargoGlobal ["optic_Nightstalker", 1];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 1];
	_vAmmo addItemCargoGlobal ["muzzle_snds_H", 1];
	_vAmmo addItemCargoGlobal ["muzzle_snds_B", 1];
	_vAmmo addItemCargoGlobal ["muzzle_snds_L", 1];
};
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 	
};

// GL Ammo
_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 5];
_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 5]; 

// Grenades
_vAmmo addMagazineCargoGlobal ["MiniGrenade", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 5]; 

// ACE3 Specific	
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ACE_EarPlugs",5]};
if (ADF_mod_ACE3) then {_vAmmo addItemCargoGlobal ["ace_mapTools",5]};

// Medical Items
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_fieldDressing",25];
	_vAmmo addItemCargoGlobal ["ACE_personalAidKit",1];
	_vAmmo addItemCargoGlobal ["ACE_morphine",10];
	_vAmmo addItemCargoGlobal ["ACE_epinephrine",5];
} else {
	_vAmmo addItemCargoGlobal ["FirstAidKit",25];
	_vAmmo addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Rangefinder", 1];
_vAmmo addWeaponCargoGlobal ["Laserdesignator", 1];
_vAmmo addWeaponCargoGlobal ["Binocular", 1];
_vAmmo addItemCargoGlobal ["G_Tatical_Clear", 1];
_vAmmo addItemCargoGlobal ["G_Shades_Black" ,1];
_vAmmo addItemCargoGlobal ["NVGoggles", 2];

if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Vector",2];		
	_vAmmo addItemCargoGlobal ["ACE_Kestrel",1];		
};	

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vAmmo addItemCargoGlobal ["ACRE_PRC343", 5];
	_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vAmmo addItemCargoGlobal ["tf_anprc152", 1];
	//_vAmmo addItemCargoGlobal ["tf_rt1523g", 3];
	_vAmmo addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vAmmo addItemCargoGlobal ["ItemRadio", 5]};
if (ADF_mod_CTAB) then {
	_vAmmo addItemCargoGlobal ["ItemcTab", 1];
	_vAmmo addItemCargoGlobal ["ItemAndroid", 1];
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",5];
};

// Gear kit (not working from crates/veh)
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 1];

// Misc items
_vAmmo addItemCargoGlobal ["ItemGPS", 1];
_vAmmo addItemCargoGlobal ["Laserbatteries", 3];
_vAmmo addItemCargoGlobal ["B_Static_Designator_01_weapon_F", 1];

//hintSilent "vAmmo loaded."; // For debug only.