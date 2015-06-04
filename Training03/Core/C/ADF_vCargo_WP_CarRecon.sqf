/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car Recon/Specop Teams
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



sleep 25; // let other scripts settle in

// Init
_vAmmo = _this select 0;

if (!isserver) exitWith {};


// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vAmmo addWeaponCargoGlobal ["srifle_EBR_DMS_pointer_snds_F", 1]; // Marksman
_vAmmo addWeaponCargoGlobal ["arifle_MX_ACO_pointer_snds_F", 1];

// Secondary weapon
_vAmmo addWeaponCargoGlobal ["hgun_P07_snds_F", 1];

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 25];
_vAmmo addMagazineCargoGlobal ["20Rnd_762x51_Mag", 10]; // marksman

// Magazines secondary weapon
_vAmmo addMagazineCargoGlobal ["16Rnd_9x21_Mag", 5];

// Launchers
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_short_F", 1];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["Titan_AT", 1];
_vAmmo addMagazineCargoGlobal ["Titan_AP", 1];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 10];
_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 5];

// Weapon mountings
_vAmmo addItemCargoGlobal ["acc_pointer_IR", 1];
_vAmmo addItemCargoGlobal ["optic_NVS", 3];
_vAmmo addItemCargoGlobal ["muzzle_snds_H", 1];

// GL Ammo
_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 5];
_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 5]; 

// Grenades
_vAmmo addMagazineCargoGlobal ["MiniGrenade", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 10]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 5]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 5]; 

// Medical Items
_vAmmo addItemCargoGlobal ["FirstAidKit", 5];

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Rangefinder", 1];
_vAmmo addWeaponCargoGlobal ["Laserdesignator", 1];
_vAmmo addWeaponCargoGlobal ["Binocular", 1];
_vAmmo addItemCargoGlobal ["G_Tatical_Clear", 1];
_vAmmo addItemCargoGlobal ["G_Shades_Black" ,1];
_vAmmo addItemCargoGlobal ["NVGoggles", 2];

// ACRE and cTAB
if (ADF_mod_ACRE) then {_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];};

// Gear kit (not working from crates/veh)
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 1];

// Misc items
_vAmmo addItemCargoGlobal ["ItemGPS", 1];
_vAmmo addItemCargoGlobal ["Laserbatteries", 3];

//hintSilent "vAmmo loaded."; // For debug only.