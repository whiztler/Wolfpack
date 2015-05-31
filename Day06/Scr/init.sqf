_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK IN", 30];

vWolf_takeOff = false;
vWolf_10Secs = false;

if (isServer) then {
	// vWolf_1
	[] spawn {
		_c = group vWolf_1;
		vWolf_1 flyInHeight 5;		
		//[vWolf_1,"SOARinsig"] call BIS_fnc_setUnitInsignia;
		_wp1 = _c addWaypoint [getMarkerPos "mVSOR_1_wp1", 0];
		_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "NORMAL";	
		_wp2 = _c addWaypoint [getMarkerPos "mVSOR_1_wp2", 0];
		_wp2 setWaypointType "MOVE"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "NORMAL";
		waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
		vWolf_10Secs = true; publicVariable "vWolf_10Secs";
		_wp3 = _c addWaypoint [getPos mWolfLand_1, 0];
		_wp3 setWaypointType "TR UNLOAD"; _wp3 setWaypointBehaviour "SAFE"; _wp3 setWaypointSpeed "LIMITED";
		_wp3 setWaypointStatements ["true", "vWolf_1 land 'LAND';"];		
		{vWolf_1 animateDoor [_x, 1];} forEach ["door_L","door_R"];
		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};	
		waitUntil {isTouchingGround vWolf_1};
		waitUntil {isTouchingGround vWolf_2};
		vWolf_takeOff = true; publicVariable "vWolf_takeOff";
		sleep 2;
		vWolf_1 setFuel 0;
		sleep 5;
		vWolf_1 lock true;
		vWolf_1 setFuel 1;
		{vWolf_1 animateDoor [_x, 0];} forEach ["door_L","door_R"];
		vWolf_1 flyInHeight 20;
		_wp4 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointBehaviour "SAFE";
		_wp4 setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp4 select 0)) > (_wp4 select 1)};		
		if !(isNil "vWolf_1") then {{deleteVehicle _x} forEach (crew vWolf_1); deleteVehicle vWolf_1; vWolf_1 = nil};		
	};
	// vWolf_2
	[] spawn {
		_c = group vWolf_2;
		vWolf_2 flyInHeight 5;
		vSOR_2_created = true; publicVariable "vSOR_2_created";
		//[vWolf_2,"SOARinsig"] call BIS_fnc_setUnitInsignia;
		_wp1 = _c addWaypoint [getMarkerPos "mvSOR_2_wp1", 0];
		_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "NORMAL";	
		_wp2 = _c addWaypoint [getMarkerPos "mvSOR_2_wp2", 0];
		_wp2 setWaypointType "MOVE"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "NORMAL";
		waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
		_wp3 = _c addWaypoint [getPos mWolfLand_2, 0];
		_wp3 setWaypointType "TR UNLOAD"; _wp3 setWaypointBehaviour "SAFE"; _wp3 setWaypointSpeed "LIMITED";
		_wp3 setWaypointStatements ["true", "vWolf_2 land 'LAND';"];	
		{vWolf_2 animateDoor [_x, 1];} forEach ["door_L","door_R"];
		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
		waitUntil {isTouchingGround vWolf_2};
		waitUntil {isTouchingGround vWolf_1};		
		sleep 2;
		vWolf_2 setFuel 0;
		sleep 8;
		vWolf_2 lock true;
		vWolf_2 setFuel 1;
		{vWolf_2 animateDoor [_x, 0];} forEach ["door_L","door_R"];
		vWolf_2 flyInHeight 15;		
		_wp4 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointBehaviour "SAFE";
		_wp4 setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp4 select 0)) > (_wp4 select 1)};		
		if !(isNil "vWolf_2") then {{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2; vWolf_2 = nil};		
	};
};


[] spawn {
	waitUntil {time > 21};
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 06 | Riga Hill</t>",0,0,3,12] spawn BIS_fnc_dynamicText;
};

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
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsCargo vWolf_1; SOR_RM_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_1; SOR_RTL_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_1; SOR_RS_2 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_1; SOR_RS_3 moveInCargo vWolf_1;}; sleep 0.035;
	
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_2; SOR_RTL_2 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_2; SOR_RS_5 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_2; SOR_RS_6 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_2; SOR_RS_7 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_2; SOR_AT_1 moveInCargo vWolf_2;};
};

objBarcelona = 0;
objInstanbul = 0;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Uncle</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Viper</t><br />
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
DEVGRU TOC: </font><font color='#9DA698'>Uncle</font><br/>
<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Viper</font>
<br/><br/>"]];


[] spawn {
	waitUntil {vWolf_10Secs};
	hint parseText"
		<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>160th SOAR Lt. Campbell: Commander, 20 seconds! Get ready!<br /></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Lt. Campbell</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>160th SOAR Lt. Campbell: Commander, 20 seconds! Get ready!</font>
	<br/><br/>"]];
};

[] spawn {
	waitUntil {vWolf_takeOff};
	hint parseText"
		<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>160th SOAR Lt. Campbell: Dusting off in 5 seconds<br /></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Lt. Campbell</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>160th SOAR Lt. Campbell: Dusting off in 5 seconds</font>
	<br/><br/>"]];	
};

execVM "Scr\edessa.sqf";

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

waitUntil {triggerActivated tIremi};
// Naval Patrols
_c = createGroup EAST;
_v = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNP1 = _v select 0;
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
sleep 0.5;
_c = createGroup EAST;
_v = [getMarkerPos "mNS1", 270, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;	
sleep 0.5;	

// Road patrols
_c = createGroup EAST; _v = [getMarkerPos "mVP1", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP1", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;
_c = createGroup EAST; _v = [getMarkerPos "mVP2", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP2", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;
_c = createGroup EAST; _v = [getMarkerPos "mVP3", 90, "O_Truck_02_transport_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP3", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;
_c = createGroup EAST; _v = [getMarkerPos "mVP4", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP4", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;
sleep 20;
_c = createGroup EAST; _v = [getMarkerPos "mVP1", 90, "O_Truck_02_medical_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP1", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;
_c = createGroup EAST; _v = [getMarkerPos "mVP2", 90, "O_Truck_02_Ammo_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP2", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;
_c = createGroup EAST; _v = [getMarkerPos "mVP3", 90, "O_Truck_02_fuel_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP3", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;
_c = createGroup EAST; _v = [getMarkerPos "mVP4", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "mVP4", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 0.5;	

deleteMarker "mBrief0";

// Air Patrols
_c = createGroup EAST; 
_v = [getMarkerPos "ap1", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle; [_c, getmarkerpos "ap1", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
vAP1 = _v select 0;
_delAmmoArray = ["38Rnd_80mm_rockets","250Rnd_30mm_HE_shells","250Rnd_30mm_APDS_shells","8Rnd_LG_scalpel"];
{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;

deleteVehicle tIremi;

ADF_fnc_DeleteVehicles = {
	private ["_vehToDelete"];
	_vehToDelete = _this select 0;	
	{
		{deleteVehicle _x} forEach crew (vehicle _x) + [(vehicle _x)];
	} forEach _vehToDelete;
	true
};

/// Convoy
[] spawn {	
	_c = createGroup EAST;
	_v = [getMarkerPos "mConvoy_Spawn", markerDir "mConvoy_Spawn", "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_1 = _v select 0; 
	_v = [(trptConvoy_1 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_2 = _v select 0;
	_v = [(trptConvoy_2 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_3 = _v select 0;
	_v = [(trptConvoy_3 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_4 = _v select 0;
	_v = [(trptConvoy_4 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_device_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_5 = _v select 0;
	_c setCombatMode "GREEN";
	_wp = _c addWaypoint [getMarkerPos "mConvoy_1",0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
	_wp = _c addWaypoint [getMarkerPos "mConvoy_2",1]; _wp setWaypointType "MOVE"; 
	_wp = _c addWaypoint [getMarkerPos "mConvoy_3",2]; _wp setWaypointType "MOVE"; 
	_wp = _c addWaypoint [getMarkerPos "mConvoy_4",3]; _wp setWaypointType "MOVE"; 
	_wp = _c addWaypoint [getMarkerPos "mConvoy_5",4]; _wp setWaypointType "MOVE";
	_wp = _c addWaypoint [getMarkerPos "mConvoy_end",5]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "[[trptConvoy_1,trptConvoy_2,trptConvoy_3,trptConvoy_4,trptConvoy_5]] call ADF_fnc_DeleteVehicles"];

	while {!(isNil "trptConvoy_1")} do {
		trptConvoy_1 limitSpeed 30;		
		trptConvoy_2 limitSpeed (speed trptConvoy_1);
		trptConvoy_3 limitSpeed (speed trptConvoy_1);
		trptConvoy_4 limitSpeed (speed trptConvoy_1);	
		trptConvoy_5 limitSpeed (speed trptConvoy_1);	
		sleep 1;
	};
};

execVM "Scr\barcelona.sqf";
sleep 3;
execVM "Scr\istanbul.sqf";

waitUntil {time > 300};

// Sentries
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_1,[],0,"SERGEANT"]; _p setDir 40; _p moveInGunner sHmg_1; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_2,[],0,"CORPORAL"]; _p setDir 180; _p moveInGunner sHmg_2; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_3,[],0,"Private"]; _p setDir 350; _p moveInGunner sHmg_3; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_1,[],0,"Private"]; _p moveInGunner sAA_1; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_2,[],0,"Private"]; _p moveInGunner sAA_2; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_3,[],0,"Private"]; _p moveInGunner sAA_3; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_4,[],0,"Private"]; _p moveInGunner sAA_4; sleep .05;
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_5,[],0,"Private"]; _p moveInGunner sAA_5; sleep .05;

// Riga CP
_g = [getPos RigaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos RigaCP, 50, 2, true] call CBA_fnc_taskDefend;  sleep .05;

// Drimea CP
_g = [getPos DrimeaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos DrimeaCP, 50, 2, true] call CBA_fnc_taskDefend;	

deleteMarker "mManila";

if (ADF_debug) then {
	[EAST,"OFF"] call ADF_fnc_debugMarkers; // Side, Labels "ON"/"OFF"
};
