#include "ADF_JIP.sqf"

rvDone = true; publicVariable "rvDone";

if !(isNil "SOR_1_SCC") then {
	hint parseText format ["
	<t color='#6C7169' align='left'>Commander %1, welcome to Altis. My name is Nikos Fotopoulos. I am your contact person on Altis<br /></t>
	",name vehicle SOR_1_SCC];
} else {
	hint parseText"
	<t color='#6C7169' align='left'>Phoenix, welcome to Altis. My name is Nikos Fotopoulos. I am your contact person on Altis<br /></t>
	";
};
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Nikos Fotopoulos</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Phoenix, welcome to Altis. My name is Nikos Fotopoulos. I am your contact person on Altis.</font>
"]];

if (isServer) then {
	deleteMarker "mrk_Nikos";
	sleep 7;
	_mrk1 = createMarker ["obj_package", getMarkerPos "pos_obj_package"];
	_mrk1 setMarkerShape "ICON";
	_mrk1 setMarkerType "mil_triangle";
	_mrk1 setMarkerColor "ColorEAST";
	_mrk1 setMarkerText "Frini M.O.B.";
	_mrk1 setMarkerDir 0;

	_mrk2 = createMarker ["obj_exfil", getMarkerPos "pos_obj_exfil"];
	_mrk2 setMarkerShape "ICON";
	_mrk2 setMarkerType "hd_pickup";
	_mrk2 setMarkerColor "ColorWEST";
	_mrk2 setMarkerText "Exfil";
	_mrk2 setMarkerDir 0;

	deleteMarker "pos_obj_package";
	deleteMarker "pos_obj_exfil";
};

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Nikos Fotopoulos</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>I have just been in touch with Big Foot for a sitrep. Your mission is as follows:<br/><br/>
1. Covertly make your way towards </font><font color='#9DA698'>Frini M.O.B.</font><font color='#6c7169'><br/>
2. Observe the base and wait for the package to arrive by helicopter.<br/>
3. The package is Maj. F. Kallaziz, head of the CSAT Intelligence Services. </font><font color='#9DA698'>Eliminate the package.</font><font color='#6c7169'><br/>
4. Covertly make your way to the exfil location at </font><font color='#9DA698'>Cap. Agrios</font><font color='#6c7169'> where you'll board a patrol boat.<br/><br/>
I have taken the liberty to mark the positions on your map. Godspeed Commander.<br/></font>
"]];
_cnt = 0;
while {(_cnt != 30)} do {
	_cnt = _cnt + 1;
	hintSilent parseText format ["
		<t color='#6C7169' align='left'>I have just been in touch with Big Foot for a sitrep. Your mission is as follows:</t><br/><br/>
		<t color='#6C7169' align='left'>1. Covertly make your way towards </t><t color='#9DA698' align='left'>Frini M.O.B.</t><br/>
		<t color='#6C7169' align='left'>2. Observe the base and wait for the package to arrive by helicopter.</t><br/>
		<t color='#6C7169' align='left'>3. The package is Maj. F. Kallaziz, head of the CSAT Intelligence Services. </t><t color='#9DA698' align='left'>Eliminate the package.</t><br/>
		<t color='#6C7169' align='left'>4. Covertly make your way to the exfil location at </t><t color='#9DA698' align='left'>Cap. Agrios</t><t color='#6C7169' align='left'> where you'll board a patrol boat.</t><br/><br/>
		<t color='#6C7169' align='left'>I have taken the liberty to mark the positions on your map. Godspeed Commander.</t><br/>
	"];
	sleep 1;
};

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
_wp setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle mp_rv2) + [(vehicle mp_rv2)];"];

sleep 30;

0 = execVM "Scr\patrols.sqf";
