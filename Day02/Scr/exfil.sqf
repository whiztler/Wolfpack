// WP2

sleep 5;
wpEnd = false;

if (isServer) then {
	if !(isNil "v1") then {{deleteVehicle _x} forEach (crew v1);deleteVehicle v1;};	
	if !(isNil "v2") then {{deleteVehicle _x} forEach (crew v2);deleteVehicle v2;};	
	if !(isNil "v3") then {{deleteVehicle _x} forEach (crew v3);deleteVehicle v3;};	
	if !(isNil "v4") then {{deleteVehicle _x} forEach (crew v4);deleteVehicle v4;};	
	if !(isNil "AbderaApt") then {deleteMarker "AbderaApt";};
	_m = createMarker ["Seattle", getPos mSeattle];
	_m setMarkerSize [1, 1];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "Seattle";	
	
	if !(kryaActive) then {
		_q = nearestObjects [getPos kryaFlag, ["Man"], 100];
		while {true} do {
			{deleteVehicle _x} forEach _q
		};
	};
};

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Jetson: Excellent work Scarecrow. Condor is on its way to pick you up at Krya Nera Beach, </t><t color='#9DA698' align='left'>LZ Seattle<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Jetson: Excellent work Scarecrow. Condor is on its way to pick you up just NW of Krya Nera Beach, </font><font color='#9DA698'>LZ Seattle</font>
<br/><br/>"]];

Sleep 60;

hint parseText"
	<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Scarecrow, this is Condor. We're coming in from the north-west. </t><t color='#9DA698' align='left'>ETA 8 mikes.<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Condor</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Scarecrow, this is Condor. We're coming in from the north-west. </font><font color='#9DA698'>ETA 8 mikes.</font>
<br/><br/>"]];

if (isNil "MotsActive") then {sleep 500};

_c 	= [];
_v 	= [];

if (isServer) then { 

	// create end trigger
	trExfil = createTrigger ["EmptyDetector", getMarkerPos "mC4"];
	publicVariable "trExfil";

	// Create Condor
	_c = createGroup WEST;
	_v1 = [getMarkerPos "mC1a", 90, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle; sleep 2;
	vCondor1 = _v1 select 0;
	_v2 = [getMarkerPos "mC1b", 90, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vCondor2 = _v2 select 0;
	vCondor1 allowDamage False; vCondor2 allowDamage False;
	vCondor1 setCaptive true; vCondor2 setCaptive true;
	
	_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "NORMAL";
	_wp1 setWaypointStatements ["true", "vCondor1 flyInHeight 15;vCondor2 flyInHeight 15;"];
	
	_wp2 = _c addWaypoint [getMarkerPos "mC3", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "NORMAL";
	_wp2 setWaypointCombatMode "Green";
	_wp2 setWaypointStatements ["true", "hint parseText""<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Condor: Scarecrow please pop smoke or a chemlight to mark the LZ.<br /></t>"";"];
	
	_wp3 = _c addWaypoint [getPos mSeattle, 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "normal";
	_wp3 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';vCondor2 land 'LAND';hint parseText""<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>160th SOAR Lt. Summers: Dusting off in 30 seconds!<br /></t>"";vCondor1 flyInHeight 15;vCondor2 flyInHeight 15;"];	
	
	waitUntil {isTouchingGround vCondor1};
	waitUntil {isTouchingGround vCondor2};
	wpEnd = true;
	publicVariable "wpEnd";
};

waitUntil {wpEnd};
_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK", 10];
["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 02 | Kajman Fire</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
sleep 5;
["END1",true,5] call BIS_fnc_endMission;

if !(isDedicated) then {
	waitUntil {!isNil "trExfil"};
	trExfil setTriggerType "END1";
	trExfil setTriggerActivation ["WEST", "PRESENT", false];
	trExfil setTriggerArea [500,500,0,false];
};



	