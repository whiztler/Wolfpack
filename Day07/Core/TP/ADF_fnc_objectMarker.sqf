/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Detect Sensor
Author: Whiztler
Script version: 1.02

Game type: N/A
File: ADF_fnc_objectMarker.sqf
****************************************************************

Creates gray boundingbox box markers for editorplaces or scripted
objects. They then appear as map objects.

[objectName] call ADF_fnc_objectMarker

****************************************************************/

if (!isServer) exitWith {};
diag_log "ADF RPT: Init - executing ADF_fnc_objectMarker.sqf"; // Reporting. Do NOT edit/remove

ADF_fnc_objectMarker = {
	// init
	params ["_v"];
	private ["_s","_n","_m","","","",];

	_s = (boundingBox _v) select 1; _s resize 2;
	_n = "mObj" + str (floor(random 999)) + str (floor(random 10));
	_m createMarker [_n, getPosATL _v];
	_m setMarkerShape "RECTANGLE";
	_m setMarkerSize _s;
	_m setMarkerBrush "SolidFull";
	_m setMarkerColor "ColorGrey";
	_m setMarkerDir (getDir _v);
};