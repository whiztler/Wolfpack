diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

wp_fnc_airPos = {private "_airSpawnArray"; _airSpawnArray = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;_airSpawnArray;};
wp_fnc_wait = {private "_wait"; _wait = [600,900,1200] call BIS_fnc_selectRandom;_wait;};
wp_fnc_aptWait = {private "_aptWait"; _aptWait = [300,450,600,900,1200] call BIS_fnc_selectRandom;_aptWait;};
wp_fnc_airVehicle = {private "_airVehicle"; _airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};

// Inbound HeliSpawn
[] spawn {
	while {true} do {
		private ["_c","_v","_wp","_pause","_exit","_spawn","_aptHold","_wpLand","_heli"];
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
		waitUntil {isTouchingGround v1};
		sleep 2;
		v1 setFuel 0;
		sleep _aptHold;
		v1 setFuel 1;		
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
		private ["_c","_v","_wp","_pause","_exit","_spawn","_aptHold","_wpLand","_heli"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_aptHold = call wp_fnc_aptWait;
		_heli = call wp_fnc_airVehicle;	
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
		waitUntil {isTouchingGround v2};
		sleep 2;
		v2 setFuel 0;
		sleep _aptHold;
		v2 setFuel 1;		
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};		
	};
};

[] spawn {
	while {true} do {
		private ["_c","_v","_wp","_pause","_exit","_spawn","_aptHold","_wpLand","_heli"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_aptHold = call wp_fnc_aptWait;
		_heli = call wp_fnc_airVehicle;	
		sleep _pause;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v3 = _v select 0;		
		_wp = _c addWaypoint [getPos mLand_3, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v3 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v3};
		sleep 2;
		v3 setFuel 0;
		sleep _aptHold;
		v3 setFuel 1;		
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3); deleteVehicle v3; v3 = nil};		
	};
};


[] spawn {
	while {true} do {
		private ["_c","_v","_wp","_pause","_exit","_spawn","_aptHold","_wpLand","_heli"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_aptHold = call wp_fnc_aptWait;
		_heli = call wp_fnc_airVehicle;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v4 = _v select 0;		
		_wp = _c addWaypoint [getPos mLand_4, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v4 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v4};
		sleep 2;
		v4 setFuel 0;
		waitUntil {triggerActivated tPyrgosHarb};
		sleep 10;
		v4 setFuel 1;		
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v4") then {{deleteVehicle _x} forEach (crew v4); deleteVehicle v4; v4 = nil};		
	};
};

[] spawn {
	while {true} do {
		private ["_wait"];
		_wait = [900,1200,1800,2400,3600] call BIS_fnc_selectRandom;
		sleep _wait;
		[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 2;
		[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
	};
};

// Crew the static positions
private ["_g","_p"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"SERGEANT"]; _p setDir 180; _p moveInGunner oStat_1;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"CORPORAL"]; _p setDir 330; _p moveInGunner oStat_2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_3;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_4;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_5;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_6;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_7;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_8; sleep 1;

// Foot patrols
for "_i" from 1 to 8 do {
	private ["_g","_p","_r","_w","_t"];	
	_p = format ["mP%1",_i];
	_t = ["OIA_InfSentry","OI_reconSentry"] call BIS_fnc_selectRandom;;
	_p = getMarkerPos _p;
	_r = (random 225) + (random 225);
	_w = [3,4,5] call BIS_fnc_selectRandom;
	_g = [_p, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> _t)] call BIS_fnc_spawnGroup;
	[_g, _p, _r, _w, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
};

// (Tech) veh patrols
for "_i" from 1 to 4 do {
	private ["_c","_v","_p","_vc"];
	_p = format ["vSpawn%1",_i];
	_p = getMarkerPos _p;
	_vc = ["O_MRAP_02_hmg_F","O_MRAP_02_F","O_Truck_02_transport_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_c = createGroup EAST;
	_v = [_p, 45, _vc, _c] call BIS_fnc_spawnVehicle;
	[_c,_p, 1000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

// Defend groups
for "_i" from 1 to 5 do {
	private ["_g","_spawnPos","_defArr"];
	_spawnPos = format ["mDef%1",_i];
	_spawnPos = getMarkerPos _spawnPos;
	_g = [_spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, _spawnPos, 25, 2, true] call ADF_fnc_defendArea;
};

ADF_spawn_harbor = {
	private ["_g","_spawnPos","_defArr"];
	_spawnPos = getMarkerPos "cBase11";
	_g = [_spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, _spawnPos, 40, 2, true] call ADF_fnc_defendArea;
};

ADF_spawn_base = {
	_spawnPos = getMarkerPos "cBase1";
	
	private "_g";
	_g = [_spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[_g, _spawnPos, 100, 2, true] call ADF_fnc_defendArea;
	
	for "_i" from 1 to 2 do {
		private "_g";	
		_g = [_spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, _spawnPos, 75, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	};
};

ADF_init_AO = true; publicVariable "ADF_init_AO";

// Air Patrols
private ["_c","_v","_delAmmoArray"];
waitUntil {sleep 5; time > 1200};
_c = createGroup EAST; 
_c setCombatMode "GREEN";
_v = [getMarkerPos "mJet1", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
vAP1 = _v select 0;
_v = [getMarkerPos "mJet2", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
vAP2 = _v select 0;
[_c, getMarkerPos "cBase1", 7500, 100, 7, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_airPatrol;

_delAmmoArray = ["38Rnd_80mm_rockets","250Rnd_30mm_HE_shells","250Rnd_30mm_APDS_shells","8Rnd_LG_scalpel"];
{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
{vAP2 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;