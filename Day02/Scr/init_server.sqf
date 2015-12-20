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
	private ["_c","_wp1","_wp2","_wp3"];
	vWolf_1 flyInHeight 5;
	_c = group vWolf_1;
	_wp1 = _c addWaypoint [getMarkerPos "mVSOR_1_wp1", 0];
	_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "NORMAL";	
	_wp2 = _c addWaypoint [getPos mWolfLand_1, 0];
	_wp2 setWaypointType "TR UNLOAD"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "LIMITED";
	_wp2 setWaypointStatements ["true", "vWolf_1 land 'LAND';"];	
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	waitUntil {isTouchingGround vWolf_1};
	vWolf_1 flyInHeight 0;
	vWolf_takeOff = true; publicVariable "vWolf_takeOff";
	vWolf_1 setFuel 0;
	sleep 8;
	vWolf_1 setFuel 1;
	vWolf_1 flyInHeight 5;		
	_wp3 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "NORMAL";		
	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
	if !(isNil "vWolf_1") then {{deleteVehicle _x} forEach (crew vWolf_1); deleteVehicle vWolf_1; vWolf_1 = nil};		
};
// vWolf_2
[] spawn {
	private ["_c","_wp1","_wp2","_wp3"];
	vWolf_2 flyInHeight 5;
	_c = group vWolf_2;
	_wp1 = _c addWaypoint [getMarkerPos "mvSOR_2_wp1", 0];
	_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "NORMAL";	
	_wp2 = _c addWaypoint [getPos lzPopcorn, 0];
	_wp2 setWaypointType "TR UNLOAD"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "LIMITED";
	_wp2 setWaypointStatements ["true", "vWolf_2 land 'LAND';"];	
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	waitUntil {isTouchingGround vWolf_2};
	vWolf_2 flyInHeight 0;
	vWolf_2 setFuel 0;
	sleep 8;
	vWolf_2 setFuel 1;
	vWolf_2 flyInHeight 5;
	_wp3 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "NORMAL";		
	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
	if !(isNil "vWolf_2") then {{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2; vWolf_2 = nil};		
};
// vWolf_3
[] spawn {
	private ["_c","_wp1","_wp2","_wp3"];
	vWolf_3 flyInHeight 5;
	_c = group vWolf_3;
	_wp1 = _c addWaypoint [getMarkerPos "mvSOR_3_wp1", 0];
	_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "NORMAL";	
	_wp2 = _c addWaypoint [getPos mWolfLand_3, 0];
	_wp2 setWaypointType "TR UNLOAD"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "LIMITED";
	_wp2 setWaypointStatements ["true", "vWolf_3 land 'LAND';"];	
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	waitUntil {isTouchingGround vWolf_3};
	vWolf_2 flyInHeight 0;
	vWolf_3 setFuel 0;
	sleep 8;
	vWolf_3 setFuel 1;
	vWolf_3 flyInHeight 5;		
	_wp3 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "NORMAL";		
	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
	if !(isNil "vWolf_3") then {{deleteVehicle _x} forEach (crew vWolf_3); deleteVehicle vWolf_3; vWolf_3 = nil};		
};

private "_m";
_m = createMarker ["mPopcorn", getPos lzPopcorn];
_m setMarkerSize [.7, .7];
_m setMarkerShape "ICON";
_m setMarkerType "mil_start";
_m setMarkerSize [.75, .75];
_m setMarkerColor "ColorWEST";
_m setMarkerDir 0;
_m setMarkerText "POPCORN";
deleteMarker "mBrief0";

"cBase2_6" setMarkerText "KRYA NERA NAVAL BASE";	

ADF_fnc_kryanera = {
	deleteMarker "mPopcorn";
	if !(isNil "tKrya1") then {deleteVehicle tKrya1};
	if !(isNil "vWolf_1") then {{deleteVehicle _x} forEach (crew vWolf_1); deleteVehicle vWolf_1; vWolf_1 = nil};	
	if !(isNil "vWolf_2") then {{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2; vWolf_2 = nil};	
	if !(isNil "vWolf_3") then {{deleteVehicle _x} forEach (crew vWolf_3); deleteVehicle vWolf_3; vWolf_3 = nil};	
	kryaActive = true;
	waitUntil {sleep 1; roundsSplash;};

	private ["_th1","_th2","_th3","_th4","_th5"];
	_th1 = "Bo_GBU12_LGB" createVehicle (getPos gbu1); deletevehicle gbu1;
	_th2 = "Bo_GBU12_LGB" createVehicle (getPos gbu2); deletevehicle gbu2;
	_th3 = "Bo_GBU12_LGB" createVehicle (getPos gbu3); deletevehicle gbu3;
	_th4 = "Bo_GBU12_LGB" createVehicle (getPos gbu4); deletevehicle gbu4;
	_th5 = "Bo_GBU12_LGB" createVehicle (getPos gbu5); deletevehicle gbu5;

	"cApt_2_1_1" setMarkerText "ABDERA AIRBASE";
	"cBase2_6" setMarkerText "";	
};

ADF_fnc_exfil = {
	ADF_endMission = true; publicVariable "ADF_endMission";
	if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1;};	
	if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2;};	
	if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3); deleteVehicle v3;};	
	if !(isNil "v4") then {{deleteVehicle _x} forEach (crew v4); deleteVehicle v4;};
	if !(isNil "v10") then {{deleteVehicle _x} forEach (crew v10); deleteVehicle v10;};
	if !(isNil "v11") then {{deleteVehicle _x} forEach (crew v11); deleteVehicle v11;};
	if !(isNil "v12") then {{deleteVehicle _x} forEach (crew v12); deleteVehicle v12;};
	if !(isNil "vNAP") then {{deleteVehicle _x} forEach (crew vNAP); deleteVehicle vNAP;};
	"cApt_2_1_1" setMarkerText "";	
	
	private "_m";
	_m = createMarker ["Seattle", getPos mSeattle];
	_m setMarkerSize [.75, .75];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "SEATTLE";	
	
	if !(kryaActive) then {
		private "_q";
		_q = nearestObjects [getPos kryaFlag, ["Man"], 100];
		while {true} do {
			{deleteVehicle _x} forEach _q
		};
	};
	
	if (!MotsActive) then {sleep 570};
	
	// Create Condor
	private ["_c","_v","_wp"];
	_c = createGroup WEST;
	_c setCombatMode "BLUE";
	_v = [getMarkerPos "mC1a", 90, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vCondor1 = _v select 0;
	_2 = [getMarkerPos "mC1b", 90, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vCondor2 = _v select 0;
	{_x allowDamage False; _x setCaptive true, _x flyInHeight 15;} forEach [vCondor1,vCondor2];
	{_x setBehaviour "SAFE"} forEach units _c;
	
	[_c] spawn {
		params ["_c"];
		waitUntil {			
			if ((combatMode _c) != "BLUE") then {_c setCombatMode "BLUE"};
			{_x setBehaviour "SAFE"} forEach units _c;
			wpEnd
		};
	};
	
	_wp = _c addWaypoint [getMarkerPos "mC2", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "normal";
	_wp setWaypointStatements ["true", "if (hasInterface) then {['SOAR','160TH SOAR','Condor: Scarecrow please pop smoke or a chemlight to mark the LZ.'] call ADF_fnc_MessageParser};"];
	
	_wp = _c addWaypoint [getPos mSeattle, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "limited";
	_wp setWaypointCombatMode "BLUE";
	_wp setWaypointStatements ["true", "vCondor1 land 'LAND';vCondor2 land 'LAND';['SOAR','160TH SOAR','160th SOAR Lt. Summers: Dusting off in 30 seconds!'] call ADF_fnc_MessageParser;"];	
	
	waitUntil {sleep 1; ((isTouchingGround vCondor1) || (isTouchingGround vCondor2))};
	vCondor1 flyInHeight 0; vCondor2 flyInHeight 0;
	
	wpEnd = true;
	publicVariable "wpEnd";	
};