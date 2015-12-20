diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

waitUntil {sleep 5; ((time > 900) || ADF_loadAO || MotsActive)};

ADF_fnc_DeleteVehicles = {
	private ["_vehToDelete"];
	_vehToDelete = _this select 0;	
	{
		{deleteVehicle _x} forEach crew (vehicle _x) + [(vehicle _x)];
	} forEach _vehToDelete;
	true
};

// T100 convoy

[] spawn {
	private ["_c","_v","_wp"];
	sleep 600;
	_c = createGroup EAST; 
	_v = [getMarkerPos "mT100_spawn", markerDir "mT100_spawn", "O_MBT_02_cannon_F", _c] call BIS_fnc_spawnVehicle; armConvoy_1 = _v select 0; 
	_v = [(armConvoy_1 modelToWorld [0,-15,0]), getDir armConvoy_1, "O_MBT_02_cannon_F", _c] call BIS_fnc_spawnVehicle; armConvoy_2 = _v select 0;
	_c setCombatMode "GREEN";
	_wp = _c addWaypoint [getMarkerPos "mT100_1",0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_2",1]; _wp setWaypointType "MOVE"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_3",2]; _wp setWaypointType "MOVE"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_4",3]; _wp setWaypointType "MOVE"; 
	_wp = _c addWaypoint [getMarkerPos "mT100_5",4]; _wp setWaypointType "MOVE"; _wp setWaypointTimeout [10, 60, 120];
	_wp = _c addWaypoint [getMarkerPos "mT100_end",5]; _wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true", "[[armConvoy_1,armConvoy_2]] call ADF_fnc_DeleteVehicles"];
	
	while {!(isNil "armConvoy_1")} do {
		armConvoy_1 limitSpeed 30;		
		armConvoy_2 limitSpeed (speed armConvoy_1);	
		sleep .5;
	};
};

// Foot patrols
for "_i" from 1 to 6 do {
	private ["_g","_spawnpos"];
	_spawnpos = format ["p%1",_i];
	_g = [getMarkerPos _spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnpos, (500 + (random 200)), floor (3 + (random 3)), "MOVE", "SAFE", "RED", "LIMITED","FILE", 5, true] call ADF_fnc_footPatrol;
};

// Frini base squad
private ["_g","_spawnpos"];
_spawnpos = "mDef_1";
_g = [getMarkerPos _spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
 [_g, _spawnPos, 110, 2, true] call ADF_fnc_defendArea;	
 
 private ["_g","_spawnpos"];
_spawnpos = "mDef_1";
_g = [getMarkerPos _spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
 [_g, _spawnPos, 60, 2, true] call ADF_fnc_defendArea;	

private ["_g","_spawnpos"];
_spawnpos = "mDef_2";
_g = [getMarkerPos _spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
 [_g, _spawnPos, 15, 2, true] call ADF_fnc_defendArea;
 
private ["_g","_spawnpos"];
_spawnpos = "mDef_3";
_g = [getMarkerPos _spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
 [_g, _spawnPos, 15, 2, true] call ADF_fnc_defendArea;

// Tech veh patrols
for "_i" from 1 to 3 do {
	private ["_c","_v","_vc","_pp","_sp"];
	_c = createGroup EAST;
	_sp = format ["v%1a",_i];
	_pp = format ["V%1b",_i];
	_vc = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_MRAP_02_F"] call bis_fnc_selectRandom;
	_v = [getMarkerPos _sp, 90, _vc, _c] call BIS_fnc_spawnVehicle;
	_wp = _c addWaypoint [getMarkerPos _pp, 0];
	_wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
	[_c, getmarkerpos _pp, 1500, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

sleep 10;

private ["_c","_g","_v","_vc","_pp","_sp"];
_c = createGroup EAST;
_sp = ["v1a","v2a","v3a"] call bis_fnc_selectRandom;
_pp = ["v1b","v2b","v3b"] call bis_fnc_selectRandom;
_v = [getMarkerPos _sp, 90, "O_Truck_02_transport_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos _pp, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
[_c, getMarkerPos _pp, 2000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;

private "_g";
_g = [getMarkerPos "mDef_1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_Weapons")] call BIS_fnc_spawnGroup;
{_x assignAsCargo (_v select 0); _x moveInCargo (_v select 0)} foreach units _g;
sleep 1;
private "_g";
_g = [getMarkerPos "mDef_1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
{_x assignAsCargo (_v select 0); _x moveInCargo (_v select 0)} foreach units _g;	


