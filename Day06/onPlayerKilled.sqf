/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Killed init
Author: Whiztler
Script version: 1.5

Game type: n/a
File: onPlayerKilled.sqf
****************************************************************/

// Init
private["_ADF_wTix","_ADF_eTix","_u","_ADF_unit","_ADF_oldUnit","_ADF_respawnType"];
_ADF_unit 		= player;
_ADF_oldUnit		= _this select 0; // ADF 1.40 B05
_ADF_wTix 		= [WEST] call BIS_fnc_respawnTickets;
_ADF_eTix		= [EAST] call BIS_fnc_respawnTickets;
_ADF_respawnType	= getNumber (missionConfigFile >> "respawn"); // 140B05

if ((_ADF_respawnType == 0) || (_ADF_respawnType == 1)) exitWith {}; // No respawn (0) or Bird respawn (1) > 140B05

// Check if respawn-tickets are enabled and check if there are no more tickets left. If true evoke spectator.
if (	ADF_Tickets && (((side _ADF_unit == WEST) && (_ADF_wTix < 1)) || ((side _ADF_unit == EAST) && (_ADF_eTix < 1)))) exitWith { // 140B05
	if (ADF_mod_ACE3) then {
		_ADF_unit setVariable ["ACE_Medical_hasPain", false]; // 139A12
		_ADF_unit setVariable ["ACE_Medical_isBleeding", false]; // 139A12
		_ADF_unit setVariable ["ACE_isUnconscious", false]; // 139A12
		[false] call ACE_Common_fnc_disableUserInput; // 139A12
		ace_hearing_disableVolumeUpdate = true; // 1.40 B05
	};
	"chromAberration" ppEffectEnable false; // 139A12	
	[_ADF_unit,_ADF_oldUnit,true] call f_fnc_CamInit; // force into F3 Spectator > 140B05
};

// Save the player loadout when ACE3 SameGearRespawn is NOT enabled
if (ADF_sameGearRespawn && !ADF_mod_ACE3) then { 
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