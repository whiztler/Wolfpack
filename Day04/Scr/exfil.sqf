// WP4

wpEnd = false; 
sleep 10;

if (hasInterface) then {
	hint parseText"<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Rattler, this is Condor. ETA 5 mikes. Make sure the LZ is secure.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Condor</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Rattler, this is Condor. ETA 5 mikes. Make sure the LZ is secure.</font>
	<br/><br/>"]];
};

sleep 310;

if (isServer) then { 
	private ["_wolfAlive","_wp1","_v1","_v2","_wp2","_wp3"];
	_wolfAlive = {alive _x} count playableUnits;

	// create end trigger
	trExfil = createTrigger ["EmptyDetector", getMarkerPos "mC4"];
	publicVariable "trExfil";

	// Create Condor
	_c = createGroup WEST;
	if 	(_wolfAlive <= 8) then {
		_v = [getMarkerPos "mC1", 270, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
		vCondor1 = _v select 0;
		vCondor1 allowDamage False;
		vCondor1 setCaptive true;
		
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
		vCondor1 allowDamage False; vCondor2 allowDamage False;
		vCondor1 setCaptive true; vCondor2 setCaptive true;
		
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
	_wp2 setWaypointStatements ["true", "hint parseText""<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Condor: Rattler please pop smoke or a chemlight to mark the LZ.</t>"";"];
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	
	if 	(_wolfAlive <= 8) then {
		_wp3 = _c addWaypoint [getPos exfilLoc, 0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointBehaviour "SAFE";
		_wp3 setWaypointSpeed "normal";
		_wp3 setWaypointCombatMode "Green";
		_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';hint parseText""<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>160th SOAR Lt. Gimpel:  Dusting off in 30 seconds!</t>"";vCondor1 flyInHeight 15;"];	

		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
		waitUntil {isTouchingGround vCondor1};
		wpEnd = true;
		publicVariable "wpEnd";
	} else {
		_wp3 = _c addWaypoint [getPos exfilLoc, 0];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointBehaviour "SAFE";
		_wp3 setWaypointSpeed "normal";
		_wp3 setWaypointCombatMode "Green";
		_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';vCondor2 land 'LAND';hint parseText""<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>160th SOAR Lt. Gimpel: Dusting off in 30 seconds!</t>"";vCondor1 flyInHeight 15;vCondor2 flyInHeight 15;"];	

		waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
		waitUntil {isTouchingGround vCondor1};
		waitUntil {isTouchingGround vCondor2};
		wpEnd = true;
		publicVariable "wpEnd";
	};
};


waitUntil {wpEnd};
private "_l";
_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK", 10];
["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 04 | Top Screen</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
sleep 5;
["END1",true,5] call BIS_fnc_endMission;

if !(isDedicated) then {
	waitUntil {!isNil "trExfil"};
	trExfil setTriggerType "END1";
	trExfil setTriggerActivation ["WEST", "PRESENT", false];
	trExfil setTriggerArea [500,500,0,false];
};