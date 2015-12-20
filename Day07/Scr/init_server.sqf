diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

uNikkos allowFleeing 0;
uNikkos setBehaviour "CARELESS";
uNikkos setName ["Nikos Fotopoulos","Nikos","Fotopoulos"];
uNikkos addEventHandler ["killed", {remoteExec ["ADF_msg_nikosKilled",0,false];}];

[wolfCrate] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
[wolfCrateDemo] execVM "Core\C\ADF_cCargo_B_Demo.sqf";
[] spawn {sleep 120; deleteMarker "mBrief0"};

ADF_fnc_nikosRescued = {
	params ["_o","_c","_i"];
	NikkosRescued = true;
	tNR = true;
	
	uNikkos removeAction _i;
	[uNikkos] joinSilent (group _c);
	
	private "_m";
	_m = createMarker ["mExfil2", getMarkerPos "mExfil"];
	_m setMarkerSize [.7,.7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "USS ANCHORAGE";
	
	if !(isNil "vAP2") then {{deleteVehicle _x} forEach (crew vAP2);deleteVehicle vAP2;};
	if (MotsActive) then {ADF_counter = 20} else {ADF_counter = ((random 250) + (random 250))};
	publicVariable "ADF_counter";
	sleep ADF_counter;
	
	if (!isNil "tCities3") then {deleteVehicle tCities3};
	if (!isNil "tFP5") then {deleteVehicle tFP5};

	for "_i" from 1 to 4 do {
		private ["_g","_v"];
		_g = createGroup EAST;
		_v = [getMarkerPos "mCounterSpawn", 100, "O_MRAP_02_hmg_F", _g] call BIS_fnc_spawnVehicle;		
		[_g, getmarkerpos "mObj1", 2500, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
		sleep 10;		
	};
	
	sleep ADF_counter - 26;

	private ["_c","_v","_d"];
	_c = createGroup EAST; 
	_v = [getMarkerPos "mCounterAir", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
	vAP1 = _v select 0;
	vAP1 flyInHeight 30;
	_d = ["38Rnd_80mm_rockets","8Rnd_LG_scalpel"];
	{vAP1 removeMagazineTurret [_x,[0]]} forEach _d;	
	
	_wp1 = _c addWaypoint [getMarkerPos "ap1", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointSpeed "NORMAL";
	waitUntil {(currentWaypoint (_wp1 select 0)) > (_wp1 select 1)};
	[_c, getMarkerPos "ap1", 2000, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_airPatrol;	
};


