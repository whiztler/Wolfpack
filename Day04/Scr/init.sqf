if (ADF_HC_execute || isServer) then {
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
};

if (isServer) then {
	[vWolf_1] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
	[vWolf_2] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
};

rvDone = false;

if (hasInterface) then {
	player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
	player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
	<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
	The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
	<br/><br/>
	"]];

	waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

	sleep 3; // Loadout finished > pri weapon loaded

	while {time < 25} do {	
		if !(isNil "SOR_SSC_1") then {SOR_SSC_1 assignAsCargo vWolf_1; SOR_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsCommander vWolf_1; SOR_RM_1 moveInCommander vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsGunner vWolf_1; SOR_UAV_1 moveInGunner vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsDriver vWolf_1; SOR_RMM_1 moveInDriver vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_1; SOR_RTL_1 moveInCargo vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_1; SOR_RS_2 moveInCargo vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_1; SOR_RS_3 moveInCargo vWolf_1;}; sleep 0.035;
		
		if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCommander vWolf_2; SOR_RS_4 moveInCommander vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsGunner vWolf_2; SOR_DEM_1 moveInGunner vWolf_2;}; sleep 0.035;	
		if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsDriver vWolf_2; SOR_RTL_2 moveInDriver vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_2; SOR_RS_5 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_2; SOR_RS_6 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_2; SOR_RS_7 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_2; SOR_AT_1 moveInCargo vWolf_2;};	
	};
	
	waitUntil {sleep 2; ADF_missionInit}; sleep 5;
	
	private ["_logTime","_logTimeText"];
	hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Mother.</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Rattler.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
	DEVGRU TOC: </font><font color='#9DA698'>Mother</font><br/>
	<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Rattler</font>
	<br/><br/>"]];

	sleep 15;

	private "_cnt";
	_cnt = 0;
	while {(_cnt != 40)} do {
		_cnt = _cnt + 1;
		hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Mother: Rattler, as per the briefing earlier today, please insert at your own accord. Your options are:</t><br/><br/><t color='#6C7169' align='left'>1. RV ALPHA<br/>Rendezvous with </t><t color='#9DA698' align='left'>Dimitri/Nikos</t><t color='#6C7169' align='left'>. They'll have vehicles for you to use for transport. Distance to AO: approx </t><t color='#9DA698' align='left'>7</t><t color='#6C7169' align='left'> km's.</t><br/><br/><t color='#6C7169' align='left'>2. RV HOTEL<br/>Just south of </t><t color='#9DA698' align='left'>Faronaki</t><t color='#6C7169' align='left'>. This RV area is patrolled by CSAT naval forces. Distance to AO: approx </t><t color='#9DA698' align='left'>3</t><t color='#6C7169' align='left'> km's.</t><br/><br/><t color='#6C7169' align='left'>3. RV ZULU<br/>The island of </t><t color='#9DA698' align='left'>Chelonisi</t><t color='#6C7169' align='left'> is considered free of CSAT forces. The bay west of it is patrolled by the CSAT navy. Distance to AO: approx </t><t color='#9DA698' align='left'>950</t><t color='#6C7169' align='left'> meters.<br/></t>		";
		sleep 1;
	};
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Mother: Rattler, as per the briefing earlier today, please insert at your own accord. Your options are:<br/><br/>
	<font color='#6C7169'>1. RV ALPHA<br/>Rendezvous with </font><font color='#9DA698'>Dimitri/Nikos</font><font color='#6C7169'>. They'll have vehicles for you to use for transport. Distance to AO: approx </font><font color='#9DA698'>7</font><font color='#6C7169'> km's.</font><br/><br/>
	<font color='#6C7169'>2. RV HOTEL<br/>Just south of </font><font color='#9DA698'>Faronaki</font><font color='#6C7169'>. This RV area is patrolled by CSAT naval forces. Distance to AO: approx </font><font color='#9DA698'>3</font><font color='#6C7169'> km's.</font><br/><br/>
	<font color='#6C7169'>3. RV ZULU<br/>The island of </font><font color='#9DA698'>Chelonisi</font><font color='#6C7169'> is considered free of CSAT forces. The bay west of it is patrolled by the CSAT navy. Distance to AO: approx </font><font color='#9DA698'>950</font><font color='#6C7169'> meters.</font>
	<br/><br/>"]];
	sleep 50;

	hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Mother: Since you have some time before you reach your RV, I suggest brief your RTL's re your tactical plan/MO.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Mother: Since you have some time before you reach your RV, I suggest brief your RTL's re your tactical plan/MO.</font>
	<br/><br/>"]];
};

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

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

_c = createGroup CIVILIAN;
_v = [[22337.7,4505.5,-112], 0, "C_Boat_Civil_01_police_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "mpol1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mpol2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mpol3", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";	
sleep 0.5;

// Road patrols
[] spawn {
	private ["_c","_v"];
	_c = createGroup EAST; _v = [getMarkerPos "mVP1", 90, "O_Truck_02_transport_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP1", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	_c = createGroup EAST; _v = [getMarkerPos "mVP2", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP2", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	_c = createGroup EAST; _v = [getMarkerPos "mVP3", 90, "O_Truck_02_transport_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP3", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	_c = createGroup EAST; _v = [getMarkerPos "mVP4", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP4", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	sleep 120;
	_c = createGroup EAST; _v = [getMarkerPos "mVP1", 90, "O_Truck_02_medical_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP1", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	_c = createGroup EAST; _v = [getMarkerPos "mVP2", 90, "O_Truck_02_Ammo_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP2", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	_c = createGroup EAST; _v = [getMarkerPos "mVP3", 90, "O_Truck_02_fuel_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP3", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	_c = createGroup EAST; _v = [getMarkerPos "mVP4", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP4", 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;	
};

deleteMarker "mBrief0";

// Crew the static positions
private "_p";
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPos mLand_1,[],0,"SERGEANT"]; _p setDir 180; _p moveInGunner oStat_1;
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPos oCP_1,[],0,"Corporal"]; _p setDir 180;
_p = _g createUnit ["O_Soldier_F",getPos oCP_1,[],0,"Soldier"]; _p setDir 90;

// Air Patrols
_c = createGroup EAST; 
_c setCombatMode "GREEN";
_v = [getPos mLand_1, 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
vAP1 = _v select 0; sleep 2;
_v = [getPos mLand_2, 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
vAP2 = _v select 0;
[_c, getMarkerPos "cBase1", 7500, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_airPatrol;

private "_delAmmoArray";
_delAmmoArray = ["38Rnd_80mm_rockets","250Rnd_30mm_HE_shells","250Rnd_30mm_APDS_shells","8Rnd_LG_scalpel"];
{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
{vAP2 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;


wp_fnc_airPos = {private "_airSpawnArray"; _airSpawnArray = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;_airSpawnArray;};
wp_fnc_airVehicle = {private "_airVehicle"; _airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};
wp_fnc_wait = {private "_wait"; _wait = [600,900,1200] call BIS_fnc_selectRandom;_wait;};
wp_fnc_aptWait = {private "_aptWait"; _aptWait = [300,450,600,900,1200] call BIS_fnc_selectRandom;_aptWait;};

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
