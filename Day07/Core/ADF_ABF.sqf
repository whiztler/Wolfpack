/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Altitude Based Fatigue (ABF)
Author: Whiztler
Script version: 1.00

Game type: N/A
File: ADF_ABF.sqf
****************************************************************
Instructions:

Configure in ADF_init_config.sqf
****************************************************************/

if (!hasInterface) exitWith {}; // clients only - double check

// Init
private ["_ADF_unit","_ADF_ABF_factorMinor","_ADF_ABF_factorMild","_ADF_ABF_factorMajor","_ADF_ABF_factorSevere","_ADF_ABF_factorExtreme","_ADF_ABF_actual"];

_ADF_unit 				= player;
_ADF_ABF_factorMinor		= 1.10 + random 0.05;	// 10%
_ADF_ABF_factorMild		= 1.20 + random 0.05; 	// 25%
_ADF_ABF_factorMajor		= 1.40 + random 0.10; 	// 50%
_ADF_ABF_factorSevere		= 1.60 + random 0.10; 	// 75
_ADF_ABF_factorExtreme	= 2; 					// 125
_ADF_ABF_pause			= 60;					// runs every xx seconds
_ADF_ABF_actual 			= [];
_ADF_unit enableFatigue true;

ADF_fnc_ABF_update = {
	private ["_ADF_unit","_ADF_unitAltitude","_ADF_curFatigue"];
	params ["_ADF_unit"];
	_ADF_curFatigue		= getFatigue _ADF_unit;
	_ADF_unitAltitude		= getPosASL _ADF_unit;
	_ADF_ABF_actual		= [_ADF_unitAltitude select 2,_ADF_curFatigue];
	_ADF_ABF_actual
};

waitUntil {
	_ADF_unitNotAlive = !(alive _ADF_unit);
	_ADF_ABF_current = [_ADF_unit] call ADF_fnc_ABF_update;
	if !((vehicle player) isKindOf "Air") then {
		if (_ADF_ABF_current select 0 <= 1500) then {player setFatigue (_ADF_ABF_current select 1)};
		if ((_ADF_ABF_current select 0 > 1500) && (_ADF_ABF_current select 0 <= 2000)) then {player setFatigue (_ADF_ABF_current select 1) * _ADF_ABF_factorMinor};
		if ((_ADF_ABF_current select 0 > 2000) && (_ADF_ABF_current select 0 <= 3000)) then {player setFatigue (_ADF_ABF_current select 1) * _ADF_ABF_factorMild};
		if ((_ADF_ABF_current select 0 > 3000) && (_ADF_ABF_current select 0 <= 4000)) then {player setFatigue (_ADF_ABF_current select 1) * _ADF_ABF_factorMajor};
		if ((_ADF_ABF_current select 0 > 4000) && (_ADF_ABF_current select 0 <= 5000)) then {player setFatigue (_ADF_ABF_current select 1) * _ADF_ABF_factorSevere};
		if (_ADF_ABF_current select 0 > 5000)  then {player setFatigue (_ADF_ABF_current select 1) * _ADF_ABF_factorExtreme};
		if ((getFatigue _ADF_unit) >= 1) then {player setFatigue 1};
	};
	sleep _ADF_ABF_pause;
	_ADF_unitNotAlive
};