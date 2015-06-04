/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Detection Sensor
Author: Whiztler
Script version: 1.1

Game type: n/a
File: ADF_DetectSensor.sqf
****************************************************************
Instructions:

Place a trigger:
Name: Give the trigger a unique name
Axis A,B: whatever size you want. The is the catchment area'
Activation: Blufor, once, detected by Opfor
MIN/MID/MAX: 5/7/10
Condition: this
On Activation: 0 = [thisTrigger,EAST,500] execVM "Core\ADF_DetectSensor.sqf";
****************************************************************/

if (ADF_debug) then {["TRIGGER - DetectSensor Activated",false] call ADF_fnc_log};

if (!isServer) exitwith {};

private ["_ADF_trig","_ADF_side","_ADF_list","_ADF_rad"];

_ADF_trig = _this select 0;
_ADF_side = _this select 1;
_ADF_rad = _this select 2;
_ADF_list = (getPos _ADF_trig) nearEntities [["Man"], _ADF_rad];

{
	if ((side _x == _ADF_side) && (_x in _ADF_list)) then {
		_x setbehaviour "COMBAT"; 
		_x setcombatmode "RED";
		_x setskill 0.75;	
	};
} forEach allUnits;