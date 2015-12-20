diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

[wolfCrate] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
[wolfCrateDemo] execVM "Core\C\ADF_cCargo_B_Demo.sqf";
[wolfCrateWet_1] execVM "Core\C\ADF_cCargo_B_WetGear.sqf";
[wolfCrateWet_2] execVM "Core\C\ADF_cCargo_B_WetGear.sqf";

if (isMultiplayer) then {sleep 90} else {sleep 10};

[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 50, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 70, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
deleteMarker "mBrief0";


ADF_fnc_depot = {
	deleteMarker "mRV";	
};

ADF_fnc_stratisAB = {
	"mDepot" setMarkerText "";
	waitUntil {
		sleep 5;
		(
			!(alive obj_1) && 
			!(alive obj_2) && 
			!(alive obj_3) && 
			!(alive obj_4) && 
			!(alive obj_5) && 
			!(alive obj_6) && 
			!(alive obj_7) && 
			!(alive obj_8) && 
			!(alive obj_9)
		);
	};
	objDone = true; publicVariable "objDone";
	"cApt" setMarkerText "";
	
	private ["_m","_c","_v"];
	_m = createMarker ["mExfil2", getMarkerPos "mExfil"];
	_m setMarkerSize [.7,.7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "BOMBAY";	
	
	_c = createGroup EAST;	
	_v = [getMarkerPos "mOSupport", 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	[_c, getMarkerPos "cApt", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	sleep 10;
	_c = createGroup EAST;	
	_v = [getMarkerPos "mOSupport", 0, "O_MRAP_02_gmg_F", _c] call BIS_fnc_spawnVehicle;	
	[_c, getMarkerPos "cApt", 1500, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	sleep 10;	
	_c = createGroup EAST;	
	_v = [getMarkerPos "mOSupport", 0, "O_APC_Tracked_02_cannon_F", _c] call BIS_fnc_spawnVehicle;	
	[_c, getMarkerPos "cApt", 1500, 6, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

ADF_fnc_exfil = {
	waitUntil {sleep 1; objDone};
	
	// Create Raven
	_c = createGroup WEST;
	_v1 = [getMarkerPos "mHSpawn1", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle; //mAirExit2
	vRaven1 = _v1 select 0; vRaven1 allowDamage False; vRaven1 setCaptive true; 
	_v2 = [getMarkerPos "mHSpawn2", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vRaven2 = _v2 select 0; vRaven2 allowDamage False; vRaven2 setCaptive true;
	//hint "choppers created";
	_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "FULL";
	_wp1 setWaypointStatements ["true", "vRaven1 flyInHeight 10;vRaven2 flyInHeight 10;"];
	
	_wp2 = _c addWaypoint [getMarkerPos "mC3", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "LIMITED";
	_wp2 setWaypointCombatMode "Green";
	_wp2 setWaypointStatements ["true", "if (hasInterface) then {['SOAR','Raven','Raven: Roach, pop smoke or a chemlight to mark the LZ.'] call ADF_fnc_MessageParser};"];
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	
	_wp3 = _c addWaypoint [getPos exfilLoc, 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "LIMITED";
	_wp3 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "vRaven1 land 'LAND';vRaven2 land 'LAND';"];	

	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
	vRaven1 flyInHeight 0;
	vRaven2 flyInHeight 0;
	waitUntil {isTouchingGround vRaven1 || isTouchingGround vRaven2}; 
	wpEnd = true;
	publicVariable "wpEnd";
};
ADF_mots_1 = true;