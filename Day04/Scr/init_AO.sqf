diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

// Naval Patrols
private ["_c","_v","_wp"];
_c = createGroup EAST;
_v = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";

_c = createGroup EAST;
_v = [getMarkerPos "mNP6", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";

// Road patrols
[] spawn {	
	for "_i" from 1 to 4 do {
		private ["_c","_p","_v","_k"];
		_c = createGroup EAST;
		_p = format ["mVP%1",_i];
		_p = getMarkerPos _p;
		_k = ["O_MRAP_02_F", "O_Truck_02_fuel_F", "O_Truck_02_Ammo_F", "O_Truck_02_medical_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F"] call BIS_fnc_selectRandom;
		_v = [_p, random 360, _k, _c] call BIS_fnc_spawnVehicle;
		[_c, getmarkerpos "mVP1", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	};
	sleep 120;
	for "_i" from 1 to 4 do {
		private ["_c","_p","_v","_k"];
		_c = createGroup EAST;
		_p = format ["mVP%1",_i];
		_p = getMarkerPos _p;
		_k = ["O_MRAP_02_F", "O_Truck_02_fuel_F", "O_Truck_02_Ammo_F", "O_Truck_02_medical_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F"] call BIS_fnc_selectRandom;
		_v = [_p, random 360, _k, _c] call BIS_fnc_spawnVehicle;
		[_c, getmarkerpos "mVP1", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	};	
};

// Crew the static positions
private "_p";
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPos mLand_1,[],0,"SERGEANT"]; _p setDir 180; _p moveInGunner oStat_1;
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPos oCP_1,[],0,"Corporal"]; _p setDir 180;
_p = _g createUnit ["O_Soldier_F",getPos oCP_1,[],0,"Soldier"]; _p setDir 90;

// Air Patrols
[] spawn {
	waitUntil {sleep 5; time > 900};
	_c = createGroup EAST; 
	_c setCombatMode "GREEN";
	_v = [getPos mLand_1, 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
	vAP1 = _v select 0; sleep 2;
	_v = [getPos mLand_2, 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
	vAP2 = _v select 0;
	[_c, getMarkerPos "mDef_10", 7500, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_airPatrol;

	private "_delAmmoArray";
	_delAmmoArray = ["38Rnd_80mm_rockets","250Rnd_30mm_HE_shells","250Rnd_30mm_APDS_shells","8Rnd_LG_scalpel"];
	{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
	{vAP2 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
};

wp_fnc_airPos = {private "_airSpawnArray"; _airSpawnArray = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom; _airSpawnArray;};
wp_fnc_airVehicle = {private "_airVehicle"; _airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom; _airVehicle;};
wp_fnc_wait = {private "_wait"; _wait = [600,900,1200] call BIS_fnc_selectRandom; _wait;};
wp_fnc_aptWait = {private "_aptWait"; _aptWait = [300,450,600,900,1200] call BIS_fnc_selectRandom; _aptWait;};

// Inbound HeliSpawn
[] spawn {
	while {true} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_heli = call wp_fnc_airVehicle;
		_aptHold = call wp_fnc_aptWait;
		sleep _pause;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v1 = _v select 0;		
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
		sleep _aptHold;
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
	while {true} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_heli = call wp_fnc_airVehicle;
		_aptHold = call wp_fnc_aptWait;
		sleep _pause;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v2 = _v select 0;		
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
		sleep _aptHold;
		v2 setFuel 1;
		v2 flyInHeight 20 + (random 150);
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};		
	};
};

// Defend groups
for "_i" from 1 to 4 do {
	private ["_g","_spawnpos"];
	_spawnpos = format ["mDef_%1",_i];
	_spawnpos = getMarkerPos _spawnpos;
	_g = [_spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, _spawnpos, 75, 2, true] call ADF_fnc_defendArea;
};

for "_i" from 1 to 2 do {
	private ["_g","_spawnpos"];
	_spawnpos = getMarkerPos "mDef_10";
	_g = [_spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[_g, _spawnpos, 200, 2, true] call ADF_fnc_defendArea;
};