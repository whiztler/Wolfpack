/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

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
_vAmmo = _this select 0;

// Settings 
clearWeaponCargoGlobal _vAmmo; // Empty vehicle Cargo contents on init
clearMagazineCargoGlobal _vAmmo; // Empty vehicle Cargo contents on init
clearItemCargoGlobal _vAmmo; // Empty vehicle Cargo contents on init

// Primary weapon
_vAmmo addWeaponCargoGlobal ["arifle_MX_GL_F", 2]; // GL
_vAmmo addWeaponCargoGlobal ["arifle_MX_SW_F", 2]; // LMG
_vAmmo addWeaponCargoGlobal ["LMG_mk200_f", 1]; // MG
_vAmmo addWeaponCargoGlobal ["arifle_MXM_F", 1]; // Marksman
_vAmmo addWeaponCargoGlobal ["arifle_MX_F", 10];

// Secondary weapon
_vAmmo addWeaponCargoGlobal ["hgun_P07_F", 10];

// Magazines primary weapon
_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 100];
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_tracer", 100]; // LMG
_vAmmo addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 25]; // LMG
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 50]; // MG
_vAmmo addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 25]; // MG
if (ADF_mod_ACE3) then {
	_vAmmo addMagazineCargoGlobal ["ACE_30Rnd_65x39_caseless_mag_Tracer_Dim", 250];
} else {
	_vAmmo addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 250];
};

// Magazines secondary weapon
_vAmmo addMagazineCargoGlobal ["16Rnd_9x21_Mag", 50];

// Launchers
_vAmmo addweaponCargoGlobal ["launch_NLAW_F", 5];
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_F", 2];
_vAmmo addWeaponCargoGlobal ["launch_B_Titan_short_F", 5];

// Rockets/Missiles
if (!ADF_mod_ACE3) then {_vAmmo addMagazineCargoGlobal ["NLAW_F", 10]};
_vAmmo addMagazineCargoGlobal ["Titan_AT", 10];
_vAmmo addMagazineCargoGlobal ["Titan_AP", 5];
_vAmmo addMagazineCargoGlobal ["Titan_AA", 5];

// Demo/Explosives
_vAmmo addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 15];
_vAmmo addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 10];
_vAmmo addMagazineCargoGlobal ["ATMine_Range_Mag", 5];
_vAmmo addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 5];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Clacker",10];
	_vAmmo addItemCargoGlobal ["ACE_DefusalKit",5];
	_vAmmo addItemCargoGlobal ["ACE_M26_Clacker",5]; 
	_vAmmo addItemCargoGlobal ["ACE_wirecutter",3];
};	

// Weapon mountings
// Weapon mountings
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 10];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 10];	
	_vAmmo addItemCargoGlobal ["ACE_optic_Hamr_2D", 10];
	_vAmmo addItemCargoGlobal ["ACE_optic_Hamr_PIP", 10];
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_2D", 10];
	_vAmmo addItemCargoGlobal ["ACE_optic_Arco_PIP", 10];
	_vAmmo addItemCargoGlobal ["ACE_optic_MRCO_2D", 10];
	// Sniper/Marksman
	_vAmmo addItemCargoGlobal ["ACE_optic_SOS_2D", 2];
	_vAmmo addItemCargoGlobal ["ACE_optic_SOS_PIP", 2];
	_vAmmo addItemCargoGlobal ["ACE_optic_LRPS_2D", 2];	
	_vAmmo addItemCargoGlobal ["ACE_optic_LRPS_PIP", 2];	
} else {
	_vAmmo addItemCargoGlobal ["acc_pointer_IR", 10];
	_vAmmo addItemCargoGlobal ["optic_ACO", 10];
	_vAmmo addItemCargoGlobal ["optic_NVS", 10];
	_vAmmo addItemCargoGlobal ["optic_Hamr", 10];
	_vAmmo addItemCargoGlobal ["acc_flashlight", 10];
};
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_H", 5];  
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_B", 5];  	
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_L", 5];	 
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_smg_01", 5];  
	_vAmmo addItemCargoGlobal ["ACE_muzzle_mzls_smg_02", 5];	 	
};
// GL Ammo
_vAmmo addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 25];
_vAmmo addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 25];
_vAmmo addMagazineCargoGlobal ["3Rnd_UGL_FlareCIR_F", 25];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_HuntIR_M203",10];
	_vAmmo addItemCargoGlobal ["ACE_HuntIR_monitor",2];
};

// Grenades
_vAmmo addMagazineCargoGlobal ["HandGrenade", 50]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShell", 50]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellGreen", 25]; 	 
_vAmmo addMagazineCargoGlobal ["SmokeShellRed", 25];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_White",25];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Red",15];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Green",15];
	_vAmmo addItemCargoGlobal ["ACE_HandFlare_Yellow",15];
	_vAmmo addItemCargoGlobal ["ACE_M84",15];
}; 

// ACRE / TFAR and cTAB
if (ADF_mod_ACRE) then {
	_vAmmo addItemCargoGlobal ["ACRE_PRC343", 25];
	_vAmmo addItemCargoGlobal ["ACRE_PRC148", 5];
};
if (ADF_mod_TFAR) then {
	_vAmmo addItemCargoGlobal ["tf_anprc152", 25];
	//_vAmmo addItemCargoGlobal ["tf_rt1523g", 3];
	_vAmmo addBackpackCargoGlobal ["tf_rt1523g", 5];
};
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_vAmmo addItemCargoGlobal ["ItemRadio", 25]};
if (ADF_mod_CTAB) then {
	//_vAmmo addItemCargoGlobal ["ItemAndroid", 5];
	//_vAmmo addItemCargoGlobal ["ItemcTab", 1];
	_vAmmo addItemCargoGlobal ["ItemcTabHCam",25];
};

// ACE3 Specific	
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_EarPlugs",50];
	_vAmmo addItemCargoGlobal ["ace_mapTools",10];
	_vAmmo addItemCargoGlobal ["ACE_CableTie",50];
	_vAmmo addItemCargoGlobal ["ACE_UAVBattery",5];
	_vAmmo addItemCargoGlobal ["ACE_TacticalLadder_Pack",3];
};

// Medical Items
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_fieldDressing",30];
	_vAmmo addItemCargoGlobal ["ACE_personalAidKit",1];
	_vAmmo addItemCargoGlobal ["ACE_morphine",15];
	_vAmmo addItemCargoGlobal ["ACE_epinephrine",10];
	_vAmmo addItemCargoGlobal ["ACE_bloodIV",5];
} else {
	_vAmmo addItemCargoGlobal ["FirstAidKit",30];
	_vAmmo addItemCargoGlobal ["Medikit",1];
};

// Optical/Bino's/Goggles
_vAmmo addWeaponCargoGlobal ["Rangefinder", 2];
_vAmmo addWeaponCargoGlobal ["Binocular", 10];
_vAmmo addItemCargoGlobal ["G_Tatical_Clear", 5];
_vAmmo addItemCargoGlobal ["G_Shades_Black" ,5];
_vAmmo addItemCargoGlobal ["NVGoggles", 10];
if (ADF_mod_ACE3) then {
	_vAmmo addItemCargoGlobal ["ACE_Vector",5];		
};

// Gear kit (not working from crates/veh)
_vAmmo addBackpackCargoGlobal ["B_Carryall_Base", 10];
_vAmmo addBackpackCargoGlobal ["B_AssaultPack_blk", 10];
_vAmmo addBackpackCargoGlobal ["B_Kitbag_mcamo", 5];

// Misc items
_vAmmo addItemCargoGlobal ["ItemGPS", 10];
