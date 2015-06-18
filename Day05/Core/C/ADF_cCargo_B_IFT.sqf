/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Crate Cargo Script (BLUEFOR) - Infantry Fire Team (Fox)
Author: Whiztler
Script version: 1.7

Game type: n/a
File: ADF_cCargo_B_IFT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the crate:
null = [this] execVM "Core\C\ADF_cCargo_B_IFT.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle cargo. 
****************************************************************/

if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_crate = _this select 0;
_crate allowDamage false;
_wpn = 1; 	// Regular Weapons
_spw = 1; 	// Special Purpose Weapons
_lau = 5;	// Launchers
_mag = 20;	// Magazines
_dem = 1;	// Demo/Explosives
_mis = 5;	// Missiles/Rockets
_itm = 1;	// Items
_uni = 4;	// Uniform/Vest/Backpack/etc

// Settings 
clearWeaponCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _crate; // Empty vehicle CargoGlobal contents on init



// Primary weapon
_crate addWeaponCargoGlobal ["arifle_MX_F", 2];
_crate addWeaponCargoGlobal ["arifle_MX_GL_F", _wpn]; // GL
_crate addWeaponCargoGlobal ["arifle_MX_SW_F", _wpn]; // LMG
		
// Secondary weapon
_crate addWeaponCargoGlobal ["hgun_P07_F", _wpn];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_crate addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", _mag];
	_crate addMagazineCargoGlobal ["ACE_100Rnd_65x39_caseless_mag_Tracer_Dim", _mag];
	_crate addMagazineCargoGlobal ["ACE_200Rnd_65x39_cased_Box_Tracer_Dim", _mag];
} else {
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _mag];
	_crate addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", _mag];
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", _mag]; // LMG
	_crate addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", _mag]; // LMG	
};


// Magazines secondary weapon
_crate addMagazineCargoGlobal ["16Rnd_9x21_Mag", _mag];

// Launchers
_crate addweaponCargoGlobal ["launch_NLAW_F", _lau];

// Rockets/Missiles
_crate addMagazineCargoGlobal ["NLAW_F", _mis];

// Demo/Explosives
_crate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", _dem];
_crate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", _dem];
_crate addMagazineCargoGlobal ["ATMine_Range_Mag", _dem];
_crate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", _itm];
_crate addItemCargoGlobal ["MineDetector", _itm];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Cellphone",1];
	_crate addItemCargoGlobal ["ACE_Clacker",_itm];
	_crate addItemCargoGlobal ["ACE_DefusalKit",_itm];
	_crate addItemCargoGlobal ["ACE_wirecutter",_itm];
};		

// Weapon mountings
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["acc_pointer_IR", 1];
	_crate addItemCargoGlobal ["acc_flashlight", 1];	
	_crate addItemCargoGlobal ["ACE_optic_Hamr_2D", 1];
	_crate addItemCargoGlobal ["ACE_optic_Hamr_PIP", 1];
	_crate addItemCargoGlobal ["ACE_optic_Arco_2D", 1];
	_crate addItemCargoGlobal ["ACE_optic_Arco_PIP", 1];
	_crate addItemCargoGlobal ["ACE_optic_MRCO_2D", 1];
} else {
	_crate addItemCargoGlobal ["acc_pointer_IR", 1];
	_crate addItemCargoGlobal ["optic_ACO", 1];
	_crate addItemCargoGlobal ["optic_NVS", 1];
	_crate addItemCargoGlobal ["optic_Hamr", 1];
	_crate addItemCargoGlobal ["acc_flashlight", 1];
};

// GL Ammo
_crate addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
_crate addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 5];
_crate addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", 3];
_crate addMagazineCargoGlobal ["UGL_FlareCIR_F", 1];
_crate addMagazineCargoGlobal ["UGL_FlareWhite_F", 3];
_crate addMagazineCargoGlobal ["UGL_FlareGreen_F", 3];
_crate addMagazineCargoGlobal ["UGL_FlareRed_F", 3];
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_HuntIR_M203",10];
	_crate addItemCargoGlobal ["ACE_HuntIR_monitor",2];
};

// Grenades/Chemlights
_crate addMagazineCargoGlobal ["HandGrenade", 15]; 	 
_crate addMagazineCargoGlobal ["SmokeShell", 15]; 	 
_crate addMagazineCargoGlobal ["SmokeShellGreen", 3]; 	 
_crate addMagazineCargoGlobal ["SmokeShellRed", 3]; 
_crate addMagazineCargoGlobal ["SmokeShellPurple", 1]; 
_crate addMagazineCargoGlobal ["Chemlight_green", _mag]; 
_crate addMagazineCargoGlobal ["Chemlight_red", _mag]; 
_crate addMagazineCargoGlobal ["B_IR_Grenade", 3]; 
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_HandFlare_White",10];
	_crate addItemCargoGlobal ["ACE_HandFlare_Red",3];
	_crate addItemCargoGlobal ["ACE_HandFlare_Green",3];
	_crate addItemCargoGlobal ["ACE_HandFlare_Yellow",3];
};

// ACE3 Specific	
if (ADF_mod_ACE3) then {_crate addItemCargoGlobal ["ACE_EarPlugs",15]};
if (ADF_mod_ACE3) then {_crate addItemCargoGlobal ["ace_mapTools",_itm]};	

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
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_Vector",3];		
	_crate addItemCargoGlobal ["ACE_Kestrel4500",1];		
} else {		
	_crate addWeaponCargoGlobal ["Binocular", 3];
};
_crate addItemCargoGlobal ["G_Tatical_Clear", 5];
_crate addItemCargoGlobal ["NVGoggles", 5];

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
_crate addBackpackCargoGlobal ["B_Carryall_Base", 3];
_crate addBackpackCargoGlobal ["B_AssaultPack_blk", 3];
_crate addBackpackCargoGlobal ["B_Kitbag_mcamo", 3];

// Misc items
_crate addItemCargoGlobal ["ItemMap", 3];
_crate addItemCargoGlobal ["ItemWatch", 3];
_crate addItemCargoGlobal ["ItemCompass", 3];	
if (ADF_mod_ACE3) then {
	_crate addItemCargoGlobal ["ACE_UAVBattery", 2];
};

