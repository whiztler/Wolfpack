/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Detect Sensor
Author: Whiztler
Script version: 1.03

Game type: N/A
File: ADF_fnc_objectMarker.sqf
****************************************************************

Creates gray boundingbox box markers for editorplaces or scripted
objects. They then appear as map objects.

Usage:

_array = ["ClassName","ClassName","ClassName"]; // Array of classnames of objects to mark on the map

[
	_array,				// Array
	"MyMarker"		// Center position (object, marker, trigger, etc)
	,150				// radius from center position
] call ADF_fnc_objectMarker;

****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_objectMarker.sqf"; // Reporting. Do NOT edit/remove
if !(isNil "ADF_fnc_objectMarkerExec") exitWith {};
ADF_fnc_objectMarkerExec = true;

ADF_fnc_objectMarker = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	// init
	params ["_a","_p","_r"];
	private ["_s","_n","_m","_start","_finish"];
	_start = diag_tickTime;
	
	if (ADF_debug) then {diag_log format ["ADF RPT: Debug - ADF_fnc_objectMarker passed position: %1",_p]};
	
	if (typeName _p == "STRING") then {_p = getMarkerPos _p};	
	if (typeName _p == "OBJECT") then {_p = getPosATL _p};
	if (typeName _p == "ARRAY") then {_p = _p};
	if (typeName _p == "GROUP") then {_p = getPosATL (leader _p)};
	
	_q = nearestObjects [_p,_a,_r];
	
	{
		_s = (boundingBoxReal _x) select 1; _s resize 2;
		_n = "mObj" + str (floor(random 999)) + str (floor(random 10));
		_m = createMarker [_n, (getPosATL _x)];
		_m setMarkerShape "RECTANGLE";
		_m setMarkerSize _s;
		_m setMarkerBrush "SolidFull";
		_m setMarkerColor "ColorGrey";
		_m setMarkerDir (getDir _x);
	} forEach _q;
	
	_finish = diag_tickTime;
	if (ADF_debug) then {diag_log format ["ADF RPT: Debug - ADF_fnc_objectMarker diag: %1 seconds",_finish - _start];};
};

ADF_fnc_reMarker = {
	if (!ADF_HC_execute || !isServer) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	params ["_a"];
	
	// Store marker data
	_mn = _a;
	_mp = getMarkerPos _a;
	_mt = getMarkerType _a;
	_mc = getMarkerColor _a;
	_my	= markerShape _a;
	_md = markerDir _a;
	_ms = getMarkerSize _a;
	_mx = markerText _a;	
	_ma = markerAlpha _a;
	_mb = markerBrush _a;
	
	// Delete the marker
	deleteMarker _a;
	
	// re-create the marker on top of the object markers
	_m = createMarker [_mn,_mp];
	_m setMarkerType _mt;
	_m setMarkerColor _mc;
	_m setMarkerShape _my;
	_m setMarkerDir _md;
	_m setMarkerSize _ms;
	_m setMarkerText _mx;
	_m setMarkerAlpha _ma;
	_m setMarkerBrush _mb;
};