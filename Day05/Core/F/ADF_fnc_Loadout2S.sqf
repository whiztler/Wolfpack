/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Loadout Gear 2 SIERRA campaign
Author: Whiztler
Script version: 1.04

Game type: n/a
File: ADF_fnc_loadout2S.sqf
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_Loadout2S.sqf"; // Reporting. Do NOT edit/remove

/********* INIT ********/

private ["_ADF_unit","_ADF_unitString","_u","_r","_ADF_INF_headGear","_ADF_INF_priWpn","_ADF_INF_priWpn_lite","_ADF_INF_priWpn_GL",
		"_ADF_INF_priWpn_LMG","_ADF_INF_priWpn_MG","_ADF_INF_handWpn","_ADF_INF_tube_Lite","_ADF_INF_tube_AT","_ADF_INF_tube_AA",
		"_ADF_INF_priWpnScope_lite","_ADF_INF_priWpnMag","_ADF_INF_priWpnMag_LMG","_ADF_INF_priWpnMag_MG","_ADF_INF_handWpn_mag",
		"_ADF_INF_tubeMag_Lite","_ADF_INF_tubeMag_AT","_ADF_INF_tubeMag_AA","_ADF_INF_40mike","_ADF_INF_handgrenade","_ADF_INF_ACE3_default",
		"_ADF_INF_ACE3_defaultMed","_ADF_TFAR_PersonalRadio", "_ADF_TFAR_SWRadio", "_ADF_TFAR_LRRadio","_ADF_texture"];
		
tf_no_auto_long_range_radio 	= true;

// Init unit vars
_ADF_unit 					= _this;
_ADF_unitString				= str _ADF_unit;
_u 							= _ADF_unitString splitString "_";
_r							= toLower (_u select 1);

// Init gear
_ADF_INF_headGear				= ["H_HelmetSpecB_paint2","H_HelmetB_sand","H_HelmetB_desert"] call BIS_fnc_selectRandom;

// Init Weapon
_ADF_INF_priWpn				= "arifle_MX_Black_Hamr_pointer_F";
_ADF_INF_priWpn_lite			= "arifle_MXC_Black_F";
_ADF_INF_priWpn_GL			= "arifle_MX_GL_Black_Hamr_pointer_F";
_ADF_INF_priWpn_LMG			= "LMG_Mk200_MRCO_F";
_ADF_INF_priWpn_MG			= "MMG_02_black_RCO_BI_F";
_ADF_INF_handWpn				= "hgun_P07_F";
_ADF_INF_tube_Lite			= "launch_NLAW_F";
_ADF_INF_tube_AT				= "launch_B_Titan_short_F";
_ADF_INF_tube_AA				= "launch_B_Titan_F";

// Attachments
_ADF_INF_priWpnScope_lite		= "optic_Aco";

// Init ammo
_ADF_INF_priWpnMag			= "30Rnd_65x39_caseless_mag";
_ADF_INF_priWpnMag_LMG		= "200Rnd_65x39_cased_Box_Tracer";
_ADF_INF_priWpnMag_MG			= "130Rnd_338_Mag";

_ADF_INF_handWpn_mag			= "16Rnd_9x21_Mag";
_ADF_INF_tubeMag_Lite			= "NLAW_F";
_ADF_INF_tubeMag_AT			= "Titan_AT";
_ADF_INF_tubeMag_AA			= "Titan_AA";
_ADF_INF_40mike				= "1Rnd_HE_Grenade_shell";
_ADF_INF_handgrenade			= "HandGrenade";

// Radios
_ADF_TFAR_PersonalRadio		= "tf_rf7800str";
_ADF_TFAR_SWRadio				= "tf_anprc152";
_ADF_TFAR_LRRadio				= "tf_rt1523g_big_rhs";

// Misc
_ADF_microDAGR				= "Chemlight_green"; // in can of no ACE3 or cTAB

// ACE overrides
if (ADF_mod_ACE3) then {
	_ADF_INF_priWpnMag 		= "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim";
	_ADF_INF_priWpnMag_LMG	= "ACE_200Rnd_65x39_cased_Box_Tracer_Dim";
};

// Default ACE3 kit
_ADF_INF_ACE3_default 		= ["ACE_EarPlugs","ace_mapTools","ACE_CableTie","ACE_IR_Strobe_Item","ACE_morphine","ACE_HandFlare_White","ACE_HandFlare_White","ACE_M84","ACE_M84"];
_ADF_INF_ACE3_defaultMed		= ["ACE_fieldDressing","ACE_elasticBandage","ACE_quikclot","ACE_fieldDressing","ACE_elasticBandage","ACE_quikclot","ACE_fieldDressing",
								"ACE_elasticBandage","ACE_quikclot"];
								
// Strip the unit
removeAllWeapons _ADF_unit; removeAllItems _ADF_unit; removeAllAssignedItems _ADF_unit; removeVest _ADF_unit; removeBackpack _ADF_unit; removeHeadgear _ADF_unit; removeGoggles _ADF_unit; 


/********* DEFAULT TWO SIERRA LOADOUT ********/

// Add Items/gear
_ADF_unit forceAddUniform "U_B_CombatUniform_mcam";
{_ADF_unit linkItem _x} forEach ["ItemWatch","ItemCompass","ItemMap"];
_ADF_unit addHeadgear _ADF_INF_headGear;
_ADF_unit addVest "V_TacVest_khk";
_ADF_unit addWeapon "NVGoggles";
_ADF_unit addItem "acc_flashlight";
_ADF_unit addItemToUniform "acc_pointer_IR";

// MicroDAGR. If no ACE or CtAB than add chemlight
if (ADF_mod_ACE3) then {_ADF_microDAGR = "ACE_microDAGR"};
if (!ADF_mod_ACE3 && ADF_mod_CTAB) then {_ADF_microDAGR = "itemMicroDagr"};

// Closing arguments
ADF_loadout_platoon = {
	params ["_ADF_unit","_r"];
	_ADF_unit selectWeapon (primaryWeapon _ADF_unit);
	if (isMultiplayer && ADF_mod_ACE3) then {_ADF_unit setSpeaker "ACE_NoVoice";};
	if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
	if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
	
	// Hand weapon
	for "_i" from 1 to 3 do {_ADF_unit addMagazine _ADF_INF_handWpn_mag;};
	_ADF_unit addWeapon _ADF_INF_handWpn;
	
	// Misc 
	for "_i" from 1 to 2 do {
		_ADF_unit addItem "SmokeShell"; _ADF_unit addItem "Chemlight_green"; _ADF_unit addItem _ADF_INF_handgrenade;
		if (!ADF_mod_ACE3) then {_ADF_unit addItem "FirstAidKit";};
	};	
	
	// Add ACE3 default loadout items
	if (ADF_mod_ACE3) then {
		_def = count _ADF_INF_ACE3_default;
		for "_i" from 0 to _def do {_ADF_unit addItem (_ADF_INF_ACE3_default select _i)};
		_med = count _ADF_INF_ACE3_defaultMed;
		for "_i" from 0 to _med do {_ADF_unit addItem (_ADF_INF_ACE3_defaultMed select _i)};
	};

	// cTab
	if (ADF_mod_CTAB) then {_ADF_unit addItemToUniform "ItemcTabHCam"};	

	// Personal Radios all units
	if (ADF_mod_ACRE) then {_ADF_unit linkItem "ACRE_PRC343"}; // ACRE
	if (ADF_mod_TFAR) then {_ADF_unit linkItem _ADF_TFAR_PersonalRadio; _ADF_unit addItem "tf_microdagr";}; // TFAR
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_ADF_unit linkItem "ItemRadio"}; // Vanilla
	
	// mircoDAGR
	if (_r == "pc" || _r == "tto" || _r == "sql" || _r == "wtl" || _r == "frl") then {_ADF_unit addItem _ADF_microDAGR;};
	
	// Add Uniform EH
	_ADF_unit addEventHandler ["Take", {
		(getObjectTextures player + [uniformContainer player getVariable "texture"])
		params ["_texUniform", "_texInsignia", "_texCustom"];
		if (isNil "_texCustom") exitWith {};
		if (_texUniform == _texCustom) exitWith {};
		player setObjectTextureGlobal [0, _texCustom];
		if (ADF_Clan_uniformInsignia) then {[player,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
		false
	}];

	// Set local Texture
	_ADF_texture =  "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa";
	uniformContainer _ADF_unit setVariable ["texture", _ADF_texture, true];
	
	ADF_gearLoaded = true;
};

/********* TWO SIERRA UNIT LOADOUT ********/

// Platoon Commander
if (_r == "pc") exitWith {
	_ADF_unit linkItem "ItemGPS";
	_ADF_unit addGoggles "G_Tactical_Clear";
	_ADF_unit addWeapon "Laserdesignator";
	_ADF_unit addItem "Laserbatteries";	
	
	// Mod Items
	if (ADF_mod_ACRE) then {_ADF_unit addBackpack "B_AssaultPack_cbr"; _ADF_unit addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio} else {_ADF_unit addBackpack "B_AssaultPack_cbr"};	
	if (ADF_mod_ACE3) then {_ADF_unit addItem "ace_dagr";};
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemcTab";};

	// Weapons
	for "_i" from 1 to 5 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn_lite;
	_ADF_unit addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Platoon/Squad: RTO
if (_r == "rto") exitWith {
	_ADF_unit linkItem "ItemGPS";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_ADF_unit addBackpack "B_AssaultPack_cbr"; _ADF_unit addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio} else {_ADF_unit addBackpack "B_AssaultPack_cbr"};	
	if (ADF_mod_ACE3) then {_ADF_unit addWeapon "ACE_Vector"; _ADF_unit addItem "ace_dagr";} else {_ADF_unit addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemAndroid";};	
	
	// Weapons
	for "_i" from 1 to 8 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn_lite;
	_ADF_unit addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;


	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Squad: Leader
if (_r == "sql") exitWith {
	_ADF_unit linkItem "ItemGPS";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_ADF_unit addBackpack "B_Kitbag_cbr"; _ADF_unit addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio} else {_ADF_unit addBackpack "B_Kitbag_cbr";};	
	if (ADF_mod_ACE3) then {_ADF_unit addItem "ACE_HuntIR_M203"; _ADF_unit addItem "ACE_HuntIR_monitor"; _ADF_unit addWeapon "ACE_Vector"; 	_ADF_unit addItem "ace_dagr";	} else {_ADF_unit addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemAndroid";};
	
	// Weapons
	for "_i" from 1 to 8 do {_ADF_unit addMagazine _ADF_INF_priWpnMag; _ADF_unit addItemToVest _ADF_INF_40mike;};
	_ADF_unit addWeapon _ADF_INF_priWpn_GL;
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Fire Team: Leader
if (_r == "ftl") exitWith {
	_ADF_unit linkItem "ItemGPS";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_ADF_unit addBackpack "B_Kitbag_cbr"; _ADF_unit addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio} else {_ADF_unit addBackpack "B_Kitbag_cbr";};
	if (ADF_mod_ACE3) then {_ADF_unit addItem "ACE_HuntIR_M203"; _ADF_unit addItem "ACE_HuntIR_monitor"; _ADF_unit addWeapon "ACE_Vector"; 	_ADF_unit addItem "ace_dagr";	} else {_ADF_unit addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemAndroid";};
	
	// Weapons
	for "_i" from 1 to 8 do {_ADF_unit addMagazine _ADF_INF_priWpnMag; _ADF_unit addItemToVest _ADF_INF_40mike;};
	_ADF_unit addWeapon _ADF_INF_priWpn_GL;
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Weapons Team: Leader
if (_r == "wtl") exitWith {
	_ADF_unit linkItem "ItemGPS";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	// Mod items
	if (ADF_mod_ACRE) then {_ADF_unit addBackpack "B_Kitbag_cbr"; _ADF_unit addItemToBackpack "ACRE_PRC148";};
	if (ADF_mod_TFAR) then {_ADF_unit addBackpack _ADF_TFAR_LRRadio} else {_ADF_unit addBackpack "B_Kitbag_cbr";};	
	if (ADF_mod_ACE3) then {_ADF_unit addItem "ACE_HuntIR_M203"; _ADF_unit addItem "ACE_HuntIR_monitor"; _ADF_unit addWeapon "ACE_Vector"; 	_ADF_unit addItem "ace_dagr";	} else {_ADF_unit addWeapon "Rangefinder";};
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemAndroid";};
	
	// Weapons
	for "_i" from 1 to 8 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	for "_i" from 1 to 3 do {_ADF_unit addItemToVest _ADF_INF_40mike;};
	_ADF_unit addWeapon _ADF_INF_priWpn_GL;	
	_ADF_unit addMagazine _ADF_INF_tubeMag_AA;
	_ADF_unit addWeapon _ADF_INF_tube_AA;
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Squad: Medic
if (_r == "cls") exitWith {
	_ADF_unit linkItem "ItemGPS";
	_ADF_unit addBackpack "B_Carryall_cbr";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	// Weapons
	for "_i" from 1 to 8 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn;
	for "_i" from 1 to 4 do {_ADF_unit addItemToVest "SmokeShell"; 	_ADF_unit addItemToVest "Chemlight_green";	};
	
	// ACE3 Medical
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
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Fire Team: Automatic Rifleman (LMG) 
if (_r == "ar") exitWith {
	_ADF_unit addBackpack "B_Kitbag_cbr";
	_ADF_unit addGoggles "G_Combat";
	
	for "_i" from 1 to 3 do {_ADF_unit addMagazine _ADF_INF_priWpnMag_LMG;};
	_ADF_unit addWeapon _ADF_INF_priWpn_LMG;
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Fire Team: Asst Automatic Rifleman (LMG)
if (_r == "aar") exitWith {
	_ADF_unit addBackpack "B_Kitbag_cbr";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 11 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn;	
	for "_i" from 1 to 3 do {_ADF_unit addItemToBackpack _ADF_INF_priWpnMag_LMG;};
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Fire Team: Rifleman
if (_r == "r") exitWith {
	_ADF_unit addBackpack "B_AssaultPack_cbr";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 13 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn;

	[_ADF_unit, _r] call ADF_loadout_platoon;

};

// Fire Team: Rifleman AT
if (_r == "rat") exitWith {
	_ADF_unit addBackpack "B_FieldPack_cbr";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 8 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn;
	_ADF_unit addMagazine _ADF_INF_tubeMag_Lite;
	_ADF_unit addWeapon _ADF_INF_tube_Lite;
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Weapons Team: Machine Gunner
if (_r == "mg") exitWith {
	_ADF_unit addBackpack "B_Kitbag_cbr";
	_ADF_unit addGoggles "G_Combat";
	
	for "_i" from 1 to 4 do {_ADF_unit addMagazine _ADF_INF_priWpnMag_MG;};
	_ADF_unit addWeapon _ADF_INF_priWpn_MG;
	
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemAndroid";};	
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Weapons Team: Asst. Machinegunner
if (_r == "amg") exitWith {
	_ADF_unit addBackpack "B_Carryall_cbr";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 8 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn_lite;
	_ADF_unit addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	for "_i" from 1 to 4 do {_ADF_unit addItemToBackpack _ADF_INF_priWpnMag_MG;};
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Weapons Team: Missile Specialist
if (_r == "ms") exitWith {
	_ADF_unit addBackpack "B_Kitbag_cbr";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 5 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn_lite;
	_ADF_unit addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	_ADF_unit addMagazine _ADF_INF_tubeMag_AT;
	_ADF_unit addItemToBackpack _ADF_INF_tubeMag_AT;
	_ADF_unit addWeapon _ADF_INF_tube_AT;
	
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemAndroid";};	
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Weapons Team: Asst. Missile Specialist
if (_r == "ams") exitWith {
	_ADF_unit addBackpack "B_Carryall_cbr";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 5 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn_lite;
	_ADF_unit addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	for "_i" from 1 to 2 do {_ADF_unit addItemToBackpack _ADF_INF_tubeMag_AT;};
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Weapons Team: HMG specialist
if (_r == "hmg") exitWith {
	_ADF_unit addBackpack "B_HMG_01_weapon_F";
	_ADF_unit addGoggles "G_Combat";
	
	for "_i" from 1 to 5 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn_lite;
	_ADF_unit addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	
	if (ADF_mod_CTAB) then {_ADF_unit addItem "ItemAndroid";};	
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};

// Weapons Team: Asst. HMG specialist
if (_r == "ahmg") exitWith {
	_ADF_unit addBackpack "B_HMG_01_support_F";
	_ADF_unit addGoggles "G_Tactical_Clear";
	
	for "_i" from 1 to 5 do {_ADF_unit addMagazine _ADF_INF_priWpnMag;};
	_ADF_unit addWeapon _ADF_INF_priWpn_lite;
	_ADF_unit addPrimaryWeaponItem _ADF_INF_priWpnScope_lite;
	
	[_ADF_unit, _r] call ADF_loadout_platoon;
};