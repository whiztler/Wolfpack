sleep 10;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Mother: Job well done Rattler!</t><br/><br/>
	<t color='#6C7169' align='left'>Time to come home. Head to </t><t color='#9DA698' align='left'>LZ Romeo</t><t color='#6C7169' align='left'> in the </t><t color='#9DA698' align='left'>Limni Swamps.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Mother: Job well done Rattler!</font><br/><br/>
<font color='#6C7169'>Time to come home. Head to </font><font color='#9DA698'>LZ Romeo</font><font color='#6C7169'> in the </font><font color='#9DA698'>Limni Swamps.</font>
<br/><br/>"]];

if !(isServer) exitWith {};
_m = createMarker ["mRomeo", getPos exfilLoc];
_m setMarkerSize [1, 1];
_m setMarkerShape "ICON";
_m setMarkerType "hd_pickup";
_m setMarkerColor "ColorWEST";
_m setMarkerDir 0;
_m setMarkerText "Romeo";

deleteMarker "mABC2";
