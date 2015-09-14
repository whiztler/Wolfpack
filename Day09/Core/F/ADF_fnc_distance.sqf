/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Distance functions
Author: Whiztler
Script version: 1.00

Game type: N/A
File: ADF_fnc_distance.sqf
***************************************************************/

// Functions init
diag_log "ADF RPT: Init - executing ADF_fnc_distance.sqf"; // Reporting. Do NOT edit/remove
if !(isNil "ADF_fnc_distanceExec") exitWith {};
ADF_fnc_distanceExec = true;
// These functions require the ADF_fnc_position.sqf to be loaded. Check if already loaded
if (isNil "ADF_fnc_positionExec") then {call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf"};


/***************************************************************
Name: ADF_fnc_checkDistance

Parameters required:
a. marker / object / vehicle / group
1. marker / object / vehicle / group

Optional parameters:
n/a

Returns:
Integer (distance number)
***************************************************************/

ADF_fnc_checkDistance = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	params ["_a","_b"];
	private ["_return","_pos_a","_pos_b"];
	_pos_a	= _a call ADF_fnc_checkPosition; // get the position of the first param
	_pos_b	= _b call ADF_fnc_checkPosition; // get the position of the second param
	_return	= round (_pos_a distance2D _pos_b); // return the distance between the first and the second param
	_return
};


/***************************************************************
Name: ADF_fnc_checkClosest

Parameters required:
a. array (e.g. AllPlayers, allUnits, etc)
1. marker / object / vehicle / group (to check against)

Optional parameters:
2. radius (number)

Returns:
Integer (distance number)
***************************************************************/

ADF_fnc_checkClosest = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	params ["_a","_b",["_r",10^5,[0]]];	
	private ["_return"];
	_return = _r + 1;
	{
		_return = [_x, _b] call ADF_fnc_checkDistance;
		if (ADF_Debug) then {diag_log format ["ADF RPT: Debug - ADF_fnc_checkClosest: distance to %1: %2 meters",_b,_return]};
		if (_return < _r) then {_r = _return};
	} forEach _a;
	_return	
};

