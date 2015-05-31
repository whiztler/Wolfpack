hint parseText "
	<t color='#A1A4AD' align='left'>Nikos: Eightball, I am in the destroyed building opposite the church just south east of your position.</t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Nikos Fotopoulos</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Niko: Eightball, I am in the destroyed building opposite the church just south east of your position.</font>
<br/><br/>"]];

0 = execVM "Scr\convoy.sqf";
