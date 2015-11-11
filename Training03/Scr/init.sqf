if (ADF_HC_execute || isServer) then {
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
};

execVM "Scr\loadout.sqf"; // Loadout for Wolfpack training missions
execVM "Scr\timer.sqf";
execVM "Scr\obj.sqf";

if (hasInterface) then {
	player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
	player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
	<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
	The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
	<br/><br/>
	"]];
};

bDect = 0;
spawnDone = false;
obj1Done = false;
obj2Done = false;

ADF_fnc_MDEVteleport = {
	openMap true; sleep .5;
	hintSilent format ["%1, click on a location on the map to teleport...", name vehicle player];
	onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true; openMap false; hint format [""%1, you are now at: %2"", name vehicle player, getPosATL player];";
};

if !(isNil "mdev") then {mdev addAction ["<t align='left' color='#F7D358'>Teleport</t>",ADF_fnc_MDEVteleport];};


if (isServer) then { 
	// Ambient flyby's	
	[getMarkerPos "mAF1", getMarkerPos "mAFx", 15, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;
	[getMarkerPos "mAF2", getMarkerPos "mAFx", 15, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 5;
	[getMarkerPos "mAF3", getMarkerPos "mAFx", 15, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 0.035;
	[getMarkerPos "mAF4", getMarkerPos "mAFx", 15, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby;
};

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Statics
private ["_g","_p"];
_g = CreateGroup EAST;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"SERGEANT"]; _p assignAsGunner oStat_1; _p moveInGunner oStat_1; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"CORPORAL"]; _p assignAsGunner oStat_2; _p moveInGunner oStat_2; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_3; _p moveInGunner oStat_3; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_4; _p moveInGunner oStat_4; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_5; _p moveInGunner oStat_5; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_6; _p moveInGunner oStat_6; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_7; _p moveInGunner oStat_7; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_8; _p moveInGunner oStat_8; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_9; _p moveInGunner oStat_9; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_10; _p moveInGunner oStat_10; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_11; _p moveInGunner oStat_11; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPos mAirLand1,[],0,"PRIVATE"]; _p assignAsGunner oStat_12; _p moveInGunner oStat_12; sleep 1;

// EI patrols
for "_i" from 1 to 15 do {
	private ["_spawnPos","_g"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 800, 5, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
};

// Obj patrols
for "_i" from 21 to 24 do {
	private ["_spawnPos","_g"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 150, 3, "MOVE", "SAFE", "RED", "LIMITED","FILE", 5] call ADF_fnc_footPatrol;
};

selectVehPoolSupport = {
	private "_vPoolArraySup";
	_vPoolArraySup = ["O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_fuel_F","O_Truck_03_device_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","_Truck_03_medical_F","O_Truck_03_repair_F"] call BIS_fnc_selectRandom;
	_vPoolArraySup
};

selectVehPoolPatrol = {
	private "_vPoolArrayPat";
	_vPoolArrayPat = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"] call BIS_fnc_selectRandom;
	_vPoolArrayPat
};

// Vehicle Support Airport
[] spawn {
	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolSupport;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1f", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1g", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1h", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1i", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolSupport;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1i", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1h", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1g", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1f", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolSupport;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1f", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1g", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1h", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1i", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolSupport;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1i", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1h", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1g", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1f", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolSupport;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1f", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1g", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1h", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1i", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	// Vehicle Patrols Airport
	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolPatrol;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolPatrol;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolPatrol;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;

	private ["_c","_pause","_vObject","_v","_wp"];
	_c = createGroup EAST;
	_pause = [10,15,20,30,50,100] call BIS_fnc_selectRandom;
	_vObject = call selectVehPoolPatrol;
	_v = [getMarkerPos "mVehSpawn_1", 0, _vObject, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	_wp = _c addWaypoint [getMarkerPos "mWP_1c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1e", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2a", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2c", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_2d", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1b", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10;
	_wp = _c addWaypoint [getMarkerPos "mWP_1a", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; _wp setWaypointCompletionRadius 10; sleep _pause;
	if (ADF_debug) then {spawnDone = true; publicVariableServer "spawnDone";};
};
	
// Airport Area veh patrols
[] spawn {
	for "_i" from 1 to 5 do {
		private ["_c","_vPool","_v"];
		_c = createGroup EAST;
		_vPool = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F","O_Truck_02_medical_F","O_Truck_03_medical_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;			
		_v = [getMarkerPos "mVehSpawn_2", 0, _vPool, _c] call BIS_fnc_spawnVehicle;
		[_c, getmarkerpos "mVehSpawn_2", 3500, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
		_pause = [15,30,60] call BIS_fnc_selectRandom;
		sleep _pause;
	};
};

// JetSpawn
[] spawn {
	while {!triggerActivated tIAI} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [180,240,600,1200,1800] call BIS_fnc_selectRandom;
		_wpx = ["mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_c = createGroup EAST;		
		_v = createVehicle ["O_Plane_CAS_02_F", getMarkerPos "mJetSpawn", [], 0, "NONE"];
		_v setDir (markerDir "mJetSpawn");
		_p = _c createUnit ["O_Pilot_F",getPos mAirLand1,[],0,"CAPTAIN"]; _p moveInDriver _v select 0; sleep 0.035;			
		_wp = _c addWaypoint [getMarkerPos _wpx, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "FULL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		{deleteVehicle _x} forEach (units _c); deleteGroup _c; deleteVehicle _v;		
		sleep _pause;
	};
};

// Outbound HeliSpawn
[] spawn {
	while {!triggerActivated tIAI} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [180,240,600,1200,1800] call BIS_fnc_selectRandom;
		_wpx = ["mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_c = createGroup EAST;		
		_v = createVehicle ["O_Heli_Light_02_F", getMarkerPos "mHeliSpawn", [], 0, "NONE"];
		_v setDir (markerDir "mHeliSpawn");
		_p = _c createUnit ["O_helipilot_F",getPos mAirLand1,[],0,"CAPTAIN"]; _p moveInDriver _v select 0; sleep 0.035;
		//_p = _c createUnit ["O_helicrew_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner _v select 0; sleep 0.035;
		_wp = _c addWaypoint [getMarkerPos _wpx, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "FULL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		{deleteVehicle _x} forEach (units _c); deleteGroup _c; deleteVehicle _v;
		sleep _pause;
	};
};

// Inbound 1 HeliSpawn
[] spawn {
	while {!triggerActivated tIAI} do {
		private ["_c","_v","_wp","_pause","_wpx","_mAirSpawn"];
		_pause = [180,240,600,1200,1800] call BIS_fnc_selectRandom;
		_mAirSpawn = ["mAirSpawn_1","mAirSpawn_2","mAirSpawn_3","mAirSpawn_4"] call BIS_fnc_selectRandom;
		_c = createGroup EAST;		
		_v = [getMarkerPos _mAirSpawn, 0, "O_Heli_Light_02_F", _c] call BIS_fnc_spawnVehicle;
		v1 = _v select 0;
		_wp = _c addWaypoint [getPos mAirLand1, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v1};
		sleep 20;
		if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1; v1 = nil};		
		sleep _pause;
	};
};

// Inbound 2 HeliSpawn
[] spawn {
	while {!triggerActivated tIAI} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [180,240,600,1200,1800] call BIS_fnc_selectRandom;		
		_mAirSpawn = ["mAirSpawn_1","mAirSpawn_2","mAirSpawn_3","mAirSpawn_4"] call BIS_fnc_selectRandom;
		_c = createGroup EAST;		
		_v = [getMarkerPos _mAirSpawn, 0, "O_Heli_Attack_02_F", _c] call BIS_fnc_spawnVehicle;	
		v2 = _v select 0;		
		_wp = _c addWaypoint [getPos mAirLand2, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v2 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v2};
		sleep 20;		
		if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};		
		sleep _pause;
	};
};

// Inbound 1 JetSpawn
[] spawn {
	while {!triggerActivated tIAI} do {
		private ["_c","_v","_wp","_pause","_wpx"];
		_pause = [180,240,600,1200,1800] call BIS_fnc_selectRandom;
		_mAirSpawn = ["mAirSpawn_1","mAirSpawn_2","mAirSpawn_3","mAirSpawn_4"] call BIS_fnc_selectRandom;
		_c = createGroup EAST;		
		_v = [getMarkerPos _mAirSpawn, 0, "O_Plane_CAS_02_F", _c] call BIS_fnc_spawnVehicle;	
		v3 = _v select 0;		
		_wp = _c addWaypoint [getMarkerPos "mEIP_2", 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v3 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v3};
		sleep 180;		
		if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3); deleteVehicle v3; v3 = nil};		
		sleep _pause;
	};
};

// EI Fortify
for "_i" from 1 to 5 do {
	private ["_spawnPos"];
	_spawnPos = format ["mEIF_%1",_i];	
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfReam")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 75, 2, true] call ADF_fnc_defendArea;
};	
