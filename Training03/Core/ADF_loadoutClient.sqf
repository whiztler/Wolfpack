/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Loadout Client
Author: Whiztler
Script version: 5.1

Game type: n/a
File: ADF_loadoutClient.sqf
****************************************************************
NOTE: Gear loads on actual players only. Does not load on AI's!!
****************************************************************/

#include "ADF_JIP.sqf"
If (IsDedicated || !(local player)) exitWith {};

//Init vars
private [
	"_ADF_customLoadout","_ADF_uniform_inf","_ADF_uniform_sor","_ADF_NVGoggles","_ADF_GPS","_ADF_INF_assault_weapon",
	"_ADF_INF_LMG_weapon","_ADF_INF_hand_weapon","_ADF_INF_scopes","_ADF_Wolfassault_weapon","_ADF_Wolfhand_weapon",
	"_ADF_CAV_assault_weapon","_ADF_TFAR_PersonalRadio","_ADF_TFAR_SWRadio","_ADF_TFAR_LRRadio",
	"_uFaction","_ADF_inf_headgear","_unit","_chk","_uStr","_u","_p","_r"
];

_ADF_customLoadout = _this select 0;
_ADF_uniform_inf = _this select 1;
_ADF_uniform_sor = _this select 2;
_ADF_NVGoggles = _this select 3;
_ADF_GPS = _this select 4;
_ADF_INF_assault_weapon = _this select 5;
_ADF_INF_LMG_weapon = _this select 6;
_ADF_INF_hand_weapon = _this select 7;
_ADF_INF_scopes = _this select 8;
_ADF_Wolfassault_weapon = _this select 9;
_ADF_Wolfhand_weapon = _this select 10;	
_ADF_CAV_assault_weapon = _this select 11;
_ADF_TFAR_PersonalRadio = _this select 12;
_ADF_TFAR_SWRadio = _this select 13;
_ADF_TFAR_LRRadio = _this select 14;
ADF_WolfMK20 = false;
ADF_WolfMXC = false;
ADF_WolfMX = false;
_uFaction = faction player;
_unit = player;

// BluFor Faction
if ((_uFaction == "BLU_F") && _ADF_customLoadout) exitWith { // BLUFOR: Custom loadout = true

	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_LoadoutWest.sqf";
				
	// Check if the player is a ADF unit
	_chk = toLower str (vehicle _unit);
	_chk = toArray _chk;
	_chk resize 3;
	if (
		(toString _chk != "inf") &&
		(toString _chk != "sor") &&
		(toString _chk != "sod") &&
		(toString _chk != "sop") &&	
		(toString _chk != "cav") &&
		(toString _chk != "air") &&
		(toString _chk != "dev")
	) exitWith {
		[_unit] call ADF_fnc_loadoutNotDef; // Undefined unit > load standard infantry gear
	}; 
	
	// Split the player variable into Squad, Role
	_uStr = str _unit;
	_u = [_uStr, "_"] call CBA_fnc_split;
	_s = toLower (_u select 0);
	_r = toLower (_u select 1);
	
	// Strip the unit of vanilla loadout
	removeAllWeapons _unit; removeAllItems _unit; removeAllAssignedItems _unit; removeVest _unit; removeBackpack _unit; removeHeadgear _unit; removeGoggles _unit;	
	
	// Add default loadout
	_unit linkItem "ItemMap"; _unit linkItem "ItemWatch"; _unit linkItem "ItemCompass"; sleep 0.05;
	if (_ADF_NVGoggles) then {_unit addWeapon "NVGoggles"};	
				
	// Load the appropriate Squad/Role gear											
	if (_s == "inf") exitWith {[_s,_r] call ADF_fnc_loudoutInf}; // Infantry Platoon
	if (_s == "cav") exitWith {[_s,_r] call ADF_fnc_loadoutCav}; // Cavalry Battery
	if (_s == "air") exitWith {[_s,_r] call ADF_fnc_loadoutAir}; // Air wing
	if (_s == "sor") exitWith {[_s,_r] call ADF_fnc_loadoutSor}; // SpecOp/Recon Squadron
	if (_s == "sod") exitWith {[_s,_r] call ADF_fnc_loadoutSod}; // Divers
	if (_s == "sop") exitWith {[_s,_r] call ADF_fnc_loadoutSop}; // Snipers/JTAC
	if (_s == "dev") exitWith {									 // Mission Developer
		_unit addVest "V_Rangemaster_belt";
		_unit unassignItem "NVGoggles";
		_unit addWeapon "LaserDesignator";
		_unit addMagazine "LaserBatteries";
		_unit allowDamage false;
	};
}; // close _ADF_customLoadout

if ((faction player == "BLU_F") && !_ADF_customLoadout) exitWith { // BLUFOR: Custom loadout = false
	private ["_unit","_chk"];
	_unit = player;
	_uStr = str _unit;
	_u = [_uStr, "_"] call CBA_fnc_split;
	_s = toLower (_u select 0);
	_r = toLower (_u select 1);
	// Default equip (additional to Vanilla)
	if ((isClass(configFile/"CfgPatches"/"cTab")) && (side player == WEST)) then {_unit addItemToVest "ItemcTabHCam"};
	if (isClass (configFile >> "CfgPatches" >> "AGM_Hearing")) then {_unit addItemToVest "AGM_EarBuds"};
	if (isClass (configFile >> "CfgPatches" >> "AGM_Interaction")) then {_unit addItemToVest "AGM_CableTie"};
	if (isClass (configFile >> "CfgPatches" >> "AGM_Map")) then {_unit addItemToVest "AGM_MapTools"};
	if (isClass (configFile >> "CfgPatches" >> "AGM_Core")) then {_unit addItemToVest "AGM_IR_Strobe_Item"};

	// Add additional radios for leaders & RTO's
	if (isClass(configFile/"CfgPatches"/"task_force_radio") && (_r == "rto")) then {
		_unit addItemToVest _ADF_TFAR_SWRadio;
		_unit addBackpack _ADF_TFAR_LRRadio
	};
	
	// Add cTAB equipment to leadership units
	if (isClass(configFile/"CfgPatches"/"cTab") && (_r == "xo")) then {_unit addItemToVest "itemcTab"};
	if (isClass(configFile/"CfgPatches"/"cTab") && ((_r == "sql") || (_r == "ftl") || (_r == "atl") || (_r == "rtl") || (_r == "vc") || (_r == "p") || (_r == "hp") || (_r == "sp") || (_r == "jtc") || (_r == "wtl"))) then {_unit addItemToVest "itemAndroid"};
};


