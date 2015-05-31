#include "ADF_JIP.sqf"

rvDone = true; publicVariable "rvDone";

hint parseText"
	<t color='#6C7169' align='left'>Hi Kommender, so sory but my Inglis no good. Name is Dimitri, good to see yu yes.<br/><br/>Nikos at Camp P12 yes. He see yu their. I put on map for yu yes. Me now go.</t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Dimitri Tsakonas</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Hi Kommender, so sory but my Inglis no good. Name is Dimitri, good to see yu yes.<br/><br/>Nikos at Camp P12 yes. He see yu their. I put on map for yu yes. Me now go.</font>
<br/><br/>"]];

if (!isServer) exitWith {};

_mrk1 = createMarker ["mP12", getPos trigRCamp_1];
_mrk1 setMarkerShape "ICON";
_mrk1 setMarkerType "mil_triangle";
_mrk1 setMarkerColor "ColorWEST";
_mrk1 setMarkerText "P12";
_mrk1 setMarkerDir 0;

deleteMarker "mRValpha";
deleteMarker "mRVhotel";
deleteMarker "mRVzulu";

sleep 10;

_wp = gDimitri addWaypoint [getPos qb1, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "COLUMN";
_wp setWaypointStatements ["true", "Dimitri moveInDriver qb1;"];
sleep 1;
_wp = gDimitri addWaypoint [getMarkerPos "mDim", 1];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle qb1) + [(vehicle qb1)];"];
