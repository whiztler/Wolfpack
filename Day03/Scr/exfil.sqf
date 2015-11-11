// WP3

wpEnd = false; 

waitUntil {sleep 5; wpExfil};
sleep 25; // wait till other hints have cleared

if (hasInterface) then {
	hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: Great job Eightball. Move to </t><t color='#9DA698' align='left'>LZ Miami </t><t color='#6C7169' align='left'>for extraction.</t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: Great job Eightball. Move to </font><font color='#9DA698'>LZ Miami </font><font color='#6C7169'>for extraction.</font>
	<br/><br/>"]];

	Sleep 60;

	hint parseText"<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eightball, this is Condor. We're coming in from the south west. ETA 12 mikes. Advice vectors on final, how copy?<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Condor</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eightball, this is Condor. We're coming in from the south west. ETA 12 mikes. Advice vectors on final, how copy?</font>
	<br/><br/>"]];
};

if (isServer) then { // Condor
	private ["_m","_wolfAlive","_c","_wp1","_wp2","_wp3"];
	_m = createMarker ["exfil", getPos mStadium];
	_m setMarkerSize [1.5, 1.5];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "Miami";
	
	sleep 750;
	
	// Cleanup
	if !(isNil "vNP1") then {{deleteVehicle _x} forEach (crew vNP1);deleteVehicle vNP1;};
	if !(isNil "vNP2") then {{deleteVehicle _x} forEach (crew vNP2);deleteVehicle vNP2;};
	if !(isNil "vTP1") then {{deleteVehicle _x} forEach (crew vTP1);deleteVehicle vTP1;};
	if !(isNil "vTP2") then {{deleteVehicle _x} forEach (crew vTP2);deleteVehicle vTP2;};
	if !(isNil "vTP3") then {{deleteVehicle _x} forEach (crew vTP3);deleteVehicle vTP3;};
	deleteVehicle gmg1; deleteVehicle taa1; deleteVehicle hmg1; 

	_wolfAlive = {alive _x} count allPlayers;

	// create end trigger
	trExfil = createTrigger ["EmptyDetector", getMarkerPos "mC5"];
	publicVariable "trExfil";

	_c = createGroup WEST;
	_v = [getMarkerPos "mC1a", 30, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle; sleep 1;
	vCondor1 = _v select 0;
	_v = [getMarkerPos "mC1b", 30, "B_Heli_Transport_01_F", _c] call BIS_fnc_spawnVehicle;
	vCondor2 = _v select 0;
	vCondor1 allowDamage False; vCondor2 allowDamage False;
	vCondor1 setCaptive true; vCondor2 setCaptive true;
			
	_wp1 = _c addWaypoint [getMarkerPos "mC2", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "FULL";
	
	_wp2 = _c addWaypoint [getMarkerPos "mC3", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "NORMAL";
	_wp2 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "hint parseText ""<t color='#6C7169' align='left'><img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>Condor: Eightball please pop smoke to mark the LZ.</t>"";"];	
	
	_wp3 = _c addWaypoint [getMarkerPos "mC4", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "SAFE";
	_wp3 setWaypointSpeed "normal";
	_wp3 setWaypointCombatMode "Green";
	_wp3 setWaypointStatements ["true", "vCondor1 land 'LAND';vCondor2 land 'LAND';hint parseText""<t color='#6C7169' align='left'><img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/>160th SOAR Capt. Keagan: Dusting off in 30 seconds!</t>"";vCondor1 flyInHeight 15;vCondor2 flyInHeight 15;"];	

	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};
	waitUntil {isTouchingGround vCondor1}; vCondor1 flyInHeight 0;
	waitUntil {isTouchingGround vCondor2}; vCondor2 flyInHeight 0;
	sleep 3;
	wpEnd = true;
	publicVariable "wpEnd";
};

waitUntil {sleep 3; wpEnd};
_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK", 10];
["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 03 | Switch Off</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
sleep 5;
["END1",true,5] call BIS_fnc_endMission;
	