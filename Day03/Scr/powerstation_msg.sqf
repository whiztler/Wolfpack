hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Eagle  Eye: Eightball, we have you on SatNav at the Powerstation. The generators are quite tough. You probably need a lot of explosives to take them out. Search the premises for explosives if you run out.<br/></t>
";

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169' align='left'>Eagle  Eye: Eightball, we have you on SatNav at the Powerstation. The generators are quite tough. You probably need a lot of explosives to take them out. Search the premises for explosives if you run out.</font>
<br/><br/>"]];