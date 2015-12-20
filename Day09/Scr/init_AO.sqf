diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

waitUntil {sleep 1; (time > 300) || MotsActive};

// Statics & crews
private ["_g","_p"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInCommander oArti1; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner oArti1; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInCommander oArti2; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner oArti2; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInCommander oArti3; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner oArti3; sleep 0.035;
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_1; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_2; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_3; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_4; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_5; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_6; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_7; sleep 0.035;
(effectiveCommander oArti1) doWatch artiTarget; (effectiveCommander oArti2) doWatch artiTarget; (effectiveCommander oArti3) doWatch artiTarget;
(gunner oArti1) doWatch artiTarget; (gunner oArti2) doWatch artiTarget; (gunner oArti3) doWatch artiTarget;

// Fortify defence
for "_i" from 1 to 5 do {
	private ["_g","_spawnPos"];
	_g = createGroup EAST;	
	private ["_spawnPos"];
	_spawnPos = format ["mEF_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 75, 2, true] call ADF_fnc_defendArea;
};

// EI patrols Airbase 
for "_i" from 1 to 8 do {
	private ["_g","_spawnPos"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 150, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
};

// EI patrols Island
for "_i" from 10 to 15 do {
	private ["_g","_spawnPos","_r"];
	_r = 400 + (random 500);
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, _r, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
};

// CP's
for "_i" from 1 to 2 do {
	private ["_g","_spawnPos"];
	_g = createGroup EAST;	
	_spawnPos = format ["mCP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 50, 2, true] call ADF_fnc_defendArea;
};

// Vehicle patrols Airbase
for "_i" from 1 to 4 do {
	private ["_c","_spawnPos","_vPool","_v"];
	_c = createGroup EAST;
	_vPool = ["O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F"] call BIS_fnc_selectRandom;
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	[_c, getMarkerPos _spawnPos, 750, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

// Vehicle patrols Isand
for "_i" from 10 to 12 do {
	private ["_c","_spawnPos","_vPool","_v"];
	_c = createGroup EAST;
	_vPool = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	[_c, getMarkerPos _spawnPos, 3500, 6, "MOVE", "SAFE", "RED", "LIMITED", 30] call ADF_fnc_vehiclePatrol;
};

//Sea patrol
_c = createGroup EAST;
_v = [getMarkerPos "NP_spawn", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
[_c, getMarkerPos "NP_spawn", 2500, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 50] call ADF_fnc_seaPatrol;

wp_fnc_airVehicle = {private "_airVehicle"; _airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};

// JetSpawn
[] spawn {
	while {!triggerActivated tStratisAB} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [180,480,720,1200,1800] call BIS_fnc_selectRandom;
		_wpx = ["mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_c = createGroup EAST;		
		_v = createVehicle ["O_Plane_CAS_02_F", getMarkerPos "mJetSpawn", [], 0, "NONE"];
		_v setDir (markerDir "mJetSpawn");
		_p = _c createUnit ["O_Pilot_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInDriver _v select 0; sleep 0.035;			
		_wp = _c addWaypoint [getMarkerPos "mEIP_8", 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp = _c addWaypoint [getMarkerPos _wpx, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "FULL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		{deleteVehicle _x} forEach (units _c); deleteGroup _c; deleteVehicle _v;		
		sleep _pause;
	};
};

// Outbound HeliSpawn
[] spawn {
	while {!triggerActivated tStratisAB} do {
		private ["_c","_v","_wp","_pause","_wpx","_heli"];
		_heli = call wp_fnc_airVehicle;
		_pause = [180,480,720,1200,1800] call BIS_fnc_selectRandom;
		_wpx = ["mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_c = createGroup EAST;		
		_v = createVehicle [_heli, getMarkerPos "mHeliSpawn", [], 0, "NONE"];
		_v setDir (markerDir "mHeliSpawn");
		_p = _c createUnit ["O_helipilot_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInDriver _v select 0; sleep 0.035;
		//_p = _c createUnit ["O_helicrew_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner _v select 0; sleep 0.035;
		_wp = _c addWaypoint [getMarkerPos _wpx, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "FULL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		{deleteVehicle _x} forEach (units _c); deleteGroup _c; deleteVehicle _v;
		sleep _pause;
	};
};

// Inbound 1 HeliSpawn
[] spawn {
	while {!triggerActivated tStratisAB} do {
		private ["_c","_v","_wp","_pause","_wpx","_heli"];
		_heli = call wp_fnc_airVehicle;
		_pause = [180,480,720,1200,1800] call BIS_fnc_selectRandom;		
		_c = createGroup EAST;		
		_v = [getMarkerPos "mAirSpawn", 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v1 = _v select 0;
		_wp = _c addWaypoint [getPos mAirLand, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "doStop v1; v1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v1 flyInHeight 0;
		waitUntil {isTouchingGround v1};
		sleep 90;
		if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1; v1 = nil};		
		sleep _pause;
	};
};

// Inbound 2 HeliSpawn
[] spawn {
	while {!triggerActivated tStratisAB} do {
		private ["_c","_v","_wp","_pause","_wpx","_heli"];
		_heli = call wp_fnc_airVehicle;
		_pause = [180,480,720,1200,1800] call BIS_fnc_selectRandom;		
		_c = createGroup EAST;		
		_v = [getMarkerPos "cBase4", 0, _heli, _c] call BIS_fnc_spawnVehicle;	
		v2 = _v select 0;		
		_wp = _c addWaypoint [getPos mAirLand2, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "doStop v2; v2 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v2 flyInHeight 0;
		waitUntil {isTouchingGround v2};
		sleep 90;		
		if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};		
		sleep _pause;
	};
};

// Inbound 1 JetSpawn
[] spawn {
	while {!triggerActivated tStratisAB} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [180,480,720,1200,1800] call BIS_fnc_selectRandom;		
		_c = createGroup EAST;		
		_v = [getMarkerPos "mAirExit3", 0, "O_Plane_CAS_02_F", _c] call BIS_fnc_spawnVehicle;	
		v3 = _v select 0;		
		_wp = _c addWaypoint [getMarkerPos "mEIP_2", 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "doStop v3; v3 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v3 flyInHeight 0;
		waitUntil {isTouchingGround v3};
		sleep 180;		
		if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3); deleteVehicle v3; v3 = nil};		
		sleep _pause;
	};
};

ADF_init_AO = true; publicVariable "ADF_init_AO";
