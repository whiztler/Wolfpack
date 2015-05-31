if (rvDone) exitWith {};
hint parseText"
	<t color='#6C7169' align='left'>Commander, diz iz Dimitri. Me 100 metres north west yes. Me at chappel.</t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Dimitri Tsakonas</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Commander, diz iz Dimitri. Me 100 metres north west yes. Me at chappel.</font>
<br/><br/>"]];

