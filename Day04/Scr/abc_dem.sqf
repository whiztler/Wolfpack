sleep 3;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Mother: Excellent job Rattler.</t><br/><br/>
	<t color='#6C7169' align='left'>Proceed to exfil </t><t color='#9DA698' align='left'>Sydney</t><t color='#6C7169' align='left'>, just east of </t><t color='#9DA698' align='left'>Faronaki<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Mother: Excellent job Rattler.</font><br/><br/>
<font color='#6C7169'>Proceed to exfil </font><font color='#9DA698'>Sydney</font><font color='#6C7169'>, just east of </font><font color='#9DA698'>Faronaki</font>
<br/><br/>"]];

if (isServer) then {
	deleteMarker "mABC";
	if (!isnil "mRVzulu") then {deleteMarker "mRVzulu";};
	if (!isnil "mRVhotel") then {deleteMarker "mRVhotel";};
	if (!isnil "mRValpha") then {deleteMarker "mRValpha";};

	_m = createMarker ["exfil1", [16079.3,11417.9,5]];
	_m setMarkerSize [1, 1];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_pickup";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "Sydney";
};

sleep 20;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#9DA698' align='left' size='1.5'>STANDBY!</t><br/><br/>
	<t color='#6C7169' align='left'>Mother: Rattler, hold your position and standby for orders update. Out.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#9DA698' size='1.5'>STANDBY!</font><br/><br/>
<font color='#6C7169'>Mother: Rattler, hold your position and standby for orders update. Out</font>
<br/><br/>"]];

if (isServer) then {deleteMarker "exfil1"};

sleep 110;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Mother: Rattler, additional orders:</t><br/><br/>
	<t color='#6C7169' align='left'>Head towards </t><t color='#9DA698' align='left'>Charkia</t><t color='#6C7169' align='left'>, north of your current. There is a </t><t color='#9DA698' align='left'>storage facility</t><t color='#6C7169' align='left'> on the north side of the city.</t><br/>
	<t color='#6C7169' align='left'>More updates to follow asap.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Mother: Rattler, additional orders:</font><br/><br/>
<font color='#6C7169'>Head towards </font><font color='#9DA698'>Charkia</font><font color='#6C7169'>, north of your current. There is a </font><font color='#9DA698'>storage facility</font><font color='#6C7169'> on the north side of the city.</font><br/>
<font color='#6C7169'>More updates to follow asap.</font
<br/><br/>"]];

sleep 190;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Mother: Rattler, apparently there are two spare generators at the storage facility.</t><br/>
	<t color='#6C7169' align='left'>We need to take out those two generators. Find them and blow them to hell.</t><br/><br/>
	<t color='#6C7169' align='left'>Niko's crew will leave you additional explosives at the entrance of the facility.</t><br/><br/>
	<t color='#6C7169' align='left'>Good luck Rattler.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Mother: Rattler, apparently there are two spare generators at the storage facility.</font><br/>
<font color='#6C7169'>We need to take out those two generators. Find them and blow them to hell.</font><br/><br/>
<font color='#6C7169'>Niko's crew will leave you additional explosives at the entrance of the facility.</font><br/><br/>
<font color='#6C7169'>Good luck Rattler.</font>
<br/><br/>"]];

if !(isServer) exitWith {};
_m = createMarker ["mABC2", [18330,15521,48]];
_m setMarkerSize [1, 1];
_m setMarkerShape "ICON";
_m setMarkerType "mil_triangle";
_m setMarkerColor "ColorWEST";
_m setMarkerDir 0;
_m setMarkerText "ABC Gen";