/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Respawn init 
Author: Whiztler
Script version: 2.2

Game type: n/a
File: ADF_onPlayerRespawn.sqf
****************************************************************/

// Init
private["_cID","_ADF_unit"];
_ADF_unit = player;
waitUntil {alive _ADF_unit};


/////  Respawn params/vars - announce (hint) number of remaining respawn tickets per side
if (ADF_Tickets) then {
	private["_ADF_wTix","_ADF_eTix","_ADF_unitName"];
	_ADF_wTix = [WEST] call BIS_fnc_respawnTickets;
	_ADF_eTix = [EAST] call BIS_fnc_respawnTickets;

	_ADF_unitName = name vehicle player;

	if (side player == WEST) then {
		[[[_ADF_unitName,_ADF_wTix],
			{
				HintSilent parseText format
					["					
						<t color='#6C7169' size='1.5'>%1 Logistics</t><br/><br/>					
						<t color='#A1A4AD' align='left'>Reinforcement slot:</t><t color='#FFFFFF' align='right'>%2</t><br/>
						<t color='#1262c4' align='left'>BLUEFOR</t><t color='#A1A4AD' align='left'> slots remaining: </t><t color='#FFFFFF' align='right'>%3</t><br/>
					",ADF_clanName, _this select 0, _this select 1];
			}
		],"BIS_fnc_spawn", WEST, true, false] spawn BIS_fnc_MP;
		sleep 8;
		hintSilent "";
	};

	if (side player == EAST) then {	
		[[[_ADF_unitName,_ADF_eTix],
			{
				HintSilent parseText format
					["					
						<t color='#6C7169' size='1.5'>%1 Logistics</t><br/><br/>					
						<t color='#A1A4AD' align='left'>Reinforcement slot:</t><t color='#FFFFFF' align='right'>%2</t><br/>
						<t color='#d45454' align='left'>OPFOR</t><t color='#A1A4AD' align='left'> slots remaining: </t><t color='#FFFFFF' align='right'>%3</t><br/>
					",ADF_clanName, _this select 0, _this select 1];
			}
		],"BIS_fnc_spawn", EAST, true, false] spawn BIS_fnc_MP;
		sleep 8;
		hintSilent "";
	};
}; // close ADF_Tickets

if (ADF_mod_ACE3 && ADF_sameGearRespawn) exitWith {if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};}; // Use the ACE3 function rather than the ADF function

///// Apply stored Loadout (see onPlayerKilled.sqf)

removeAllWeapons _ADF_unit; removeAllItems _ADF_unit; removeAllAssignedItems _ADF_unit; removeVest _ADF_unit; removeBackpack _ADF_unit; removeHeadgear _ADF_unit;

// Containers
_ADF_unit addUniform ADF_StoreLoadout_uniform;
_ADF_unit addVest ADF_StoreLoadout_vest;
_ADF_unit addBackpack ADF_StoreLoadout_backpack;
_ADF_unit addHeadgear ADF_StoreLoadout_headgear;
// Weapons/Magazines
{_ADF_unit addMagazine _x} forEach ADF_StoreLoadout_magazines;
{_ADF_unit addWeapon _x} forEach ADF_StoreLoadout_weapons;
// Weapon attachments etc
{_ADF_unit addPrimaryWeaponItem _x} forEach ADF_StoreLoadout_primaryWeaponItems;
{_ADF_unit addSecondaryWeaponItem _x} forEach ADF_StoreLoadout_secondaryWeaponItems;
{_ADF_unit addHandgunItem _x} forEach ADF_StoreLoadout_sideWeaponItems;
// Items
{_ADF_unit addItem _x} forEach ADF_StoreLoadout_items;
{_ADF_unit assignItem _x} forEach ADF_StoreLoadout_assignedItems;
// (re-apply) insignia
if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};
