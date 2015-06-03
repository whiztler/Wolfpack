vWolf_takeOff = false;
vWolf_10Secs = false;
iceTigerLocated = false;

if (isServer) then {
	// vWolf_1
	[] spawn {
		_c = group vWolf_1;
		vWolf_1 flyInHeight 10;
		vSOR_1_created = true; publicVariable "vSOR_1_created";		
		_wp1 = _c addWaypoint [getMarkerPos "mVSOR_1_wp1", 0];
		_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "FULL";	
		_wp2 = _c addWaypoint [getMarkerPos "mVSOR_1_wp2", 0];
		_wp2 setWaypointType "MOVE"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "FULL";
		waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};	
		vWolf_10Secs = true; publicVariable "vWolf_10Secs";
		vWolf_1 flyInHeight 20;	
		_wp3 = _c addWaypoint [getPos mWolfLand_1, 0];
		_wp3 setWaypointType "TR UNLOAD"; _wp3 setWaypointBehaviour "SAFE"; _wp3 setWaypointSpeed "NORMAL";
		_wp3 setWaypointStatements ["true", "vWolf_1 land 'LAND';"];		
		{vWolf_1 animateDoor [_x, 1];} forEach ["door_L","door_R"];
		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};	
		waitUntil {isTouchingGround vWolf_1 && isTouchingGround vWolf_2};
		vWolf_takeOff = true; publicVariable "vWolf_takeOff";
		sleep 2;
		vWolf_1 setFuel 0;
		sleep 8;
		vWolf_1 setFuel 1;
		vWolf_1 lock true;
		{vWolf_1 animateDoor [_x, 0];} forEach ["door_L","door_R"];
		vWolf_1 flyInHeight 20;
		_wp4 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointBehaviour "SAFE";
		_wp4 setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp4 select 0)) > (_wp4 select 1)};		
		if !(isNil "vWolf_1") then {{deleteVehicle _x} forEach (crew vWolf_1); deleteVehicle vWolf_1; vWolf_1 = nil};		
	};
	// vWolf_2
	[] spawn {
		_c = group vWolf_2;
		vWolf_2 flyInHeight 10;
		vSOR_2_created = true; publicVariable "vSOR_2_created";
		_wp1 = _c addWaypoint [getMarkerPos "mvSOR_2_wp1", 0];
		_wp1 setWaypointType "MOVE"; _wp1 setWaypointBehaviour "SAFE"; _wp1 setWaypointSpeed "FULL";	
		_wp2 = _c addWaypoint [getMarkerPos "mvSOR_2_wp2", 0];
		_wp2 setWaypointType "MOVE"; _wp2 setWaypointBehaviour "SAFE"; _wp2 setWaypointSpeed "FULL";
		_wp2 setWaypointStatements ["true", "vWolf_2 flyInHeight 20;"];
		waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
		_wp3 = _c addWaypoint [getPos mWolfLand_2, 0];
		_wp3 setWaypointType "TR UNLOAD"; _wp3 setWaypointBehaviour "SAFE"; _wp3 setWaypointSpeed "NORMAL";
		_wp3 setWaypointStatements ["true", "vWolf_2 land 'LAND';"];	
		{vWolf_2 animateDoor [_x, 1];} forEach ["door_L","door_R"];
		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};		
		waitUntil {isTouchingGround vWolf_1 && isTouchingGround vWolf_2};
		sleep 2;
		vWolf_2 setFuel 0;
		sleep 12;
		vWolf_2 setFuel 1;
		vWolf_2 lock true;
		{vWolf_2 animateDoor [_x, 0];} forEach ["door_L","door_R"];
		vWolf_2 flyInHeight 15;		
		_wp4 = _c addWaypoint [getMarkerPos "mVwolf_exit", 0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointBehaviour "SAFE";
		_wp4 setWaypointSpeed "NORMAL";		
		waitUntil {(currentWaypoint (_wp4 select 0)) > (_wp4 select 1)};		
		if !(isNil "vWolf_2") then {{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2; vWolf_2 = nil};		
	};
};

player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

sleep 3; // Loadout finished > pri weapon loaded

while {time < 25} do {
	if !(isNil "SOR_SSC_1") then {SOR_SSC_1 assignAsCargo vWolf_1; SOR_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsCargo vWolf_1; SOR_RM_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_1; SOR_RTL_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_1; SOR_RS_2 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_1; SOR_RS_3 moveInCargo vWolf_1;}; sleep 0.035;
	
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_2; SOR_RTL_2 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_2; SOR_RS_5 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_2; SOR_RS_6 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_2; SOR_RS_7 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_2; SOR_AT_1 moveInCargo vWolf_2;};
};

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Uncle.</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Viper.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
<font color='#6c7169'>DEVGRU TOC: </font><font color='#9DA698'>Uncle</font><br/>
<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Viper</font>
<br/><br/>"]];
sleep 50;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Uncle: TOC will advice a search grid in a few minutes...<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Uncle: TOC will advice a search grid in a few minutes...</font>
<br/><br/>"]];
sleep 90;

[] spawn {
	waitUntil {vWolf_10Secs};
	hint parseText"
		<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>160th SOAR Lt. Randahl: Commander, 30 seconds! Get ready!<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Lt. Randahl</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>160th SOAR Lt. Randahl: Commander, 30 seconds! Get ready!</font>
	<br/><br/>"]];
};

[] spawn {
	waitUntil {vWolf_takeOff};
	hint parseText"
		<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>160th SOAR Lt. Randahl: Dusting off in 5 seconds.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Lt. Randahl</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>160th SOAR Lt. Randahl: Dusting off in 5 seconds</font>
	<br/><br/>"]];	
};

if (isServer) then {

	waitUntil {time > 180};
	
	deleteMarker "mBrief0";

	// Spawn Ice Tiger
	_iceTiger = [
		["Land_HelipadEmpty_F",[0,0,0.2],0,1,0,[],"OFOB_spawn","",true,false], 
		["Land_MetalBarrel_empty_F",[7.06641,12.9395,0],239.02,1,0,[],"","",true,false], 
		["Land_MetalBarrel_empty_F",[5.79688,-15.3164,0],144.167,1,0,[],"","",true,false], 
		["Land_MetalBarrel_F",[7.77734,15.8066,4.29153e-005],238.999,1,0.00996778,[],"","",true,false], 
		["O_MBT_02_cannon_F",[2.61328,-17.7051,-0.0887341],3.00001,1,0,[],"obj_2","",true,false], 
		["O_APC_Tracked_02_cannon_F",[3.24414,17.7793,-0.0604005],180.078,1,0,[],"","",true,false], 
		//["CamoNet_OPFOR_big_F",[3.06641,18.3047,0.2],0,1,0,[],"","",true,false], 
		//["CamoNet_OPFOR_big_F",[2.94531,-19.5195,0.2],183.459,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[7.20313,19.5605,0.0305426],162.998,1,0.00529062,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[7.08398,-20.5352,0.0305424],249.201,1,0.0054032,[],"","",true,false], 
		["Land_BarrelEmpty_grey_F",[-0.046875,22.8965,6.00815e-005],149.216,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-13.0703,19.5215,0.0305433],180.817,1,0.00546478,[],"","",true,false], 
		["O_MBT_02_cannon_F",[-16.7871,16.4648,-0.0887351],179.074,1,0,[],"obj_5","",true,false], 
		["Land_BarrelEmpty_grey_F",[0.169922,-23.9102,6.00815e-005],149.216,1,0,[],"","",true,false], 
		["O_Truck_02_fuel_F",[-23.4766,7.23047,-0.00966072],104.304,1,0,[],"","",true,false], 
		["O_APC_Tracked_02_AA_F",[-16.375,-18.457,-0.0606647],360,1,0,[],"","",true,false], 
		//["CamoNet_OPFOR_big_F",[-16.6484,18.2461,0.2],0,1,0,[],"","",true,false], 
		["Land_MetalBarrel_F",[5.16406,-24.9883,4.64916e-005],144.132,1,0.00997531,[],"","",true,false], 
		//["CamoNet_OPFOR_big_F",[-16.873,-19.2227,0.2],183.459,1,0,[],"","",true,false], 
		["Land_MetalBarrel_empty_F",[-13.6113,21.9707,0],144.167,1,0,[],"","",true,false], 
		["Land_MetalBarrel_empty_F",[20.9531,15.2383,0],144.167,1,0,[],"","",true,false], 
		["Land_MetalBarrel_F",[-20.7598,-15.5195,4.64916e-005],144.132,1,0.00997499,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[18.9336,18.0313,0.0305419],163.001,1,0.00523803,[],"","",true,false], 
		["Land_MetalBarrel_F",[19.1875,-18.3418,4.41074e-005],195.674,1,0.00996466,[],"","",true,false], 
		["Land_BarrelEmpty_grey_F",[-19.4844,19.4824,5.96046e-005],149.216,1,0,[],"","",true,false], 
		["Land_MetalBarrel_F",[-15.2715,23.3887,4.64916e-005],144.132,1,0.00997531,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-21.4531,-19.2383,0.0305355],33.7166,1,0,[],"","",true,false], 
		["Land_MetalBarrel_empty_F",[20.9043,-20.7793,0],195.702,1,0,[],"","",true,false], 
		["O_MBT_02_cannon_F",[23.5488,-18.1465,-0.0887346],7.73268e-006,1,0,[],"obj_3","",true,false], 
		["O_MBT_02_cannon_F",[24.1699,17.3516,-0.0887341],174.074,1,0,[],"obj_4","",true,false], 
		//["CamoNet_OPFOR_big_F",[23.3027,18.4395,0.2],0,1,0,[],"","",true,false], 
		["Land_PaperBox_closed_F",[-5.91992,29.459,0],176.457,1,0,[],"","",true,false], 
		//["CamoNet_OPFOR_big_F",[23.3203,-19.082,0.2],183.459,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-9.26758,29.0664,0.0305374],157.594,1,0.0361095,[],"","",true,false], 
		["Land_MetalBarrel_empty_F",[-19.5879,-23.5723,0],144.167,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-3.73633,30.7051,0.0305407],140.109,1,0.00513837,[],"","",true,false], 
		["CamoNet_OPFOR_open_F",[-6.58984,31.0762,0],174.644,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-11.3574,29.5254,0.0305433],213.379,1,0.00543707,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-10.0527,30.7988,0.0305369],215.47,1,0.0311232,[],"","",true,false], 
		["Land_PaperBox_open_full_F",[-7.28516,31.623,0],89.6932,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-2.64453,32.5293,0.030539],215.203,1,0.0343553,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-4.69727,32.4043,0.0305343],55.0569,1,0.0299129,[],"","",true,false], 
		["Land_Pallet_MilBoxes_F",[-9.93164,33.0313,0],176.457,1,0,[],"","",true,false], 
		["Land_PaperBox_open_full_F",[10.0879,33.2695,0],175.429,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[27.332,-22.1875,0.0305436],162.999,1,0.0044796,[],"","",true,false], 
		["Land_MetalBarrel_F",[28.082,21.6094,4.64916e-005],144.132,1,0.00997531,[],"","",true,false], 
		["Land_MetalBarrel_F",[-32.9141,-13.8008,3.98159e-005],149.216,1,0.00995739,[],"","",true,false], 
		["Land_MetalBarrel_empty_F",[-32.1367,-15.7734,0],149.249,1,0,[],"","",true,false], 
		["Land_PaperBox_closed_F",[12.6035,33.6035,0],91.6254,1,0,[],"","",true,false], 
		["Flag_CSAT_F",[3.92773,35.2656,0],358.197,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-33.7695,14.9941,0.0305407],163.001,1,0.00537114,[],"","",true,false], 
		["CamoNet_OPFOR_open_F",[14.1523,35.375,1],175.87,1,0,[],"","",true,false], 
		["Land_Cargo_HQ_V1_F",[-7.17188,-36.584,0],269.45,1,0,[],"","",true,false], 
		["O_Truck_03_repair_F",[36.3301,-10.9648,-0.00785828],310.869,1,0,[],"","",true,false], 
		["Land_Cargo20_military_green_F",[10.3574,36.5449,0],176.898,1,0,[],"","",true,false], 
		["Land_HBarrierBig_F",[-2.85156,38.6992,0],180.663,1,0,[],"","",true,false], 
		["Land_Cargo20_military_green_F",[15.9824,35.4355,0],267.785,1,0,[],"","",true,false], 
		["Land_BarrelEmpty_grey_F",[-33.1348,21.4141,6.00815e-005],149.216,1,0,[],"","",true,false], 
		["O_MBT_02_cannon_F",[-36.668,16.2129,-0.0887341],182.074,1,0,[],"obj_6","",true,false], 
		["O_MBT_02_cannon_F",[-36.7617,-16.4023,-0.0887341],355,1,0,[],"obj_1","",true,false], 
		["Land_HBarrierBig_F",[-11.2578,38.8125,0],180.663,1,0,[],"","",true,false], 
		["O_Truck_03_covered_F",[23.793,-33.0293,0.00322294],269.51,1,0,[],"","",true,false], 
		//["CamoNet_OPFOR_big_F",[-36.5469,17.8398,0.2],0,1,0,[],"","",true,false], 
		["Land_Cargo20_military_green_F",[-23.7402,33.4922,0],358.985,1,0,[],"","",true,false], 
		//["CamoNet_OPFOR_big_F",[-36.3418,-18.9648,0.2],183.459,1,0,[],"","",true,false], 
		["Flag_CSAT_F",[-1.96289,-43.2109,0],358.197,1,0,[],"","",true,false], 
		["Land_BarrelEmpty_grey_F",[-36.1367,-23.0957,6.00815e-005],149.216,1,0,[],"","",true,false], 
		["Land_MetalBarrel_empty_F",[-39.5156,17.627,0],227.021,1,0,[],"","",true,false], 
		["Land_PaperBox_open_full_F",[-23.3457,36.75,0],357.516,1,0,[],"","",true,false], 
		["O_Truck_03_ammo_F",[-21.4648,-38.3027,-0.0490003],179.728,1,0,[],"","",true,false], 
		["O_Truck_03_covered_F",[23.8594,-37.5527,0.00322247],269.51,1,0,[],"","",true,false], 
		["Land_Razorwire_F",[43.082,13.9141,0],90.1428,1,0,[],"","",true,false], 
		["Land_PaperBox_closed_F",[-25.8574,36.4922,0],273.712,1,0,[],"","",true,false], 
		["Box_East_AmmoVeh_F",[-40.3008,-19.668,0.0305443],194.426,1,0.00570304,[],"","",true,false], 
		["CamoNet_OPFOR_open_F",[-27.4648,34.8145,1],357.957,1,0,[],"","",true,false], 
		["Land_MetalBarrel_F",[-40.7949,19.4844,3.69549e-005],226.998,1,0.00996975,[],"","",true,false], 
		["Land_Razorwire_F",[43.3984,-14.6504,0],269.566,1,0,[],"","",true,false], 
		["Land_Cargo20_military_green_F",[-29.3066,34.793,0],89.8722,1,0,[],"","",true,false], 
		["Land_Medevac_house_V1_F",[27.0996,35.8164,0],268.991,1,0,[],"","",true,false], 
		["Land_Razorwire_F",[43.0176,22.0234,0],90.1428,1,0,[],"","",true,false], 
		["Land_Cargo40_military_green_F",[32.2422,-34.9609,0],88.4116,1,0,[],"","",true,false], 
		["Land_Razorwire_F",[43.5332,-22.7715,0],269.566,1,0,[],"","",true,false], 
		["Box_East_AmmoOrd_F",[36.5859,-31.8047,-2.38419e-007],179.972,1,0.00989162,[],"","",true,false], 
		["O_MRAP_02_F",[12.4453,-47.7559,0.00800991],326.539,1,0,[],"","",true,false], 
		["O_Truck_03_medical_F",[26.5879,42.0508,0.00364208],286.015,1,0,[],"","",true,false], 
		["Box_East_AmmoOrd_F",[36.6367,-34.0195,-2.38419e-007],179.972,1,0.00989144,[],"","",true,false]
	];

	iceTigerLoc = ["mOFOB_1","mOFOB_2","mOFOB_3","mOFOB_4","mOFOB_5"] call BIS_fnc_selectRandom;
	publicVariable "iceTigerLoc";
	_iceTigerPos = getMarkerPos iceTigerLoc;
	_iceTigerDir = markerDir iceTigerLoc;
	[_iceTigerPos,_iceTigerDir,_iceTiger] call BIS_fnc_ObjectsMapper;

	// debug 
	if (ADF_debug) then {
		_m = createMarker ["IceTigerLoccDebug", getMarkerPos iceTigerLoc];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_objective";
		_m setMarkerColor "ColorGreen";

		_m = createMarker ["mObj1", getPos obj_1];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_dot";
		_m setMarkerColor "ColorRed";

		_m = createMarker ["mObj2", getPos obj_2];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_dot";
		_m setMarkerColor "ColorRed";

		_m = createMarker ["mObj3", getPos obj_3];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_dot";
		_m setMarkerColor "ColorRed";

		_m = createMarker ["mObj4", getPos obj_4];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_dot";
		_m setMarkerColor "ColorRed";

		_m = createMarker ["mObj5", getPos obj_5];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_dot";
		_m setMarkerColor "ColorRed";

		_m = createMarker ["mObj6", getPos obj_6];
		_m setMarkerShape "ICON";
		_m setMarkerType "mil_dot";
		_m setMarkerColor "ColorRed";
	};

	tObj1 setPos (getPos obj_1); tObj1 setDir (getDir obj_1);
	tObj2 setPos (getPos obj_2); tObj2 setDir (getDir obj_2);
	tObj3 setPos (getPos obj_3); tObj3 setDir (getDir obj_3);
	tObj4 setPos (getPos obj_4); tObj4 setDir (getDir obj_4);
	tObj5 setPos (getPos obj_5); tObj5 setDir (getDir obj_5);
	tObj6 setPos (getPos obj_6); tObj6 setDir (getDir obj_6);

	tIceTiger = createTrigger ["EmptyDetector", getMarkerPos iceTigerLoc];
	publicVariable "tIceTiger";
};

if (!isDedicated) then {
	waitUntil {!isNil "tIceTiger"};
	tIceTiger setTriggerType "NONE";
	tIceTiger setTriggerActivation ["WEST", "PRESENT", false];
	tIceTiger setTriggerArea [500,500,0,false];
	tIceTiger setTriggerStatements ["this", "hint parseText ""<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Uncle: It seems you have located Ice Tiger. Good work men!<br/><br/>Standby for orders...</t><br/>"";iceTigerLocated = true; publicVariable 'iceTigerLocated';0 = execVM ""Scr\exfil.sqf"";", ""];	
};

waitUntil {!isNil "iceTigerLoc"};
execVM "Scr\SOD_patrols.sqf";

waitUntil {time > 1200};
if (iceTigerLocated) exitWith {};
hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Uncle: Once you have located IceTiger, get within 500 meters of IceTiger and report in.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Uncle: Once you have located IceTiger, get within 500 meters of IceTiger and report in.</font>
<br/><br/>"]];

waitUntil {date select 3 >= 7};
if (iceTigerLocated) exitWith {};
hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Uncle: Viper we have just received some intel re a possible location of IceTiger. We have send the coordinates to your GPS ComLink.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Uncle: Viper we have just received some intel re a possible location of IceTiger. We have send the coordinates to your GPS ComLink.</font>
<br/><br/>"]];

if (isServer) then {
	private ["_mPos"];
	_mPos = getMarkerPos iceTigerLoc;	
	_m = createMarker ["mObj2500",[(_mPos select 0) + random 1000,(_mPos select 1) + random 1000]];
	_m setMarkerShape  "ELLIPSE";
	_m setMarkerBrush "Border";
	_m setMarkerSize [2500, 2500];
	_m setMarkerColor "ColorRed";
};

waitUntil {date select 3 >= 8};
if (iceTigerLocated) exitWith {};
hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Uncle: Viper we have received more information about a possible target location. We have send the coordinates to your GPS ComLink.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Uncle: Viper we have received more information about a possible target location. We have send the coordinates to your GPS ComLink.</font>
<br/><br/>"]];

if (isServer) then {
	private ["_mPos"];
	_mPos = getMarkerPos iceTigerLoc;	
	_m = createMarker ["mObj1500",[(_mPos select 0) + random 500,(_mPos select 1) + random 500]];
	_m setMarkerShape  "ELLIPSE";
	_m setMarkerBrush "Border";
	_m setMarkerSize [1500, 1500];
	_m setMarkerColor "ColorRed";
};
