vWolf_takeOff = false;
kryaActive = false;
wpExfil = false;
wpEnd = false;
execVM "Scr\kryanera_s.sqf";

if (isServer) then {
	// vWolf_1
	[] spawn {
		vWolf_1 flyInHeight 5;
		_c = group vWolf_1;
		_wp1 = _c addWaypoint [getMarkerPos "mVSOR_1_wp1", 0];
		_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "FULL";	
		_wp2 = _c addWaypoint [getPos mWolfLand_1, 0];
		_wp2 setWaypointType "TR UNLOAD"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "LIMITED";
		_wp2 setWaypointStatements ["true", "vWolf_1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
		waitUntil {isTouchingGround vWolf_1};
		vWolf_takeOff = true; publicVariable "vWolf_takeOff";
		sleep 2;
		vWolf_1 setFuel 0;
		sleep 5;
		vWolf_1 setFuel 1;		
		_wp3 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointBehaviour "SAFE";
		_wp3 setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
		if !(isNil "vWolf_1") then {{deleteVehicle _x} forEach (crew vWolf_1); deleteVehicle vWolf_1; vWolf_1 = nil};		
	};
	// vWolf_2
	[] spawn {
		vWolf_2 flyInHeight 5;
		_c = group vWolf_2;
		_wp1 = _c addWaypoint [getMarkerPos "mvSOR_2_wp1", 0];
		_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "FULL";	
		_wp2 = _c addWaypoint [getPos lzPopcorn, 0];
		_wp2 setWaypointType "TR UNLOAD"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "LIMITED";
		_wp2 setWaypointStatements ["true", "vWolf_2 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
		waitUntil {isTouchingGround vWolf_2};
		sleep 2;
		vWolf_2 setFuel 0;
		sleep 5;
		vWolf_2 setFuel 1;		
		_wp3 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointBehaviour "SAFE";
		_wp3 setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
		if !(isNil "vWolf_2") then {{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2; vWolf_2 = nil};		
	};
	// vWolf_3
	[] spawn {
		vWolf_3 flyInHeight 5;
		_c = group vWolf_3;
		_wp1 = _c addWaypoint [getMarkerPos "mvSOR_3_wp1", 0];
		_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "FULL";	
		_wp2 = _c addWaypoint [getPos mWolfLand_3, 0];
		_wp2 setWaypointType "TR UNLOAD"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "LIMITED";
		_wp2 setWaypointStatements ["true", "vWolf_3 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
		waitUntil {isTouchingGround vWolf_3};
		sleep 2;
		vWolf_3 setFuel 0;
		sleep 5;
		vWolf_3 setFuel 1;		
		_wp3 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointBehaviour "SAFE";
		_wp3 setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
		if !(isNil "vWolf_3") then {{deleteVehicle _x} forEach (crew vWolf_3); deleteVehicle vWolf_3; vWolf_3 = nil};		
	};
};

player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

while {time < 30} do {
	if !(isNil "SOR_SSC_1") then {SOR_SSC_1 assignAsCargo vWolf_1; SOR_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsCargo vWolf_1; SOR_RM_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_2; SOR_RTL_1 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_2; SOR_RS_2 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_2; SOR_RS_3 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;
	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_3; SOR_RTL_2 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_3; SOR_RS_5 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_3; SOR_RS_6 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_3; SOR_RS_7 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_3; SOR_AT_1 moveInCargo vWolf_3;};
};

waitUntil {ADF_missionInit}; sleep 5;
hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Jetson</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Scarecrow<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
DEVGRU TOC: </font><font color='#9DA698'>Jetson</font><br/>
<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Scarecrow</font>
<br/><br/>"]];
sleep 25;

if (isServer) then {
	_m = createMarker ["popcorn", getPos lzPopcorn];
	_m setMarkerSize [1, 1];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "Popcorn";
	deleteMarker "mBrief0";
};
	
hint parseText"
	<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>160th SOAR Lt. Campbell: We'll drop you off at </t><t color='#9DA698' align='left'>LZ Popcorn</t><t color='#6C7169' align='left'>, about 1.5 clicks east of the Naval Base.<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: 160th SOAR Lt. Campbell</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>160th SOAR Lt. Campbell: We'll drop you off at </font><font color='#9DA698'>LZ Popcorn</font><font color='#6C7169'>, about 1.5 clicks east of the Naval Base.</font>
<br/><br/>"]];

[] spawn {
	waitUntil {vWolf_takeOff};
	hint parseText"
		<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>160th SOAR Lt. Campbell: Dusting off in 5 seconds<br /></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: 160th SOAR Lt. Campbell</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>160th SOAR Lt. Campbell: Dusting off in 5 seconds</font>
	<br/><br/>"]];
};


sleep 150;

if (isServer) then {
	_m = createMarker ["mKrya", [9730.5,22320.4,0]];
	_m setMarkerSize [1.5, 1.5];
	_m setMarkerShape "ICON";
	_m setMarkerType "o_naval";
	_m setMarkerColor "ColorEAST";
	_m setMarkerDir 0;
	_m setMarkerText "Krya Nera Naval Base";
};

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Jetson: Scarecrow, make your way to the </t><t color='#9DA698' align='left'>Krya Nera Naval Base.</t><br/><br/><t color='#6C7169' align='left'>Clear the area and wait for further instructions.<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Jetson: Scarecrow, make your way to the </font><font color='#9DA698'>Krya Nera Naval Base.</font><br/><br/><font color='#6C7169'>Clear the area and wait for further instructions.</font>
<br/><br/>"]];

_c = []; _v1 = []; _v2 = [];

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

wp_fnc_airPos = {_airSpawnArray = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;_airSpawnArray;};
wp_fnc_airVehicle = {_airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};
wp_fnc_wait = {_wait = [180,480,720,1200,1800] call BIS_fnc_selectRandom;_wait;};
wp_fnc_aptWait = {_aptWait = [180,360,600,900,1200] call BIS_fnc_selectRandom;_aptWait;};

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
		sleep _aptHold;
		v4 setFuel 1;		
		_wp = _c addWaypoint [getMarkerPos _exit, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};		
		if !(isNil "v4") then {{deleteVehicle _x} forEach (crew v4); deleteVehicle v4; v4 = nil};		
	};
};

if (ADF_debug) then {[EAST,"OFF"] call ADF_fnc_debugMarkers;}; // Side, Labels "ON"/"OFF";
