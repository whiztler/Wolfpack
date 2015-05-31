/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Killed init
Author: Whiztler
Script version: 1.4

Game type: n/a
File: onPlayerKilled.sqf
****************************************************************/

// Init
private["_ADF_wTix","_ADF_eTix","_u","_ADF_unit"];
_ADF_unit = player;
_ADF_wTix = [WEST] call BIS_fnc_respawnTickets;
_ADF_eTix = [EAST] call BIS_fnc_respawnTickets;

if (ADF_Tickets && ADF_mod_ACE3 && (side _ADF_unit == WEST) && (_ADF_wTix < 1)) exitWith {
	_ADF_unit setVariable ["ACE_Medical_hasPain", false]; // 1.39 a12
	_ADF_unit setVariable ["ACE_Medical_isBleeding", false]; // 1.39 a12
	_ADF_unit setVariable ["ACE_isUnconscious", false]; // 1.39 a12
	"chromAberration" ppEffectEnable false; // 1.39 a12
	[false] call ACE_Common_fnc_disableUserInput; // 1.39 a12
};

if (ADF_Tickets && ADF_mod_ACE3 && (side _ADF_unit == EAST) && (_ADF_eTix < 1)) exitWith {
	_ADF_unit setVariable ["ACE_Medical_hasPain", false]; // 1.39 a12
	_ADF_unit setVariable ["ACE_Medical_isBleeding", false]; // 1.39 a12
	_ADF_unit setVariable ["ACE_isUnconscious", false]; // 1.39 a12
	"chromAberration" ppEffectEnable false; // 1.39 a12
	[false] call ACE_Common_fnc_disableUserInput; // 1.39 a12
};

if (ADF_sameGearRespawn && !ADF_mod_ACE3) then { // Save the player loadout when ACE3 SameGearRespawn is NOT enabled
	// Containers
	ADF_StoreLoadout_uniform = uniform _ADF_unit;
	ADF_StoreLoadout_vest = vest _ADF_unit;
	ADF_StoreLoadout_backpack = backpack _ADF_unit;
	ADF_StoreLoadout_headgear = headgear _ADF_unit;	
	// Weapons (also binos, gps etc)
	ADF_StoreLoadout_weapons = weapons _ADF_unit;	
	ADF_StoreLoadout_magazines = magazines _ADF_unit;
	// Weapon attachments etc
	ADF_StoreLoadout_primaryWeaponItems = primaryWeaponItems _ADF_unit;
	ADF_StoreLoadout_secondaryWeaponItems = secondaryWeaponItems _ADF_unit;	
	ADF_StoreLoadout_sideWeaponItems = handgunItems _ADF_unit;
	// items
	ADF_StoreLoadout_items = items _ADF_unit;
	ADF_StoreLoadout_assignedItems = assignedItems _ADF_unit;
};


