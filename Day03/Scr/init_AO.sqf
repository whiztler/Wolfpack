diag_log "ADF RPT: Init - executing init_AO.sqf"; // Reporting. Do NOT edit/remove

// Naval Patrols
_c = createGroup EAST;
_v1 = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNP1 = _v1 select 0; if (ADF_isHC) then {publicVariableServer "vNP1"};
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
_v2 = [getMarkerPos "mNP6", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNP2 = _v2 select 0; if (ADF_isHC) then {publicVariableServer "vNP2"};
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";

// Static PowerStation	
private "_p";
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL gmg1,[],0,"SERGEANT"]; _p setDir 320; _p moveInGunner gmg1;
_p = _g createUnit ["O_Soldier_F",getPosASL taa1,[],0,"CORPORAL"]; _p setDir 45; _p moveInGunner taa1;
_p = _g createUnit ["O_Soldier_F",getPosASL hmg1,[],0,"PRIVATE"]; _p setDir 270; _p moveInGunner hmg1;
_p = _g createUnit ["O_Soldier_F",getPosASL hmg3,[],0,"PRIVATE"]; _p setDir 180; _p moveInGunner hmg3;
_g = CreateGroup EAST;
_p = _g createUnit ["O_Soldier_F",getPosASL cp5,[],0,"CORPORAL"]; _p setDir 300;
_p = _g createUnit ["O_Soldier_F",getPosASL cp5,[],0,"PRIVATE"]; _p setDir 110;

// Defend Groups
for "_i" from 50 to 51 do {
	private ["_p","_g","_defArr"];
	_p = format ["mDef%1",_i];
	_g = [getMarkerPos _p, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	_defArr = [_g, getMarkerPos _p, 75, 2, true];
	_defArr call ADF_fnc_defendArea;
};

private ["_p","_g","_defArr"];
_g = [getMarkerPos "mDef51", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
_defArr = [_g, getMarkerPos "mDef51", 75, 2, true];
_defArr call ADF_fnc_defendArea;

if !(isNil "mBrief0") then {deleteMarker "mBrief0"};

// Foot patrols
for "_i" from 1 to 5 do {
	private ["_g","_spawnpos"];
	_spawnpos = format ["ap%1",_i];
	_spawnpos = getMarkerPos _spawnpos;
	_g = [_spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, _spawnpos, ((random 500) + 200), 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 10] call ADF_fnc_footPatrol;
};

// Foot patrols (city)
for "_i" from 1 to 3 do {
	private ["_g","_spawnpos"];
	_spawnpos = format ["kp%1",_i];
	_spawnpos = getMarkerPos _spawnpos;
	_g = [_spawnpos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, _spawnpos, ((random 250) + 250), 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 10] call ADF_fnc_footPatrol;
};

// Tech veh patrols
for "_1" from 1 to 5 do {
	private "_c";
	_c = ["O_G_Offroad_01_armed_F", "O_MRAP_02_F", "O_Truck_02_covered_F", "O_Truck_03_covered_F", "O_MRAP_02_hmg_F"] call BIS_fnc_selectRandom;	
	[EAST, _c, "vPat", "vPat", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_createVehiclePatrol;
	sleep 15;
};

// Powerstation patrols
private "_g";
_g = [getMarkerPos "ps1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps1", 500, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps2", 800, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps1", 800, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps2", 200, 3, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

_g = [getMarkerPos "ps1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "ps1", 600, 4, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;

ADF_fnc_createConvoy = {
	if (WP_convoyStarted) exitWith {}; // double check
	WP_convoyStarted = true; publicVariable "WP_convoyStarted";

	params ["_startPause"];
	private ["_c","_v","_WP"];

	sleep _startPause;
	_c = createGroup EAST;
	_v = [getMarkerPos "mConvoy_Spawn", markerDir "mConvoy_Spawn", "O_APC_Wheeled_02_rcws_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_1 = _v select 0; 
	_v = [(trptConvoy_1 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_2 = _v select 0;
	_v = [(trptConvoy_2 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_ammo_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_3 = _v select 0;
	_v = [(trptConvoy_3 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_repair_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_4 = _v select 0;
	_c setCombatMode "GREEN";
	_wp = _c addWaypoint [getMarkerPos "mConvoy_1",0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_2",1]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_3",2]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_4",3]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_5",4]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_end",5]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "[[trptConvoy_1,trptConvoy_2,trptConvoy_3,trptConvoy_4]] call ADF_fnc_DeleteVehicles", ""];

	while {!(isNil "trptConvoy_1")} do {
		trptConvoy_1 limitSpeed 30;		
		trptConvoy_2 limitSpeed (speed trptConvoy_1);
		trptConvoy_3 limitSpeed (speed trptConvoy_1);
		trptConvoy_4 limitSpeed (speed trptConvoy_1);	
		sleep .5;
	};
};

ADF_msg_rv = {
	if (!WP_convoyStarted) then {[450] spawn ADF_fnc_createConvoy};
	if (isServer && (!isNil "nikos_1")) then {deleteVehicle nikos_1};
};

ADF_msg_niko = {
	if (!WP_convoyStarted) then {[120] spawn ADF_fnc_createConvoy};
	remoteExec ["ADF_fnc_niko",2,false];	
};

ADF_init_AO = true; publicVariable "ADF_init_AO";
