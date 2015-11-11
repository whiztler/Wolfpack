if (!hasInterface) exitWith {};
if (rvDone) exitWith {};
hint parseText"<t color='#6C7169' align='left'>Nikos: Phoenix, I am at the church</t><br />";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Nikos Fotopoulos</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Nikos: Phoenix, I am at the church.</font>
"]];
