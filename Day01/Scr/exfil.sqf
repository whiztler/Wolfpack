// Exfil

NeptuneLive = true; publicVariableServer "NeptuneLive";

hint parseText"
	<t color='#6C7169' align='left'>Phoenix, this is Neptune. We're your ride home. ETA 2 mikes.<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Neptune</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Phoenix, this is Neptune. We're your ride home. ETA 2 mikes.</font>
"]];


[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 5;
[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 170, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby; 

wpEnd = false; 

_c 	= [];
_v 	= [];

if (isServer) then { // Create Neptune

	_c = createGroup WEST;
	_v1 = [getMarkerPos "nep1a", 210, "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle; 
	vNeptune1 = _v1 select 0; sleep 0.035;
	_v2 = [getMarkerPos "nep1a2", 210, "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle;
	vNeptune2 = _v2 select 0;
	vNeptune1 allowDamage False; vNeptune2 allowDamage False;
	vNeptune1 setCaptive true; vNeptune2 setCaptive true;

	_wp1 = _c addWaypoint [getMarkerPos "nep1b", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "COMBAT";
	_wp1 setWaypointSpeed "FULL";
	_wp1 setWaypointStatements ["true", "hint parseText""<t color='#6C7169' align='left'>Neptune: Phoenix, get ready. ETA 1 mike.</t><br />"";"];
		
	_wp2 = _c addWaypoint [getMarkerPos "nep1c", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "COMBAT";
	_wp2 setWaypointSpeed "NORMAL";

	_wp3 = _c addWaypoint [getMarkerPos "nep1d", 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointBehaviour "COMBAT";
	_wp3 setWaypointSpeed "LIMITED";
	_wp3 setWaypointStatements ["true", "hint parseText""<t color='#6C7169' align='left'>Neptune: Great to see you Commander. Hop on. We'll take you guys home.</t><br />"";"];	
	waitUntil {(currentWaypoint (_wp3 select 0)) > (_wp3 select 1)};

	wpEnd = true;
	publicVariable "wpEnd";	
};

waitUntil {wpEnd};
Sleep 10;
if (!alive Kallaziz_1) exitWith {
	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 10];
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 01 | The Package</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
	sleep 5;
	['END1',true,5] call BIS_fnc_endMission;
};
if (alive Kallaziz_1) exitWith {["END2",false,5] call BIS_fnc_endMission;};