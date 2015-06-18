ADF_joined = false;
#include "ADF_JIP.sqf"
waitUntil {ADF_joined};

execVM "Scr\tasks.sqf";

player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

{	
	if (_x isKindOf "man" && side _x == WEST) then {
		[_x,"CLANPATCH"] call BIS_fnc_setUnitInsignia;
	};
} forEach allUnits;

removeHeadgear player;
_WPheadGear = ["H_Watchcap_camo","H_Watchcap_blk","H_Cap_usblack","H_Bandanna_gry","H_Beret_blk"] call BIS_fnc_selectRandom;
player addHeadgear _WPheadGear;

// (re-apply) SOR uniform texture
if ((typeOf player) IN ["B_recon_F","B_recon_LAT_F","B_recon_exp_F","B_recon_medic_F","B_recon_TL_F","B_recon_M_F","B_recon_JTAC_F"]) then {
	[player] spawn {
		ADF_sorUnits = [];		
		// Check if the SOR groups are populated/exist and add to ADF_sorUnits array
		if !(isNil "gCO_4") then {ADF_sorUnits pushBack gCO_4};
		if !(isNil "gCO_41M") then {ADF_sorUnits pushBack gCO_41M};
		if !(isNil "gCO_41R") then {ADF_sorUnits pushBack gCO_41R};
		if !(isNil "gCO_41Y") then {ADF_sorUnits pushBack gCO_41Y};
		if !(isNil "gCO_41Z") then {ADF_sorUnits pushBack gCO_41Z};			
	
		waitUntil {time > 10};
		
		player setObjectTexture [0, "\A3\Characters_F\Common\Data\basicbody_black_co.paa"];
		{
			{			
				_x setObjectTexture [0, "\A3\Characters_F\Common\Data\basicbody_black_co.paa"];
			} forEach units _x;
		} forEach ADF_sorUnits;
	};
};


[] spawn {
	if (isServer || ADF_isHC) exitWith {};
	waitUntil {ADF_missionInit};
	sleep 5;

	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<t color='#A1A4AD' size='17'>Wolfpack W.T.T.</t><br/><br/>
	<font color='#6c7169'>Warmup for a Wolfpack mission<br/><br/>	
	Train your recon skills<br/><br/>
	Test Wolfpack mission mods<br/><br/>
	11 Tasks/Objective<br/>to choose from<br/><br/>
	JIP / Respawn enabled<br/><br/>
	Teleport to Troop Leader at Flagpole<br/><br/>
	Vanilla loadout. Extra kit in crates</font>
	"]];
	
	hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
<t color='#A1A4AD' size='1.7'>Wolfpack W.T.T.</t><br/><br/>
<t color='#6C7169'>Warmup for a<br/>Wolfpack mission</t><br/><br/>	
<t color='#6C7169'>Train your recon skills</t><br/><br/>
<t color='#6C7169'>Test Wolfpack<br/>mission mods</t><br/><br/>
<t color='#6C7169'>11 Tasks/Objective<br/>to choose from</t><br/><br/>
<t color='#6C7169'>JIP / Respawn enabled</t><br/><br/>
<t color='#6C7169'>Teleport to Troop<br/>Leader at Flagpole</t><br/><br/>
<t color='#6C7169'>Vanilla loadout. Extra<br/>kit in crates</t><br/><br/>	
";
};

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

heliActive = false;

//Sea patrol
_c = createGroup EAST;
_p = _c createUnit ["O_Soldier_F",getMarkerPos "mEIP_70",[],0,"CORPORAL"]; _p moveInGunner vPefkas;
_p = _c createUnit ["O_Soldier_F",getMarkerPos "mEIP_70",[],0,"PRIVATE"]; _p moveInDriver vPefkas;
_p = _c createUnit ["O_Soldier_F",getMarkerPos "mEIP_70",[],0,"CAPTAIN"]; _p moveInCommander vPefkas;
_wp = _c addWaypoint [(getMarkerPos "mNP_2"), 0]; _wp setWaypointType "MOVE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [(getMarkerPos "mNP_3"), 0]; _wp setWaypointType "MOVE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [(getMarkerPos "mNP_4"), 0]; _wp setWaypointType "MOVE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [(getMarkerPos "mNP_5"), 0]; _wp setWaypointType "MOVE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [(getMarkerPos "mNP_6"), 0]; _wp setWaypointType "MOVE"; _wp setWaypointSpeed "LIMITED";
_wp = _c addWaypoint [(getMarkerPos "mNP_7"), 0]; _wp setWaypointType "CYCLE"; _wp setWaypointSpeed "LIMITED";

// CP's
for "_i" from 1 to 4 do {
	_g = createGroup EAST;	
	private ["_spawnPos"];
	_spawnPos = format ["mCP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 50, 2, true] call CBA_fnc_taskDefend;
	 sleep 0.035;
};

// EI 2 pax patrols
for "_i" from 1 to 4 do {
	private ["_spawnPos"];
	_spawnPos = format ["mEIP_%1",_i];
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos _spawnPos, 600, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	 sleep 0.035;
};

// Vehicle patrols light
selectVehPoolLight = {
	_vPoolArray = ["O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F"] call BIS_fnc_selectRandom;
	_vPoolArray;
};

// Vehicle patrols Armed
selectVehPoolArm = {
	_vPoolArray = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_vPoolArray;
};

// CSAT Recon UGV team
_g = [getMarkerPos "mEIP_4", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "SpecOps" >> "OI_AttackTeam_UGV")] call BIS_fnc_spawnGroup;
[_g, getMarkerPos "mEIP_4", 2000, 8, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [20,60,120]] call CBA_fnc_taskPatrol;


for "_i" from 1 to 4 do {
	_c = createGroup EAST;
	_vPool = call selectVehPoolLight;
	private ["_spawnPos"];
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
	_v select 0 allowDamage false;
	[_c, getMarkerPos _spawnPos, 3500, 8, "MOVE", "SAFE", "BLUE", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
	 sleep 0.035;
};

for "_i" from 10 to 12 do {
	_c = createGroup EAST;
	_vPool = call selectVehPoolArm;
	private ["_spawnPos"];
	_spawnPos = format ["mEVP_%1",_i];
	_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;	
	[_c, getMarkerPos _spawnPos, 3500, 8, "MOVE", "SAFE", "WHITE", "LIMITED", "", "", [10,40,120]] call CBA_fnc_taskPatrol;
	 sleep 0.035;
};


// Arti
ADF_fnc_WTT_tArti = {
	if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
	_g = CreateGroup EAST; 
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInCommander oArti1;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner oArti1;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInCommander oArti2;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner oArti2;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInCommander oArti3;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner oArti3;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_8;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_9;
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"PRIVATE"]; _p moveInGunner oStat_10;
	// Patrols
	_g = [getMarkerPos "mCP_11", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "mCP_11", 250, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	_g = [getMarkerPos "mCP_11", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "mCP_11", 250, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	// CP
	_g = [getMarkerPos "mCP_11", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "mCP_11", 50, 2, true] call CBA_fnc_taskDefend;	
};

// Airport
ADF_fnc_WTT_tAirpt = {
	_g = CreateGroup EAST; 
	_p = _g createUnit ["O_Soldier_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner oStat_1;
	//EIP
	for "_i" from 20 to 23 do {
		private ["_spawnPos"];
		_spawnPos = format ["mEIP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 600, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	};	
	// CP's
	for "_i" from 20 to 21 do {
		_g = createGroup EAST;	
		private ["_spawnPos"];
		_spawnPos = format ["mCP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 50, 2, true] call CBA_fnc_taskDefend;		
	};
};

// AA-Site
ADF_fnc_WTT_tAA = {
	_g = CreateGroup EAST; 
	_p = _g createUnit ["O_Soldier_F",getPos tAA,[],0,"PRIVATE"]; _p moveInGunner oStat_5;
	_p = _g createUnit ["O_Soldier_F",getPos tAA,[],0,"PRIVATE"]; _p moveInGunner oStat_6;
	_p = _g createUnit ["O_Soldier_F",getPos tAA,[],0,"CAPTAIN"]; _p moveInCommander oStat_7;
	_p = _g createUnit ["O_Soldier_F",getPos tAA,[],0,"CORPORAL"]; _p moveInGunner oStat_7;
	//EIP
	_g = [getPos tAA, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getPos tAA, 50, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	_g = [getPos tAA, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getPos tAA, 125, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;	
	// CP's
	_g = [getMarkerPos "mCP_30", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
};

// Hotel
ADF_fnc_WTT_tHotel = {
	_g = CreateGroup EAST; 
	_p = _g createUnit ["O_Soldier_F",getPos tHotel,[],0,"PRIVATE"]; _p moveInGunner oStat_70;
	_p = _g createUnit ["O_Soldier_F",getPos tHotel,[],0,"PRIVATE"]; _p moveInGunner oStat_71;	
	_p = _g createUnit ["O_Soldier_F",getPos tHotel,[],0,"CORPORAL"]; _p moveInGunner oStat_72;
	//EIP
	for "_i" from 70 to 73 do {
		private ["_spawnPos"];
		_spawnPos = format ["mEIP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 600, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	};
	// CP's
	_g = [getMarkerPos "mCP_70", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;	
	[_g, getMarkerPos "mCP_70", 50, 2, true] call CBA_fnc_taskDefend;
	_g = [getMarkerPos "mCP_71", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;	
	[_g, getMarkerPos "mCP_71", 50, 2, true] call CBA_fnc_taskDefend;
	_g = [getMarkerPos "mCP_72", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad_weapons")] call BIS_fnc_spawnGroup;	
	[_g, getMarkerPos "mCP_72", 50, 2, true] call CBA_fnc_taskDefend;
	for "_i" from 74 to 79 do {
		private ["_spawnPos"];
		_spawnPos = format ["mCP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 70, 2, true] call CBA_fnc_taskDefend;		
	};	
	// HVT
	_g = CreateGroup EAST;
	obj_resort = _g createUnit ["O_officer_F",getMarkerPos "mCP_73",[],0,"COLONEL"];
	[_g, getMarkerPos "mCP_73", 50, 2, true] call CBA_fnc_taskDefend;
};

// Rodo CP
RodoActive = false;
ADF_fnc_WTT_tRodoCP = {
	if (RodoActive) exitWith {};
	RodoActive = true;
	_g = CreateGroup EAST; 
	_p = _g createUnit ["O_Soldier_F",getPos tRodoCP,[],0,"PRIVATE"]; _p moveInGunner oStat_2;
	_p = _g createUnit ["O_Soldier_F",getPos tRodoCP,[],0,"PRIVATE"]; _p moveInGunner oStat_3;		
	//EIP
	_g = [getMarkerPos "mEIP_40", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "mEIP_40", 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	_g = [getMarkerPos "mEIP_41", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "mEIP_41", 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	// CP's
	_g = [getMarkerPos "mCP_40", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
};

// Petros CP
PetrosActive = false;
ADF_fnc_WTT_tPetros = {
	if (PetrosActive) exitWith {};
	PetrosActive = true;
	_g = CreateGroup EAST; 	
	_p = _g createUnit ["O_Soldier_F",getPos tRodoCP,[],0,"PRIVATE"]; _p moveInGunner oStat_4;		
	//EIP
	_g = [getMarkerPos "mEIP_50", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "mEIP_50", 400, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;	
	// CP's
	_g = [getMarkerPos "mCP_50", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
};

// Fuel Depot
ADF_fnc_WTT_tFuelDepot = {
	_g = CreateGroup EAST; 	
	_p = _g createUnit ["O_Soldier_F",getPos tFuelDepot,[],0,"PRIVATE"]; _p moveInGunner oStat_60;
	_p = _g createUnit ["O_Soldier_F",getPos tFuelDepot,[],0,"PRIVATE"]; _p moveInGunner oStat_61;
	_p = _g createUnit ["O_Soldier_F",getPos tFuelDepot,[],0,"PRIVATE"]; _p moveInGunner oStat_62;
	_p = _g createUnit ["O_Soldier_F",getPos tFuelDepot,[],0,"PRIVATE"]; _p moveInGunner oStat_63;
	_p = _g createUnit ["O_Soldier_F",getPos tFuelDepot,[],0,"CAPTAIN"]; _p moveInCommander oStat_63;
	//EIP
	for "_i" from 60 to 62 do {
		private ["_spawnPos"];
		_spawnPos = format ["mEIP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 600, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
	};	
	// CP's
	for "_i" from 60 to 63 do {
		_g = createGroup EAST;	
		private ["_spawnPos"];
		_spawnPos = format ["mCP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 50, 2, true] call CBA_fnc_taskDefend;
	};
};

wp_fnc_airVehicle = {_airVehicle = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;_airVehicle;};

// Outbound HeliSpawn
[] spawn {
	while {!triggerActivated tAirptHeli} do {
		private ["_c","_v","_wp","_pause","_heli","_startPos","_heli"];
		_pause = [300,600,1200,1800] call BIS_fnc_selectRandom;
		_wpx = ["mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_heli = call wp_fnc_airVehicle;
		_c = createGroup EAST;		
		_v = createVehicle [_heli, getPos HeliSpawn, [], 0, "NONE"];
		_v setDir (getDir HeliSpawn);
		_p = _c createUnit ["O_helipilot_F",getPos mSpawn,[],0,"CAPTAIN"]; _p moveInDriver _v select 0;
		//_p = _c createUnit ["O_helicrew_F",getPos mSpawn,[],0,"CORPORAL"]; _p moveInGunner _v select 0;
		_wp = _c addWaypoint [getMarkerPos _wpx, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "FULL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		{deleteVehicle _x} forEach (units _c); deleteGroup _c; deleteVehicle _v;
		sleep _pause;
	};
};

// Randomized Ambient fly-by's
[] spawn {
	while {true} do {
		_startPos = ["mJet1a","mJet1b","mJet1c"] call BIS_fnc_selectRandom;
		_endPos = ["mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_pause = [360,600,1200,2400] call BIS_fnc_selectRandom;
		_alt = [30,50,150,200,250,300,350] call BIS_fnc_selectRandom;
		_type = ["O_Plane_CAS_02_F","O_Heli_Attack_02_black_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;		
		[getMarkerPos _startPos, getMarkerPos _endPos, _alt, "FULL", _type, EAST] call BIS_fnc_ambientFlyby; 		
		sleep 5;		
		[getMarkerPos _startPos, getMarkerPos _endPos, _alt, "FULL", _type, EAST] call BIS_fnc_ambientFlyby;
		sleep _pause;
	};
};

// Inbound 1 HeliSpawn
[] spawn {
	while {true} do {
		if (heliActive) then {
			waitUntil {!heliActive; sleep 12;}
		};
		heliActive = true;
		private ["_c","_v","_wp","_pause","_heli","_startPos"];
		_heli = call wp_fnc_airVehicle;
		_pause = [300,600,900,1200,1800] call BIS_fnc_selectRandom;
		_heli = call wp_fnc_airVehicle;
		sleep _pause;
		_startPos = ["mJet1a","mJet1b","mJet1c","mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;		
		_c = createGroup EAST;		
		_v = [getMarkerPos _startPos, 0, _heli, _c] call BIS_fnc_spawnVehicle;
		v1 = _v select 0;
		_wp = _c addWaypoint [getMarkerPos "mInboundHeli1", 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v1 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v1};
		_pausePad = [60,120,180,240,300,600] call BIS_fnc_selectRandom;
		v1 setFuel 0;
		sleep _pausePad;
		v1 setFuel 1;
		_exitPos = ["mJet1a","mJet1b","mJet1c","mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_wp = _c addWaypoint [getMarkerPos _exitPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		sleep 10;
		if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1; v1 = nil};		
		heliActive = false;
	};
};

// Inbound 2 HeliSpawn
[] spawn {
	while {true} do {
		if (heliActive) then {
			waitUntil {!heliActive; sleep 10;}
		};
		heliActive = true;
		private ["_c","_v","_wp","_pause","_heli","_startPos"];
		_pause = [300,600,900,1200,1800] call BIS_fnc_selectRandom;
		sleep _pause;
		_startPos = ["mJet1a","mJet1b","mJet1c","mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_heli = call wp_fnc_airVehicle;
		_c = createGroup EAST;		
		_v = [getMarkerPos _startPos, 0, _heli, _c] call BIS_fnc_spawnVehicle;	
		v2 = _v select 0;		
		_wp = _c addWaypoint [getPos mInboundHeli2, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v2 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v2};
		_pausePad = [60,120,180,240,300,600] call BIS_fnc_selectRandom;
		v2 setFuel 0;
		sleep _pausePad;
		v2 setFuel 1;
		_exitPos = ["mJet1a","mJet1b","mJet1c","mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_wp = _c addWaypoint [getMarkerPos _exitPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		sleep 10;	
		if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};
		heliActive = false;
	};
};

// Inbound 3 HeliSpawn
[] spawn {
	while {true} do {
		if (heliActive) then {
			waitUntil {!heliActive; sleep 11;}
		};
		heliActive = true;
		private ["_c","_v","_wp","_pause","_heli","_startPos"];
		_pause = [300,600,900,1200,1800] call BIS_fnc_selectRandom;
		sleep _pause;
		_startPos = ["mJet1a","mJet1b","mJet1c","mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_heli = call wp_fnc_airVehicle;
		_c = createGroup EAST;		
		_v = [getMarkerPos _startPos, 0, "O_Heli_Attack_02_F", _c] call BIS_fnc_spawnVehicle;		
		v3 = _v select 0;		
		_wp = _c addWaypoint [getPos mSpawn, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		_wp setWaypointStatements ["true", "v3 land 'LAND';"];	
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		waitUntil {isTouchingGround v3};
		_pausePad = [60,120,180,240,300,600] call BIS_fnc_selectRandom;
		v3 setFuel 0;
		sleep _pausePad;
		v3 setFuel 1;
		_exitPos = ["mJet1a","mJet1b","mJet1c","mAirExit1","mAirExit2","mAirExit3"] call BIS_fnc_selectRandom;
		_wp = _c addWaypoint [getMarkerPos _exitPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed "NORMAL";
		waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
		sleep 10;
		if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3); deleteVehicle v3; v3 = nil};
		heliActive = false;
	};
};		

if (ADF_debug) then {waitUntil {time > 60}; [EAST,"OFF"] call ADF_fnc_debugMarkers;}; // Side, Labels "ON"/"OFF";