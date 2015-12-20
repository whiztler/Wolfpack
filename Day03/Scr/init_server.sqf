diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

{_x enableSimulation false} forEach [tTower1, tTower2, tTower3];

[wolfCrate] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
[wolfCrateDemo] execVM "Core\C\ADF_cCargo_B_Demo.sqf";
ADF_runExfil = false;

ADF_fnc_niko = {
	deleteMarker "mrk_rv";

	"cBase2_4" setMarkerText "RADAR AND COMM STATION";

	_m = createMarker ["obj_pwrplant", [4230,15076,19]];
	_m setMarkerShape "ICON";
	_m setMarkerSize [0.7,.07];
	_m setMarkerType "o_installation";
	_m setMarkerColor "ColorEAST";
	_m setMarkerText " KAVALA POWER STATION";
	_m setMarkerDir 0;

	if !(isNil "nikos_2") then {deleteVehicle nikos_2};
	
	sleep 35;
	_wp = gNikos addWaypoint [getMarkerPos "mp_rv1", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "COLUMN";
	_wp setWaypointStatements ["true", "pNikos moveInDriver vMP;"];
	sleep 1;
	_wp = gNikos addWaypoint [getMarkerPos "mConvoy_end", 1];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "deleteVehicle pNikos; deleteGroup gNikos; deleteVehicle vMP; gNikos = nil;"];

	[getMarkerPos "mAir1", getMarkerPos "mAirEnd1", 50, "NORMAL", "O_Heli_Transport_04_F", EAST] call BIS_fnc_ambientFlyby;
	sleep ((random 450) + (random 450)); // 15 min
	[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
	[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
	sleep ((random 600) + (random 600)); // 20 min
	[getMarkerPos "mAirEnd1", getMarkerPos "mAir1", 50, "NORMAL", "O_Heli_Transport_04_black_F", EAST] call BIS_fnc_ambientFlyby;
	sleep ((random 900) + (random 900)); // 30 min
	[getMarkerPos "mJetEnd", getMarkerPos "mJet2", 100, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby;
	[getMarkerPos "mJetEnd", getMarkerPos "mJet2", 100, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby;
};

ADF_fnc_DeleteVehicles = {
	params ["_vehToDelete"];
	{
		{deleteVehicle _x} forEach crew (vehicle _x) + [(vehicle _x)];
	} forEach _vehToDelete;
	true
};

ADF_msg_commStation = {
	{_x enableSimulation true} forEach [tTower1, tTower2, tTower3];
	
	waitUntil {sleep 1; (tt1 && tt2 && tt3)};	
	ADF_obj_commStation = true;	
	remoteExec ["ADF_fnc_commsOff",0,false];
	
	waitUntil {ADF_blizzard};
	private ["_th1","_th2","_th3","_th4","_th5","_th6","_th7","_th8"];
	_th1 = "Bo_GBU12_LGB" createVehicle (getPos tTower1); sleep .25;
	_th2 = "Bo_GBU12_LGB" createVehicle (getPos tTower1); sleep .25;
	_th3 = "Bo_GBU12_LGB" createVehicle (getPos tTower1); sleep .25;
	_th4 = "Bo_GBU12_LGB" createVehicle (getPos tTower2); sleep .25;
	_th5 = "Bo_GBU12_LGB" createVehicle (getPos tTower2); sleep .25;
	_th6 = "Bo_GBU12_LGB" createVehicle (getPos tTower2); sleep .25;
	_th7 = "Bo_GBU12_LGB" createVehicle (getPos tTower3); sleep .25;
	_th8 = "Bo_GBU12_LGB" createVehicle (getPos tTower3);
	{deleteVehicle _x} forEach [tTower3, tTower1, tTower2, ttmain];
	"cBase2_4" setMarkerText "";
};

ADF_fnc_exfil = {
	ADF_endMission = true;
	if (ADF_runExfil) exitWith {};
	ADF_runExfil = true;

	private ["_m","_wolfAlive","_c","_wp1","_wp2","_wp3"];
	_m = createMarker ["exfil", getPos mStadium];
	_m setMarkerSize [.75,.75];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "MIAMI";
	
	if (MotsActive || ADF_debug) then {sleep 20} else {sleep 750};
	
	// Cleanup
	if !(isNil "vNP1") then {{deleteVehicle _x} forEach (crew vNP1);deleteVehicle vNP1;};
	if !(isNil "vNP2") then {{deleteVehicle _x} forEach (crew vNP2);deleteVehicle vNP2;};
	if !(isNil "ppAPC") then {{deleteVehicle _x} forEach (crew ppAPC);deleteVehicle ppAPC;};	
	
	deleteVehicle gmg1; deleteVehicle taa1; deleteVehicle hmg1;
	{if (side _x == EAST) then {deleteVehicle _x}} forEach nearestObjects [getMarkerPos "mC2", ["CAR","APC","TANK"], 1500];

	_wolfAlive = {alive _x} count allPlayers;

	_c = createGroup WEST;
	_v = [getMarkerPos "mC1a", 30, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vCondor1 = _v select 0;
	_v = [getMarkerPos "mC1b", 30, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vCondor2 = _v select 0;
	{_x allowDamage False; _x setCaptive true; _x flyInHeight 15;} forEach [vCondor1, vCondor2];
			
	_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "NORMAL";
	
	_wp2 = _c addWaypoint [getMarkerPos "mC3", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "LIMITED";
	_wp2 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "if (hasInterface) then {['SOAR','Lt. Mitchell','Condor: Eightball please pop smoke to mark the LZ.'] call ADF_fnc_MessageParser};"];	
	
	_wp3 = _c addWaypoint [getMarkerPos "mC4", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "LIMITED";
	_wp3 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';vCondor2 land 'LAND';if (hasInterface) then {['SOAR','Lt. Mitchell','Condor: Dusting off in 30 seconds!'] call ADF_fnc_MessageParser;}"];	

	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
	waitUntil {isTouchingGround vCondor1}; vCondor1 flyInHeight 0;
	waitUntil {isTouchingGround vCondor2}; vCondor2 flyInHeight 0;
	sleep 3;
	wpEnd = true;
	publicVariable "wpEnd";
};

ADF_fnc_powerOff = {
	ADF_obj_powerStation = true;

	_types = [
	"Lamps_Base_F",
	"Land_LampAirport_F",
	"Land_LampSolar_F",
	"Land_LampStreet_F",
	"Land_LampStreet_small_F",
	"PowerLines_base_F",
	"Land_LampDecor_F",
	"Land_LampHalogen_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_PowerPoleWooden_L_F",
	"Land_NavigLight",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_yellow_F",
	"Land_Runway_PAPI",
	"Land_Runway_PAPI_2",
	"Land_Runway_PAPI_3",
	"Land_Runway_PAPI_4",
	"Land_fs_roof_F", // Fuel station roof lights
	"Land_fs_sign_F"
	];

	for [{_i = 0},{_i < (count _types)},{_i = _i + 1}] do
	{
		_lamps = (getMarkerPos "ps1") nearObjects [_types select _i, 2000]; // 1000 = distance
		sleep 0.3;
		{_x setDamage 0.95; sleep 0.01;} forEach _lamps;
	};
	
	"obj_pwrplant" setMarkerText "";
};

ADF_msg_powerStation = {
	// Power Station Generators
	private ["_gen_1","_gen_2","_gen_3","_gen_4","_gen_5","_gen_6","_gen_7","_gen_8","_gen_9"];
	_gen_1 = nearestTerrainObjects [getMarkerPos "mGen1", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 1: %1",_gen_1]; gen_1 = _gen_1 select 0;
	_gen_2 = nearestTerrainObjects [getMarkerPos "mGen2", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 2: %1",_gen_2]; gen_2 = _gen_2 select 0;
	_gen_3 = nearestTerrainObjects [getMarkerPos "mGen3", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 3: %1",_gen_3]; gen_3 = _gen_3 select 0;
	_gen_4 = nearestTerrainObjects [getMarkerPos "mGen4", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 4: %1",_gen_4]; gen_4 = _gen_4 select 0;
	_gen_5 = nearestTerrainObjects [getMarkerPos "mGen5", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 5: %1",_gen_5]; gen_5 = _gen_5 select 0;
	_gen_6 = nearestTerrainObjects [getMarkerPos "mGen6", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 6: %1",_gen_6]; gen_6 = _gen_6 select 0;
	_gen_7 = nearestTerrainObjects [getMarkerPos "mGen7", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 7: %1",_gen_7]; gen_7 = _gen_7 select 0;
	_gen_8 = nearestTerrainObjects [getMarkerPos "mGen8", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 8: %1",_gen_8]; gen_8 = _gen_8 select 0;
	_gen_9 = nearestTerrainObjects [getMarkerPos "mGen9", ["house"], 1.5]; diag_log format ["Wolfpack Debug: Generator 9: %1",_gen_9]; gen_9 = _gen_9 select 0;	
	
	waitUntil {
		sleep 5; 
		!(alive gen_1) &&
		!(alive gen_2) &&
		!(alive gen_3) &&
		!(alive gen_4) &&
		!(alive gen_5) &&
		!(alive gen_6) &&
		!(alive gen_7) &&
		!(alive gen_8) &&
		!(alive gen_9)
	};

	remoteExec ["ADF_fnc_powerOff",0,true];	
};