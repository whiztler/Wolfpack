/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Car Infantry Weapons Team
Author: Whiztler
Script version: 1.6

Game type: n/a
File: ADF_vCargo_B_CarIWT.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_CarIWT.sqf";

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
_vSupply addWeaponCargoGlobal ["arifle_MX_GL_F", 1]; // GL
_vSupply addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
_vSupply addWeaponCargoGlobal ["MMG_02_sand_RCO_LP_F", 1]; // MG
_vSupply addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman

// Secondary weapon
_vSupply addWeaponCargoGlobal ["hgun_P07_F", 1];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 15];
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x47_Scenar_mag", 5];
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65_Creedmor_mag", 5];
	_vSupply addMagazineCargoGlobal ["ACE_200Rnd_65x39_cased_Box_Tracer_Dim", 7];	
} else {
	_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 20];
	_vSupply addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 5]; // MG
	_vSupply addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 2]; // MG
};
	_vSupply addMagazineCargoGlobal ["130Rnd_338_Mag", 5];

// Magazines secondary weapon
_vSupply addMagazineCargoGlobal ["16Rnd_9x21_Mag", 3];

// Static weapon
_vSupply addItemCargoGlobal ["B_GMG_01_weapon_F", 1];
_vSupply addItemCargoGlobal ["B_HMG_01_weapon_F", 1];
_vSupply addItemCargoGlobal ["B_HMG_01_support_F", 2];

// Static weapon Ammunition
_vSupply addMagazineCargoGlobal ["500Rnd_127x99_mag", 2];
_vSupply addMagazineCargoGlobal ["40Rnd_20mm_g_belt", 2];

// Mortar
_vSupply addMagazineCargoGlobal ["8Rnd_82mm_Mo_guided", 4];
_vSupply addMagazineCargoGlobal ["8Rnd_82mm_Mo_shells", 4];
_vSupply addMagazineCargoGlobal ["8Rnd_82mm_Mo_LG", 2];

// Launchers
_vSupply addWeaponCargoGlobal ["launch_B_Titan_F", 1];
_vSupply addWeaponCargoGlobal ["launch_B_Titan_short_F", 1];

// Rockets/Missiles
_vSupply addMagazineCargoGlobal ["Titan_AT", 5];
_vSupply addMagazineCargoGlobal ["Titan_AP", 2];
_vSupply addMagazineCargoGlobal ["Titan_AA", 2];

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
_vSupply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
_vSupply addMagazineCargoGlobal ["ATMine_Range_Mag", 3];
_vSupply addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 3];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Cellphone",1];
	_vSupply addItemCargoGlobal ["ACE_Clacker",2];
	_vSupply addItemCargoGlobal ["ACE_M26_Clacker",2]; // ACE3 094	
	_vSupply addItemCargoGlobal ["ACE_DefusalKit",2];
	_vSupply addItemCargoGlobal ["ACE_wirecutter",1];
};	

// Weapon mountings
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 6];
	_vSupply addItemCargoGlobal ["acc_flashlight", 6];	
	_vSupply addItemCargoGlobal ["ACE_optic_Hamr_2D", 3];
	_vSupply addItemCargoGlobal ["ACE_optic_Hamr_PIP", 3];
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_2D", 3];
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_PIP", 3];
	_vSupply addItemCargoGlobal ["ACE_optic_MRCO_2D", 4];
	_vSupply addItemCargoGlobal ["optic_tws_mg", 2];	
	_vSupply addItemCargoGlobal ["optic_NVS", 3];	
} else {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 6];
	_vSupply addItemCargoGlobal ["optic_ACO", 1];
	_vSupply addItemCargoGlobal ["optic_DMS", 2];
	_vSupply addItemCargoGlobal ["optic_NVS", 3];
	_vSupply addItemCargoGlobal ["optic_Hamr", 3];
	_vSupply addItemCargoGlobal ["optic_tws_mg", 2];
	_vSupply addItemCargoGlobal ["acc_flashlight",6];
};

// GL Ammo
_vSupply addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 15];
_vSupply addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 6];
_vSupply addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 6]; 
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HuntIR_M203",3];
	_vSupply addItemCargoGlobal ["ACE_HuntIR_monitor",1];
};

// Grenades
_vSupply addMagazineCargoGlobal ["HandGrenade", 6]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 6]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellGreen", 3]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellRed", 1]; 
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HandFlare_White",6];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Red",1];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Green",1];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Yellow",1];
	_vSupply addItemCargoGlobal ["ACE_M84",5]; // ACE3 094	
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vSupply addItemCargoGlobal ["ACRE_PRC343", 6];
	_vSupply addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vSupply addItemCargoGlobal ["tf_anprc152", 6];
	//_vSupply addItemCargoGlobal ["tf_rt1523g", 3];
	_vSupply addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vSupply addItemCargoGlobal ["ItemRadio", 6]};
/*if (ADF_mod_CTAB) then {
	_vSupply addItemCargoGlobal ["ItemAndroid", 1];
	_vSupply addItemCargoGlobal ["ItemcTabHCam",6];
};*/

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_EarPlugs",5];
	_vSupply addItemCargoGlobal ["ace_mapTools",1];
	_vSupply addItemCargoGlobal ["ACE_CableTie",5];
	_vSupply addItemCargoGlobal ["ACE_UAVBattery", 1];
	_vSupply addItemCargoGlobal ["ACE_TacticalLadder_Pack", 1];
}; 

// Medical Items
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_fieldDressing",10];
	_vSupply addItemCargoGlobal ["ACE_personalAidKit",1];
	_vSupply addItemCargoGlobal ["ACE_morphine",5];
	_vSupply addItemCargoGlobal ["ACE_epinephrine",3];
	_vSupply addItemCargoGlobal ["ACE_bloodIV",1];
} else {
	_vSupply addItemCargoGlobal ["FirstAidKit",10];
	_vSupply addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vSupply addWeaponCargoGlobal ["Rangefinder", 3];
_vSupply addItemCargoGlobal ["NVGoggles", 3];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Vector",2];		
};	

// Gear kit 
_vSupply addBackpackCargoGlobal ["B_Carryall_Base", 3];
_vSupply addBackpackCargoGlobal ["B_AssaultPack_blk", 5];

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 3];