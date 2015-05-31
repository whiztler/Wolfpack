wpEnd = false;
waitUntil {objDone};
hint parseText"
	<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy, this is Raven. We're your ride home boys.</t><br/><br/>
	<t color='#9DA698' align='left'>ETA 5 mikes.</t><br/><br/>
	<t color='#6C7169' align='left'>Please make sure we drop into a clean LZ.</t><br/>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Raven</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Cowboy, this is Raven. We're your ride home boys.</font><br/><br/>
<font color='#9DA698'>ETA 5 mikes.</font><br/><br/>
<font color='#6C7169'>Please make sure we drop into a clean LZ.</font>
<br/><br/>"]];

_c 	= [];
_v 	= [];

if (isServer) then { 	

	// Create Raven
	_c = createGroup WEST;
	_v1 = [getMarkerPos "mHSpawn1", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle; sleep 2; //mAirExit2
	vRaven1 = _v1 select 0; vRaven1 allowDamage False; vRaven1 setCaptive true; 
	_v2 = [getMarkerPos "mHSpawn2", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vRaven2 = _v2 select 0; vRaven2 allowDamage False; vRaven2 setCaptive true;
	//hint "choppers created";
	_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "FULL";
	_wp1 setWaypointStatements ["true", "vRaven1 flyInHeight 10;vRaven2 flyInHeight 10;"];
	
	_wp2 = _c addWaypoint [getMarkerPos "mC3", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "LIMITED";
	_wp2 setWaypointCombatMode "Green";
	_wp2 setWaypointStatements ["true", "hint parseText""<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Raven: Cowboy please pop smoke or a chemlight to mark the LZ.</t>"";"];
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	
	_wp3 = _c addWaypoint [getPos exfilLoc, 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "LIMITED";
	_wp3 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "vRaven1 land 'LAND';vRaven2 land 'LAND';vRaven1 flyInHeight 10;vRaven2 flyInHeight 10;"];	

	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
	waitUntil {isTouchingGround vRaven1}; 
	waitUntil {isTouchingGround vRaven2};
	wpEnd = true;
	publicVariable "wpEnd";	
};

waitUntil {wpEnd};
sleep 3;
hint parseText"<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>160th SOAR Lt. McAllistar: Dusting off in 30 seconds!<br/></t>";
sleep 3;
_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK", 10];
["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 09 | DragonFly</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
sleep 5;
["END1",true,5] call BIS_fnc_endMission;