/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: TaskForce Radio configuration
Author: Whiztler
Script version: 1.0

Game type: n/a
File: ADF_TFAR.sqf
****************************************************************
TFAR Radio overrides and settings
****************************************************************/

#include "ADF_JIP.sqf"

if (ADF_mod_TFAR) then {
	tf_no_auto_long_range_radio = true;
	tf_give_personal_radio_to_regular_soldier = false;
	if (ADF_TFAR_preset) then {
		tf_same_sw_frequencies_for_side = false;
	} else {
		tf_same_sw_frequencies_for_side = true;
	};
	
	if (side player != WEST) exitWith {};
	
	[] spawn {
		private ["_ADF_TFAR_presetEnable"];
		if (ADF_TFAR_preset) exitWith {}; // Exit if per group defined presets are required
		waitUntil {time > 20};
		[(call TFAR_fnc_activeSwRadio), 1, "100.0"] call TFAR_fnc_SetChannelFrequency;
		[(call TFAR_fnc_activeLrRadio), 1, "30.0"] call TFAR_fnc_SetChannelFrequency;
	};
};