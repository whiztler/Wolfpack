/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: TaskForce Radio preset loader
Author: Whiztler
Script version: 1.2

Game type: n/a
File: ADF_TFAR-preset.sqf
****************************************************************
Sets the long range and short wave frequency of units.

The frequencies for the groups are defined in:
			ADF_TFAR-freq.sqf
and included here to determine and configure the appropriate
radio freq for each unit.
****************************************************************/

#include "ADF_JIP.sqf"

If (!(local player) || isDedicated || !ADF_mod_TFAR || !(side player == WEST)) exitWith {};  // Local players only / Exit if TFAR is not active

waitUntil {time > 10}; // Wait for init.sqf to run
waitUntil {ADF_missionInit}; // Wait for the mission init to finish
//if (!isMultiplayer) exitWith {systemChat format ["ADF: %1, TFAR preset works only in multiplayer",name vehicle player]}; // Multiplayer only

// Init
private ["_ADF_TFAR_SW_radio","_ADF_TFAR_LR_radio","_ADF_TFAR_SW_freq","_ADF_TFAR_LR_freq","_ADF_gID"];
_ADF_TFAR_SW_radio = call TFAR_fnc_haveSWRadio;
_ADF_TFAR_LR_radio = call TFAR_fnc_haveLRRadio;
_ADF_gID = groupID (group player);

// Check which group the unit belongs to.
#include "ADF_TFAR-freq.sqf"

// Apply SW & LR frequencies
if (_ADF_TFAR_SW_radio) then {[(call TFAR_fnc_activeSwRadio), 1, str _ADF_TFAR_SW_freq] call TFAR_fnc_SetChannelFrequency};
if (_ADF_TFAR_LR_radio) then {[(call TFAR_fnc_activeLrRadio), 1, str _ADF_TFAR_LR_freq] call TFAR_fnc_SetChannelFrequency};

// Announce to player
if (!_ADF_TFAR_LR_radio) exitWith {systemChat format ["ADF: %1, TFAR radio tuned in. SW: %2",name vehicle player,_ADF_TFAR_SW_freq]};
if (_ADF_TFAR_SW_radio && _ADF_TFAR_LR_radio) exitWith {systemChat format ["ADF: %1, TFAR radio's tuned in. SW: %2 | LR: %3",name vehicle player,_ADF_TFAR_SW_freq,_ADF_TFAR_LR_freq]};



