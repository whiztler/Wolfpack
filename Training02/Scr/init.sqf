execVM "Scr\loadout.sqf"; // Loadout for Wolfpack training missions
execVM "Scr\timer.sqf"; // Time in minutes, prep time in minutes (max. 15 min)

player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

bDect = 0;
_g	= [];
_p	= [];
_c	= [];
_v	= [];

ADF_fnc_MDEVteleport = {
	openMap true; sleep .5;
	hintSilent format ["%1, click on a location on the map to teleport...", name vehicle player];
	onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true; openMap false; hint format [""%1, you are now at: %2"", name vehicle player, getPosATL player];";
};

if !(isNil "mdev") then {mdev addAction ["<t align='left' color='#F7D358'>Teleport</t>",ADF_fnc_MDEVteleport];};

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Armored conv
_g = [getMarkerPos "arm_spawn", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Armored" >> "OIA_TankSection")] call BIS_fnc_spawnGroup;
_wp = _g addWaypoint [getMarkerPos "arm_1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointFormation "COLUMN";
_wp = _g addWaypoint [getMarkerPos "arm_2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointFormation "COLUMN";
_wp = _g addWaypoint [getMarkerPos "arm_3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointFormation "COLUMN";
_wp = _g addWaypoint [getMarkerPos "arm_4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointFormation "COLUMN";
_wp = _g addWaypoint [getMarkerPos "arm_5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointFormation "COLUMN";
_wp = _g addWaypoint [getMarkerPos "arm_6", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL"; _wp setWaypointFormation "COLUMN";

// EI patrols
for "_i" from 1 to 18 do {
	private ["_spawnPos"];
	_spawnPos = format ["mIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 800, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
	sleep 0.035;
};		

// Vehicle patrols
selectVehPool = {
	_vPoolArray = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_Truck_02_covered_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F","O_Truck_02_medical_F","O_Truck_03_medical_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_vPoolArray;
 };

for "_i" from 1 to 7 do {
	_c = createGroup EAST;
	_vPool = call selectVehPool;
	private ["_spawnPos"];
	_spawnPos = format ["mVP_%1",_i];	
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	[_c, getmarkerpos _spawnPos, 2500, 7, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
	sleep 0.035;
};	

// CP's
for "_i" from 1 to 7 do {
	private ["_spawnPos"];
	_spawnPos = format ["mCP_%1",_i];	
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 50, 2, true] call CBA_fnc_taskDefend;
	sleep 0.035;
};		
// CP Static Positions
_g = CreateGroup EAST;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"SERGEANT"]; _p assignAsGunner oStat_30; _p moveInGunner oStat_30; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"CORPORAL"]; _p assignAsGunner oStat_31; _p moveInGunner oStat_31; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_32; _p moveInGunner oStat_32; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_33; _p moveInGunner oStat_33; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_34; _p moveInGunner oStat_34; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_35; _p moveInGunner oStat_35; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_36; _p moveInGunner oStat_36; sleep 0.035;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_36; _p moveInGunner oStat_36; sleep 0.035;
_vPos = ["mOStat_37-1","mOStat_37-2","mOStat_37-3","mOStat_37-4"] call BIS_fnc_selectRandom;
oStat_37 setPos (getMarkerPos _vPos);
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_37; _p moveInGunner oStat_37; sleep 0.035;
_vPos = ["mOStat_38-1","mOStat_38-2","mOStat_38-3"] call BIS_fnc_selectRandom;
oStat_38 setPos (getMarkerPos _vPos);
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_38; _p moveInGunner oStat_38; sleep 0.035;
_vPos = ["mOStat_39-1","mOStat_39-2","mOStat_39-3"] call BIS_fnc_selectRandom;
oStat_39 setPos (getMarkerPos _vPos);
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mAOborder",[],0,"PRIVATE"]; _p assignAsGunner oStat_39; _p moveInGunner oStat_39; sleep 0.035;

// Sniper Teams
for "_i" from 1 to 3 do {
	private ["_spawnPos"];
	_spawnPos = format ["mST_%1",_i];	
	_g = CreateGroup EAST;
	_p = _g createUnit ["O_sniper_F",getMarkerPos _spawnPos,[],0,"SERGEANT"]; _p setUnitPos "DOWN"; _p setUnitPos "DOWN";
	_p = _g createUnit ["O_spotter_F",getMarkerPos _spawnPos,[],0,"CORPORAL"]; _p setUnitPos "DOWN"; _p setUnitPos "DOWN";
	_g setCombatMode "RED";
	_c setBehaviour "STEALTH";
};

waitUntil {time > 400};

// Randomized Ambient fly-by's
[] spawn {
	waitUntil {
		_startPos = ["mJet1a","mJet1b","mJet1c","mJet1d","mJet1e"] call BIS_fnc_selectRandom;
		_endPos = ["mJet2a","mJet2b","mJet2c","mJet2d","mJet2e"] call BIS_fnc_selectRandom;
		_pause = [360,600,1200,1800] call BIS_fnc_selectRandom;
		_pauseShort = [10,15,30,50] call BIS_fnc_selectRandom;
		_alt = [30,50,150,200,250,300,350] call BIS_fnc_selectRandom;
		_type = ["O_Plane_CAS_02_F","O_Heli_Attack_02_black_F","O_Heli_Light_02_F","O_Heli_Transport_04_bench_black_F","O_Heli_Transport_04_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;		
		[getMarkerPos _startPos, getMarkerPos _endPos, _alt, "FULL", _type, EAST] call BIS_fnc_ambientFlyby; sleep _pauseShort;
		_alt = [30,50,150,200,250,300,350] call BIS_fnc_selectRandom;
		[getMarkerPos _startPos, getMarkerPos _endPos, _alt, "FULL", _type, EAST] call BIS_fnc_ambientFlyby;
		sleep _pause;
		false
	};
};

waitUntil {time > 600};

// Air Patrols	
_c = createGroup EAST; 
_v = [getMarkerPos "mAOborder", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
_ap1 = _v select 0;
_ap1 flyInHeight 25;
_c setCombatMode "GREEN";
_c setBehaviour "SAFE";
_ap1 setPilotLight true;
[_c, getmarkerpos "mAOborder", 5000, 6, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;

if (ADF_debug) then {[EAST,"OFF"] call ADF_fnc_debugMarkers}; // Side, Labels "ON"/"OFF"