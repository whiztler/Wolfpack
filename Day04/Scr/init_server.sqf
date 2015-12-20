diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

[vWolf_1] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
[vWolf_2] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";

// Generators
gen_1 addEventHandler ["killed", {[] call ADF_fnc_objABC}];
gen_2 addEventHandler ["killed", {[] call ADF_fnc_objABC}];
gen_3 addEventHandler ["killed", {[] call ADF_fnc_objABC}];
gen_4 addEventHandler ["killed", {[] call ADF_fnc_objABC}];
gen_5 addEventHandler ["killed", {[] call ADF_fnc_objABC}];
gen_6 addEventHandler ["killed", {[] call ADF_fnc_objABC}];
gen_10 addEventHandler ["killed", {[] call ADF_fnc_objCharkia}];
gen_11 addEventHandler ["killed", {[] call ADF_fnc_objCharkia}];

ADF_fnc_objABC = { 
	if ((alive gen_1) || (alive gen_2) || (alive gen_3) || (alive gen_4) || (alive gen_5) || (alive gen_6)) exitWith {};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: ABC generators detroyed";diag_log "-----------------------------------------------------";
	private ["_wait1","_wait2"];
	_wait1 = ((random 40) + (random 40));
	_wait2 = ((random 100) + (random 100));	
	[_wait1,_wait2] remoteExec ["ADF_msg_ABC_demo",0,false];
};

ADF_fnc_objCharkia = { 
	if ((alive gen_10) || (alive gen_11)) exitWith {};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Charkia generators detroyed";diag_log "-----------------------------------------------------";
	remoteExec ["ADF_msg_charkia_demo",0,false];
};

ADF_msg_nikos = {
	deleteMarker "mP12";
	if (!isNil "vWolf_1") then {deleteVehicle vWolf_1};
	if (!isNil "vWolf_2") then {deleteVehicle vWolf_2};
	if (!isNil "tNkkos") then {deleteVehicle tNkkos};
};

ADF_fnc_p12 = {
	private ["_g","_p"];
	_g = CreateGroup CIVILIAN;
	_p = _g createUnit ["C_Nikos",getMarkerPos "rc1_Nikkos",[],0,"MAJOR"]; _p setDir 10; _p addVest "V_BandollierB_oli"; [_p, "arifle_TRG21_GL_MRCO_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
	_g = CreateGroup CIVILIAN;	
	_p = _g createUnit ["C_man_p_fugitive_F",getMarkerPos "rc1_1",[],0,"CORPORAL"]; _p addVest "V_BandollierB_oli"; _p setDir 280; _p addWeapon "LMG_Zafir_pointer_F"; sleep .05; 
	_p = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc1_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 90; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
	_p = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc1_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 100; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .2; 
	_g = CreateGroup CIVILIAN;
	_p = _g createUnit ["C_man_p_fugitive_F",getMarkerPos "rc1_2",[],0,"CORPORAL"]; _p addVest "V_BandollierB_oli"; _p setDir 280; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
	_p = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc1_2",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 90; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
	_p = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc1_2",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 100; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
	if (!isNil "tP12") then {deleteVehicle tP12};
};

ADF_msg_rv = {
	if (!isNil "tRV") then {deleteVehicle tRV};
	deleteMarker "mBrief0";
};

ADF_msg_ABC_ao = {
	if (!isNil "tABCao") then {deleteVehicle tABCao};
	if (!isNil "blueDetect3") then {deleteVehicle blueDetect3};
	if (!isNil "tFP1") then {deleteVehicle tFP1};
	if (!isNil "tCities1") then {deleteVehicle tCities1};
	if (!isNil "tFP2") then {deleteVehicle tFP2};
	if (!isNil "tCities2") then {deleteVehicle tCities2};
	if (!isNil "tFP3") then {deleteVehicle tFP3};
	if (!isNil "tFP5") then {deleteVehicle tFP5};
	if (!isNil "tFP4") then {deleteVehicle tFP4};
	if (!isNil "tCities3") then {deleteVehicle tCities3};
	if (!isNil "tCities3") then {deleteVehicle trigRCamp_2};
	
	// Cleanup Camp2
	_q = nearestObjects [getMarkerPos "rc2_1", ["all"], 50];
	{deleteVehicle _x} forEach _q;
	
	//[20] spawn ADF_fnc_createConvoy;
};

ADF_msg_ABC_demo = {
	params ["_wait1","_wait2"];
	private "_m";
	deleteMarker"mABC";

	_m = createMarker ["exfil1", [16079.3,11417.9,5]];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "SYDNEY";
	
	if (MotsActive || ADF_debug) then {sleep 10} else {sleep _wait1};
	
	deleteMarker "exfil1";
	
	if (MotsActive || ADF_debug) then {sleep 10} else {sleep _wait2};
	
	_m = createMarker ["mABC2", [18330,15521,48]];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorEAST";
	_m setMarkerDir 0;
	_m setMarkerText "ABC Gen";
};

ADF_msg_charkia_demo = {
	private "_m";
	_m = createMarker ["mRomeo", getPos exfilLoc];
	_m setMarkerSize [.7, .7];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "ROMEO";

	deleteMarker "mABC2";
};

ADF_msg_dimitri = {
	rvDone = true;
	private "_m";
	_m = createMarker ["mP12", getPos tP12];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorWEST";
	_m setMarkerText " P12";
	_m setMarkerDir 0;

	{deleteMarker _x} forEach ["mRVzulu", "mRVhotel", "mRValpha"];
	if (!isNil "tDimitri") then {deleteVehicle tDimitri};

	sleep 20;

	private "_wp";
	_wp = gDimitri addWaypoint [getPos qb1, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "COLUMN";
	_wp setWaypointStatements ["true", "Dimitri moveInDriver qb1;"];
	_wp = gDimitri addWaypoint [getMarkerPos "mDim", 1];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle qb1) + [(vehicle qb1)];"];
};

ADF_fnc_livadi = {
	private ["_g","_p"];
	_g = CreateGroup CIVILIAN;	
	_p = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc2_1",[],0,"CORPORAL"]; _p addVest "V_BandollierB_oli"; _p setDir 280; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
	_p = _g createUnit ["C_man_p_fugitive_F",getMarkerPos "rc2_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 90; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
	_p = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc2_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 100; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon;

	// Cleanup P12
	private "_q";
	_q = nearestObjects [getMarkerPos "rc1_Nikkos", ["all"], 50];
	{deleteVehicle _x} forEach _q;
	if (!isNil "tLivadi") then {deleteVehicle tLivadi};
};

ADF_fnc_DeleteVehicles = {
	private ["_vehToDelete"];
	_vehToDelete = _this select 0;	
	{
		{deleteVehicle _x} forEach crew (vehicle _x) + [(vehicle _x)];
	} forEach _vehToDelete;
	true
};

ADF_fnc_exfil = {
	ADF_endMission = true; publicVariable "ADF_endMission";
	waitUntil {sleep 1; ADF_launchCondor};

	private ["_c","_wolfAlive","_wp1","_v1","_v2","_wp2","_wp3"];
	_wolfAlive = {alive _x} count (allPlayers - entities "HeadlessClient_F");

	// Create Condor
	_c = createGroup WEST;
	if 	(_wolfAlive <= 8) then {
		_v = [getMarkerPos "mC1", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
		vCondor1 = _v select 0;
		vCondor1 allowDamage False;
		vCondor1 setCaptive true;
		vCondor1 flyInHeight 10;
		
		_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
		_wp1 setWaypointType "MOVE";
		_wp1 setWaypointBehaviour "SAFE";
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointStatements ["true", "vCondor1 flyInHeight 10;"];
	} else {
		_v1 = [getMarkerPos "mC1", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle; sleep 10;
		vCondor1 = _v1 select 0;
		_v2 = [getMarkerPos "mC1", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
		vCondor2 = _v2 select 0;
		{_x allowDamage False; _x setCaptive true; _x flyInHeight 10} forEach [vCondor1,vCondor2];
		
		_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
		_wp1 setWaypointType "MOVE";
		_wp1 setWaypointBehaviour "SAFE";
		_wp1 setWaypointSpeed "FULL";
		_wp1 setWaypointStatements ["true", "vCondor1 flyInHeight 10;vCondor2 flyInHeight 10;"];
	};
	
	_wp2 = _c addWaypoint [getMarkerPos "mC3", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "NORMAL";
	_wp2 setWaypointCombatMode "Green";
	_wp2 setWaypointStatements ["true", "if (hasInterface) then {['SOAR','Condor','Condor: Rattler please pop smoke or a chemlight to mark the LZ.'] call ADF_fnc_MessageParser};"];
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	
	if (_wolfAlive <= 8) then {
		_wp3 = _c addWaypoint [getPos exfilLoc, 0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointBehaviour "SAFE";
		_wp3 setWaypointSpeed "normal";
		_wp3 setWaypointCombatMode "Green";
		_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';if (hasInterface) then {['SOAR','Condor','160th SOAR Lt. Gimpel: Dusting off in 30 seconds.'] call ADF_fnc_MessageParser};"];	

		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
		waitUntil {isTouchingGround vCondor1};  vCondor1 flyInHeight 0;
		wpEnd = true;
		publicVariable "wpEnd";
	} else {
		_wp3 = _c addWaypoint [getPos exfilLoc, 0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointBehaviour "SAFE";
		_wp3 setWaypointSpeed "normal";
		_wp3 setWaypointCombatMode "Green";
		_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';vCondor2 land 'LAND';if (hasInterface) then {['SOAR','Condor','160th SOAR Lt. Gimpel: Dusting off in 30 seconds.'] call ADF_fnc_MessageParser};"];	

		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
		waitUntil {isTouchingGround vCondor1}; vCondor1 flyInHeight 0;
		waitUntil {isTouchingGround vCondor2}; vCondor2 flyInHeight 0;
		wpEnd = true;
		publicVariable "wpEnd";
	};
};

ADF_fnc_createConvoy = {
	if (WP_convoyStarted) exitWith {}; // double check
	WP_convoyStarted = true; publicVariable "WP_convoyStarted";

	params ["_startPause"];
	private ["_c","_v","_WP"];

	sleep _startPause;
	_c = createGroup EAST;
	_c setCombatMode "GREEN";
	_c setFormation "COLUMN";
	 c setSpeedMode "LIMITED";
	_c setBehaviour "CARELESS";
	_wp = _c addWaypoint [getMarkerPos "mConvoy_1",0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointCompletionRadius 20; _wp setWaypointFormation "COLUMN";
	_wp = _c addWaypoint [getMarkerPos "mConvoy_2",1]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_3",2]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_4",3]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_5",4]; _wp setWaypointType "MOVE"; _wp setWaypointCompletionRadius 20;
	_wp = _c addWaypoint [getMarkerPos "mConvoy_end",5]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "[[trptConvoy_1,trptConvoy_2,trptConvoy_3,trptConvoy_4,trptConvoy_5,trptConvoy_6,trptConvoy_7,trptConvoy_8,trptConvoy_9,trptConvoy_10]] call ADF_fnc_DeleteVehicles"];
	
	_v = [getMarkerPos "mConvoy_Spawn", markerDir "mConvoy_Spawn", "O_APC_Wheeled_02_rcws_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_1 = _v select 0; sleep 1;	
	_v = [(trptConvoy_1 modelToWorld [0,-15,0]), markerDir "mConvoy_Spawn", "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_2 = _v select 0; trptConvoy_2 allowDamage false; sleep 1;
	_v = [(trptConvoy_2 modelToWorld [0,-15,0]), markerDir "mConvoy_Spawn", "O_Truck_03_ammo_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_3 = _v select 0; trptConvoy_3 allowDamage false; sleep 1;
	_v = [(trptConvoy_3 modelToWorld [0,-15,0]), markerDir "mConvoy_Spawn", "O_Truck_03_repair_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_4 = _v select 0; trptConvoy_4 allowDamage false; sleep 1;
	_v = [(trptConvoy_4 modelToWorld [0,-17,0]), markerDir "mConvoy_Spawn", "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_5 = _v select 0; trptConvoy_5 allowDamage false; sleep 1;
	_v = [(trptConvoy_5 modelToWorld [0,-17,0]), markerDir "mConvoy_Spawn", "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_6 = _v select 0; trptConvoy_6 allowDamage false; sleep 1;
	_v = [(trptConvoy_6 modelToWorld [0,-17,0]), markerDir "mConvoy_Spawn", "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_7 = _v select 0; trptConvoy_7 allowDamage false; sleep 1;
	_v = [(trptConvoy_7 modelToWorld [0,-19,0]), markerDir "mConvoy_Spawn", "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_8 = _v select 0; trptConvoy_8 allowDamage false; sleep 1;
	_v = [(trptConvoy_8 modelToWorld [0,-19,0]), markerDir "mConvoy_Spawn", "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_9 = _v select 0; trptConvoy_9 allowDamage false; sleep 1;
	_v = [(trptConvoy_9 modelToWorld [0,-19,0]), markerDir "mConvoy_Spawn", "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_10 = _v select 0; trptConvoy_10 allowDamage false; 
	{_x allowDamage true;} forEach [trptConvoy_2, trptConvoy_3, trptConvoy_4, trptConvoy_5, trptConvoy_6, trptConvoy_7, trptConvoy_8,  trptConvoy_9, trptConvoy_10];

	while {!(isNil "trptConvoy_1")} do {
		trptConvoy_1 limitSpeed 45;
		{_x limitSpeed (speed trptConvoy_1);} forEach [trptConvoy_2, trptConvoy_3, trptConvoy_4, trptConvoy_5, trptConvoy_6, trptConvoy_7,	trptConvoy_8,	 trptConvoy_9, trptConvoy_10];
		sleep 0.5;
	};
};

ADF_init_AO = true; publicVariable "ADF_init_AO";