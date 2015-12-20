diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

waitUntil {sleep 1; !isNil "iceTigerLoc"};

private ["_g","_c","_p"];

// EI patrols
for "_i" from 1 to 15 do {
	private ["_spawnPos","_g"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 1200, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	sleep 5;
};

_g = [getMarkerPos "mAbdera", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mAbdera", 150, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;

// Vehicle patrols
for "_i" from 1 to 10 do {
	private ["_c","_vPool","_spawnPos","_v"];
	_c = createGroup EAST;
	_vPool = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F","O_Truck_02_medical_F","O_Truck_03_medical_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	[_c, getMarkerPos _spawnPos, 3500, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

// Static
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"SERGEANT"]; _p moveInGunner oStat_1;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"CORPORAL"]; _p moveInGunner oStat_2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_3;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_4;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_5;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInCommander oStat_6;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_7;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_8;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_9;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_10;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_11;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_12;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_13;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oAA_1;

// CP'2
for "_i" from 1 to 5 do {
	private ["_spawnPos","_g"];
	_g = createGroup EAST;	
	_spawnPos = format ["mCP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 50, 2, true] call ADF_fnc_defendArea;
};

// ICE Tiger patrols
for "_i" from 1 to 3 do {
	private "_g";
	_g = [getMarkerPos iceTigerLoc, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos iceTigerLoc, 250, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
};

// ICE Tiger crews
_g = CreateGroup EAST; 
_p = _g createUnit ["O_crew_F",getPos obj_1,[],0,"SERGEANT"];
_p = _g createUnit ["O_crew_F",getPos obj_1,[],0,"CORPORAL"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_crew_F",getPos obj_3,[],0,"SERGEANT"];
_p = _g createUnit ["O_crew_F",getPos obj_3,[],0,"CORPORAL"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_crew_F",getPos obj_5,[],0,"SERGEANT"];
_p = _g createUnit ["O_crew_F",getPos obj_5,[],0,"CORPORAL"];

// Air patrols
[] spawn {
	while {true} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;
		_exit = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;
		if (_spawn isEqualTo _exit) then {_exit = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;};
		_pause = [180,1800] call BIS_fnc_randomNum;
		_heli = ["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;
		_aptHold = [180,1200] call BIS_fnc_randomNum;
		_c = createGroup EAST;		
		_v = [getMarkerPos _spawn, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v1 = _v select 0;
		v1 flyInHeight 100;		
		_wp = _c addWaypoint [getPos mLand, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		v1 flyInHeight 0;
		waitUntil {isTouchingGround v1};
		v1 setFuel 0;
		sleep _aptHold;
		v1 setFuel 1;
		v1 flyInHeight 70;
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1; v1 = nil};		
		sleep _pause;
	};
};

ADF_init_AO = true; publicVariable "ADF_init_AO";