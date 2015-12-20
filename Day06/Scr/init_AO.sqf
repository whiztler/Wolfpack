waitUntil {sleep 5; vWolf_takeOff};
diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

// Sentries
private ["_g","_p"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_1,[],0,"SERGEANT"]; _p setDir 40; _p moveInGunner sHmg_1; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_2,[],0,"CORPORAL"]; _p setDir 180; _p moveInGunner sHmg_2; 
_p = _g createUnit ["O_Soldier_F",getPosASL sHmg_3,[],0,"Private"]; _p setDir 350; _p moveInGunner sHmg_3; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_1,[],0,"Private"]; _p moveInGunner sAA_1; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_2,[],0,"Private"]; _p moveInGunner sAA_2; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_3,[],0,"Private"]; _p moveInGunner sAA_3; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_4,[],0,"Private"]; _p moveInGunner sAA_4; 
_p = _g createUnit ["O_Soldier_F",getPosASL sAA_5,[],0,"Private"]; _p moveInGunner sAA_5; 

// Riga CP
_g = [getPos RigaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos RigaCP, 50, 2, true] call ADF_fnc_defendArea;

// Drimea CP
_g = [getPos DrimeaCP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getPos DrimeaCP, 50, 2, true] call ADF_fnc_defendArea;

private ["_c","_v","_wp","_g","_p"];
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

_c = createGroup EAST;
_v = [getMarkerPos "mNS1", 270, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;	

// Road patrols
for "_i" from 1 to 4 do {
	private ["_c","_v","_vc","_p"];
	_c = createGroup EAST;
	_p = format ["mVP%1",_i];
	_p = getMarkerPos _p;
	_vc = ["O_MRAP_02_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F"] call BIS_fnc_selectRandom;
	_v = [_p, 90, _vc, _c] call BIS_fnc_spawnVehicle;
	[_c, _p, 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 50] call ADF_fnc_vehiclePatrol;
};
sleep 20;
for "_i" from 1 to 4 do {
	private ["_c","_v","_vc","_p"];
	_c = createGroup EAST;
	_p = format ["mVP%1",_i];
	_p = getMarkerPos _p;
	_vc = ["O_MRAP_02_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F"] call BIS_fnc_selectRandom;
	_v = [_p, 90, _vc, _c] call BIS_fnc_spawnVehicle;
	[_c, _p, 5000, 5, "MOVE", "SAFE", "RED", "LIMITED", 50] call ADF_fnc_vehiclePatrol;
};

// Air Patrols
private ["_c","_v","_delAmmoArray"];
_c = createGroup EAST; 
_v = [getMarkerPos "ap1", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "ap1", 5000, 100, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 250] call ADF_fnc_airPatrol;
vAP1 = _v select 0;
_delAmmoArray = ["38Rnd_80mm_rockets","250Rnd_30mm_HE_shells","250Rnd_30mm_APDS_shells","8Rnd_LG_scalpel"];
{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;

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
	sleep 600;
	private ["_c","_v","_wp"];
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

// Defend groups Barca & Istanbul
for "_i" from 1 to 2 do {
	private ["_g","_spawnPos","_defArr"];
	_spawnPos = format ["mDef_%1",_i];
	_spawnPos = getMarkerPos _spawnPos;
	_g = [_spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, _spawnPos, 100, 2, true] call ADF_fnc_defendArea;
};
sleep 60;
for "_i" from 1 to 2 do {
	private ["_g","_spawnPos","_defArr"];
	_spawnPos = format ["mDef_%1",_i];
	_spawnPos = getMarkerPos _spawnPos;
	_g = [_spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[_g, _spawnPos, 150, 2, true] call ADF_fnc_defendArea;
};

ADF_init_AO = true; publicVariable "ADF_init_AO";



