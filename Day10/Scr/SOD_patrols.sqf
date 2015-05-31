if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

// EI patrols
for "_i" from 1 to 15 do {
	private ["_spawnPos"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 1200, 6, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	sleep 5;
};

_g = [getMarkerPos "mAbdera", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mAbdera", 150, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;

if (ADF_debug) then {hint "EI patrols spawned";};

// Vehicle patrols
selectVehPool = {
	_vPoolArray = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F","O_Truck_02_medical_F","O_Truck_03_medical_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_vPoolArray;
};

for "_i" from 1 to 10 do {
	_c = createGroup EAST;
	_vPool = call selectVehPool;
	private ["_spawnPos"];
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	[_c, getMarkerPos _spawnPos, 3500, 8, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
	sleep 5;
};

if (ADF_debug) then {hint "Vehicle patrols spawned";};

// CP'2
for "_i" from 1 to 5 do {
	_g = createGroup EAST;	
	private ["_spawnPos"];
	_spawnPos = format ["mCP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 50, 2, true] call CBA_fnc_taskDefend;
	sleep 3;
};

if (ADF_debug) then {hint "CP's spawned";};

// Static
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"SERGEANT"]; _p moveInGunner oStat_1; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"CORPORAL"]; _p moveInGunner oStat_2; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_3; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_4; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_5; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInCommander oStat_6; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_7; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_8; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_9; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_10; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_11; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_12; sleep 2;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oStat_13; sleep 2;

if (ADF_debug) then {hint "Static crews spawned";};

// ICE Tiger patrols
for "_i" from 1 to 3 do {
	_g = [getPos OFOB_spawn, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getPos OFOB_spawn, 250, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	sleep 3;
};

if (ADF_debug) then {hint "ICE Tiger patrols spawned";};

// ICE Tiger crews
_g = CreateGroup EAST; 
_p = _g createUnit ["O_crew_F",getPos obj_1,[],0,"SERGEANT"]; sleep 0.035;
_p = _g createUnit ["O_crew_F",getPos obj_1,[],0,"CORPORAL"]; sleep 2;
_g = CreateGroup EAST; 
_p = _g createUnit ["O_crew_F",getPos obj_3,[],0,"SERGEANT"]; sleep 0.035;
_p = _g createUnit ["O_crew_F",getPos obj_3,[],0,"CORPORAL"]; sleep 2;
_g = CreateGroup EAST; 
_p = _g createUnit ["O_crew_F",getPos obj_5,[],0,"SERGEANT"]; sleep 0.035;
_p = _g createUnit ["O_crew_F",getPos obj_5,[],0,"CORPORAL"]; sleep 2;

if (ADF_debug) then {hint "ICE Tiger crews spawned";};

// Air patrols

[] spawn {
	_c = createGroup EAST; 
	_v = [getMarkerPos "mKavala", 0, "O_Heli_Light_02_unarmed_F", _c] call BIS_fnc_spawnVehicle;
	vAP1 = _v select 0;
	_c setCombatMode "GREEN";
	_wp = _c addWaypoint [getMarkerPos "mEIP_1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
	_wpL = _c addWaypoint [getMarkerPos "mAbdera", 0]; _wpL setWaypointType "MOVE"; _wpL setWaypointBehaviour "SAFE"; _wpL setWaypointSpeed "NORMAL";
	_wpL setWaypointStatements ["true", "vAP1 land 'LAND';"];	
	waitUntil {(currentWaypoint (_wpL select 0)) > (_wpL select 1)};
	waitUntil {isTouchingGround vAP1};
	vAP1 setFuel 1;
	_wp = _c addWaypoint [getMarkerPos "cApt", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
	_wp = _c addWaypoint [getMarkerPos "cApt_2", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";	
};

if (ADF_debug) then {hint "Air patrols spawned";};

// Ambient flyby's	
[getMarkerPos "mAF1", getMarkerPos "mAFx", 20, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;
[getMarkerPos "mAF2", getMarkerPos "mAFx", 15, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;
[getMarkerPos "mAF3", getMarkerPos "mAFx", 30, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;

// Debug
if (ADF_debug) then {[EAST] call ADF_fnc_debugMarkers;};