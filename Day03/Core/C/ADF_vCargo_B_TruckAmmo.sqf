/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Vehicle Cargo Script (BLUEFOR) (BLUEFOR) - Ammunition Supply Truck
Author: Whiztler
Script version: 2.0

Game type: n/a
File: ADF_vCargo_B_TruckAmmo.sqf
****************************************************************
Instructions:

Paste below line in the INITIALIZATION box of the vehicle:
null = [this] execVM "Core\C\ADF_vCargo_B_TruckAmmo.sqf";

You can comment out (//) lines of ammo you do not want to include
in the vehicle Cargo. 
****************************************************************/

// Init
if (!isServer) exitWith {};

waitUntil {time > 0};

// Init
_vSupply = _this select 0;

// Settings 
clearWeaponCargoGlobal _vSupply; // Empty vehicle Cargo contents on init
clearMagazineCargoGlobal _vSupply; // Empty vehicle Cargo contents on init
clearItemCargoGlobal _vSupply; // Empty vehicle Cargo contents on init

// Primary weapon
_vSupply addWeaponCargoGlobal ["arifle_MX_GL_F", 2]; // GL
_vSupply addWeaponCargoGlobal ["arifle_MX_SW_F", 2]; // LMG
_vSupply addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
_vSupply addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman
_vSupply addWeaponCargoGlobal ["arifle_MX_F", 10];

// Secondary weapon
_vSupply addWeaponCargoGlobal ["hgun_P07_F", 10];

// Magazines primary weapon
_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 100];
_vSupply addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", 100]; // LMG
_vSupply addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 25]; // LMG
_vSupply addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 50]; // MG
_vSupply addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 25]; // MG
if (ADF_mod_ACE3) then {
	_vSupply addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 250];
} else {
	_vSupply addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 250];
};

// Magazines secondary weapon
_vSupply addMagazineCargoGlobal ["16Rnd_9x21_Mag", 20];

// Launchers
_vSupply addweaponCargoGlobal ["launch_NLAW_F", 5];
_vSupply addWeaponCargoGlobal ["launch_B_Titan_F", 2];
_vSupply addWeaponCargoGlobal ["launch_B_Titan_short_F", 2];

// Rockets/Missiles
if (!ADF_mod_ACE3) then {_vSupply addMagazineCargoGlobal ["NLAW_F", 10]};
_vSupply addMagazineCargoGlobal ["Titan_AT", 10];
_vSupply addMagazineCargoGlobal ["Titan_AP", 5];
_vSupply addMagazineCargoGlobal ["Titan_AA", 5];

// Demo/Explosives
_vSupply addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 15];
_vSupply addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 10];
_vSupply addMagazineCargoGlobal ["ATMine_Range_Mag", 5];
_vSupply addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 5];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Clacker",10];
	_vSupply addItemCargoGlobal ["ACE_DefusalKit",5];
	_vSupply addItemCargoGlobal ["ACE_M26_Clacker",5]; 
	_vSupply addItemCargoGlobal ["ACE_wirecutter",3];
};	

// Weapon mountings
// Weapon mountings
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 10];
	_vSupply addItemCargoGlobal ["acc_flashlight", 10];	
	_vSupply addItemCargoGlobal ["ACE_optic_Hamr_2D", 10];
	_vSupply addItemCargoGlobal ["ACE_optic_Hamr_PIP", 10];
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_2D", 10];
	_vSupply addItemCargoGlobal ["ACE_optic_Arco_PIP", 10];
	_vSupply addItemCargoGlobal ["ACE_optic_MRCO_2D", 10];
	// Sniper/Marksman
	_vSupply addItemCargoGlobal ["ACE_optic_SOS_2D", 2];
	_vSupply addItemCargoGlobal ["ACE_optic_SOS_PIP", 2];
	_vSupply addItemCargoGlobal ["ACE_optic_LRPS_2D", 2];	
	_vSupply addItemCargoGlobal ["ACE_optic_LRPS_PIP", 2];	
} else {
	_vSupply addItemCargoGlobal ["acc_pointer_IR", 10];
	_vSupply addItemCargoGlobal ["optic_ACO", 10];
	_vSupply addItemCargoGlobal ["optic_NVS", 10];
	_vSupply addItemCargoGlobal ["optic_Hamr", 10];
	_vSupply addItemCargoGlobal ["acc_flashlight", 10];
};
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_smg_01", 5];  
	_vSupply addItemCargoGlobal ["ACE_muzzle_mzls_smg_02", 5];	 	
};
// GL Ammo
_vSupply addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 25];
_vSupply addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 25];
_vSupply addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 25];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HuntIR_M203",10];
	_vSupply addItemCargoGlobal ["ACE_HuntIR_monitor",2];
};

// Grenades
_vSupply addMagazineCargoGlobal ["HandGrenade", 50]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShell", 50]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellGreen", 25]; 	 
_vSupply addMagazineCargoGlobal ["SmokeShellRed", 25];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_HandFlare_White",25];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Red",15];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Green",15];
	_vSupply addItemCargoGlobal ["ACE_HandFlare_Yellow",15];
	_vSupply addItemCargoGlobal ["ACE_M84",15];
}; 

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vSupply addItemCargoGlobal ["ACRE_PRC343", 25];
	_vSupply addItemCargoGlobal ["ACRE_PRC148", 5];
};
if (ADF_mod_TFAR) then {
	_vSupply addItemCargoGlobal ["tf_anprc152", 25];
	//_vSupply addItemCargoGlobal ["tf_rt1523g", 3];
	_vSupply addBackpackCargoGlobal ["tf_rt1523g", 5];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vSupply addItemCargoGlobal ["ItemRadio", 25]};
if (ADF_mod_CTAB) then {
	//_vSupply addItemCargoGlobal ["ItemAndroid", 5];
	//_vSupply addItemCargoGlobal ["ItemcTab", 1];
	_vSupply addItemCargoGlobal ["ItemcTabHCam",25];
};

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_EarPlugs",50];
	_vSupply addItemCargoGlobal ["ace_mapTools",10];
	_vSupply addItemCargoGlobal ["ACE_CableTie",50];
	_vSupply addItemCargoGlobal ["ACE_UAVBattery",5];
	_vSupply addItemCargoGlobal ["ACE_TacticalLadder_Pack",3];
};

// Medical Items
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_fieldDressing",30];
	_vSupply addItemCargoGlobal ["ACE_personalAidKit",1];
	_vSupply addItemCargoGlobal ["ACE_morphine",15];
	_vSupply addItemCargoGlobal ["ACE_epinephrine",10];
	_vSupply addItemCargoGlobal ["ACE_bloodIV",5];
} else {
	_vSupply addItemCargoGlobal ["FirstAidKit",30];
	_vSupply addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vSupply addWeaponCargoGlobal ["Rangefinder", 2];
_vSupply addWeaponCargoGlobal ["Binocular", 10];
_vSupply addItemCargoGlobal ["G_Tatical_Clear", 5];
_vSupply addItemCargoGlobal ["G_Shades_Black" ,5];
_vSupply addItemCargoGlobal ["NVGoggles", 10];
if (ADF_mod_ACE3) then {
	_vSupply addItemCargoGlobal ["ACE_Vector",5];		
};

// Gear kit (not working from crates/veh)
_vSupply addBackpackCargoGlobal ["B_Carryall_Base", 10];
_vSupply addBackpackCargoGlobal ["B_AssaultPack_blk", 10];
_vSupply addBackpackCargoGlobal ["B_Kitbag_mcamo", 5];

// Misc items
_vSupply addItemCargoGlobal ["ItemGPS", 10];

// Misc items
_vSupply addItemCargoGlobal ["ToolKit", 2];