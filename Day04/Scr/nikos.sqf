#include "ADF_JIP.sqf"

_cnt = 0;
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Ahhh Commander, good to see you my friend. Welcome to one of our camps.</font><br/><br/>
<font color='#6C7169'>I understand you are going to sabotage the ABC headquarters. It is about time we get rid of CSAT propaganda.</font><br/>
<font color='#6C7169'>Pyrgos is well defended. A large army bases is just north of the ABC buildings. There is at least a battalion at the base. Beware of urban area's. CSAT has presence in every town now. And they patrol the entire peninsula actively.</font><br/><br/>
<font color='#6C7169'>I have </font><font color='#9DA698'>two trucks</font><font color='#6C7169'> waiting for your at our supply camp just north west of here, at </font><font color='#9DA698'>Livadi</font><font color='#6C7169'>. I asked the guys drop a chemlight for you at the camp. Beware of patrols. There are many!</font><br/><br/>
<font color='#6C7169'>Good luck Commander!</font>
<br/><br/>"]];
while {(_cnt != 40)} do {
	_cnt = _cnt + 1;
	hintSilent parseText"
	<t color='#6C7169' align='left'>Ahhh Commander, good to see you my friend. Welcome to one of our camps.</t><br/><br/>
	<t color='#6C7169' align='left'>I understand you are going to sabotage the ABC headquarters. It is about time we get rid of CSAT propaganda.</t><br/>
	<t color='#6C7169' align='left'>Pyrgos is well defended. A large army bases is just north of the ABC buildings. There is at least a battalion at the base. Beware of urban area's. CSAT has presence in every town now. And they patrol the entire peninsula actively.</t><br/><br/>
	<t color='#6C7169' align='left'>I have </t><t color='#9DA698' align='left'>two trucks</t><t color='#6C7169' align='left'> waiting for your at our supply camp just north west of here, at </t><t color='#9DA698' align='left'>Livadi</t><t color='#6C7169' align='left'>. I asked the guys drop a chemlight for you at the camp. Beware of patrols. There are many!</t><br/><br/>
	<t color='#6C7169' align='left'>Good luck Commander!<br/></t>
	";
	sleep 1;
};

sleep 10;

if !(isServer) exitWith {};

if (!isNil "mP12") then {deleteMarker "mP12"};
if (!isNil "vWolf_1") then {deleteVehicle vWolf_1};
if (!isNil "vWolf_2") then {deleteVehicle vWolf_2};
