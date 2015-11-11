if (!hasInterface) exitWith {};
hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#A1A4AD' align='left'>Uncle: Viper, intel suggests that Ice Tiger is somewhere further north.<br/></t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Uncle: Viper, intel suggests that Ice Tiger is somewhere further north</font>
<br/><br/>"]];