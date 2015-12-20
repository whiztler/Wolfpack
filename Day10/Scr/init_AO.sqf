diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

[getMarkerPos "mNP_1", getMarkerPos "mNP_1", east, 1, false, 1500, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 15] call ADF_fnc_createSeaPatrol;

// EI patrols Country
for "_i" from 1 to 6 do {
	private ["_spawnPos","_g"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 750, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};

// EI patrols Cities
for "_i" from 10 to 17 do {
	private ["_spawnPos","_g"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};

if (ADF_debug) then {[{systemChat "EI patrols spawned"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;};

// Vehicle patrols
for "_i" from 1 to 5 do {
	private ["_spawnPos","_c","_vPool","_v"];
	_c = createGroup east;
	_vPool = ["O_Truck_02_covered_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F","O_Truck_02_medical_F","O_Truck_03_medical_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	[_c, getMarkerPos _spawnPos, 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

for "_i" from 10 to 15 do {
	private ["_spawnPos","_c","_vPool","_v"];
	_c = createGroup east;
	_vPool = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"] call BIS_fnc_selectRandom;
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	(_v select 0) allowDamage false;
	[_c, getMarkerPos _spawnPos, 1200, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

// CP'2
for "_i" from 1 to 7 do {
	private ["_spawnPos","_g"];
	_g = createGroup east;	
	_spawnPos = format ["mCP_%1",_i];
	_g = [getMarkerPos _spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 50, 2, true] call ADF_fnc_defendArea;
};

// Static
private ["_g","_p"];
_g = CreateGroup east; 
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"SERGEANT"]; _p moveInGunner oStat_1;
if (ADF_isHC) then {
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"CORPORAL"]; _p moveInGunner oStat_2;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_3;
};
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_4;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_5;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_6;
if (ADF_isHC) then {
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_7;
};
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_8;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_9;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_10;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_11;
if (ADF_isHC) then {
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_12;
};
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oAA_1;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oAA_2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oAA_3;

// HQ's
for "_i" from 1 to 5 do {
	private ["_spawnPos","_g"];
	_g = createGroup east;	
	_spawnPos = format ["csatHQ_%1",_i];
	_g = [getMarkerPos _spawnPos, east, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 25, 2, true] call ADF_fnc_defendArea;
};

// Inbound 1 HeliSpawn
[] spawn {
	while {!triggerActivated tExfil} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [600,900,1200,1800] call BIS_fnc_selectRandom;
		_c = createGroup east;		
		_v = [getMarkerPos "mAirSpawn", 0, "O_Heli_Light_02_F", _c] call BIS_fnc_spawnVehicle;
		v1 = _v select 0;
		_wp = _c addWaypoint [getPos mAirLand, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "doStop v1; v1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v1 flyInHeight 0;
		waitUntil {isTouchingGround v1};
		v1 setFuel 0;
		sleep 90;
		if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1; v1 = nil};		
		sleep _pause;
	};
};

// Inbound 2 HeliSpawn
[] spawn {
	while {!triggerActivated tExfil} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [600,900,1200,1800] call BIS_fnc_selectRandom;
		_heli = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;
		_c = createGroup east;		
		_v = [getMarkerPos "mAirSpawn2",0,_heli,_c] call BIS_fnc_spawnVehicle;
		v2 = _v select 0;
		_wp = _c addWaypoint [getPos mAirLand2, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "doStop v2; v2 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v2 flyInHeight 0;
		waitUntil {isTouchingGround v2};
		v2 setFuel 0;
		sleep 90;
		if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};		
		sleep _pause;
	};
};

ADF_init_AO = true; publicVariable "ADF_init_AO";