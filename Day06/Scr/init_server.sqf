diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

// vWolf_1
[] spawn {
	_c = group vWolf_1;
	_c setCombatMode "GREEN";
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
	deleteMarker "mBrief0";
	vWolf_1 flyInHeight 0;
	waitUntil {isTouchingGround vWolf_1};
	vWolf_takeOff = true; publicVariable "vWolf_takeOff";
	vWolf_1 setFuel 0;	
	sleep 8;
	vWolf_1 lock true;
	vWolf_1 setFuel 1;
	{vWolf_1 animateDoor [_x, 0];} forEach ["door_L","door_R"];
	_wp4 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
	_wp4 setWaypointType "MOVE";
	_wp4 setWaypointBehaviour "SAFE";
	_wp4 setWaypointSpeed "NORMAL";
	vWolf_1 flyInHeight 20;
	waitUntil {(currentWaypoint (_wp4 select 0)) > (_wp4 select 1)};
	deleteMarker "mManila";
	if !(isNil "vWolf_1") then {{deleteVehicle _x} forEach (crew vWolf_1); deleteVehicle vWolf_1; vWolf_1 = nil};		
};
// vWolf_2
[] spawn {
	_c = group vWolf_2;
	_c setCombatMode "GREEN";
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
	vWolf_2 flyInHeight 0;
	waitUntil {isTouchingGround vWolf_2}; 
	vWolf_2 setFuel 0;
	sleep 8;
	vWolf_2 lock true;
	vWolf_2 setFuel 1;
	{vWolf_2 animateDoor [_x, 0];} forEach ["door_L","door_R"];
	_wp4 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
	_wp4 setWaypointType "MOVE";
	_wp4 setWaypointBehaviour "SAFE";
	_wp4 setWaypointSpeed "NORMAL";		
	vWolf_2 flyInHeight 15;
	waitUntil {(currentWaypoint (_wp4 select 0)) > (_wp4 select 1)};		
	if !(isNil "vWolf_2") then {{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2; vWolf_2 = nil};
};

radar_1 addEventHandler ["killed", {remoteExec ["ADF_fnc_objBarcelona",0,false];}];
sAA_1 addEventHandler ["killed", {remoteExec ["ADF_fnc_objIstanbul",0,false];}];
sAA_2 addEventHandler ["killed", {remoteExec ["ADF_fnc_objIstanbul",0,false];}];
sAA_3 addEventHandler ["killed", {remoteExec ["ADF_fnc_objIstanbul",0,false];}];
sAA_4 addEventHandler ["killed", {remoteExec ["ADF_fnc_objIstanbul",0,false];}];
sAA_5 addEventHandler ["killed", {remoteExec ["ADF_fnc_objIstanbul",0,false];}];

ADF_fnc_objBarcelona = {
	objBarcelona = true;
	"mBarca" setMarkerText "";
	if (objInstanbul) then {[] call ADF_fnc_Naples};
};

ADF_fnc_objIstanbul = {
	if (alive sAA_1 || alive sAA_2 || alive sAA_3 || alive sAA_4 || alive sAA_5) exitWith {};
	objInstanbul = true;
	"mIstanbul" setMarkerText "";
	if (objBarcelona) then {[] call ADF_fnc_Naples};
};

ADF_msg_Barcelona = {
	if (!isNil "tBarcaInfo") then {deleteVehicle tBarcaInfo};
	if (!isNil "tCities1") then {deleteVehicle tCities1};
	if (!isNil "tFP30") then {deleteVehicle tFP30};
	if (!isNil "tFP1") then {deleteVehicle tFP1};
	if (!isNil "tFP2") then {deleteVehicle tFP2};
	if (!isNil "tSites1") then {deleteVehicle tSites1};
	if (!isNil "tFP3") then {deleteVehicle tFP3};
};

ADF_msg_Istanbul = {
	if (!isNil "tIstanInfo") then {deleteVehicle tIstanInfo};
};

ADF_fnc_Naples = {
	private ["_m","_c","_v"];
	if !(isNil "vExf1") exitWith {}; // exfil already created
	_m = createMarker ["exfil", getMarkerPos "mExf2"];
	_m setMarkerSize [.7,.7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "NAPLES";
	
	if !(isNil "vAP1") then {{deleteVehicle _x} forEach (crew vAP1); deleteVehicle vAP1; vAP1 = nil};
	if !(isNil "vNP1") then {{deleteVehicle _x} forEach (crew vNP1); deleteVehicle vNP1; vNP1 = nil};		

	_c = createGroup WEST;
	_v = [getMarkerPos "mExf1", markerDir "mExf1", "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle; 
	vExf1 = _v select 0;
	vExf1 setFuel 0;
	_v = [getMarkerPos "mExf2", markerDir "mExf2", "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle;
	vExf2 = _v select 0;
	vExf2 setFuel 0;	
};

[] spawn {
	waitUntil {sleep 5; if ((isNil "vWolf_1") && (isNil "vWolf_2")) exitWith {}; time > 600};	
	if !(isNil "vWolf_1") then {{deleteVehicle _x} forEach (crew vWolf_1); deleteVehicle vWolf_1; vWolf_1 = nil};
	if !(isNil "vWolf_2") then {{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2; vWolf_2 = nil};
};
