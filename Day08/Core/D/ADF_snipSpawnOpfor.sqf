/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Spawn Units
Author: Whiztler
Script version: 1.0

Game type: n/a
File: ADF_SnipSpawnOpfor.sqf
****************************************************************
Map click to spawn an Opfor Weapons Squad.
****************************************************************/

openMap true; sleep .5;
hintSilent format ["%1, click on a location on the map to spawn a Bluefor Weapons Squad...", name vehicle player];
if (isMultiplayer) then {
	onMapSingleClick "if(_alt) then {_grp = [_pos,EAST,(configFile >> 'CfgGroups' >> 'East' >> 'OPF_F' >> 'Infantry' >> 'OIA_InfSquad_Weapons')] call BIS_fnc_spawnGroup;};onMapSingleClick ' ';true;openMap false;hintSilent format ['%1, Bluefor Weapons Squad spawned at: %2', name vehicle player, _pos];";
} else {
	onMapSingleClick "_grp = [_pos,EAST,(configFile >> 'CfgGroups' >> 'East' >> 'OPF_F' >> 'Infantry' >> 'OIA_InfSquad_Weapons')] call BIS_fnc_spawnGroup;onMapSingleClick ' ';true;openMap false;hintSilent format ['%1, Bluefor Weapons Squad spawned at: %2', name vehicle player, _pos];";
};


