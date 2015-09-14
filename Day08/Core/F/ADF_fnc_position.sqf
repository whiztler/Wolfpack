/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Position functions
Author: Whiztler
Script version: 1.06

Game type: N/A
File: ADF_fnc_position.sqf
***************************************************************/

// Functions init
diag_log "ADF RPT: Init - executing ADF_fnc_position.sqf"; // Reporting. Do NOT edit/remove
if !(isNil "ADF_fnc_positionExec") exitWith {};
ADF_fnc_positionExec = true;


/***************************************************************
Name: ADF_fnc_checkPosition

Parameters required:
0. marker / object / vehicle / group

Optional parameters:
n/a

Returns:
Array (position x,y,z)
***************************************************************/

ADF_fnc_checkPosition = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	params ["_p"];
	private ["_return"];
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_checkPosition - pre-check position: %1",_p]};
	if (typeName _p == "STRING") exitWith {getMarkerPos _p};		// Marker			
	if (typeName _p == "OBJECT") exitWith {getPosATL _p};			// object / vehicle / etc/
	if (typeName _p == "ARRAY") exitWith {_p};						// Position array
	if (typeName _p == "GROUP") exitWith {getPosATL (leader _p)};	// group - returns the position of the current group leader
	_p // None of the above, return the passed position
};


/***************************************************************
Name: ADF_fnc_randomPos

Parameters required:
0. center position
1. radius in meters
2. direction

Optional parameters:
n/a

Returns:
Array (position x,y,z)
***************************************************************/

ADF_fnc_randomPos = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	// Init
	params ["_p","_r","_d"];
	private ["_pX","_pY"];
	if (typeName _p != "ARRAY") then {_p = _p call ADF_fnc_checkPosition};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_randomPos - pre-position: %1",_p]};
	
	// Create random position from centre & radius
	_pX = (_p select 0) + (_r * sin _d);
	_pY = (_p select 1) + (_r * cos _d);
	
	// Return position
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_randomPos - post-position: [%1,%2,0]",_pX, _pY]};
	[_pX, _pY, 0]
};


/***************************************************************
Name: ADF_fnc_roadPos

Parameters required:
0. center position to search from
1. radius in meters

Optional parameters:
n/a

Returns:
Array (position x,y,z)
***************************************************************/

ADF_fnc_roadPos = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	// Init
	params ["_p","_r"];
	private ["_rd","_c","_return","_rd"];
	
	if (typeName _p != "ARRAY") then {_p = _p call ADF_fnc_checkPosition};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_roadPos - pre-position: %1",_p]};
	
	// Check nearby raods from passed position
	_rd		= _p nearRoads _r;
	_c		= count _rd;
	_return	= [];

	// if road position found, use it else use original position
	if (_c > 0) then {_return = getPos (_rd select 0);} else {_return = _p};
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_roadPos - post-position: %1",_return]};
	
	// return the position
	_return
};


/***************************************************************
Name: ADF_fnc_randomPosInArea

return a position in a predefined area (e.g. marker, trigger)
Works on circular triggers/markers only. With uneven shapes,
units might spawn out of area. Fix = wip

Parameters required:
0. center position to search from (marker or trigger)

Returns:
Array (position x,y,z)
***************************************************************/

ADF_fnc_randomPosInArea = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	params ["_t"];
	private ["_p","_m","_s","_r","_d","_return"];
	
	_p 		= _t;
	_m 		= if (typeName _t == "STRING") then {true} else {false};
	_s		= if (_m) then {getMarkerSize _t} else {triggerArea _t};
	_s		= if ((_s select 0) != (_s select 1)) then {((_s select 0) + (_s select 1)) / 2} else {_s select 0};
	_r		= if (_s > 0) then {_s / 2} else {0};
	_d		= random 360;

	_return = if (_r > 0) then {[_p,_r,_d] call ADF_fnc_randomPos} else {_p};
	_return
};