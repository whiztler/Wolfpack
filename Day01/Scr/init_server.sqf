diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

// Load Supplies
[wolfCrate] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";

Kallaziz_1 addEventHandler ["killed", {remoteExec ["ADF_msg_kallaziz",0,true]; remoteExec ["ADF_fnc_Retaliate",0,true];}];

ADF_msg_rv = {
	diag_log "-----------------------------------------------------";
	diag_log "WOLFPACK: RV message";
	diag_log "-----------------------------------------------------";
	if !(isNil "nikos_1") then {deleteVehicle nikos_1};
};

ADF_fnc_nikos = {
	ADF_loadAO = true; publicVariable "ADF_loadAO";
	deleteMarker "mrk_Nikos";
	"cBase2" setMarkerText "FRINI MOB";

	_m = createMarker ["obj_exfil", getMarkerPos "pos_obj_exfil"];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerSize [.75, .75];
	_m setMarkerColor "ColorWEST";
	_m setMarkerText "VICTOR";
	_m setMarkerDir 0;

	deleteMarker "pos_obj_package";
	deleteMarker "pos_obj_exfil";

	sleep 30;
	
	private "_wp";
	_wp = gNikos addWaypoint [getMarkerPos "mp_rv1", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "COLUMN";
	_wp setWaypointStatements ["true", "pNikos moveInDriver vMP;"];
	_wp = gNikos addWaypoint [getMarkerPos "mp_rv2", 1];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle vMP) + [(vehicle vMP)];"];
	
	[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
	[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
};

ADF_fnc_kallazizActive = {
	private ["_c","_v","_wp","_s"];	
	
	_s = [700,750,800,850,900,950,1000] call BIS_fnc_selectRandom;
	diag_log "-----------------------------------------------------";
	diag_log format ["WOLFPACK: HVT timer: %1 seconds (%2 minutes)",_s,round (_s / 60)];
	diag_log "-----------------------------------------------------";
	if (MotsActive || ADF_debug) then {sleep 5} else {sleep _s};
	kallaziz_active = true; publicVariable "kallaziz_active";

	_c = creategroup EAST;
	_c setCombatMode "GREEN";
	_v = [getMarkerPos "cApt_1", 310, "O_Heli_Light_02_unarmed_F", _c] call BIS_fnc_spawnVehicle;
	vKalla = _v select 0;
	{_x assignAsCargo vKalla; _x moveInCargo vKalla;} forEach units gKallaziz;

	_wp = _c addWaypoint [getMarkerPos "mLand", 0];
	_wp setWaypointType "TR UNLOAD";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "this land 'LAND';"];

	_wp = _c addWaypoint [getMarkerPos "cApt_1", 1];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle vKalla) + [(vehicle vKalla)];"];
	
	if !(isNil "tFrini") then {deleteVehicle tFrini};
};

ADF_fnc_Retaliate = {
	sleep 120;
	
	private ["_c","_v","_wp","_wpS"];
	_c = createGroup EAST; 
	_v = [getMarkerPos "Abdera_Apt", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
	vAP1 = _v select 0;
	vAP1 flyInHeight 30;
	_wp = _c addWaypoint [getMarkerPos "p3", 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "NORMAL";
	waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
	_wpS = _c addWaypoint [getMarkerPos "cBase2", 0];
	_c setCombatMode "RED";
	_wpS setWaypointType "SAD";
	
	private "_delAmmoArray";
	_delAmmoArray = ["38Rnd_80mm_rockets","8Rnd_LG_scalpel"];
	{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
	
	waitUntil {ADF_endMission};
	
	vAP1 flyInHeight 400;
	_wp2 = _c addWaypoint [getMarkerPos "Abdera_Apt", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "FULL";
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	vAP1 setDamage .9;	
};

ADF_fnc_exfil = {
	ADF_endMission = true;

	_c = createGroup WEST;
	_v = [getMarkerPos "nep1a", 210, "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle; 
	vNeptune1 = _v select 0; 
	_v = [getMarkerPos "nep1a2", 210, "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle;
	vNeptune2 = _v2 select 0;

	{_x allowDamage False; _x setCaptive true} forEach [vNeptune1,vNeptune2];
	
	_wp1 = _c addWaypoint [getMarkerPos "nep1b", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "COMBAT";
	_wp1 setWaypointSpeed "FULL";
	_wp1 setWaypointCompletionRadius 30;
	_wp1 setWaypointStatements ["true", "if (hasInterface) then {['NONE','Neptune','Phoenix, this is Neptune. Get ready. ETA 2 mikes.'] call ADF_fnc_MessageParser};"];
		
	_wp2 = _c addWaypoint [getMarkerPos "nep1c", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "AWARE";
	_wp1 setWaypointCompletionRadius 30;
	_wp2 setWaypointSpeed "NORMAL";

	_wp3 = _c addWaypoint [getMarkerPos "nep1d", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "LIMITED";
	_wp1 setWaypointCompletionRadius 0;
	_wp3 setWaypointStatements ["true", "if (hasInterface) then {['NONE','Neptune','Neptune: Great to see you Commander. Hop on. We will take you guys home.'] call ADF_fnc_MessageParser};"];	
	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
	{_x setFuel 0} forEach [vNeptune1,vNeptune2];

	wpEnd = true;
	publicVariable "wpEnd";	
};

[] spawn {
	waitUntil {sleep 5; time > 30};
	"Notice: All communication (messages) are logged once displayed on screen. You can access the 'WOLFPACK LOG' from the map menu. All messages are time-stamped and saved in order of appearance." remoteExec ["systemChat",-2,false];
	waitUntil {sleep 5; time > 600};
	deleteMarker "mBrief0";
};

ADF_init_AO = true; publicVariable "ADF_init_AO";