[] spawn {
	sleep 180;
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Uncle: listen up Viper, we just got word from Nikos. He thinks that 'Ice Tiger's' location is somewhere in the following grid:</font><br/><br/>
	<font color='#9DA698' align='center' size='16'>031223 - 091231</font><br/>
	<font color='#9DA698' align='center' size='16'>042184 - 100164</font><br/><br/>
	<font color='#6C7169'>The 7 x 7 Km area covers the north western tip of Altis to </font>
	<font color='#9DA698'>Krya Nera </font>
	<font color='#6C7169'>and all the way down to </font>
	<font color='#9DA698'>Negades </font>
	<font color='#6C7169'>and just north of </font>	
	<font color='#9DA698'>Agios Dionysios.</font><br/><br/>	
	<font color='#6C7169'>Good hunting Viper!</font>
	<br/><br/>"]];	
	for "_i" from 1 to 20 do {
		hintSilent parseText"
			<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
			<t color='#6C7169' align='left'>Uncle: listen up Viper, we just got word from Nikos. He thinks that 'Ice Tiger's' location is somewhere in the following grid:</t><br/><br/>
			<t color='#9DA698' align='center' size='1.3'>031223 - 091231</t><br/>
			<t color='#9DA698' align='center' size='1.3'>042184 - 100164</t><br/><br/>
			<t color='#6C7169' align='left'>The 7 x 7 Km area covers the north western tip of Altis to </t>
			<t color='#9DA698' align='left'>Krya Nera </t>
			<t color='#6C7169' align='left'>and all the way down to </t>
			<t color='#9DA698' align='left'>Negades </t>
			<t color='#6C7169' align='left'>and just north of </t>	
			<t color='#9DA698' align='left'>Agios Dionysios.</t><br/><br/>	
			<t color='#6C7169' align='left'>Good hunting Viper!<br/></t>
		";
		sleep 1;
	};
};


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
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mEIP_12",[],0,"PRIVATE"]; _p moveInGunner oAA_1; sleep 2;

if (ADF_debug) then {hint "Static crews spawned";};

// ICE Tiger patrols
for "_i" from 1 to 3 do {
	_g = [getMarkerPos iceTigerLoc, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos iceTigerLoc, 250, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
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
wp_fnc_airPos = {_airSpawnArray = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;_airSpawnArray;};
wp_fnc_airVehicle = {_airVehicle = ["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};
wp_fnc_wait = {_wait = [180,480,720,1200,1800] call BIS_fnc_selectRandom;_wait;};
wp_fnc_aptWait = {_aptWait = [180,360,600,900,1200] call BIS_fnc_selectRandom;_aptWait;};

// Inbound HeliSpawn
[] spawn {
	while {true} do {
		private ["_c","_v","_wp","_pause","_exit","_heli","_spawn","_aptHold"];
		_spawn = call wp_fnc_airPos;
		_exit = call wp_fnc_airPos;
		_pause = call wp_fnc_wait;
		_heli = call wp_fnc_airVehicle;
		_aptHold = call wp_fnc_aptWait;		
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
		sleep _pause;
	};
};

if (ADF_debug) then {hint "Air patrols spawned";};

// Ambient flyby's	
[getMarkerPos "mAF1", getMarkerPos "mAFx", 20, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;
[getMarkerPos "mAF2", getMarkerPos "mAFx", 15, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;
[getMarkerPos "mAF3", getMarkerPos "mAFx", 30, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;

// Debug
if (ADF_debug) then {[EAST,"OFF"] call ADF_fnc_debugMarkers;}; // Side, Labels "ON"/"OFF"