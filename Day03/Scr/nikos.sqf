#include "ADF_JIP.sqf"

if !(isNil "SOD_1_SCC") then {
	hint parseText format ["
	<t color='#6C7169' align='left'>Good morning Commander %1, good to see you again.</t>
	",name vehicle SOD_1_SCC];
} else {
	hint parseText"
	<t color='#6C7169' align='left'>Good morning Commander, good to see you again.</t>
	";
};
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Nikos Fotopoulos</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Good morning Commander, good to see you again.</font>
<br/><br/>"]];
sleep 5;

if (isServer) then {
	deleteMarker "mrk_rv";
	sleep 4;
	_m = createMarker ["obj_tower", getMarkerPos "pos_obj_tower"];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorWEST";
	_m setMarkerText "Radar and Communications Station";
	_m setMarkerDir 0;

	_m = createMarker ["obj_pwrplant", [4230,15076,19]];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorWEST";
	_m setMarkerText "Kavala Power Plant";
	_m setMarkerDir 0;
	sleep 0.05;
	deleteMarker "pos_obj_tower";
};


_cnt = 0;
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Nikos Fotopoulos</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>
The resistance has been disrupting Telecom networks. We need to take out the power plant and radar and communications station for a lasting effect. Your mission is as follows:<br/><br/>
1. Covertly make your way towards the </font><font color='#9DA698'>Power Plant. Set charges around the </font><font color='#9DA698'>9 generators</font><font color='#6C7169'> and make sure they are destroyed completely. Make sure you bring enough explosives.<br/><br/>
2. Move to the </font><font color='#9DA698'>Radar and Communications Station. At the large radar antennas and at the Radar Dome you have an option to attach a </font><font color='#9DA698'>LRI tag sticker</font><font color='#6C7169'> and call in a missile strike.<br/><br/>
The objectives are marked on the map. Best of luck Commander.</font>
<br/><br/>"]];
while {(_cnt != 30)} do {
	_cnt = _cnt + 1;
	hintSilent parseText format ["
		<t color='#6C7169' align='left'>The resistance has been disrupting Telecom networks. We need to take out the power plant and radar &amp; communications station for a lasting effect. Your mission is as follows:</t><br/><br/>
		<t color='#6C7169' align='left'>1. Covertly make your way towards the </t><t color='#9DA698' align='left'>Power Plant.</t><br/>
		<t color='#6C7169' align='left'>Set charges around the </t><t color='#9DA698' align='left'>9 generators</t><t color='#6C7169' align='left'> and make sure they are destroyed completely. Make sure you bring enough explosives.</t><br/><br/>
		<t color='#6C7169' align='left'>2. Move to the </t><t color='#9DA698' align='left'>Radar &amp; Communications Station.</t><br/>
		<t color='#6C7169' align='left'>At the large radar antennas and at the Radar Dome you have an option to attach a </t><t color='#9DA698' align='left'>LRI tag sticker</t><t color='#6C7169' align='left'> and call in a missile strike.</t><br/><br/>
		<t color='#6C7169' align='left'>The objectives are marked on the map. Best of luck Commander.</t><br/>
	"];
	sleep 1;
};

if (!isServer) exitWith {};
sleep 15;
_wp = gNikos addWaypoint [getMarkerPos "mp_rv1", 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "COLUMN";
_wp setWaypointStatements ["true", "pNikos moveInDriver vMP;"];
sleep 1;
_wp = gNikos addWaypoint [getMarkerPos "mp_rv2", 1];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointStatements ["true", "deleteVehicle pNikos; deleteGroup gNikos; deleteVehicle vMP; gNikos = nil;"];

[getMarkerPos "mAir1", getMarkerPos "mAirEnd1", 50, "NORMAL", "O_Heli_Transport_04_F", EAST] call BIS_fnc_ambientFlyby;
sleep 900; // 15 min
[getMarkerPos "mJet1", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
[getMarkerPos "mJet2", getMarkerPos "mJetEnd", 150, "FULL", "O_Plane_CAS_02_F", EAST] call BIS_fnc_ambientFlyby;
sleep 1200; // 20 min
[getMarkerPos "mAirEnd1", getMarkerPos "mAir1", 50, "NORMAL", "O_Heli_Transport_04_black_F", EAST] call BIS_fnc_ambientFlyby;
sleep 1800; // 30 min
[getMarkerPos "mJetEnd", getMarkerPos "mJet2", 100, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby;
[getMarkerPos "mJetEnd", getMarkerPos "mJet2", 100, "NORMAL", "O_Heli_Attack_02_F", EAST] call BIS_fnc_ambientFlyby;