/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

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
_vAmmo = _this select 0;

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle CargoGlobal contents on init

// Primary weapon
_vAmmo addWeaponCargoGlobal ["arifle_MX_GL_F", 1]; // GL
_vAmmo addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
_vAmmo addWeaponCargoGlobal ["MMG_02_sand_RCO_LP_F", 1]; // MG
_vAmmo addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman

// Secondary weapon
_vAmmo addWeaponCargoGlobal ["hgun_P07_F", 1];

// Magazines primary weapon
if (ADF_mod_ACE3) then {
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 15];
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x47_Scenar_mag", 5];
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65_Creedmor_mag", 5];
	_vAmmo addMagazineCargoGlobal ["ACE_200Rnd_65x39_cased_Box_Tracer_Dim", 7];	
} else {
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 20];
	_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 5]; // MG
	_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 2]; // MG
};
	_vAmmo addMagazineCargoGlobal ["130Rnd_338_Mag", 5];

// Magazines secondary weapon
_vAmmo addMagazineCargoGlobal ["16Rnd_9x21_Mag", 3];

// Static weapon
_vAmmo addItemCargoGlobal ["B_GMG_01_weapon_F", 1];
_vAmmo addItemCargoGlobal ["B_HMG_01_weapon_F", 1];
_vAmmo addItemCargoGlobal ["B_HMG_01_support_F", 2];

// Static weapon Ammunition
_vAmmo addMagazineCargoGlobal ["500Rnd_127x99_mag", 2];
_vAmmo addMagazineCargoGlobal ["40Rnd_20mm_g_belt", 2];

// Mortar
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_guided", 4];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_shells", 4];
_vAmmo addMagazineCargoGlobal ["8Rnd_82mm_Mo_LG", 2];

// Launchers
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_F", 1];
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_short_F", 1];

// Rockets/Missiles
_vAmmo addMagazineCargoGlobal ["Titan_AT", 5];
_vAmmo addMagazineCargoGlobal ["Titan_AP", 2];
_vAmmo addMagazineCargoGlobal ["Titan_AA", 2];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 5];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
_vAmmo addMagazineCargoGlobal ["ATMine_Range_Mag", 3];
_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 3];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Cellphone",1];
	_vAmmo addItemCargoGlobal ["ACE_Clacker",2];
	_vAmmo addItemCargoGlobal ["ACE_M26_Clacker",2]; // ACE3 094	
	_vAmmo addItemCargoGlobal ["ACE_DefusalKit",2];
	_vAmmo addItemCargoGlobal ["ACE_wirecutter",1];
};	

// Weapon mountings
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 6];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 6];	
	_vAmmo addItemCargoGlobal ["ACE_optic_Hamr_2D", 3];
	_vAmmo addItemCargoGlobal ["ACE_optic_Hamr_PIP", 3];
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_2D", 3];
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_PIP", 3];
	_vAmmo addItemCargoGlobal ["ACE_optic_MRCO_2D", 4];
	_vAmmo addItemCargoGlobal ["optic_tws_mg", 2];	
	_vAmmo addItemCargoGlobal ["optic_NVS", 3];	
} else {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 6];
	_vAmmo addItemCargoGlobal ["optic_ACO", 1];
	_vAmmo addItemCargoGlobal ["optic_DMS", 2];
	_vAmmo addItemCargoGlobal ["optic_NVS", 3];
	_vAmmo addItemCargoGlobal ["optic_Hamr", 3];
	_vAmmo addItemCargoGlobal ["optic_tws_mg", 2];
	_vAmmo addItemCargoGlobal ["acc_flashlight",6];
};

// GL Ammo
_vAmmo addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 15];
_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 6];
_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 6]; 
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_HuntIR_M203",3];
	_vAmmo addItemCargoGlobal ["ACE_HuntIR_monitor",1];
};

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 6]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 6]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 3]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 1]; 
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_White",6];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Red",1];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Green",1];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Yellow",1];
	_vAmmo addItemCargoGlobal ["ACE_M84",5]; // ACE3 094	
};

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vAmmo addItemCargoGlobal ["ACRE_PRC343", 6];
	_vAmmo addItemCargoGlobal ["ACRE_PRC148", 1];
};
if (ADF_mod_TFAR) then {
	_vAmmo addItemCargoGlobal ["tf_anprc152", 6];
	//_vAmmo addItemCargoGlobal ["tf_rt1523g", 3];
	_vAmmo addBackpackCargoGlobal ["tf_rt1523g", 1];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vAmmo addItemCargoGlobal ["ItemRadio", 6]};
/*if (ADF_mod_CTAB) then {
	_vAmmo addItemCargoGlobal ["ItemAndroid", 1];
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",6];
};*/

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_EarPlugs",5];
	_vAmmo addItemCargoGlobal ["ace_mapTools",1];
	_vAmmo addItemCargoGlobal ["ACE_CableTie",5];
	_vAmmo addItemCargoGlobal ["ACE_UAVBattery", 1];
	_vAmmo addItemCargoGlobal ["ACE_TacticalLadder_Pack", 1];
}; 

// Medical Items
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_fieldDressing",10];
	_vAmmo addItemCargoGlobal ["ACE_personalAidKit",1];
	_vAmmo addItemCargoGlobal ["ACE_morphine",5];
	_vAmmo addItemCargoGlobal ["ACE_epinephrine",3];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV",1];
} else {
	_vAmmo addItemCargoGlobal ["FirstAidKit",10];
	_vAmmo addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Rangefinder", 3];
_vAmmo addItemCargoGlobal ["NVGoggles", 3];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Vector",2];		
};	

// Gear kit 
_vAmmo addBackpackCargoGlobal ["B_Carryall_Base", 3];
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 5];
