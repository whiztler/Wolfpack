if (ADF_HC_execute || isServer) then {
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
};

objDone		= false;
MotsActive	= false;

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
		if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsDriver vWolf_1; SOR_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
		if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

		if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_2; SOR_RTL_1 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsDriver vWolf_2; SOR_RS_2 moveInDriver vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_2; SOR_RS_3 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;
		
		if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_3; SOR_RTL_2 moveInCargo vWolf_3;}; sleep 0.035;
		if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsDriver vWolf_3; SOR_RS_5 moveInDriver vWolf_3;}; sleep 0.035;
		if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_3; SOR_RS_6 moveInCargo vWolf_3;}; sleep 0.035;
		if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_3; SOR_RS_7 moveInCargo vWolf_3;}; sleep 0.035;
		if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_3; SOR_AT_1 moveInCargo vWolf_3;};
	};
	
	waitUntil {sleep 2; ADF_missionInit}; sleep 5;
	
	hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Eagle Eye.</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Cowboy.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
	DEVGRU TOC: </font><font color='#9DA698'>Eagle Eye</font><br/>
	<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Cowboy</font>
	<br/><br/>"]];
	sleep 30;

	hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: Cowboy, our locals on the ground have supplied us with a small support cache north east of Stratis. You'll find diving equipment and all the support gear you need to fulfil the mission.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: Cowboy, our locals on the ground have supplied us with a small support cache north east of Stratis. You'll find diving equipment and all the support gear you need to fulfil the mission.</font>
	<br/><br/>"]];

	if (!MotsActive) then {sleep 120} else {sleep 10};

	hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: First tasking order: move to the Depot at Agia Marina and wait for further instructions.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: First tasking order: move to the Depot at Agia Marina and wait for further instructions.</font>
	<br/><br/>"]];
};

if (isServer) then {
	[wolfCrate] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
	[wolfCrateDemo] execVM "Core\C\ADF_cCargo_B_Demo.sqf";
	[wolfCrateWet_1] execVM "Core\C\ADF_cCargo_B_WetGear.sqf";
	[wolfCrateWet_2] execVM "Core\C\ADF_cCargo_B_WetGear.sqf";

	[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 50, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
	[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 70, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
	
	[] spawn {sleep 120; deleteMarker "mBrief0";};
};

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server
waitUntil {sleep 1; time > 300};

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
	[_g, getMarkerPos _spawnPos, 150, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};

// EI patrols Island
for "_i" from 10 to 15 do {
	private ["_g","_spawnPos"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 150, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
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
selectVehPoolAB = {
	private "_vPoolArray";
	_vPoolArray = ["O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F"] call BIS_fnc_selectRandom;
	_vPoolArray;
};

for "_i" from 1 to 4 do {
	private ["_c","_spawnPos","_vPool","_v"];
	_c = createGroup EAST;
	_vPool = call selectVehPoolAB;
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	[_c, getMarkerPos _spawnPos, 750, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

// Vehicle patrols Isand
selectVehPoolISL = {
	private "_vPoolArray";
	_vPoolArray = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_vPoolArray;
};

for "_i" from 10 to 12 do {
	private ["_c","_spawnPos","_vPool","_v"];
	_c = createGroup EAST;
	_vPool = call selectVehPoolISL;
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	[_c, getMarkerPos _spawnPos, 3500, 6, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

//Sea patrol
_c = createGroup EAST;
_v = [getMarkerPos "NP_spawn", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
[_c, getMarkerPos "NP_spawn", 2500, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 25] call ADF_fnc_seaPatrol;

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
		_wp setWaypointStatements ["true", "v1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
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
		_wp setWaypointStatements ["true", "v2 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
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
		_wp setWaypointStatements ["true", "v3 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v3};
		sleep 180;		
		if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3); deleteVehicle v3; v3 = nil};		
		sleep _pause;
	};
};
