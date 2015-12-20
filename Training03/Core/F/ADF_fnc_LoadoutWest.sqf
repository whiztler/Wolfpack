/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Loadout Gear West
Author: Whiztler
Script version: 5.61

Game type: n/a
File: ADF_fnc_loadoutWest.sqf
****************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!

Instructions:

This script is called by the loadoutClient.sqf script. The client
script call for a specific role that matches the name of the playable
unit. Make sure that the names of your playable units match exactly
with the names (variables) in both the client and the gear script else
the script will not execute for that specific player causing him to have
an incorrect loadout.

Make sure to check the capacity of the backpack and vest before adding
(more) items. Do not delete lines but comment them out when you do not
want it included.
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_LoadoutWest.sqf"; // Reporting. Do NOT edit/remove

/**[  INFANTRY SQUAD  ]*******************************************************************************/

ADF_fnc_loudoutInf = {

	///// define weapon loadout INF Assault Rifle
	if (_ADF_INF_assault_weapon == 1) then { // MX Weapon series		
		// Scopes for all units?
		if (_ADF_INF_scopes) then {ADF_INF_wpn_R = "arifle_MX_Hamr_pointer_F";} else {ADF_INF_wpn_R = "arifle_MX_ACO_pointer_F"};
		// Grenadier & TL
		ADF_INF_wpn_G = "arifle_MX_GL_Hamr_pointer_F";
		// magazines >  Vanilla or ACE mags
		if (ADF_mod_ACE3) then {ADF_INF_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_INF_mag_R = "30Rnd_65x39_caseless_mag"};		
	} else { // MK20 Weapon series		
		// Scopes for all units?
		if (_ADF_INF_scopes) then {ADF_INF_wpn_R = "arifle_Mk20_MRCO_pointer_F";} else {ADF_INF_wpn_R = "arifle_Mk20C_ACO_pointer_F"};
		// Grenadier & TL
		ADF_INF_wpn_G = "arifle_Mk20_GL_MRCO_pointer_F";
		// magazines >  Stanag or ACE mags
		if (ADF_mod_ACE3) then {ADF_INF_mag_R = "ACE_30Rnd_556x45_Stanag_Tracer_Dim";} else {ADF_INF_mag_R = "30Rnd_556x45_Stanag"};		
	};
	
	if ((_ADF_INF_assault_weapon == 1) && ((_r == "xo") || (_r == "uav") || (_r == "csm") || (_r == "sql") || (_r == "rto"))) then {
		ADF_INF_wpn_R = "arifle_MXC_Holo_pointer_F";
	};	
	
	///// define weapon loadout INF LMG		
	if (_ADF_INF_LMG_weapon == 1) then { // MX SW		
		ADF_INF_wpn_LMG = "arifle_MX_SW_Hamr_pointer_F";
		// magazines
		if (ADF_mod_ACE3) then {ADF_INF_mag_LMG = "ACE_100Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_INF_mag_LMG = "100Rnd_65x39_caseless_mag_Tracer";};
		ADF_INF_magCount_LMG = 6;		
	} else { // MK200		
		ADF_INF_wpn_LMG = "LMG_Mk200_MRCO_F";
		// magazines		
		if (ADF_mod_ACE3) then {ADF_INF_mag_LMG = "ACE_200Rnd_65x39_cased_Box_Tracer_Dim"} else {ADF_INF_mag_LMG = "200Rnd_65x39_cased_Box_Tracer";};
		ADF_INF_magCount_LMG = 3;		
	};	
	
	///// MG
	ADF_INF_wpn_MG = "MMG_02_sand_RCO_LP_F";
	if (ADF_mod_ACE3) then {ADF_INF_mag_MG = "130Rnd_338_Mag";} else {ADF_INF_mag_MG = "130Rnd_338_Mag"};	
		
	///// define weapon loadout INF hand weapon
	if (_ADF_INF_hand_weapon == 1) then {
		ADF_INF_pistol = "hgun_P07_F";
		ADF_INF_pistol_mag = "16Rnd_9x21_Mag";
	} else {
		ADF_INF_pistol = "hgun_Pistol_heavy_01_F";
		ADF_INF_pistol_mag = "11Rnd_45ACP_Mag";
	};

	///// Default loadout init
	
	removeUniform _ADF_unit;
	// Containers
	_ADF_unit AddUniform _ADF_uniform_inf;
	if ((_r != "doc") && (_r != "xo")) then {_ADF_unit addVest "V_PlateCarrierGL_rgr";} else {_ADF_unit addVest "V_BandollierB_rgr";};	
	// Store in Vest
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToVest "ACE_M84";
		_ADF_unit addItemToVest "ACE_M84";			
	};
	_ADF_unit addItemToVest "acc_flashlight";
	// Store in Uniform
	if (ADF_mod_ACE3 && ((_r != "cls") && (_r != "doc"))) then {
		for "_i" from 1 to 3 do {			
			_ADF_unit addItemToUniform "ACE_fieldDressing";
			_ADF_unit addItemToUniform "ACE_elasticBandage";
			_ADF_unit addItemToUniform "ACE_quikclot";						
		};	
		_ADF_unit addItemToUniform "ACE_morphine";	
	} else {
		_ADF_unit addItemToUniform "FirstAidKit";
		_ADF_unit addItemToUniform "FirstAidKit";			
	};
	// microDAGR
	if (ADF_microDAGR_all == 1) then {_ADF_unit addItemToUniform ADF_microDAGR};
	// Personal Radios all units
	if (ADF_mod_ACRE) then {_ADF_unit linkItem "ACRE_PRC343"}; // ACRE
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_PersonalRadio}; // TFAR
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_ADF_unit linkItem "ItemRadio"}; // Vanilla	
	// hand weapon
	[_ADF_unit, ADF_INF_pistol, 3, ADF_INF_pistol_mag] call BIS_fnc_addWeapon;
	
	// headgear
	_ADF_inf_headgear = ["H_HelmetB","H_HelmetB_plain_mcamo","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_Helmet_Kerry"] call BIS_fnc_selectRandom;

	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item";
	};
	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};	
	// GPS
	if (_ADF_GPS) then {_ADF_unit linkItem "ItemGPS"} else {
		if ((_r == "sql") || (_r == "ftl") || (_r == "wtl") || (_r == "xo") || (_r == "cls") || (_r == "doc") || (_r == "rto")) then {
			_ADF_unit linkItem "ItemGPS"
		};
	};
	
	ADF_loadOut_gearLoaded = {
		params ["_ADF_unit", "_ADF_perfDiagStart"];
		_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
		if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
		if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
		ADF_gearLoaded = true;
		_ADF_perfDiagStop = diag_tickTime;
		if (ADF_debug) then {
			_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
			_debugText = "LOADOUT - INF Platoon loadout applied.";
			_debugMsg = _debugText + _debugDiag;
			[_debugMsg,false] call ADF_fnc_log;
		};
	};
	
	/*****************************************************************************************************/
	
	///// XO/SQL/FTL/WTL
	
	if ((_r == "sql") || (_r == "ftl") || (_r == "xo") || (_r == "wtl") || (_r == "pc")) exitWith {
		// Containers
		if (ADF_mod_ACRE) then {
			_ADF_unit addBackpack "B_AssaultPack_rgr";
			_ADF_unit addItemToBackpack "ACRE_PRC148";					
		};
		if (ADF_mod_TFAR) then {
			if (_r == "xo") then {
				_ADF_unit addBackpack "tf_rt1523g";
			} else {
				_ADF_unit addBackpack _ADF_TFAR_LRRadio;
			};		
		};
		if (!ADF_mod_TFAR && !ADF_mod_ACRE) then {_ADF_unit addBackpack "B_AssaultPack_rgr"};
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		if (_r == "xo") then {
			_ADF_unit addHeadgear "H_Beret_Colonel";
		} else {
			_ADF_unit addHeadgear _ADF_inf_headgear;
		};
		_ADF_unit addGoggles "G_Tactical_Clear";
		_ADF_unit addWeapon "Rangefinder";
		// Store in Backpack
		if (_r != "xo") then {
			for "_i" from 1 to 2 do {
				_ADF_unit addItemToBackpack "HandGrenade";
				_ADF_unit addItemToBackpack "SmokeShell";
			};
		};
		_ADF_unit addItemToBackpack "Chemlight_green";
		// Store in Vest
		if (_r != "xo") then {
			for "_i" from 1 to 8 do {_ADF_unit addItemToVest "1Rnd_HE_Grenade_shell"};				
			_ADF_unit addItemToVest "3Rnd_UGL_FlareGreen_F";
			_ADF_unit addItemToVest "3Rnd_UGL_FlareRed_F";
		};
		if (ADF_mod_ACE3) then {
			_ADF_unit addItemToVest "ACE_HandFlare_White";
			_ADF_unit addItemToVest "ACE_HandFlare_White";
			_ADF_unit addItem "ACE_HuntIR_M203";
			_ADF_unit addItem "ACE_HuntIR_monitor";			
		};
		if (ADF_mod_CTAB) then {
			if (_r == "xo") then {
				_ADF_unit addItemToBackpack "ItemcTab";
			} else {
				_ADF_unit addItemToUniform "ItemAndroid";
			};
		};	
		// Primary weapon 
		if (_r == "xo") then {
			[_ADF_unit, ADF_INF_wpn_R, 4, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		} else {
			[_ADF_unit, ADF_INF_wpn_G, 8, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		};
		// AA Launcher WTL
		if (_r == "wtl") then {[_ADF_unit, "launch_B_Titan_F", 1, "Titan_AA"] call BIS_fnc_addWeapon};
		// XO baret
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close XO/SQL/FTL/WTL
	
	/*****************************************************************************************************/

	///// UAV	
	if (_r == "uav") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_UAV_01_backpack_F";		
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Combat";
		_ADF_unit addWeapon "Rangefinder";
		// Store in Vest > no space in backpack		
		_ADF_unit addItemToVest "B_UavTerminal";		
		if (ADF_mod_ACE3) then {_ADF_unit addItemToUniform "ACE_UAVBattery"};
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 4, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		_ADF_unit assignItem "B_UavTerminal";
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;		
	}; // Close UAV
	
	/*****************************************************************************************************/

	///// CLS
	if ((_r == "cls") || (_r == "doc")) exitWith {
		// Containers	
		_ADF_unit addBackpack "B_Bergen_mcamo";
		if (_r == "cls") then {_ADF_unit addHeadgear "H_HelmetB_light_desert";} else {_ADF_unit addHeadgear "H_MilCap_mcamo";};
		_ADF_unit addGoggles "G_Tactical_Clear";
		_ADF_unit addWeapon "Rangefinder";
		// Store in Vest
		for "_i" from 1 to 6 do {			
			_ADF_unit addItemToVest "SmokeShell";
			_ADF_unit addItemToVest "Chemlight_green";
		};
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		// Store in Backpack
		if (ADF_mod_ACE3) then { // ACE3 Advanced Medical
			for "_i" from 1 to 12 do {			
				_ADF_unit addItemToBackpack "ACE_fieldDressing";
				_ADF_unit addItemToBackpack "ACE_elasticBandage";
				_ADF_unit addItemToBackpack "ACE_quikclot";
				_ADF_unit addItemToBackpack "ACE_atropine";				
			};		
			for "_i" from 1 to 8 do {			
				_ADF_unit addItemToBackpack "ACE_morphine";
				_ADF_unit addItemToBackpack "ACE_epinephrine";				
				_ADF_unit addItemToBackpack "ACE_packingBandage";			
			};
			for "_i" from 1 to 5 do {			
				_ADF_unit addItemToBackpack "ACE_salineIV_500";					
				_ADF_unit addItemToBackpack "ACE_tourniquet";				
			};
			for "_i" from 1 to 2 do {			
				_ADF_unit addItemToBackpack "ACE_bloodIV";				
				_ADF_unit addItemToBackpack "ACE_plasmaIV";
				_ADF_unit addItemToBackpack "ACE_personalAidKit";
			};
			if (_r == "doc") then {_ADF_unit addItemToBackpack "ACE_surgicalKit"} else {_ADF_unit addItemToBackpack "ACE_bodyBag";};			
		} else { // Vanilla
			for "_i" from 1 to 10 do {			
				_ADF_unit addItemToBackpack "FirstAidKit";
			};
			_ADF_unit addItemToBackpack "Medikit";
		};
		// Primary weapon. Doc gets no rifle weapon, only hand weapon just like IRL
		if (_r == "cls") then {[_ADF_unit, ADF_INF_wpn_R, 8, ADF_INF_mag_R] call BIS_fnc_addWeapon};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;		
	}; // Close CLS/DOC

	/*****************************************************************************************************/
	
	///// RTO
	
	if ((_r == "rto") || (_r == "csm")) exitWith { 
		// Containers	
		if (ADF_mod_ACRE) then {
			_ADF_unit addBackpack "ACRE_PRC117F";
			_ADF_unit addItemToBackpack "ACRE_PRC148";					
		};
		if (ADF_mod_TFAR) then {
			_ADF_unit addBackpack _ADF_TFAR_LRRadio;
			_ADF_unit addItemToBackpack "tf_anprc152";			
		};
		if (!ADF_mod_TFAR && !ADF_mod_ACRE) then {_ADF_unit addBackpack "B_AssaultPack_rgr"};
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Backpack		
		for "_i" from 1 to 2 do {
			_ADF_unit addItemToBackpack "HandGrenade";
			_ADF_unit addItemToBackpack "SmokeShell";
			_ADF_unit addItemToBackpack "Chemlight_green";
		};
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 8, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;		
	}; // Close RTO	
	
	/*****************************************************************************************************/

	///// Rifleman
	
	if (_r == "r") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_AssaultPack_rgr";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Backpack		
		for "_i" from 1 to 2 do {
			_ADF_unit addItemToBackpack "HandGrenade";
			_ADF_unit addItemToBackpack "SmokeShell";
			_ADF_unit addItemToBackpack "Chemlight_green";
		};
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 12, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;		
	}; // Close Rifleman
	
	/*****************************************************************************************************/
	
	///// Grenadier
	
	if (_r == "g") exitWith {
		// Containers	
		_ADF_unit addBackpack "B_AssaultPack_rgr";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Backpack		
		for "_i" from 1 to 2 do {
			_ADF_unit addItemToBackpack "HandGrenade";
			_ADF_unit addItemToBackpack "SmokeShell";
			_ADF_unit addItemToBackpack "Chemlight_green";
		};
		// Store in Vest
		for "_i" from 1 to 8 do {
			_ADF_unit addItemToVest "1Rnd_HE_Grenade_shell";
		};				
		_ADF_unit addItemToVest "3Rnd_UGL_FlareGreen_F";

		// Primary weapon		
		[_ADF_unit, ADF_INF_wpn_G, 12, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Grenadier
	
	/*****************************************************************************************************/
	
	///// Auto Rifleman
	
	if (_r == "ar") exitWith {
		// Containers	
		_ADF_unit addBackpack "B_AssaultPack_rgr";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Combat";
		_ADF_unit addWeapon "Rangefinder";
		// Store in Backpack		
		for "_i" from 1 to 2 do {
			_ADF_unit addItemToBackpack "HandGrenade";
			_ADF_unit addItemToBackpack "SmokeShell";
			_ADF_unit addItemToBackpack "Chemlight_green";
		};
		if (ADF_mod_ACE3 && (ADF_INF_wpn_LMG == "LMG_Mk200_MRCO_F")) then {_ADF_unit addItemToBackpack "ACE_SpareBarrel";};
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_LMG, ADF_INF_magCount_LMG, ADF_INF_mag_LMG] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Auto Rifleman
	
	/*****************************************************************************************************/
	
	///// Asst Auto Rifleman
	
	if (_r == "aar") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_Bergen_mcamo";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Backpack		
		for "_i" from 1 to 2 do {
			_ADF_unit addItemToBackpack "HandGrenade";
			_ADF_unit addItemToBackpack "SmokeShell";
			_ADF_unit addItemToBackpack "Chemlight_green";
		};
		for "_i" from 1 to 4 do {
			_ADF_unit addItemToBackpack ADF_INF_mag_LMG;
		};
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 12, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Asst Auto Rifleman
	
	/*****************************************************************************************************/
	
	///// Rifleman AT
	
	if (_r == "rat") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_AssaultPack_rgr";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Backpack		
		_ADF_unit addItemToBackpack "HandGrenade";
		_ADF_unit addItemToBackpack "SmokeShell";
		_ADF_unit addItemToBackpack "Chemlight_green";
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 8, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		// Launcher
		[_ADF_unit, "launch_NLAW_F", 1, "NLAW_F"] call BIS_fnc_addWeapon; // works both on Vanilla and ACE3
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Rifleman AT
	
	/*****************************************************************************************************/
	
	///// Engineer
	
	if (_r == "eng") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_Carryall_mcamo";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Vest		
		for "_i" from 1 to 2 do {
			_ADF_unit addItemToVest "HandGrenade";
			_ADF_unit addItemToVest "SmokeShell";
			_ADF_unit addItemToVest "Chemlight_green";
		};
		// Store in Backpack
		for "_i" from 1 to 2 do {
			_ADF_unit addItemToBackpack "DemoCharge_Remote_Mag";
		};
		_ADF_unit addItemToBackpack "Toolkit";				
		// _ADF_unit addItemToBackpack "SatchelCharge_Remote_Mag"; // 3Kg
		if (ADF_mod_ACE3) then {
			_ADF_unit addItemToBackpack "ACE_DeadManSwitch";
			_ADF_unit addItemToBackpack "ACE_DefusalKit";
			_ADF_unit addItemToBackpack "ACE_M26_Clacker";
			_ADF_unit addItemToBackpack "ACE_Clacker";
			_ADF_unit addItemToBackpack "ACE_wirecutter"; // 4 Kg
		};
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 8, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Engineer	
	
	/*****************************************************************************************************/
	
	///// Machine Gunner (MM DLC)
	
	if (_r == "mg") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_Carryall_mcamo";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Combat";
		_ADF_unit addWeapon "Rangefinder";
		// Store in Backpack		
		_ADF_unit addItemToBackpack "HandGrenade";
		_ADF_unit addItemToBackpack "SmokeShell";
		_ADF_unit addItemToBackpack "Chemlight_green";
		if (ADF_mod_ACE3) then {_ADF_unit addItemToBackpack "ACE_SpareBarrel";};
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_MG, 4, ADF_INF_mag_MG] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Heavy Machine
	
	/*****************************************************************************************************/
	
		///// Asst Machine Gunner (MM DLC)
	
	if (_r == "amg") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_Carryall_mcamo";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Combat";
		_ADF_unit addWeapon "Rangefinder";
		// Store in Backpack		
		for "_i" from 1 to 4 do {
			_ADF_unit addItemToBackpack "130Rnd_338_Mag";
		};
		_ADF_unit addItemToBackpack "HandGrenade";
		_ADF_unit addItemToBackpack "SmokeShell";
		_ADF_unit addItemToBackpack "Chemlight_green";
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 4, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Heavy Machine
	
	/*****************************************************************************************************/

	///// Heavy Weapons Team (HMG/GMG/MK6)
	
	if ((_r == "hmg") || (_r == "ahmg") || (_r == "gmg") || (_r == "agmg") || (_r == "mkg") || (_r == "amk")) exitWith { 
		// Containers	
		if (_r == "hmg") then {_ADF_unit addBackpack "B_HMG_01_weapon_F";}; // HMG Gunner
		if ((_r == "ahmg") || (_r == "agmg")) then {_ADF_unit addBackpack "B_HMG_01_support_F";}; // Asst. HMG/GMG
		if (_r == "gmg") then {_ADF_unit addBackpack "B_GMG_01_weapon_F";}; // GMG Gunner
		if (_r == "mkg") then {_ADF_unit addBackpack "B_Mortar_01_weapon_F";}; // MK6 Gunner
		if (_r == "amk") then {_ADF_unit addBackpack "B_Mortar_01_support_F";}; // Asst. MK6
		
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Combat";
		_ADF_unit addWeapon "Rangefinder";
		// Store in Vest > no space in backpack		
		_ADF_unit addItemToVest "HandGrenade";
		_ADF_unit addItemToVest "SmokeShell";
		_ADF_unit addItemToVest "Chemlight_green";
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 4, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Heavy Weapons Team (HMG/GMG/MK6)
	
	/*****************************************************************************************************/
	
	///// Missile Specialist
	
	if (_r == "ms") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_Carryall_mcamo";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Backpack		
		_ADF_unit addItemToBackpack "HandGrenade";
		_ADF_unit addItemToBackpack "SmokeShell";
		_ADF_unit addItemToBackpack "Chemlight_green";
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 6, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		// Launcher
		[_ADF_unit, "launch_B_Titan_short_F", 2, "Titan_AT"] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Missile Specialist		
	
	/*****************************************************************************************************/
	
	///// Asst. Missile Specialist
	
	if (_r == "ams") exitWith { 
		// Containers	
		_ADF_unit addBackpack "B_Carryall_mcamo";
		_ADF_unit addHeadgear _ADF_inf_headgear;
		_ADF_unit addGoggles "G_Tactical_Clear";
		// Store in Backpack		
		_ADF_unit addItemToBackpack "HandGrenade";
		_ADF_unit addItemToBackpack "SmokeShell";
		_ADF_unit addItemToBackpack "Chemlight_green";
		_ADF_unit addItemToBackpack "Titan_AT";
		_ADF_unit addItemToBackpack "Titan_AT";
		_ADF_unit addItemToBackpack "Titan_AP";		
		// Primary weapon
		[_ADF_unit, ADF_INF_wpn_R, 6, ADF_INF_mag_R] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // Close Asst. Missile Specialist
};


/**[  SPECOP/RECON SQUADRON  ]*************************************************************************/

ADF_fnc_loadoutSor = {
	
	// define weapon loadout rifle SOR
	switch (_ADF_SOR_assault_weapon) do {
		case 1: { // MX black series			
			ADF_SOR_wpn_R = "arifle_MX_Black_Hamr_pointer_F";			
			ADF_SOR_wpn_G = "arifle_MX_GL_Black_Hamr_pointer_F";
			// magazines >  Stanag or ACE mags
			//ACE_30Rnd_65x39_caseless_mag_SD
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_65x39_caseless_mag"};
			ADF_SOR_MX = true;
		};
		case 2: { // TRG series
			ADF_SOR_wpn_R = "arifle_Mk20_MRCO_pointer_F";			
			ADF_SOR_wpn_G = "arifle_Mk20_GL_MRCO_pointer_F";
			// magazines >  Stanag or ACE mags
			// ACE_30Rnd_556x45_Stanag_SD
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_556x45_Stanag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_556x45_Stanag"};
			ADF_SOR_MK20 = true;
		};
		case 3: { // MX Compact series
			ADF_SOR_wpn_R = "arifle_MXC_ACO_pointer_snds_F";			
			ADF_SOR_wpn_G = "arifle_MXC_ACO_pointer_snds_F"; // No GL version avail
			// magazines >  Stanag or ACE mags
			//ACE_30Rnd_65x39_caseless_mag_SD
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_65x39_caseless_mag"};
			ADF_SOR_MXC = true;
		};
	};
	
	// define weapon loadout Hand weapon SOR
	if (_ADF_SOR_hand_weapon == 1) then {
		ADF_SOR_pistol = "hgun_Pistol_heavy_01_MRD_F";
		ADF_SOR_pistol_mag = "11Rnd_45ACP_Mag";		
	} else {
		ADF_SOR_pistol = "hgun_P07_snds_F";
		ADF_SOR_pistol_mag = "16Rnd_9x21_Mag";
	};	
	
	// Face paint
	_ADF_SOR_face = ["GreekHead_A3_10_sa","GreekHead_A3_10_l","GreekHead_A3_10_a","WhiteHead_22_a","WhiteHead_22_l","WhiteHead_22_sa"] call BIS_fnc_selectRandom;
	_ADF_unit setFace _ADF_SOR_face;
	
	///// Default loadout init
	
	removeUniform _ADF_unit;
	// Containers
	if (_r == "ssc") then {		
		_ADF_unit forceAddUniform "U_I_G_resistanceLeader_F";		
	} else {
		_ADF_unit forceAddUniform _ADF_uniform_sor;		
	};		
	if (_r != "uav") then {	
		if ((_r == "ssc") || (_r == "rtl") || (_r == "rto")) then {	
			if (ADF_mod_ACRE) then {
				_ADF_unit addBackpack "B_AssaultPack_rgr";
				_ADF_unit addItemToBackpack "ACRE_PRC148";					
			};
			if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadioSOR};
			if (!ADF_mod_TFAR && !ADF_mod_ACRE) then {_ADF_unit addBackpack "B_AssaultPack_rgr"};
			if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		} else {
			if (_r != "rm") then {_ADF_unit addBackpack "B_AssaultPack_blk";} else {_ADF_unit addBackpack "B_Bergen_mcamo";};
		};
		// Store in Backpack
		_ADF_unit addItemToBackpack "MiniGrenade";
		_ADF_unit addItemToBackpack "MiniGrenade";
	};	
	if (ADF_dlc_MarksMan) then {_ADF_unit addVest "V_PlateCarrierSpec_blk";} else {_ADF_unit addVest "V_TacVestIR_blk";}; //MM DLC check
	_ADF_unit addWeapon "G_Tactical_Black";	
	// Store in Vest
	if (ADF_mod_ACE3 && (_r != "uav")) then {for "_i" from 1 to 3 do {_ADF_unit addItemToVest "ACE_M84"}};
	_ADF_unit addItemToVest "acc_flashlight";
	// Store in Uniform
	if (ADF_mod_ACE3) then {
		for "_i" from 1 to 3 do {			
			_ADF_unit addItemToVest "ACE_fieldDressing";
			_ADF_unit addItemToVest "ACE_elasticBandage";
			_ADF_unit addItemToVest "ACE_quikclot";						
		};	
		_ADF_unit addItemToVest "ACE_morphine";	
	} else {
		_ADF_unit addItemToUniform "FirstAidKit";
		_ADF_unit addItemToUniform "FirstAidKit";			
	};
	// Personal Radios all units
	if (ADF_mod_ACRE) then {_ADF_unit linkItem "ACRE_PRC343"}; // ACRE
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_SWRadio}; // TFAR
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_ADF_unit linkItem "ItemRadio"}; // Vanilla	
	// hand weapon
	[_ADF_unit, ADF_SOR_pistol, 3, ADF_SOR_pistol_mag] call BIS_fnc_addWeapon;	
	// headgear
	_ADF_sor_headgear = ["H_Bandanna_khk_hs","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Bandanna_gry","H_Cap_usblack"] call BIS_fnc_selectRandom;
	_ADF_unit addHeadgear _ADF_sor_headgear;
	// microDAGR
	if (ADF_microDAGR_all == 1) then {_ADF_unit addItemToUniform ADF_microDAGR};	
	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item"
	};
	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};	
	// GPS
	_ADF_unit linkItem "ItemGPS";
	// Primary weapon
	if (_r != "rmm") then {
		if ((_r == "rtl") || (_r == "ssc")) then {
			[_ADF_unit, ADF_SOR_wpn_G, 6, ADF_SOR_mag_R] call BIS_fnc_addWeapon;
		} else {
			[_ADF_unit, ADF_SOR_wpn_R, 8, ADF_SOR_mag_R] call BIS_fnc_addWeapon;
		};
		if (ADF_SOR_MX) then {_ADF_unit addPrimaryWeaponItem "muzzle_snds_H"};
		if (ADF_SOR_MK20) then {_ADF_unit addPrimaryWeaponItem "muzzle_snds_M"};
		if (ADF_SOR_MXC) then {_ADF_unit addPrimaryWeaponItem "optic_Hamr"};
	} else { // Marksman
		if (ADF_dlc_MarksMan) then { // Check if Marksman DLC premium is active
			// MM DLC active
			if (ADF_mod_ACE3) then { // Check if ACE3 Ballistics is active for DLC ammo
				for "_i" from 1 to 5 do {_ADF_unit addMagazine "ACE_10Rnd_338_API526_Mag"}; // ACE3
			} else {
				for "_i" from 1 to 5 do {_ADF_unit addMagazine "10Rnd_338_Mag"}; // Vanilla
			};
			_ADF_unit addWeapon "srifle_DMR_02_F";
			_ADF_unit addPrimaryWeaponItem "acc_pointer_IR";
			_ADF_unit addPrimaryWeaponItem "muzzle_snds_338_black";
			_ADF_unit addPrimaryWeaponItem "optic_AMS";			
		} else {
			// No MM DLC active
			if (ADF_mod_ACE3) then { // Check if ACE3 Ballistics is active
				for "_i" from 1 to 10 do {_ADF_unit addMagazine "ACE_20Rnd_762x51_Mag_SD"}; // ACE3
			} else {
				for "_i" from 1 to 10 do {_ADF_unit addMagazine "20Rnd_762x51_Mag"}; // Vanilla
			};
			_ADF_unit addWeapon "srifle_EBR_F";
			_ADF_unit addPrimaryWeaponItem "acc_pointer_IR";
			_ADF_unit addPrimaryWeaponItem "muzzle_snds_B";
			_ADF_unit addPrimaryWeaponItem "optic_DMS";
		};
	};
	
	ADF_loadOut_gearLoaded = {
		params ["_ADF_unit", "_ADF_perfDiagStart"];
		_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
		if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
		if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
		ADF_gearLoaded = true;
		_ADF_perfDiagStop = diag_tickTime;
		if (ADF_debug) then {
			_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
			_debugText = "LOADOUT - INF Platoon loadout applied.";
			_debugMsg = _debugText + _debugDiag;
			[_debugMsg,false] call ADF_fnc_log;
		};
	};
	
	/*****************************************************************************************************/
	
	///// SSC & RTL
	
	if ((_r == "ssc") || (_r == "rtl")) exitWith {
		if (ADF_mod_CTAB) then {
			if (_r == "ssc") then {
				_ADF_unit addItem "ItemcTab";
			} else {
				_ADF_unit addItemToBackpack "ItemAndroid";
			};
		};
		if (_r == "ssc") then {
			_ADF_unit addWeapon "Laserdesignator";
			_ADF_unit addItemToBackpack "Laserbatteries";
		} else {
			_ADF_unit addWeapon "Rangefinder"
		};
		// Store in Vest
		if (!ADF_SOR_MXC) then { // Dont add GL ammo if the MX Compact is selected
			_ADF_unit addItem "3Rnd_HE_Grenade_shell";
			_ADF_unit addItem "3Rnd_UGL_FlareCIR_F";	
			//_ADF_unit addItem "3Rnd_UGL_FlareGreen_F";
			if (ADF_mod_ACE3) then {
				_ADF_unit addItem "ACE_HuntIR_M203";
				_ADF_unit addItem "ACE_HuntIR_monitor";		
			};			
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // close SSC & RTL
	
	/*****************************************************************************************************/
	
	///// Recon Marksman
	
	if (_r == "rmm") exitWith {
		_ADF_unit addItemToBackpack "optic_Nightstalker";
		_ADF_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		if (ADF_mod_ACE3) then {
			_ADF_unit addWeapon "ACE_Vector";
			_ADF_unit addItemToVest "ACE_Kestrel4500";
			_ADF_unit addItemToVest "ACE_ATragMX";
			_ADF_unit addItemToVest "ACE_RangeCard";
		} else {
			_ADF_unit addWeapon "Rangefinder";
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // close Recon Marksman
	
	/*****************************************************************************************************/
	
	///// Recon Demolition	
	
	if (_r == "dem") exitWith {	
		// Store in Backpack
		for "_i" from 1 to 5 do {
			_ADF_unit addItemToBackpack "DemoCharge_Remote_Mag";
		};		
		//_ADF_unit addItemToBackpack "SatchelCharge_Remote_Mag";
		if (ADF_mod_ACE3) then {
			_ADF_unit addItemToBackpack "ACE_DeadManSwitch";
			_ADF_unit addItemToBackpack "ACE_DefusalKit";
			_ADF_unit addItemToBackpack "ACE_M26_Clacker";
			_ADF_unit addItemToBackpack "ACE_Clacker";	
			_ADF_unit addItemToBackpack "ACE_Cellphone";			
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // close Recon Demolition

	/*****************************************************************************************************/
	
	///// Recon Medic

	if (_r == "rm") exitWith { 
		// Store in Vest
		for "_i" from 1 to 6 do {			
			_ADF_unit addItemToVest "SmokeShell";
			_ADF_unit addItemToVest "Chemlight_green";
		};
		// Store in Backpack
		if (ADF_mod_ACE3) then { // ACE3 Advanced Medical
			for "_i" from 1 to 10 do {			
				_ADF_unit addItemToBackpack "ACE_fieldDressing";
				_ADF_unit addItemToBackpack "ACE_elasticBandage";
				_ADF_unit addItemToBackpack "ACE_quikclot";
				_ADF_unit addItemToBackpack "ACE_atropine";				
			};		
			for "_i" from 1 to 7 do {			
				_ADF_unit addItemToBackpack "ACE_morphine";
				_ADF_unit addItemToBackpack "ACE_epinephrine";				
				_ADF_unit addItemToBackpack "ACE_packingBandage";			
			};
			for "_i" from 1 to 4 do {			
				_ADF_unit addItemToBackpack "ACE_salineIV_500";					
				_ADF_unit addItemToBackpack "ACE_tourniquet";				
			};
			for "_i" from 1 to 2 do {			
				_ADF_unit addItemToBackpack "ACE_bloodIV";				
				_ADF_unit addItemToBackpack "ACE_plasmaIV";
				_ADF_unit addItemToBackpack "ACE_personalAidKit";
			};
			_ADF_unit addItemToBackpack "ACE_surgicalKit";
		} else { // Vanilla
			for "_i" from 1 to 10 do {			
				_ADF_unit addItemToBackpack "FirstAidKit";
			};
			_ADF_unit addItemToBackpack "Medikit";
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	};// close Recon Medic	
	
	/*****************************************************************************************************/
	
	///// Recon AT

	if (_r == "at") exitWith { 
		(backpackContainer _ADF_unit) addmagazinecargoGlobal ["Titan_AT",1];
		[_ADF_unit, "launch_B_Titan_short_F", 1, "Titan_AT"] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	};// close Recon AT	

	/*****************************************************************************************************/
	
	///// UAV specialist
	
	if (_r == "uav") exitWith { 
		_ADF_unit addBackpack "B_UAV_01_backpack_F";
		_ADF_unit addItem "B_UavTerminal";
		_ADF_unit assignItem "B_UavTerminal";
		if (ADF_mod_ACE3) then {
			_ADF_unit addItem "ACE_UAVBattery";
			_ADF_unit addItem "ace_dagr";
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	};// close UAV specialist
}; // Close ADF_fnc_loadoutSor	


/**[  SPECOP/RECON DIVERS TEAM  ]*************************************************************************/

ADF_fnc_loadoutSod = {

	// define weapon loadout rifle SOR
	switch (_ADF_SOR_assault_weapon) do {
		case 1: { // MX black series			
			ADF_SOR_wpn_R = "arifle_MX_Black_Hamr_pointer_F";			
			ADF_SOR_wpn_G = "arifle_MX_GL_Black_Hamr_pointer_F";
			// magazines >  Stanag or ACE mags
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_65x39_caseless_mag"};
			ADF_SOR_MX = true;
		};
		case 2: { // TRG series
			ADF_SOR_wpn_R = "arifle_Mk20_MRCO_pointer_F";			
			ADF_SOR_wpn_G = "arifle_Mk20_GL_MRCO_pointer_F";
			// magazines >  Stanag or ACE mags
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_556x45_Stanag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_556x45_Stanag"};
			ADF_SOR_MK20 = true;
		};
		case 3: { // MX Compact series
			ADF_SOR_wpn_R = "arifle_MXC_ACO_pointer_snds_F";			
			ADF_SOR_wpn_G = "arifle_MXC_ACO_pointer_snds_F"; // No GL version avail
			// magazines >  Stanag or ACE mags
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_65x39_caseless_mag"};
			ADF_SOR_MXC = true;
		};
	};
	
	// define weapon loadout Hand weapon SOR
	if (_ADF_SOR_hand_weapon == 1) then {
		ADF_SOR_pistol = "hgun_Pistol_heavy_01_MRD_F";
		ADF_SOR_pistol_mag = "11Rnd_45ACP_Mag";		
	} else {
		ADF_SOR_pistol = "hgun_P07_snds_F";
		ADF_SOR_pistol_mag = "16Rnd_9x21_Mag";
	};
	
	// Containers
	_ADF_unit addUniform "U_B_Wetsuit";
	_ADF_unit addVest "V_RebreatherB"; 	
	_ADF_unit addGoggles "G_Diving";
	
	// microDAGR
	if (ADF_microDAGR_all == 1) then {_ADF_unit addItemToUniform ADF_microDAGR};
	
	// Pack the dry gear kit (bring your own towel)
	if (_r != "uav") then {	
		_ADF_unit addBackpack "B_Carryall_oli";
		if (ADF_mod_ACE3) then {
			(uniformContainer _ADF_unit) addItemCargoGlobal ["ACE_fieldDressing",1];
		} else {
			(uniformContainer _ADF_unit) addItemCargoGlobal ["FirstAidKit",1];
		};
		// Store in uniform
		(uniformContainer _ADF_unit) addmagazinecargoGlobal ["Chemlight_red",1];
		(uniformContainer _ADF_unit) addmagazinecargoGlobal ["Chemlight_green",1];
		//(uniformContainer _ADF_unit) addItemCargoGlobal ["acc_flashlight",1];
		//if (ADF_mod_ACE3 && (_r != "add")) then {_ADF_unit addItemToUniform "ACE_M84"};
		if (ADF_mod_ACE3) then {(uniformContainer _ADF_unit) addItemCargoGlobal ["ACE_HandFlare_Green",1]};		
		//(uniformContainer _ADF_unit) addmagazinecargoGlobal ["SmokeShell",1];
		if (ADF_mod_ACE3) then {(uniformContainer _ADF_unit) addItemCargoGlobal ["ACE_EarPlugs",1]};
		if (ADF_mod_ACE3) then {(uniformContainer _ADF_unit) addItemCargoGlobal ["ace_mapTools",1]};		
		if (ADF_mod_CTAB) then {(uniformContainer _ADF_unit) additemcargoGlobal ["ACE_CableTie",1]};
		//if (ADF_mod_CTAB) then {(uniformContainer _ADF_unit) additemcargoGlobal ["ACE_IR_Strobe_Item",1]};
		_ADF_sor_headgear = ["H_Watchcap_camo","H_Watchcap_blk","H_Booniehat_mcamo","H_Watchcap_khk","H_Bandanna_gry","H_Shemag_olive_hs","H_Bandanna_khk_hs"] call BIS_fnc_selectRandom;
		(uniformContainer _ADF_unit) addItemCargoGlobal [_ADF_sor_headgear,1];
		(uniformContainer _ADF_unit) addItemCargoGlobal ["G_Lowprofile",1];
		
		// Store in Backpack		
		if (ADF_mod_CTAB) then {(backpackContainer _ADF_unit) additemcargoGlobal ["ItemcTabHCam",1]};

		if (_r != "rmm") then {
			if ((_r == "atl") || (_r == "ssc")) then {
				(backpackContainer _ADF_unit) addweaponcargoGlobal [ADF_SOR_wpn_G,1];				
			} else {
				(backpackContainer _ADF_unit) addweaponcargoGlobal [ADF_SOR_wpn_R,1];
			};
			if (_r == "ad") then {(backpackContainer _ADF_unit) addmagazinecargoGlobal [ADF_SOR_mag_R,9]}; // Assault Diver
			if (_r == "ssc") then {(backpackContainer _ADF_unit) addmagazinecargoGlobal [ADF_SOR_mag_R,4]}; // leadership
			if (_r == "atl") then {(backpackContainer _ADF_unit) addmagazinecargoGlobal [ADF_SOR_mag_R,7]}; // leadership
			if (_r == "rm") then {(backpackContainer _ADF_unit) addmagazinecargoGlobal [ADF_SOR_mag_R,4]}; // Medic
			if (_r == "add") then {(backpackContainer _ADF_unit) addmagazinecargoGlobal [ADF_SOR_mag_R,4]}; // Demo
			if (_r == "at") then {(backpackContainer _ADF_unit) addmagazinecargoGlobal [ADF_SOR_mag_R,5]}; // AT			
			
			if (ADF_SOR_MX) then {(backpackContainer _ADF_unit) addItemCargoGlobal ["muzzle_snds_H",1]};
			if (ADF_SOR_MK20) then {(backpackContainer _ADF_unit) addItemCargoGlobal ["muzzle_snds_M",1]};
			if (ADF_SOR_MXC) then {(backpackContainer _ADF_unit) addItemCargoGlobal ["optic_Hamr",1]};
		};		
		(backpackContainer _ADF_unit) addItemCargoGlobal ["V_Chestrig_blk",1];
		(backpackContainer _ADF_unit) addItemCargoGlobal ["U_I_G_Story_Protagonist_F",1];
		
		// Personal Radios all units
		if (ADF_mod_ACRE) then {(backpackContainer _ADF_unit) addItemCargoGlobal ["ACRE_PRC343",1]};
		if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_SWRadio};
		if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {(backpackContainer _ADF_unit) addItemCargoGlobal ["ItemRadio",1]};		
	} else { // Add Medkit to UAV specialist uniform
		if (ADF_mod_ACE3) then {
			_ADF_unit addItemToUniform "ACE_fieldDressing";
		} else {
			_ADF_unit addItemToUniform "FirstAidKit";
		};
	}; // done packing
	
	// GPS
	_ADF_unit linkItem "ItemGPS";
	// Primary weapon
	[_ADF_unit, "arifle_SDAR_F", 3, "20Rnd_556x45_UW_mag"] call BIS_fnc_addWeapon;
	
	ADF_loadOut_gearLoaded = {
		params ["_ADF_unit", "_ADF_perfDiagStart"];
		_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
		if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
		if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
		ADF_gearLoaded = true;
		_ADF_perfDiagStop = diag_tickTime;
		if (ADF_debug) then {
			_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
			_debugText = "LOADOUT - INF Platoon loadout applied.";
			_debugMsg = _debugText + _debugDiag;
			[_debugMsg,false] call ADF_fnc_log;
		};
	};
		
	/*****************************************************************************************************/
	
	///// Assault Demolition Diver
	
	if (_r == "add") exitWith {	
		// Store in Backpack
		for "_i" from 1 to 3 do {
			_ADF_unit addItemToBackpack "DemoCharge_Remote_Mag";
		};		
		_ADF_unit addItemToBackpack "SatchelCharge_Remote_Mag";
		if (ADF_mod_ACE3) then {
			_ADF_unit addItemToUniform "ACE_DeadManSwitch";
			_ADF_unit addItemToUniform "ACE_DefusalKit";
			_ADF_unit addItemToUniform "ACE_M26_Clacker";
			_ADF_unit addItemToUniform "ACE_Clacker";
			_ADF_unit addItemToUniform "ACE_Cellphone";			
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // close Assault Demolition Diver
	
	/*****************************************************************************************************/
	
	///// SSC & RTL
	
	if ((_r == "ssc") || (_r == "atl")) exitWith {
		if (ADF_mod_CTAB) then {
			if (_r == "ssc") then {
				_ADF_unit addItemToBackpack "ItemcTab";
			} else {
				_ADF_unit addItemToBackpack "ItemAndroid";
			};
		};
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		if (_r == "ssc") then {_ADF_unit addWeapon "Laserdesignator"; _ADF_unit addItemToBackpack "Laserbatteries";} else {_ADF_unit addWeapon "Rangefinder"};

		if (!ADF_SOR_MXC) then { // Dont add GL ammo if the MX Compact is selected
			_ADF_unit addItemToUniform "3Rnd_HE_Grenade_shell";
			_ADF_unit addItemToUniform "3Rnd_HE_Grenade_shell";
			_ADF_unit addItemToUniform "3Rnd_UGL_FlareCIR_F";	
			//_ADF_unit addItemToBackpack "3Rnd_UGL_FlareGreen_F";
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	}; // close SSC & RTL
	
	/*****************************************************************************************************/

	///// Recon Marksman
	
	if (_r == "rmm") exitWith {
		_ADF_unit addItemToUniform "optic_Nightstalker";
		if (ADF_mod_ACE3) then {
			_ADF_unit addWeapon "ACE_Vector";
			_ADF_unit addItemToBackpack "ACE_Kestrel4500";
			_ADF_unit addItemToBackpack "ACE_ATragMX";
			_ADF_unit addItemToBackpack "ACE_RangeCard";
		} else {
			_ADF_unit addWeapon "Rangefinder";
		};
		
		if (ADF_dlc_MarksMan) then { // Check if Marksman DLC premium is active
			// MM DLC active
			if (ADF_mod_ACE3) then { // ACE3
				(backpackContainer _ADF_unit) addmagazinecargoGlobal ["ACE_10Rnd_338_API526_Mag",3];
				(uniformContainer _ADF_unit) addmagazinecargoGlobal ["ACE_10Rnd_338_API526_Mag",2];
			} else { // Vanilla
				(backpackContainer _ADF_unit) addmagazinecargoGlobal ["10Rnd_338_Mag",3];
				(uniformContainer _ADF_unit) addmagazinecargoGlobal ["10Rnd_338_Mag",2];			
			};
			(backpackContainer _ADF_unit) addWeaponCargoGlobal ["srifle_DMR_02_F",1];
			(backpackContainer _ADF_unit) addItemCargoGlobal ["acc_pointer_IR",1];
			(backpackContainer _ADF_unit) addItemCargoGlobal ["muzzle_snds_338_black",1];
			(backpackContainer _ADF_unit) addItemCargoGlobal ["optic_AMS",1];
		} else {
			// No MM DLC active
			if (ADF_mod_ACE3) then { // ACE3
				(backpackContainer _ADF_unit) addmagazinecargoGlobal ["ACE_20Rnd_762x51_Mag_SD",4];
				(uniformContainer _ADF_unit) addmagazinecargoGlobal ["ACE_20Rnd_762x51_Mag_SD",3];
			} else { // Vanilla			
				(backpackContainer _ADF_unit) addmagazinecargoGlobal ["20Rnd_762x51_Mag",4];
				(uniformContainer _ADF_unit) addmagazinecargoGlobal ["20Rnd_762x51_Mag",3];
			};
			(backpackContainer _ADF_unit) addWeaponCargoGlobal ["srifle_EBR_F",1];
			(backpackContainer _ADF_unit) addItemCargoGlobal ["acc_pointer_IR",1];
			(backpackContainer _ADF_unit) addItemCargoGlobal ["muzzle_snds_B",1];	
			(backpackContainer _ADF_unit) addItemCargoGlobal ["optic_DMS",1];	
		};
	
		if (ADF_mod_ACRE) then {(backpackContainer _ADF_unit) addItemCargoGlobal ["ACRE_PRC148",1]};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	
	}; // close Recon Marksman
	
	/*****************************************************************************************************/
	
	///// Recon Medic

	if (_r == "rm") exitWith { 
		// Store in Vest
		for "_i" from 1 to 5 do {			
			_ADF_unit addItemToUniform "SmokeShellGreen";
			_ADF_unit addItemToUniform "Chemlight_green";
		};
		// Store in Backpack
		if (ADF_mod_ACE3) then { // ACE3
			for "_i" from 1 to 10 do {			
				_ADF_unit addItemToBackpack "ACE_fieldDressing";
				_ADF_unit addItemToBackpack "ACE_morphine";
			};
			for "_i" from 1 to 8 do {			
				_ADF_unit addItemToBackpack "ACE_epinephrine";				
			};
			for "_i" from 1 to 4 do {			
				_ADF_unit addItemToBackpack "ACE_bloodIV";				
			};
			_ADF_unit addItemToBackpack "ACE_personalAidKit";				
		} else { // Vanilla
			for "_i" from 1 to 10 do {			
				_ADF_unit addItemToBackpack "FirstAidKit";
			};
			_ADF_unit addItemToBackpack "Medikit";
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	};// close Recon Medic	
	
	/*****************************************************************************************************/
	
	///// Recon AT

	if (_r == "at") exitWith { 
		(backpackContainer _ADF_unit) addmagazinecargoGlobal ["Titan_AT",1];
		[_ADF_unit, "launch_B_Titan_short_F", 1, "Titan_AT"] call BIS_fnc_addWeapon;
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	};// close Recon AT	

	/*****************************************************************************************************/
	
	///// Assault Diver

	if (_r == "ad") exitWith { 
		(uniformContainer _ADF_unit) addmagazinecargoGlobal ["MiniGrenade",3];
	};// close Recon AT	

	/*****************************************************************************************************/
	
	///// UAV specialist
	
	if (_r == "uav") exitWith { 
		_ADF_unit addBackpack "B_UAV_01_backpack_F";
		_ADF_unit addItemToUniform "B_UavTerminal";
		_ADF_unit assignItem "B_UAVTerminal";		
		if (ADF_mod_ACE3) then {
			_ADF_unit addItem "ACE_UAVBattery";
			_ADF_unit addItem "ace_dagr";
		
		};
		[_ADF_unit,_ADF_perfDiagStart] call ADF_loadOut_gearLoaded;
	};// close UAV specialist
}; // Close ADF_fnc_loadoutSod


/**[  SPECOP/RECON SNIPER/JTAC TEAM  ]*********************************************************************/

ADF_fnc_loadoutSop = {

	// define weapon loadout rifle SOR
	switch (_ADF_SOR_assault_weapon) do {
		case 1: { // MX black series			
			ADF_SOR_wpn_R = "arifle_MX_Black_Hamr_pointer_F";		
			// magazines >  Stanag or ACE mags
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_65x39_caseless_mag"};
			ADF_SOR_MX = true;
		};
		case 2: { // TRG series
			ADF_SOR_wpn_R = "arifle_Mk20_MRCO_pointer_F";			
			// magazines >  Stanag or ACE mags
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_556x45_Stanag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_556x45_Stanag"};
			ADF_SOR_MK20 = true;
		};
		case 3: { // MX Compact series
			ADF_SOR_wpn_R = "arifle_MXC_ACO_pointer_snds_F";			
			// magazines >  Stanag or ACE mags
			if (ADF_mod_ACE3) then {ADF_SOR_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_SOR_mag_R = "30Rnd_65x39_caseless_mag"};
			ADF_SOR_MXC = true;
		};
	};
	
	// define weapon loadout Hand weapon SOR
	if (_ADF_SOR_hand_weapon == 1) then {
		ADF_SOR_pistol = "hgun_Pistol_heavy_01_MRD_F";
		ADF_SOR_pistol_mag = "11Rnd_45ACP_Mag";		
	} else {
		ADF_SOR_pistol = "hgun_P07_snds_F";
		ADF_SOR_pistol_mag = "16Rnd_9x21_Mag";
	};	
	
	// Containers
	if (_r == "jtc") then {
		removeUniform _ADF_unit;
		_ADF_unit addUniform "U_B_CombatUniform_mcam_vest"
	};
	if ((_r == "sp") || (_r == "jtc")) then {	
		if (ADF_mod_ACRE) then {
			_ADF_unit addBackpack "B_Bergen_mcamo";
			_ADF_unit addItemToBackpack "ACRE_PRC148";
			if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		};
		if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio};
		if (!ADF_mod_TFAR && !ADF_mod_ACRE) then {_ADF_unit addBackpack "B_Bergen_mcamo"};
		if (ADF_mod_ACE3) then {_ADF_unit addItemToBackpack "ACE_ATragMX";};
	} else {
		_ADF_unit addBackpack "B_AssaultPack_blk";
	};
	// Store in Backpack
	_ADF_unit addItemToBackpack "MiniGrenade";
	_ADF_unit addItemToBackpack "MiniGrenade";	
	_ADF_unit addVest "V_PlateCarrier3_rgr";
	_ADF_unit addWeapon "G_Tactical_Black";
	// Add to uniform
	if (ADF_mod_ACE3) then {
		for "_i" from 1 to 3 do {			
			_ADF_unit addItemToUniform "ACE_fieldDressing";
			_ADF_unit addItemToUniform "ACE_elasticBandage";
			_ADF_unit addItemToUniform "ACE_quikclot";						
		};	
		_ADF_unit addItemToUniform "ACE_morphine";			
	} else {
		_ADF_unit addItemToUniform "FirstAidKit";
		_ADF_unit addItemToUniform "FirstAidKit";			
	};
	// Personal Radios all units
	if (ADF_mod_ACRE) then {_ADF_unit linkItem "ACRE_PRC343"}; // ACRE
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_SWRadio}; // TFAR
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_ADF_unit linkItem "ItemRadio"}; // Vanilla	
	// hand weapon
	[_ADF_unit, ADF_SOR_pistol, 3, ADF_SOR_pistol_mag] call BIS_fnc_addWeapon;
	// microDAGR
	if (ADF_microDAGR_all == 1) then {_ADF_unit addItemToUniform ADF_microDAGR};	
	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item";
		if (_r != "sn") then {_ADF_unit addItem "ace_dagr";};
	};
	
	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};	
	// GPS
	_ADF_unit linkItem "ItemGPS";
	// Primary weapon and misc
	if (_r != "sn") then {
		[_ADF_unit, ADF_SOR_wpn_R, 8, ADF_SOR_mag_R] call BIS_fnc_addWeapon;
		if (ADF_SOR_MX) then {_ADF_unit addItemToBackpack "muzzle_snds_H"};
		if (ADF_SOR_MK20) then {_ADF_unit addItemToBackpack "muzzle_snds_M"};
		if (ADF_SOR_MXC) then {_ADF_unit addItemToBackpack "optic_Hamr"};
		_ADF_unit addItemToVest "ItemAndroid";
		_ADF_unit addItemToVest "optic_Nightstalker";
		_ADF_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		_ADF_unit addItemToBackpack "APERSTripMine_Wire_Mag";
		if (ADF_mod_ACE3) then {
			_ADF_unit addItemToBackpack "ACE_Clacker";
			_ADF_unit addItemToBackpack "ACE_DeadManSwitch";
			if (_r == "sp") then {_ADF_unit addItem "ace_spottingscope";};
		};
	} else { // Sniper
		[_ADF_unit, "srifle_LRR_camo_LRPS_F", 12, "7Rnd_408_Mag"] call BIS_fnc_addWeapon;
		_ADF_unit addItemToVest "optic_Nightstalker";
		_ADF_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		_ADF_unit addItemToBackpack "APERSTripMine_Wire_Mag";
		if (ADF_mod_ACE3) then {
			_ADF_unit addItemToBackpack "ACE_Clacker";
			_ADF_unit addItemToBackpack "ACE_DeadManSwitch";
			_ADF_unit addItemToBackpack "ACE_ATragMX";
			_ADF_unit addItemToBackpack "ACE_RangeCard";			
		};			
	};
	If (_r != "jtc") then {
		if (ADF_mod_ACE3) then {
			_ADF_unit addItem "ACE_Kestrel4500";
			_ADF_unit addWeapon "ACE_Vector";
		} else {
			_ADF_unit addWeapon "Rangefinder";
		};
	} else {
		_ADF_unit addHeadgear "H_HelmetB_camo";
		_ADF_unit addWeapon "LaserDesignator";
		_ADF_unit addItemToBackpack "LaserBatteries";
		_ADF_unit addItemToBackpack "ACE_Vector";		
	};
	
	// Face paint
	_ADF_SOP_face = ["WhiteHead_22_a","WhiteHead_22_l","WhiteHead_22_sa"] call BIS_fnc_selectRandom;
	_ADF_unit setFace _ADF_SOP_face;
	
	_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
	if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	ADF_gearLoaded = true;
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {
		_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
		_debugText = "LOADOUT - SOP units loadout applied.";
		_debugMsg = _debugText + _debugDiag;
		[_debugMsg,false] call ADF_fnc_log;
	};	
};


/**[  CAVALRY BATTERY  ]*********************************************************************/

ADF_fnc_loadoutCav = {

	///// define weapon loadout CAV Assault Rifle
	if (_ADF_CAV_assault_weapon == 1) then { // MX Compact Weapon series		
		ADF_CAV_wpn_R = "arifle_MXC_Holo_pointer_F";
		// magazines >  Vanilla or ACE mags
		if (ADF_mod_ACE3) then {ADF_CAV_mag_R = "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";} else {ADF_CAV_mag_R = "30Rnd_65x39_caseless_mag"};		
	} else { // Vermin SMG Weapon series		
		ADF_CAV_wpn_R = "SMG_01_F";
		// magazines >  Stanag or ACE mags
		ADF_CAV_mag_R = "30Rnd_45ACP_Mag_SMG_01_tracer_green";
	};

	removeUniform _ADF_unit;
	// Containers
	_ADF_unit AddUniform "U_B_HeliPilotCoveralls";
	_ADF_unit addHeadgear "H_HelmetCrew_B";
	_ADF_unit addWeapon "G_Combat";
	_ADF_unit addWeapon "ItemGPS"; 
	_ADF_unit addVest "V_BandollierB_rgr";
	if (_r == "vc") then {	
		if (ADF_mod_CTAB) then {_ADF_unit addItemToVest "ItemAndroid"};
		if (ADF_mod_TFAR) then {_ADF_unit addItemToVest _ADF_TFAR_SWRadio}; // Additional radio. LR in vehicles
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		_ADF_unit addWeapon "Rangefinder";
	};
	// Personal Radios all units
	if (ADF_mod_ACRE) then {_ADF_unit linkItem "ACRE_PRC343"}; // ACRE
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_PersonalRadio}; // TFAR
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_ADF_unit linkItem "ItemRadio"}; // Vanilla
	// Add to vest
	_ADF_unit addItemToVest "SmokeShellGreen";
	_ADF_unit addItemToVest "SmokeShell";
	// microDAGR
	if (ADF_microDAGR_all == 1) then {_ADF_unit addItemToUniform ADF_microDAGR};
	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item"
	};
	// Add to uniform
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToUniform "ACE_fieldDressing";
		_ADF_unit addItemToUniform "ACE_fieldDressing";			
	} else {
		_ADF_unit addItemToUniform "FirstAidKit";
		_ADF_unit addItemToUniform "FirstAidKit";			
	};
	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};	
	for "_i" from 1 to 4 do {_ADF_unit addItemToUniform ADF_CAV_mag_R};
	// Primary weapon
	_ADF_unit addMagazine ADF_CAV_mag_R;
	_ADF_unit addWeapon ADF_CAV_wpn_R;
	// hand weapon
	[_ADF_unit, "hgun_P07_F", 3, "16Rnd_9x21_Mag"] call BIS_fnc_addWeapon;
	
	_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
	if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	ADF_gearLoaded = true;
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {
		_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
		_debugText = "LOADOUT - CAV Battery loadout applied.";
		_debugMsg = _debugText + _debugDiag;
		[_debugMsg,false] call ADF_fnc_log;
	};	
}; // Close ADF_fnc_sCav

/**[  AIR WING  ]*********************************************************************/

ADF_fnc_loadoutAir = {

	// Containers
	_ADF_unit addWeapon "ItemGPS";
	_ADF_unit addBackpack "B_Parachute";
	_ADF_unit addVest "V_TacVest_oli";	
	// Personal Radios all units
	if (ADF_mod_ACRE) then {_ADF_unit linkItem "ACRE_PRC343"}; // ACRE
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_SWRadio}; // TFAR
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_ADF_unit linkItem "ItemRadio"}; // Vanilla
	// Add to vest
	_ADF_unit addItemToVest "SmokeShellGreen";
	_ADF_unit addItemToVest "SmokeShell";
	// microDAGR
	if (ADF_microDAGR_all == 1) then {_ADF_unit addItemToUniform ADF_microDAGR};
	// ACE3
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item"
	};
	// Add to uniform
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToUniform "ACE_fieldDressing";
		_ADF_unit addItemToUniform "ACE_fieldDressing";			
	} else {
		_ADF_unit addItemToUniform "FirstAidKit";
		_ADF_unit addItemToUniform "FirstAidKit";			
	};	
	if (_r == "p") then {
		if (ADF_mod_ACRE) then {_ADF_unit addItemToVest "ACRE_PRC148"};
		//if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio};
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		if (ADF_mod_CTAB) then {_ADF_unit addItemToVest "ItemAndroid"};
		_ADF_unit addWeapon "Rangefinder";
		_ADF_unit addHeadgear "H_PilotHelmetFighter_B";
		_ADF_unit addWeapon "G_Shades_Blue";
		_ADF_unit addItemToUniform "H_Cap_blk";
		[_ADF_unit, "hgun_P07_F", 3, "16Rnd_9x21_Mag"] call BIS_fnc_addWeapon;
	};
	if (_r == "hp") then {
		if (ADF_mod_ACRE) then {_ADF_unit addItemToVest "ACRE_PRC148"};
		if (ADF_microDAGR_all == 2) then {_ADF_unit addItemToUniform ADF_microDAGR};
		//if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio};
		if (ADF_mod_CTAB) then {_ADF_unit addItemToVest "ItemAndroid"};
		_ADF_unit addWeapon "Rangefinder";	
		_ADF_unit addHeadgear "H_PilotHelmetHeli_B";
		_ADF_unit addWeapon "G_Sport_Blackred";
		_ADF_unit addItemToUniform "H_Cap_blu";
		[_ADF_unit, "SMG_01_Holo_F", 3, "30Rnd_45ACP_Mag_SMG_01"] call BIS_fnc_addWeapon;
	};
	if (_r == "hc") then {
		_ADF_unit addWeapon "H_CrewHelmetHeli_B";
		[_ADF_unit, "SMG_01_Holo_F", 3, "30Rnd_45ACP_Mag_SMG_01"] call BIS_fnc_addWeapon;		
	};
	
	if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {
		_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
		_debugText = "LOADOUT - AIR wing loadout applied.";
		_debugMsg = _debugText + _debugDiag;
		[_debugMsg,false] call ADF_fnc_log;
	};
}; // Close ADF_fnc_sAir

/////  Undefined player
ADF_fnc_loadoutNotDef = {
	_ADF_unit = _this select 0;
	_ADF_inf_headgear = ["H_HelmetB","H_HelmetB_plain_mcamo","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_Helmet_Kerry"] call BIS_fnc_selectRandom;
	removeUniform _ADF_unit;
	// Assign standard Infantry gear	
	_ADF_unit addUniform "U_B_CombatUniform_mcam";
	_ADF_unit addVest "V_PlateCarrierGL_rgr";
	_ADF_unit addBackPack "B_AssaultPack_rgr";
	_ADF_unit addHeadgear _ADF_inf_headgear;
	(unitBackpack _ADF_unit) addMagazineCargo ["smokeshell",5];
	(unitBackpack _ADF_unit) addMagazineCargo ["HandGrenade",3];
	[_ADF_unit, "arifle_MX_ACO_pointer_F", 12, "30Rnd_65x39_caseless_mag"] call BIS_fnc_addWeapon;
	[_ADF_unit, "hgun_P07_F", 3,"16Rnd_9x21_Mag"] call BIS_fnc_addWeapon;	
	_ADF_unit addItem "FirstAidKit";
	_ADF_unit addItem "FirstAidKit";
	_ADF_unit addWeapon "Binocular";
	if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	ADF_gearLoaded = true;
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {
		_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
		_debugText = "LOADOUT - ERROR undefined unit.";
		_debugMsg = _debugText + _debugDiag;
		[_debugMsg,false] call ADF_fnc_log;
	};	
	
	waitUntil {ADF_missionInit};
	sleep 30;
	// Display error message
	hintSilent parseText format ["
		<t color='#FE2E2E' align='left' size='1.2'>Error!</t><br/><br/>
		<t color='#FFFFFF' align='left'>%1 </t><t color='#A1A4AD' align='left'>, your playable unit </t><t color='#FFFFFF' align='left'>%2</t><t color='#A1A4AD' align='left'> is undefined!</t><br/><br/>
		<t color='#A1A4AD' align='left'>You will be issued with vanilla infantry loadout. Please advice the mission author of this error.</t>		
	",name vehicle player, vehicle player];
}; // Close NotDef