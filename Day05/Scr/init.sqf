player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

tIntelSet = false;

sleep 3; // Loadout finished > pri weapon loaded

while {time < 25} do {
	if !(isNil "SOD_SSC_1") then {SOD_SSC_1 assignAsCargo vWolf_1; SOD_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOD_RM_1") then {SOD_RM_1 assignAsDriver vWolf_1; SOD_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
	if !(isNil "SOD_UAV_1") then {SOD_UAV_1 assignAsGunner vWolf_1; SOD_UAV_1 moveInGunner vWolf_1;}; sleep 0.035;
	if !(isNil "SOD_RMM_1") then {SOD_RMM_1 assignAsCargo vWolf_1; SOD_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

	if !(isNil "SOD_ATL_1") then {SOD_ATL_1 assignAsCargo vWolf_2; SOD_ATL_1 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOD_AD_2") then {SOD_AD_2 assignAsDriver vWolf_2; SOD_AD_2 moveInDriver vWolf_2;}; sleep 0.035;
	if !(isNil "SOD_AD_3") then {SOD_AD_3 assignAsGunner vWolf_2; SOD_AD_3 moveInGunner vWolf_2;}; sleep 0.035;
	if !(isNil "SOD_AD_4") then {SOD_AD_4 assignAsCargo vWolf_2; SOD_AD_4 moveInCargo vWolf_2;}; sleep 0.035;
	
	if !(isNil "SOD_ADD_1") then {SOD_ADD_1 assignAsDriver vWolf_3; SOD_ADD_1 moveInDriver vWolf_3;}; sleep 0.035;	
	if !(isNil "SOD_ATL_2") then {SOD_ATL_2 assignAsCargo vWolf_3; SOD_ATL_2 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOD_AD_5") then {SOD_AD_5 assignAsGunner vWolf_3; SOD_AD_5 moveInGunner vWolf_3;}; sleep 0.035;
	if !(isNil "SOD_AD_6") then {SOD_AD_6 assignAsCargo vWolf_3; SOD_AD_6 moveInCargo vWolf_3;}; sleep 0.035;
	
	if !(isNil "SOD_AD_7") then {SOD_AD_7 assignAsDriver vWolf_4; SOD_AD_7 moveInDriver vWolf_4;}; sleep 0.035;
	if !(isNil "SOD_AT_1") then {SOD_AT_1 assignAsGunner vWolf_4; SOD_AT_1 moveInGunner vWolf_4;};	
};

// init
wpFace = false;

// Init & randomize the intel location
_deskRandom = [desk2,desk3,desk4,desk5,desk6]  call BIS_fnc_selectRandom;
LaptopObj setVectorup [0,0,0.1];
LaptopObj setPos (getPos _deskRandom);
LaptopObj attachTo [_deskRandom, [0,0,0.6]];
tIntel setPos (getPos _deskRandom);
tIntel setDir (getDir _deskRandom);

tIntelSet = true; publicVariable "tIntelSet";

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Cowboy.</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Cougar.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
DEVGRU TOC: </font><font color='#9DA698'>Cowboy</font><br/>
<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Cougar</font>
<br/><br/>"]];
sleep 10;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Cougar, head out to RV XRay. Niko's crew dropped off supplies at Chelonisi in case yours have water damage.</t><br/><br/>
	<t color='#6C7169' align='left'>Pyrgos is busy as always with CSAT patrols, civilians, etc. You know what to do Cougar</t><br/>
	<t color='#6C7169' align='left'>Exfil is at </t><t color='#9DA698' align='left'>LZ Sundance</t><t color='#6C7169' align='left'>. More details to follow.</t><br/><br/>
	<t color='#6C7169' align='left'>Good luck! Cowboy out.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Cowboy: Cougar, head out to RV XRay. Niko's crew dropped off supplies at Chelonisi in case yours have water damage.</font><br/><br/>
<font color='#6C7169'>Pyrgos is busy as always with CSAT patrols, civilians, etc. You know what to do Cougar</font><br/>
<font color='#6C7169'>Exfil is at </font><font color='#9DA698'>LZ Sundance</font><font color='#6C7169'>. More details to follow.</font><br/><br/>
<font color='#6C7169'>Good luck! Cowboy out.</font>
<br/><br/>"]];
sleep 40;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Cougar, we just picked up two CSAT navy patrols on Satnav. Keep your head down!<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Cowboy: Cougar, we just picked up two CSAT navy patrols on Satnav. Keep your head down!</font>
<br/><br/>"]];

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Air Patrols
_c = createGroup EAST; 
_c setCombatMode "GREEN";
_v = [getPos mLand_1, 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
vAP1 = _v select 0; sleep 2;
_v = [getPos mLand_2, 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
vAP2 = _v select 0;
[_c, getMarkerPos "cBase1", 7500, 8, "MOVE", "SAFE", "GREEN", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
sleep 2;

_delAmmoArray = ["38Rnd_80mm_rockets","250Rnd_30mm_HE_shells","250Rnd_30mm_APDS_shells","8Rnd_LG_scalpel"];
{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
{vAP2 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;

wp_fnc_airPos = {_airSpawnArray = ["mAir_1","mAir_2","mAir_3","mAir_4"] call BIS_fnc_selectRandom;_airSpawnArray;};
wp_fnc_wait = {_wait = [600,900,1200] call BIS_fnc_selectRandom;_wait;};
wp_fnc_aptWait = {_aptWait = [300,450,600,900,1200] call BIS_fnc_selectRandom;_aptWait;};
wp_fnc_airVehicle = {_airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};

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
	|;
};


if (ADF_debug) then {
	[EAST,"OFF"] call ADF_fnc_debugMarkers; // Side, Labels "ON"/"OFF"
};