/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Crate Cargo Script (BLUEFOR) - All  items/weapons
Author: Whiztler
Script version: 1.4

Game type: n/a
File: ADF_cCargo_B_Generic.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_Generic.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

sleep 70; // let other scripts settle in

_crate = _this select 0;
_crate allowDamage false;

if (isServer) exitWith {
	// Init
	_wpn = 5; 	// Regular Weapons
	_spw = 1; 	// Special Purpose Weapons
	_lau = 2;	// Launchers
	_mag = 30;	// Magazines
	_dem = 5;	// Demo/Explosives
	_mis = 2;	// Missiles/Rockets
	_itm = 5;	// Items
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
			
	// Secondary weapon
	_crate addWeaponCargoGlobal ["hgun_P07_F", _wpn];

	// Magazines primary weapon
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", _mag]; // LMG
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", _mag]; // LMG

	// Magazines secondary weapon
	_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", _mag];

	// Launchers
	_crate addweaponCargoGlobal ["launch_NLAW_F", _lau];
	_crate addWeaponCargoGlobal ["launch_B_Titan_short_F", _lau];

	// Rockets/Missiles
	_crate addMagazineCargoGlobal ["NLAW_F", _mis];
	_crate addMagazineCargoGlobal ["Titan_AT", _mis];
	_crate addMagazineCargoGlobal ["Titan_AP", _mis];

	// Demo/Explosives
	_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", _dem];
	_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];

	// Weapon mountings
	_crate addItemCargoGlobal ["acc_pointer_IR", _itm];
	_crate addItemCargoGlobal ["optic_ACO", _itm];
	_crate addItemCargoGlobal ["optic_MRCO", _itm];
	_crate addItemCargoGlobal ["optic_Holosight", _itm];
	_crate addItemCargoGlobal ["acc_flashlight", _itm];

	// GL Ammo
	_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", _mag];
	_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", _mag];
	 
	// Grenades/Chemlights
	_crate addMagazineCargoGlobal ["HandGrenade", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShell", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShellGreen", _mag]; 	 
	_crate addMagazineCargoGlobal ["SmokeShellRed", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_green", _mag]; 
	_crate addMagazineCargoGlobal ["Chemlight_red", _mag]; 

	// Medical Items
	_crate addItemCargoGlobal ["FirstAidKit", _itm];
	_crate addItemCargoGlobal ["Medikit", 1];

	// Optical/Bino's/Goggles
	_crate addWeaponCargoGlobal ["Binocular", _itm];
	_crate addItemCargoGlobal ["G_Tatical_Clear", _itm];
	_crate addItemCargoGlobal ["NVGoggles", _itm];

	// ACRE and cTAB
	_crate addItemCargoGlobal ["ItemRadio", _itm];

	// Gear kit (not working from crates/veh)
	_crate addBackpackCargoGlobal ["B_Carryall_Base", _uni];
	_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", _uni];


	// Misc items
	_crate addItemCargoGlobal ["ItemGPS", _itm];
	_crate addItemCargoGlobal ["ItemMap", _itm];
	_crate addItemCargoGlobal ["ItemWatch", _itm];
	_crate addItemCargoGlobal ["ItemCompass", _itm];
	_crate addWeaponCargoGlobal ["B_UavTerminal", _itm];
};

