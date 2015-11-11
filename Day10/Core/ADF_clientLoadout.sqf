/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Loadout Client
Author: Whiztler
Script version: 5.61

Game type: n/a
File: ADF_clientLoadout.sqf
****************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!
****************************************************************/

if (isServer) then {diag_log "ADF RPT: Init - executing ADF_clientLoadout.sqf"}; // Reporting. Do NOT edit/remove

// Let the server apply Two Sierra uniform textures globally after the client loadout has been applied fully > 1.41 - 5.60
if (isServer) then {
	if (ADF_clanName == "Two Sierra") then {
		[] spawn {
			if (isMultiplayer) then {ADF_uArray = playableUnits;} else {ADF_uArray = switchableUnits};
			sleep 20; // wait till units have geared up
			{_x setObjectTextureGlobal [0, "\a3\characters_f\BLUFOR\Data\clothing_sage_co.paa"]} forEach ADF_uArray; 
			ADF_uArray = nil;
		};
	};
	if (ADF_clanName == "Wolfpack") then {
		[] spawn {
			if (isMultiplayer) then {ADF_uArray = playableUnits;} else {ADF_uArray = switchableUnits};
			sleep 20; // wait till units have geared up
			{_x setObjectTextureGlobal [0, "\A3\Characters_F\Common\Data\basicbody_black_co.paa"]} forEach ADF_uArray; 
			ADF_uArray = nil;
		};
	};	
};

_ADF_perfDiagStart = diag_tickTime;
if (ADF_debug) then {["LOADOUT - Loadout Client started",false] call ADF_fnc_log};

If (IsDedicated || !(local player) || ADF_isHC) exitWith {}; // 5.43
_ADF_noLoadout = param [15, false, [true,false]];
if (_ADF_noLoadout) exitWith {if (ADF_debug) then {["Loadout - noLoadout option selected. Exiting loadout client.",false] call ADF_fnc_log; ADF_gearLoaded = true; publicVariableServer "ADF_gearLoaded";} else {diag_log "ADF RPT: Loadout - noLoadout option selected. Exiting loadout client."; ADF_gearLoaded = true; publicVariableServer "ADF_gearLoaded";}};
// Two Sierra exit
if (ADF_clanName == "TWO SIERRA") exitWith {player execVM "Core\F\ADF_fnc_Loadout2S.sqf";};

//Init vars
private [
	"_ADF_customLoadout_MOD","_ADF_uniform_inf","_ADF_uniform_sor","_ADF_NVGoggles","_ADF_GPS","_ADF_INF_assault_weapon",
	"_ADF_INF_LMG_weapon","_ADF_INF_hand_weapon","_ADF_INF_scopes","_ADF_SOR_assault_weapon","_ADF_SOR_hand_weapon",
	"_ADF_CAV_assault_weapon","_ADF_TFAR_PersonalRadio","_ADF_TFAR_SWRadio","_ADF_TFAR_LRRadio","_ADF_TFAR_LRRadioSOR",
	"_ADF_unitFaction","_ADF_inf_headgear","_ADF_unit","_ADF_unitCheck","_ADF_unitString","_u","_p","_r"
];

_ADF_customLoadout_MOD 		= param [0, false, [true,false]];
_ADF_uniform_inf 				= _this select 1;
_ADF_uniform_sor 				= _this select 2;
_ADF_NVGoggles 				= param [3, true, [true,false]];
_ADF_GPS 					= param [4, false, [true,false]];
_ADF_INF_assault_weapon		= param [5, 1, [1,2]];
_ADF_INF_LMG_weapon 			= param [6, 1, [1,2]];
_ADF_INF_hand_weapon 			= param [7, 1, [1,2]];
_ADF_INF_scopes 				= param [8, false, [true,false]];
_ADF_SOR_assault_weapon		= param [9, 1, [1,2,3]];
_ADF_SOR_hand_weapon 			= param [10, 1, [1,2]];
_ADF_CAV_assault_weapon 		= param [11, 1, [1,2]];
_ADF_TFAR_PersonalRadio 		= param [12, "tf_rf7800str", ["tf_rf7800str","tf_anprc152"]];
_ADF_TFAR_SWRadio 			= param [13, "tf_anprc152", ["tf_rf7800str","tf_anprc152"]];
_ADF_TFAR_LRRadio 			= param [14, "tf_rt1523g_big", ["tf_rt1523g","tf_rt1523g_big","tf_rt1523g_black","tf_rt1523g_fabric","tf_rt1523g_green","tf_rt1523g_rhs","tf_rt1523g_sage"]];
_ADF_TFAR_LRRadioSOR 			= param [16, "tf_rt1523g_black", ["tf_rt1523g","tf_rt1523g_big","tf_rt1523g_black","tf_rt1523g_fabric","tf_rt1523g_green","tf_rt1523g_rhs","tf_rt1523g_sage"]];
_ADF_ACE3_microDAGR_all 		= param [17, false, [true,false]];
_ADF_ACE3_microDAGR_leaders 	= param [18, false, [true,false]];
_ADF_cTAB_microDAGR_all 		= param [19, false, [true,false]];
_ADF_cTAB_microDAGR_leaders 	= param [20, false, [true,false]];

tf_no_auto_long_range_radio 	= true;
ADF_SOR_MK20 				= false;
ADF_SOR_MXC 					= false;
ADF_SOR_MX 					= false;
_ADF_unitFaction 				= faction player;
_ADF_unit 					= player;

// BluFor Faction
if ((_ADF_unitFaction == "BLU_F") && _ADF_customLoadout_MOD) exitWith { // BLUFOR: Custom loadout = true

	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_LoadoutWest.sqf";
				
	// Check if the player is a ADF unit
	_ADF_unitCheck = toLower str (vehicle _ADF_unit);
	_ADF_unitCheck = toArray _ADF_unitCheck;
	_ADF_unitCheck resize 3;
	if (
		(toString _ADF_unitCheck != "inf") &&
		(toString _ADF_unitCheck != "sor") &&
		(toString _ADF_unitCheck != "sod") &&
		(toString _ADF_unitCheck != "sop") &&	
		(toString _ADF_unitCheck != "cav") &&
		(toString _ADF_unitCheck != "air") &&
		(toString _ADF_unitCheck != "dev")
	) exitWith {
		[_ADF_unit] call ADF_fnc_loadoutNotDef; // Undefined unit > load standard infantry gear
	}; 
	
	// Split the player variable into Squad, Role
	_ADF_unitString = str _ADF_unit;
	_u = _ADF_unitString splitString "_";
	_s = toLower (_u select 0);
	_r = toLower (_u select 1);
	
	// Strip the unit of vanilla loadout
	removeAllWeapons _ADF_unit; removeAllItems _ADF_unit; removeAllAssignedItems _ADF_unit; removeVest _ADF_unit; removeBackpack _ADF_unit; removeHeadgear _ADF_unit; removeGoggles _ADF_unit;	
	
	// Add default loadout
	_ADF_unit linkItem "ItemMap"; _ADF_unit linkItem "ItemWatch"; _ADF_unit linkItem "ItemCompass";
	if (_ADF_NVGoggles) then {_ADF_unit addWeapon "NVGoggles"};	
	
	// MicroDAGR config
	if ((_ADF_cTAB_microDAGR_all || _ADF_cTAB_microDAGR_leaders) && ADF_mod_CTAB) then {
		ADF_microDAGR = "itemMicroDagr";
		if (_ADF_cTAB_microDAGR_all) then {ADF_microDAGR_all = 1} else {ADF_microDAGR_all = 2};
	};
	if ((_ADF_ACE3_microDAGR_all || _ADF_ACE3_microDAGR_leaders) && ADF_mod_ACE3) then { // ACE3 prevails when both CtAB and ACE3 DAGR are selected
		ADF_microDAGR = "ACE_microDAGR";
		if (_ADF_ACE3_microDAGR_all) then {ADF_microDAGR_all = 1} else {ADF_microDAGR_all = 2};
	};
	if (!_ADF_cTAB_microDAGR_all && !_ADF_cTAB_microDAGR_leaders && !_ADF_ACE3_microDAGR_all && !_ADF_ACE3_microDAGR_leaders) then { // 140B06
		ADF_microDAGR = "Chemlight_green"; // No microDAGR wanted, replaced with green chemlight
	};
	
	// set identity
	if (isMultiplayer && ADF_mod_ACE3) then {_ADF_unit setSpeaker "ACE_NoVoice";};
	
	// SOR uniform texture update
	if (_s == "sor") then {
		[_ADF_unit] spawn {
			waitUntil {time > 10};
			
			// Add Uniform EH
			player addEventHandler ["Take", {
				(getObjectTextures player + [uniformContainer player getVariable "texture"])
				params ["_texUniform", "_texInsignia", "_texCustom"];
				if (isNil "_texCustom") exitWith {};
				if (_texUniform == _texCustom) exitWith {};
				player setObjectTextureGlobal [0, _texCustom];
				if (ADF_Clan_uniformInsignia) then {[player,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
				false
			}];

			// Set local Texture
			_ADF_texture =  "\A3\Characters_F\Common\Data\basicbody_black_co.paa";
			uniformContainer player setVariable ["texture", _ADF_texture, true];
		};
	};
	
	// Load the appropriate Squad/Role gear											
	if (_s == "inf") exitWith {[_s,_r] call ADF_fnc_loudoutInf}; // Infantry Platoon
	if (_s == "cav") exitWith {[_s,_r] call ADF_fnc_loadoutCav}; // Cavalry Battery
	if (_s == "air") exitWith {[_s,_r] call ADF_fnc_loadoutAir}; // Air wing
	if (_s == "sor") exitWith {[_s,_r] call ADF_fnc_loadoutSor}; // SpecOp/Recon Squadron
	if (_s == "sod") exitWith {[_s,_r] call ADF_fnc_loadoutSod}; // Divers
	if (_s == "sop") exitWith {[_s,_r] call ADF_fnc_loadoutSop}; // Snipers/JTAC
	if (_s == "dev") exitWith {								 // Mission Developer
		_ADF_unit addVest "V_Rangemaster_belt";
		_ADF_unit unassignItem "NVGoggles";
		_ADF_unit addWeapon "LaserDesignator";
		_ADF_unit addMagazine "LaserBatteries";
		_ADF_unit allowDamage false;
		_ADF_unit addBackpack "B_OutdoorPack_blu"; 
		if (ADF_mod_ACE3) then {_ADF_unit addItemToBackpack "ACE_microDAGR"};
		if (ADF_mod_CTAB) then {_ADF_unit addItemToBackpack "ItemcTab"};
		_ADF_perfDiagStop = diag_tickTime;
		if (ADF_debug) then {
			_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
			_debugText = "LOADOUT - loadout applied.";
			_debugMsg = _debugText + _debugDiag;
			[_debugMsg,false] call ADF_fnc_log;
		};
	};
}; // close _ADF_customLoadout_MOD

if ((faction player == "BLU_F") && !(_ADF_customLoadout_MOD)) exitWith { // BLUFOR: Custom loadout = false
	private ["_ADF_unit","_ADF_unitCheck"];
	_ADF_unit = player;
	_ADF_unitString = str _ADF_unit;
	_u = [_ADF_unitString, "_"] call CBA_fnc_split;
	_s = toLower (_u select 0);
	_r = toLower (_u select 1);
	// Default equip (additional to Vanilla)
	if (ADF_mod_CTAB && (side player == ADF_playerSide)) then {_ADF_unit addItemToVest "ItemcTabHCam"};
	/* 
	if (ADF_mod_ACE3) then { // ACE3 items added by default
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item";
	};
	*/
	// Add additional radios for leaders & RTO's
	if (ADF_mod_TFAR && (_r == "rto")) then {
		_ADF_unit addItemToVest _ADF_TFAR_SWRadio;
		_ADF_unit addBackpack _ADF_TFAR_LRRadio;
	};
	
	// Add cTAB equipment to leadership units
	if (ADF_mod_CTAB && (_r == "xo")) then {_ADF_unit addItemToVest "itemcTab"};
	if (ADF_mod_CTAB && ((_r == "sql") || (_r == "ftl") || (_r == "atl") || (_r == "rtl") || (_r == "vc") || (_r == "p") || (_r == "hp") || (_r == "sp") || (_r == "jtc") || (_r == "wtl"))) then {_ADF_unit addItemToVest "itemAndroid"};
};