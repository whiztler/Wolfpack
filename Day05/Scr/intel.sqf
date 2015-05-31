// intel found

hint parseText"
	<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy this is Cougar, we have found the laptop. How copy?</t><br/>	
";

sleep 15;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Good job Cougar!</t><br/><br/>
	<t color='#6C7169' align='left'>Please insert the USB dongle into the laptop to establish the uplink to the JSOC TOC server.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
Cowboy: Good job Cougar!</font><br/><br/>
<font color='#6C7169'>Please insert the USB dongle into the laptop to establish the uplink to the JSOC TOC server.</font>
<br/><br/>"]];
sleep 15;

if (isServer) then {
	deleteMarker "mObj1"; deleteMarker "mObj2"; deleteMarker "mObj3"; deleteMarker "mObj4"; deleteMarker "mObj5"; deleteMarker "mObj_e";

	if !(isNil "vWolf_1") then {deleteVehicle vWolf_1;};
	if !(isNil "vWolf_2") then {deleteVehicle vWolf_2;};
	if !(isNil "vWolf_3") then {deleteVehicle vWolf_3;};
	if !(isNil "vWolf_4") then {deleteVehicle vWolf_4;};
};


hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Connection established. Downloading data.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
Cowboy: Connection established. Downloading data.</font>
<br/><br/>"]];
sleep 15;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Cougar, this may take a few minutes. Will advice when we have received all the data.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
Cowboy: Cougar, this may take a few minutes. Will advice when we have received all the data.</font>
<br/><br/>"]];

_snooze = [90,100,110,120,130,140,150] call BIS_fnc_selectRandom;
sleep _snooze;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Cougar, we have the data. Excellent work!</t><br/><br/>
	<t color='#6C7169' align='left'>Condor is enroute. ETA at LZ Sundance in approx 25 minutes.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
Cowboy: Cougar, we have the data. Excellent work!</font><br/><br/>
<font color='#6C7169'>Condor is enroute. ETA at LZ Sundance in approx 25 minutes.</font>
<br/><br/>"]];

_snooze = [180,190,200,210,220,230,240] call BIS_fnc_selectRandom;
sleep _snooze;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Cougar, we just got word that Condor is ineffective.</t><br/><br/>
	<t color='#6C7169' align='left'>Standby for alternate exfil.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
Cowboy: Cougar, we just got word that Condor is ineffective.</font><br/><br/>
<font color='#6C7169'>Standby for alternate exfil.</font>
<br/><br/>"]];

if (isServer) then {deleteMarker "mExfil";};

sleep 110;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Cowboy: Cougar, we have no other SOAR's on station.</t><br/><br/>
	<t color='#6C7169' align='left'>Satnav advices that there are several CSAT Attack Vessels at the marina. Secure one or two of these vessels and head south towards the open sea. The USS Wasp is at grid 14400005</t><br/><br/>
	<t color='#6C7169' align='left'>Good luck Cougar!.</t><br/>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
Cowboy: Cougar, we have no other SOAR's on station.</font><br/><br/>
<font color='#6C7169'>Satnav advices that there are several CSAT Attack Vessels at the marina. Secure one or two of these vessels and head south towards the open sea. The USS Wasp is at grid 14400005</font><br/><br/>
<font color='#6C7169'>Good luck Cougar!.</font>
<br/><br/>"]];

if (isServer) then {
	_m = createMarker ["mWasp",getMarkerPos "mWaspTmp"];
	_m setMarkerSize [1,1];
	_m setMarkerShape "ICON";
	_m setMarkerType "c_ship";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText " USS Wasp";
};