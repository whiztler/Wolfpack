if (!hasInterface) exitWith {};
hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#A1A4AD' align='left'>Uncle: Satnav shows 2 or 3 AA emplacements on the tower and 2 emplacements on the ground. Destroy them all.</t>";

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Uncle: Satnav shows 2 or 3 AA emplacements on the tower and 2 emplacements on the ground. Destroy them all.</font>
<br/><br/>"]];

