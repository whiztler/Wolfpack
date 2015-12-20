/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Detect Sensor
Author: Whiztler
Script version: 1.04

Game type: N/A
File: ADF_fnc_sensor.sqf
****************************************************************
This is an alternative for triggers for conditions that do NOT need
to be checked every frame.

INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_sensor.sqf";

The function checks distance players to an object/marker/vehicle. 
You'll need to define the array of units/players/vehicles it needs to
check against.

for instance to check against all players:
_checkArr = allPlayers;

Execute the function with below script:

[
	_checkArr, 	// (player) array to check against. E.g. _checkArr = allPlayers;
	obj, 		// object/vehicle/marker to check distance to players
	10, 		// radius
	5, 			// How often (in seconds) should the function check the condition
	true, 		// true = persistent sensor, false = non-persistent
	"myCode" 	// Code to run (spawned) when the condition is true. E.g. myCode = {hint "The sensor is active";};
] spawn ADF_fnc_sensor;

Mycode represents the code that is executed when players/vehicles get within the sensor radius.

Note this function requires the ADF_fnc_position.sqf and ADF_fnc_distance.sqf to be loaded:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";

****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_sensor.sqf"; // Reporting. Do NOT edit/remove

ADF_fnc_sensor = {
	// Init
	params ["_a","_b","_r","_s","_p","_cIN","_cOUT"];
	private ["_codeIn","_codeOut","_codeOutExec"];
	_codeOutExec = false;
	_codeIn 		= call compile format ["%1",_cIN];
	_codeOut		= if (_cOUT != "") then {_codeOutExec = true; call compile format ["%1",_cOUT]};
	
	// Check distance loop
	waitUntil {
		_check = [_a, _b, _r] call ADF_fnc_checkClosest;
		_exit = false;	
		
		if (_check < _r) then {		
			[] spawn _codeIn;			
			if !(_p) then {
				_exit = true; _s = 0;
			} else {
				waitUntil {
					sleep _s;
					_check = [_a, _b, _r] call ADF_fnc_checkClosest;
					_check > _r
				};
				if (_codeOutExec) then {[] spawn _codeOut};
			};			
		};		
		
		sleep _s;
		_exit
	};
	if (ADF_Debug) then {diag_log format ["ADF RPT: Debug - ADF_fnc_checkClosest: sensor %1 deactivated",_b]};
};

/******************* EXAMPLE *******************

ADF_debug = true;
_checkArr = allPlayers;

[
	_checkArr, 	// (player) array to check against. E.g. _checkArr = allPlayers;
	myObject,		// object/vehicle/marker to check distance to players. Name the object in the editor or script. 
	500, 		// radius (same as the trigger size. Only circular!)
	5, 			// How often (in seconds) should the function check the condition?
	true, 		// true = persistent sensor, false = non-persistent
	"myCode1", 	// Code to run (spawned) when the condition is true. E.g. myCode = {hint "The sensor is active";};
	"myCode2" 	// Code to run (spawned) when the condition is false (deactivation). E.g. myCode2 = {hint "The sensor is deactivated";};
				// With non-persistent use ""
] spawn ADF_fnc_sensor;

myCode1 = {systemChat "The sensor is active";};
myCode2 = {systemChat "The sensor is deactivated";};

************************************************/