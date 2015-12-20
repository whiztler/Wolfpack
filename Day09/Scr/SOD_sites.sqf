// Spawn on Demand
// Sites, 500 radius

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server
params ["_t"];

// 1
if ((isNil "gS1a") && (isNil "gS1b") && (isNil "gS1c") && (_t == "1A")) exitWith {
	gS1a = [getPos tSites1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS1a, getPos tSites1, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS1b = [getPos tSites1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS1b, getPos tSites1, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS1c = [getPos tSites1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[gS1c, getPos tSites1, 200, 3, true] call ADF_fnc_defendArea;
};
if (_t == "1B") exitWith {
	if !(isNil "gS1a") then {{deleteVehicle _x} forEach units gS1a; deleteGroup gS1a; gS1a = nil}; sleep 0.05;
	if !(isNil "gS1b") then {{deleteVehicle _x} forEach units gS1b; deleteGroup gS1b; gS1b = nil}; sleep 0.05;
	if !(isNil "gS1c") then {{deleteVehicle _x} forEach units gS1c; deleteGroup gS1c; gS1c = nil}; sleep 0.05;
};

// 2 
if ((isNil "gS2a") && (isNil "gS2b") && (isNil "gS2c") && (_t == "2A")) exitWith {
	gS2a = [getPos tSites2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS2a, getPos tSites2, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS2b = [getPos tSites2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS2b, getPos tSites2, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS2c = [getPos tSites2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[gS2c, getPos tSites2, 500, 3, true] call ADF_fnc_defendArea;
};
if (_t == "2B") exitWith {
	if !(isNil "gS2a") then {{deleteVehicle _x} forEach units gS2a; deleteGroup gS2a; gS2a = nil}; sleep 0.05;
	if !(isNil "gS2b") then {{deleteVehicle _x} forEach units gS2b; deleteGroup gS2b; gS2b = nil}; sleep 0.05;
	if !(isNil "gS2c") then {{deleteVehicle _x} forEach units gS2c; deleteGroup gS2c; gS2c = nil};
};

// 3 
if ((isNil "gS3a") && (isNil "gS3b") && (isNil "gS3c") && (_t == "3A")) exitWith {
	gS3a = [getPos tSites3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS3a, getPos tSites3, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS3b = [getPos tSites3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS3b, getPos tSites3, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS3c = [getPos tSites3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[gS3c, getPos tSites3, 300, 3, true] call ADF_fnc_defendArea;
};
if (_t == "3B") exitWith {
	if !(isNil "gS3a") then {{deleteVehicle _x} forEach units gS3a; deleteGroup gS3a; gS3a = nil}; sleep 0.05;
	if !(isNil "gS3b") then {{deleteVehicle _x} forEach units gS3b; deleteGroup gS3b; gS3b = nil}; sleep 0.05;
	if !(isNil "gS3c") then {{deleteVehicle _x} forEach units gS3c; deleteGroup gS3c; gS3c = nil};	
};

// 4
if ((isNil "gS4a") && (isNil "gS4b") && (_t == "4A")) exitWith {
	gS4a = [getPos tSites4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS4a, getPos tSites4, 300, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS4b = [getPos tSites4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup; 
	[gS4b, getPos tSites4, 300, 3, true] call ADF_fnc_defendArea; sleep 0.05;
};
if (_t == "4B") exitWith {
	if !(isNil "gS4a") then {{deleteVehicle _x} forEach units gS4a; deleteGroup gS4a; gS4a = nil}; sleep 0.05;
	if !(isNil "gS4b") then {{deleteVehicle _x} forEach units gS4b; deleteGroup gS4b; gS4b = nil}; sleep 0.05;	
};

// 5
if ((isNil "gS5a") && (isNil "gS5b") && (isNil "gS5c") && (_t == "5A")) exitWith {
	gS5a = [getPos tSites5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	[gS5a, getPos tSites5, 350, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS5b = [getPos tSites5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconPatrol")] call BIS_fnc_spawnGroup;
	[gS5b, getPos tSites5, 500, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS5c = [getPos tSites5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_reconPatrol")] call BIS_fnc_spawnGroup;
	[gS5c, getPos tSites5, 800, 5, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
};
if (_t == "5B") exitWith {
	if !(isNil "gS5a") then {{deleteVehicle _x} forEach units gS5a; deleteGroup gS5a; gS5a = nil}; sleep 0.05;
	if !(isNil "gS5b") then {{deleteVehicle _x} forEach units gS5b; deleteGroup gS5b; gS5b = nil}; sleep 0.05;	
	if !(isNil "gS5c") then {{deleteVehicle _x} forEach units gS5c; deleteGroup gS5c; gS5c = nil}; sleep 0.05;	
};

// 6
if ((isNil "gS6a") && (isNil "gS6b") && (isNil "gS6c") && (_t == "6A")) exitWith {
	gS6a = [getMarkerPos "site6a", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gS6a, getMarkerPos "site6a", 75, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS6b = [getMarkerPos "site6b", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[gS6b, getMarkerPos "site6b", 60, 3, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5, true] call ADF_fnc_footPatrol;
	gS6c = CreateGroup EAST; 
	_p = gS6c createUnit ["O_Soldier_F",getMarkerPos "site6b",[],0,"CAPTAIN"]; _p moveInGunner site6_AA;
	_p = gS6c createUnit ["O_Soldier_F",getMarkerPos "site6b",[],0,"PRIVATE"]; _p moveInGunner site6_MG1;
	_p = gS6c createUnit ["O_Soldier_F",getMarkerPos "site6b",[],0,"PRIVATE"]; _p moveInGunner site6_MG2;
	_p = gS6c createUnit ["O_Soldier_F",getMarkerPos "site6b",[],0,"PRIVATE"]; _p moveInGunner site6_MG3;
	
};
if (_t == "6B") exitWith {
	if !(isNil "gS6a") then {{deleteVehicle _x} forEach units gS6a; deleteGroup gS6a; gS6a = nil}; sleep 0.05;
	if !(isNil "gS6b") then {{deleteVehicle _x} forEach units gS6b; deleteGroup gS6b; gS6b = nil}; sleep 0.05;	
	if !(isNil "gS6c") then {{deleteVehicle _x} forEach units gS6c; deleteGroup gS6c; gS6c = nil}; sleep 0.05;	
};

// T100 Crew
if ((isNil "gS7a") && (_t == "7A")) exitWith {
	if !(alive T100_1 || alive T100_2) exitWith {};
	T100_crew_breakout = false;
	T100_1 setFuel 1; T100_2 setFuel 1;
	
	// init arti
	[] spawn {
		private ["_pause"];
		for "_i" from 1 to 10 do {
			oArti1 doArtilleryFire [getMarkerPos "mArtiTarget", "32Rnd_155mm_Mo_shells", 3];
			_pause = [10,20,30,45,60,120] call BIS_fnc_selectRandom;
			(effectiveCommander oArti1) doTarget artiTarget;
			if (T100_crew_breakout) exitWith {};
			(effectiveCommander oArti1) doWatch artiTarget;
			(gunner oArti1) doWatch artiTarget;
			sleep _pause;
			oArti1 setVehicleAmmo 1;	
		};
	};
	sleep 2;
	[] spawn {
		private ["_pause"];
		for "_i" from 1 to 10 do {
			oArti2 doArtilleryFire [getMarkerPos "mArtiTarget", "32Rnd_155mm_Mo_shells", 3];
			_pause = [10,20,30,45,60,120] call BIS_fnc_selectRandom;
			(effectiveCommander oArti2) doTarget artiTarget;
			if (T100_crew_breakout) exitWith {};
			(effectiveCommander oArti2) doWatch artiTarget;
			(gunner oArti2) doWatch artiTarget;
			sleep _pause;
			oArti2 setVehicleAmmo 1;	
		};
	};
	sleep 2;
	[] spawn {
		private ["_pause"];
		for "_i" from 1 to 10 do {
			oArti3 doArtilleryFire [getMarkerPos "mArtiTarget", "32Rnd_155mm_Mo_shells", 3];
			_pause = [10,20,30,45,60,120] call BIS_fnc_selectRandom;
			(effectiveCommander oArti3) doTarget artiTarget;
			if (T100_crew_breakout) exitWith {};
			(effectiveCommander oArti3) doWatch artiTarget;
			(gunner oArti3) doWatch artiTarget;
			sleep _pause;
			oArti3 setVehicleAmmo 1;	
		};
	};
	
	gS7a = CreateGroup EAST; 
	// tank1
	_p1 = gS7a createUnit ["O_crew_F",getPos tT100Crew,[],0,"CAPTAIN"];
	_p2 = gS7a createUnit ["O_crew_F",getPos tT100Crew,[],0,"CORPORAL"];
	_p3 = gS7a createUnit ["O_crew_F",getPos tT100Crew,[],0,"PRIVATE"];
	// tank2
	_p4 = gS7a createUnit ["O_crew_F",getPos tT100Crew,[],0,"LIEUTENANT"];
	_p5 = gS7a createUnit ["O_crew_F",getPos tT100Crew,[],0,"CORPORAL"];
	_p6 = gS7a createUnit ["O_crew_F",getPos tT100Crew,[],0,"PRIVATE"];	
	
	gS7a setCombatMode "GREEN"; gS7a setBehaviour "SAFE";
	
	_snooze = [60,70,80,90,120,180,240,300] call BIS_fnc_selectRandom;
	sleep _snooze;
	//sleep 10; // debug
	
	_p1 moveInCommander T100_1; _p2 moveInGunner T100_1; _p3 moveInDriver T100_1;
	_p4 moveInCommander T100_2; _p5 moveInGunner T100_2; _p6 moveInDriver T100_2;
	T100_1 setFuel 1; T100_2 setFuel 1;
	gS7a lockWP false;
	
	//Patrol	
	_wp1 = gS7a addWaypoint [(getMarkerPos "mT100_1"), 0]; _wp1 setWaypointType "MOVE"; _wp1 setWaypointSpeed "LIMITED"; 
	_wp1 setWaypointFormation "COLUMN"; _wp1 setWaypointCombatMode "GREEN"; [gS7a,1] setWaypointCompletionRadius 15;
	_wp2 = gS7a addWaypoint [(getMarkerPos "mT100_2"), 0]; _wp2 setWaypointType "MOVE"; _wp2 setWaypointSpeed "LIMITED";
	_wp3 = gS7a addWaypoint [(getMarkerPos "mT100_3"), 0]; _wp3 setWaypointType "MOVE"; _wp3 setWaypointSpeed "LIMITED";
	_wp4 = gS7a addWaypoint [(getMarkerPos "mT100_4"), 0]; _wp4 setWaypointType "MOVE"; _wp4 setWaypointSpeed "LIMITED";
	_wp5 = gS7a addWaypoint [(getMarkerPos "mT100_5"), 0]; _wp5 setWaypointType "MOVE"; _wp5 setWaypointSpeed "LIMITED";
};
if (_t == "7B") exitWith {
	gS7a lockWP true;
	(units gS7a) doMove (getPos tT100Crew);
	waitUntil {unitReady (leader gS7a)};
	sleep 5;
	T100_1 setFuel 0; T100_2 setFuel 0;
	T100_1 lock 3; T100_2 lock 3;
	if !(isNil "gS7a") then {{deleteVehicle _x} forEach units gS7a; deleteGroup gS7a; gS7a = nil};
};