/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Defend area script
Author: Whiztler
Script version: 1.06

Game type: N/A
File: ADF_fnc_defendArea.sqf
****************************************************************
This is a defend/garrison script based on CBA_fnc_taskDefend by Rommel.
The script garrisons units in empty buildings, static weapons and vehicle
turrets.
Units that have not been garrisoned will go on patrol in the assigned
(radius) area.

INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";

Config:
[
	group,				// Group name - Name of the group.
	position,				// Array or Position - E.g. getMarkerPos "Spawn" -or- Position Player
	radius				// Number - Radius from the start position in which a waypoint is created
] call ADF_fnc_defendArea;

Example for scripted groups:
[_grp, _Position, 100] call ADF_fnc_defendArea;
[_grp, getMarkerPos "PatrolMarker", 75] call ADF_fnc_defendArea;

Notes

Lock (all) the vehicle to prevent AI's from populating the turret/static weapon

Note this function requires the ADF_fnc_position.sqf:
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_defendArea.sqf"; // Reporting. Do NOT edit/remove

ADF_fnc_buildingArr = {
	// init	
	params [["_p", [0,0,0], [[]], [3]],["_r",10,[0]]];
	private ["_b","_bp","_be"];	

	// Create the building array
	_b = nearestObjects [_p,["building"],_r];
	if (count _b == 0) exitWith {[]};	
	
	// Check if building can be entered. Then check if the building has garrison positions. If no position available, remove the building from the array
	{
		_x setVariable ["ADF_garrPos",0];
		_be = [_x] call BIS_fnc_isBuildingEnterable;
		_bp = [_x] call BIS_fnc_buildingPositions; 

		if (!_be || (count _bp == 0)) then {_b = _b - [_x]};
		_x setVariable ["ADF_garrPos",count _bp];
		
	} forEach _b;
	
	// return the building array
	_b
};

ADF_fnc_getTurrets = {
	// init
	params [["_p", [0,0,0], [[]], [3]],["_r",10,[0]]];
	private ["_t","_a"];
	_t = [];
	_a = [];	
	
	// Create array of empty static turrets
	{_t append nearestObjects [_p,[_x],_r]} forEach ["TANK","APC","CAR","StaticWeapon"];
	// Remove already populated turrest from the array
	{if ((_x emptyPositions "gunner") > 0 && ((count crew _x) == 0 && (locked _x) != 2)) then {_a append [_x]}} forEach _t;
	
	// return turrets array
	_a
};

ADF_fnc_setGarrison = {
	// init
	params ["_u",["_p", [0,0,0], [[]], [3]],"_b","_gt"];
	
	// Join a new group and move the unit inside the predefined building position
	[_u] joinSilent _gt;
	_u doMove _p;
	sleep 5;
	waitUntil {unitReady _u};	
	//_u setPosATL [_p select 0, _p select 1, ( _p select 2) + .15]; // Direct placement without movement.
	_u disableAI "move";
	_u setUnitPos "UP";
	// Attempt to make the unit face outside 
	_u setDir (([_u, _b] call BIS_fnc_dirTo) - 180);
	doStop _u;
	
	_u setVariable ["ADF_garrSetBuilding",true];
	
	waitUntil {sleep 1; !(unitReady _u)};
	_u enableAI "move";
};

ADF_fnc_setTurretGunner = {
	// init
	params ["_u"];
	
	// Increase gunner skill so they are more responsive to approaching enemies
	_u setSkill ["spotDistance",.7 + (random .3)];
	_u setSkill ["spotTime",.7 + (random .3)];
	_u setSkill ["aimingAccuracy",.5 + (random .5)];
	_u setSkill ["aimingSpeed",.5 + (random .5)];
	_u setCombatMode "YELLOW";

	true
};

ADF_fnc_defendArea = {	
	params ["_g","_p",["_r",10,[0]]];
	private ["_b","_bs","_bp","_t","_u","_uf","_c","_ct","_i","_a","_gt","_ADF_perfDiagStart","_ADF_perfDiagStop"];
	
	// init
	_ADF_perfDiagStart = diag_tickTime;
	if !(local _g) exitWith {}; 
	_p	= [_p] call ADF_fnc_checkPosition;
	_bs	= [_p,_r] call ADF_fnc_buildingArr;
	_t	= [_p,_r] call ADF_fnc_getTurrets;
	
	_g enableAttack false;
	_gt	= createGroup (side _g);
	_u	= units _g;
	_c	= count _u;
	_i	= 0;
	_l	= 0;
	
	// Modified CBA_fnc_taskDefend by Rommel et all
	
	{		
		// init
		_ct	= (count _t) - 1;
		_l = _l + 1;
		
		if ((_ct > -1) && (_x != leader _g)) then {
			[_x] joinSilent _gt;
			_x assignAsGunner (_t select _ct);
			_x moveInGunner (_t select _ct);
			[_x] call ADF_fnc_setTurretGunner;
			_t resize _ct;
			_x setVariable ["ADF_garrSetTurret",true];
			_i = _i + 1;
		} else {
			if (count _bs > 0) then {
				private ["_b","_bp","_p"];
				_b = _bs call BIS_fnc_selectRandom;
				_p = _b getVariable "ADF_garrPos";
				if (isNil "_p") then {_p = 0};	
				
				if (_p > 0) then {
					_bp = floor (random _p);
					_p = _p - 1;
										
					if (_p == 0) then {
						_bs = _bs - [_b];
						_b setVariable ["ADF_garrPos",0];
					} else {
						_b setVariable ["ADF_garrPos",_p];
					};					
									
					[_x,_b buildingPos _bp,_b,_gt] spawn ADF_fnc_setGarrison;				
					_i = _i + 1;
				} else {if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea - No positions found for unit %1 (nr. %2)",_x,_l]}};
			};
		};
	} forEach _u;
	
	{_x setVariable ["ADF_garrPos",nil]} forEach _bs;
	
	// Non garrisoned units patrol the area	
	[_c,_l,_i,_g,_p,_r] spawn {
		params ["_c","_l","_i","_g","_p","_r"];
		waitUntil {_c == _l};
		if (_i < _c) then {
			if (_r < 75) then {_r = 75};
			[_g, _p, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
		};
	};
	
	_ADF_perfDiagStop = diag_tickTime;
	if (ADF_debug) then {diag_log format ["ADF Debug: ADF_fnc_defendArea processed (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart]};
};
