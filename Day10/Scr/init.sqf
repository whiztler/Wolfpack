player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

wpEnd = false;
wpExfil = false;

sleep 3; // Loadout finished > pri weapon loaded

while {time < 25} do {
	if !(isNil "SOD_SSC_1") then {SOD_SSC_1 assignAsCargo vWolf_1; SOD_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOD_RM_1") then {SOD_RM_1 assignAsDriver vWolf_1; SOD_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
	if !(isNil "SOD_UAV_1") then {SOD_UAV_1 assignAsGunner vWolf_1; SOD_UAV_1 moveInGunner vWolf_1;}; sleep 0.035;
	if !(isNil "SOD_RMM_1") then {SOD_RMM_1 assignAsCargo vWolf_1; SOD_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

	if !(isNil "SOD_ATL_1") then {SOD_ATL_1 assignAsCargo vWolf_2; SOD_ATL_1 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOD_AD_2") then {SOD_AD_2 assignAsDriver vWolf_2; SOD_AD_2 moveInDriver vWolf_2;}; sleep 0.035;
	if !(isNil "SOD_AD_3") then {SOD_AD_3 assignAsGunner vWolf_2; SOD_AD_3 moveInGunner vWolf_2;}; sleep 0.035;
	if !(isNil "SOD_AD_4") then {SOD_AD_4 assignAsCargo vWolf_2; SOD_AD_4 moveInCargo vWolf_2;}; sleep 0.035;
	
	if !(isNil "SOD_ADD_1") then {SOD_ADD_1 assignAsDriver vWolf_3; SOD_ADD_1 moveInDriver vWolf_3;}; sleep 0.035;	
	if !(isNil "SOD_ATL_2") then {SOD_ATL_2 assignAsCargo vWolf_3; SOD_ATL_2 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOD_AD_5") then {SOD_AD_5 assignAsGunner vWolf_3; SOD_AD_5 moveInGunner vWolf_3;}; sleep 0.035;
	if !(isNil "SOD_AD_6") then {SOD_AD_6 assignAsCargo vWolf_3; SOD_AD_6 moveInCargo vWolf_3;}; sleep 0.035;
	
	if !(isNil "SOD_AD_7") then {SOD_AD_7 assignAsDriver vWolf_4; SOD_AD_7 moveInDriver vWolf_4;}; sleep 0.035;
	if !(isNil "SOD_AT_1") then {SOD_AT_1 assignAsGunner vWolf_4; SOD_AT_1 moveInGunner vWolf_4;};	
};

// Naval Patrol
[] spawn {
	if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
		waitUntil {time > 10};
		_bc = createGroup EAST;		
		_v = [getMarkerPos "mNP_1", 0, "O_Boat_Armed_01_hmg_F", _bc] call BIS_fnc_spawnVehicle;
		[_bc, getMarkerPos "mNP_1", 1500] call bis_fnc_taskPatrol;
};

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Caesar</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Nightshade</t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
DEVGRU TOC: </font><font color='#9DA698'>Caesar</font><br/>
<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Nightshade</font>
<br/><br/>"]];
sleep 30;

[] spawn {
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Caesar: Nightshade, head towards the coast. The objective is in Kavala. Nikkos men dropped off supplies at</t>
		<t color='#9DA698' align='left'> RV Helsinki </t>
		<t color='#6C7169' align='left'>in case you need additional dry gear.</t><br/><br/>
		<t color='#6C7169' align='left'>We'll brief you re your mission in a few minutes Nightshade. We're still processing intel we just received from Nikkos.</t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Caesar: Nightshade, head towards the coast. The objective is in Kavala. Nikos men dropped off supplies at</font>
	<font color='#9DA698'> RV Helsinki </font>
	<font color='#6C7169'>in case you need additional dry gear.</font><br/><br/>
	<font color='#6C7169'>We'll brief you re your mission in a few minutes Nightshade. We're still processing intel we just received from Nikos.</font>
	<br/><br/>"]];

	if (isNil "MotsActive") then {sleep 170};

	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Caesar: Nightshade, a few days ago we received intel re General Tehrani's (codename: '</font>
	<font color='#9DA698'>Doberman</font>
	<font color='#6C7169'>') plans to visit Kavala.</font><br/><br/>
	<font color='#6C7169'>Nikos tried to apprehend Doberman's travel itinerary and schedule. Unfortunately he was unsuccessful.</font><br/>
	<font color='#6C7169'>This means we have no intel on his exact location at the moment. We presume Doberman is at one of the CSAT locations in Kavala as marked on your comms device and map.</font><br/><br/>
	<font color='#9DA698'>Your orders are to find and eliminate Doberman.</font>
	<br/><br/>"]];
	for "_i" from 1 to 20 do {
		hintSilent parseText"	
			<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
			<t color='#6C7169' align='left'>Caesar: Nightshade, a few days ago we received intel re General Tehrani's (codename: '</t>
			<t color='#9DA698' align='left'>Doberman</t>
			<t color='#6C7169' align='left'>') plans to visit Kavala.</t><br/><br/>
			<t color='#6C7169' align='left'>Nikos tried to apprehend Doberman's travel itinerary and schedule. Unfortunately he was unsuccessful.</t><br/>
			<t color='#6C7169' align='left'>This means we have no intel on his exact location at the moment. We presume Doberman is at one of the CSAT locations in Kavala as marked on your comms device and map.</t><br/><br/>
			<t color='#9DA698' align='left'>Your orders are to find and eliminate Doberman.</t><br/><br/>
		";
		sleep 1;
	};

	if (isNil "MotsActive") then {sleep 55};

	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Caesar: Nightshade, we are still working on your exfil. We'll advise in due time.</t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Caesar: Nightshade, we are still working on your exfil. We'll advise in due time.</font>
	<br/><br/>"]];
};

if (isServer) then {
	// Gen Tehrani random pos
	_TehraniPos = [desk1,desk2,desk3,desk4,desk5] call BIS_fnc_selectRandom;
	Tehrani setPos (_TehraniPos modelToWorld [1,1,0]);
	Tehrani addMPEventhandler ["MPkilled", {wpExfil = true;publicVariable "wpExfil"}];

	if (ADF_debug) then {
		_m = createMarker ["mTehraniPos", getPos Tehrani]; // setup the marker			
		_m setMarkerShape "ICON";	
		_m setMarkerType "mil_objective";
		_m setMarkerColor "ColorGreen";
	};
};

[] spawn {
	if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

	// EI patrols Country
	for "_i" from 1 to 6 do {
		private ["_spawnPos"];
		_spawnPos = format ["mEIP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 1200, 5, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
		sleep 0.05;
	};

	// EI patrols Cities
	for "_i" from 10 to 17 do {
		private ["_spawnPos"];
		_spawnPos = format ["mEIP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 300, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "", [1,4,7]] call CBA_fnc_taskPatrol;
		sleep 0.05;
	};

	if (ADF_debug) then {[{systemChat "EI patrols spawned"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;};

	// Vehicle patrols
	selectVehPoolCounty = {
		_vPoolArray = ["O_Truck_02_covered_F","O_Truck_03_covered_F","O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","O_Truck_02_ammo_F","O_Truck_03_ammo_F","O_Truck_02_box_F","O_Truck_03_device_F","O_Truck_02_medical_F","O_Truck_03_medical_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
		_vPoolArray;
	};

	for "_i" from 1 to 5 do {
		_c = createGroup EAST;
		_vPool = call selectVehPoolCounty;
		private ["_spawnPos"];
		_spawnPos = format ["mEVP_%1",_i];
		_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
		_v select 0 allowDamage false;
		[_c, getMarkerPos _spawnPos, 2500, 8, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
		sleep 5;
	};

	selectVehPoolCity = {
		_vPoolArray = ["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"] call BIS_fnc_selectRandom;
		_vPoolArray;
	};

	for "_i" from 10 to 15 do {
		_c = createGroup EAST;
		_vPool = call selectVehPoolCity;
		private ["_spawnPos"];
		_spawnPos = format ["mEVP_%1",_i];
		_v = [getMarkerPos _spawnPos, 0, _vPool, _c] call BIS_fnc_spawnVehicle;
		_v select 0 allowDamage false;
		[_c, getMarkerPos _spawnPos, 1000, 5, "MOVE", "SAFE", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
		sleep 5;
	};

	if (ADF_debug) then {[{systemChat "Vehicle patrols spawned"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;};

	// CP'2
	for "_i" from 1 to 7 do {
		_g = createGroup EAST;	
		private ["_spawnPos"];
		_spawnPos = format ["mCP_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 50, 2, true] call CBA_fnc_taskDefend;
		sleep 0.05;
	};

	if (ADF_debug) then {[{systemChat "CP's spawned"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;};

	// Static
	_g = CreateGroup EAST; 
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"SERGEANT"]; _p moveInGunner oStat_1;
	if (ADF_isHC) then {
		_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"CORPORAL"]; _p moveInGunner oStat_2;
		_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_3;
	};
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_4;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_5;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_6;
	if (ADF_isHC) then {
		_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_7;
	};
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_8;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_9;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_10;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_11;
	if (ADF_isHC) then {
		_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oStat_12;
	};
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oAA_1;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oAA_2;
	_p = _g createUnit ["O_Soldier_F",getMarkerPos "csatHQ_5",[],0,"PRIVATE"]; _p moveInGunner oAA_3;

	if (ADF_debug) then {[{systemChat "Static crews spawned"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;};

	// HQ's
	for "_i" from 1 to 5 do {
		_g = createGroup EAST;	
		private ["_spawnPos"];
		_spawnPos = format ["csatHQ_%1",_i];
		_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
		[_g, getMarkerPos _spawnPos, 20, 2, true] call CBA_fnc_taskDefend;
		sleep 0.05;
	};

	if (ADF_debug) then {[{systemChat "HQ's spawned"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;};
	
	// Inbound 1 HeliSpawn
	[] spawn {
		while {!triggerActivated tExfil} do {
			private ["_c","_v","_wp","_pause","_wpx"];
			_pause = [600,900,1200,1800] call BIS_fnc_selectRandom;
			_c = createGroup EAST;		
			_v = [getMarkerPos "mAirSpawn", 0, "O_Heli_Light_02_F", _c] call BIS_fnc_spawnVehicle;
			v1 = _v select 0;
			_wp = _c addWaypoint [getPos mAirLand, 0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointSpeed "NORMAL";
			_wp setWaypointStatements ["true", "v1 land 'LAND';"];	
			waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
			waitUntil {isTouchingGround v1};
			sleep 90;
			if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1); deleteVehicle v1; v1 = nil};		
			sleep _pause;
		};
	};
	
	// Inbound 2 HeliSpawn
	[] spawn {
		while {!triggerActivated tExfil} do {
			private ["_c","_v","_wp","_pause","_wpx"];
			_pause = [600,900,1200,1800] call BIS_fnc_selectRandom;
			_heli = ["O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_covered_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_F"] call BIS_fnc_selectRandom;
			_c = createGroup EAST;		
			_v = [getMarkerPos "mAirSpawn2",0,_heli,_c] call BIS_fnc_spawnVehicle;
			v2 = _v select 0;
			_wp = _c addWaypoint [getPos mAirLand2, 0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointSpeed "NORMAL";
			_wp setWaypointStatements ["true", "v2 land 'LAND';"];	
			waitUntil {(currentWaypoint (_wp select 0)) > (_wp select 1)};
			waitUntil {isTouchingGround v2};
			sleep 90;
			if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2); deleteVehicle v2; v2 = nil};		
			sleep _pause;
		};
	};
	
	if (ADF_debug) then {[{systemChat "Air frames spawned"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;};

	// Debug
	if (ADF_debug) then {[EAST,"OFF"] call ADF_fnc_debugMarkers;}; // Side, Labels "ON"/"OFF"
}; // /spawn

waitUntil {wpExfil};

if (isServer) then {
	_m = createMarker ["mReagan",getMarkerPos "mExfil"];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_end";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText " USS Ronald Reagan";	
};

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Caesar: Excellent work nightshade!</t><br/><br/>
	<t color='#6C7169' align='left'>We've spotted an EVAC helicopter at the Kavala General Hospital helipad. Grab the helicopter and head south towards the USS Ronald Reagan.</t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Caesar: Excellent work nightshade!<br/><br/>
<font color='#6C7169'>We've spotted an EVAC helicopter at the Kavala General Hospital helipad. Grab the helicopter and head south towards the USS Ronald Reagan.</font>
<br/><br/>"]];

hEvac lock 0;

/*
this && wpExfil && {vehicle _x in thisList && isPlayer _x && ((getPosATL _x) select 2) > 15} count allUnits > 0;
this && wpExfil && ((getPosATL hEvac) select 2) > 22;
wpEnd = true; publicVariable "wpEnd";
*/

waitUntil {wpEnd};

{_x setCaptive true; _x allowDamage false} forEach playableUnits;
hEvac allowDamage false;

sleep 10;

enableRadio false;
enableEnvironment false;
clearRadio; 

playMusic "LeadTrack01c_F";

sleep 10;

["<img size= '15' shadow='false' image='Img\wpintro.paa'/><br/><br/>",0,-.3,103,1,0,1001] spawn BIS_fnc_dynamicText; sleep 3;
["<t size='1' color='#FFFFFF' shadow='false'>Campaign Completed</t>",0.02,0.8,7,-1,0,1002] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 01 | Operation The Package</t>",0.02,0.8,7,-1,0,1003] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 02 | Operation Kajman Fire</t>",0.02,0.8,7,-1,0,1004] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 03 | Operation Switch Off</t>",0.02,0.8,7,-1,0,1005] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 04 | Operation Top Screen</t>",0.02,0.8,7,-1,0,1006] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 05 | Operation Bullseye</t>",0.02,0.8,7,-1,0,1007] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 06 | Operation Riga Hill</t>",0.02,0.8,7,-1,0,1008] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 07 | Operation U-12</t>",0.02,0.8,7,-1,0,1009] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 08 | Operation Ice Tiger</t>",0.02,0.8,7,-1,0,1010] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 09 | Operation DragonFly</t>",0.02,0.8,7,-1,0,1011] spawn BIS_fnc_dynamicText; sleep 7.5;
["<t size='1' color='#FFFFFF' shadow='false'>Day 10 | Operation Doberman</t>",0.02,0.8,7,-1,0,1012] spawn BIS_fnc_dynamicText; sleep 10;
["<t size='1' color='#FFFFFF' shadow='false'>Concept &amp; Development</t><br/><br/><t size='.9' color='#FFFFFF' shadow='false'>whiztler</t>",0.02,0.8,15,-10,0,1013] spawn BIS_fnc_dynamicText; sleep 7.5;

sleep 1;
15 fadeSound 0;
sleep 1;
15 fadeMusic 0;
enableRadio true;
enableEnvironment true;  

sleep 10;

["END1",true,12] call BIS_fnc_endMission;