diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

wp_fnc_airPos = {private "_airSpawnArray"; _airSpawnArray = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;_airSpawnArray;};
wp_fnc_airVehicle = {private "_airVehicle"; _airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};
wp_fnc_wait = {private "_wait"; _wait = [180,480,720,1200,1800] call BIS_fnc_selectRandom;_wait;};
wp_fnc_aptWait = {private "_aptWait"; _aptWait = [180,360,600,900,1200] call BIS_fnc_selectRandom;_aptWait;};

// Inbound HeliSpawn
[] spawn {
	while {!triggerActivated tAirport} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_heli = call wp_fnc_airVehicle;
		_aptHold = call wp_fnc_aptWait;
		sleep _pause;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v1 = _v select 0; if (ADF_isHC) then {publicVariableServer "v1"};
		_wp = _c addWaypoint [getPos mLand_1, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v1 flyInHeight 0;
		waitUntil {isTouchingGround v1};
		sleep 2;
		v1 setFuel 0;
		for "_i" from 1 to _aptHold do {sleep 1; if (triggerActivated tAirport) exitWith {};};
		v1 setFuel 1;
		v1 flyInHeight 20 + (random 150);
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1; v1 = nil};		
	};
};

[] spawn {
	while {!triggerActivated tAirport} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_heli = call wp_fnc_airVehicle;
		_aptHold = call wp_fnc_aptWait;
		sleep _pause;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v2 = _v select 0; v3 = _v select 0; if (ADF_isHC) then {publicVariableServer "v2"};	
		_wp = _c addWaypoint [getPos mLand_2, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v2 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v2 flyInHeight 0;
		waitUntil {isTouchingGround v2};
		sleep 2;
		v2 setFuel 0;
		for "_i" from 1 to _aptHold do {sleep 1; if (triggerActivated tAirport) exitWith {};};
		v2 setFuel 1;
		v1 flyInHeight 20 + (random 150);
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};		
	};
};

[] spawn {
	while {!triggerActivated tAirport} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_heli = call wp_fnc_airVehicle;
		_aptHold = call wp_fnc_aptWait;
		sleep _pause;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v3 = _v select 0; if (ADF_isHC) then {publicVariableServer "v3"};	
		_wp = _c addWaypoint [getPos mLand_3, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v3 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v3 flyInHeight 0;
		waitUntil {isTouchingGround v3};
		sleep 2;
		v3 setFuel 0;
		for "_i" from 1 to _aptHold do {sleep 1; if (triggerActivated tAirport) exitWith {};};
		v3 setFuel 1;
		v3 flyInHeight 20 + (random 150);
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3); deleteVehicle v3; v3 = nil};		
	};
};

[] spawn {
	while {!triggerActivated tAirport} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_heli = call wp_fnc_airVehicle;
		_aptHold = call wp_fnc_aptWait;
		sleep _pause;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v4 = _v select 0; if (ADF_isHC) then {publicVariableServer "v4"};
		_wp = _c addWaypoint [getPos mLand_4, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v4 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v4 flyInHeight 0;
		waitUntil {isTouchingGround v4};
		sleep 2;
		v4 setFuel 0;
		for "_i" from 1 to _aptHold do {sleep 1; if (triggerActivated tAirport) exitWith {};};
		v4 setFuel 1;
		v4 flyInHeight 20 + (random 150);
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v4") then {{deleteVehicle _x} forEach (crew v4); deleteVehicle v4; v4 = nil};		
	};
};

waitUntil {sleep 1; vWolf_takeOff};

private ["_g","_c","_v","_wp","_wpc"];
// Foot patrols
_g = [getMarkerPos "kp1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "kp1", 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;

_g = [getMarkerPos "mDef_20", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "kp1", 800, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;

// Defend Group
_g = [getMarkerPos "mDef_20", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mDef_20", 50, 2, true] call ADF_fnc_defendArea;

// Tech veh patrols
_c = createGroup EAST;
_v = [getMarkerPos "v1a", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle; v10 = _v select 0; 
if (ADF_isHC) then {publicVariableServer "v10"};
_wp = _c addWaypoint [getMarkerPos "v1b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v1b", 1000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "v2a", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle; v11 = _v select 0;
if (ADF_isHC) then {publicVariableServer "v11"};
_wp = _c addWaypoint [getMarkerPos "v2b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v2b", 1500, 6, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "v3a", 90, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle; v12 = _v select 0;
if (ADF_isHC) then {publicVariableServer "v12"};
_wp = _c addWaypoint [getMarkerPos "v3b", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getmarkerpos "v3b", 1200, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

_c = createGroup EAST;
_v = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNAP = _v select 0; if (ADF_isHC) then {publicVariableServer "vNAP"};
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wpc = _c addWaypoint [getMarkerPos "mNP5", 0]; _wpc setWaypointType "CYCLE"; _wpc setWaypointBehaviour "SAFE"; _wpc setWaypointSpeed "NORMAL";
_wpc setWaypointStatements ["true", "if (ADF_endMission && isServer) then {vNAP setDamage 1;};"];

// Foot patrols
private "_g";
_g = [getMarkerPos "kp1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "kp1", 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ap1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap1", 700, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ap2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap2", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ap3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ap3", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;

_g = [getMarkerPos "cApt_2_1_1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "cApt_2_1_1", 100, 3, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;

// Sentries
private ["_g","_p"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL hmg1,[],0,"SERGEANT"]; _p setDir 60; _p moveInGunner hmg1;
_p = _g createUnit ["O_Soldier_F",getPosASL gmg1,[],0,"CORPORAL"]; _p setDir 330; _p moveInGunner gmg1;

// CP's
for "_i" from 1 to 12 do {
	private ["_g","_spawnpos"];
	_spawnpos = format ["mDef_%1",_i];
	_spawnpos = getMarkerPos _spawnpos;
	_g = [_spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, _spawnpos, 15, 2, true] call ADF_fnc_defendArea;
};

// Device sentry
private "_g";
_g = [getMarkerPos "mDeviceSentry", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "UInfantry" >> "OIA_GuardSentry")] call BIS_fnc_spawnGroup;

ADF_init_AO = true; publicVariable "ADF_init_AO";