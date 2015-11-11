if (!hasInterface) exitWith {};
hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#A1A4AD' align='left'>Uncle: We have you on Satnav Viper. Once you have secured the objective, blow the Radar emplacement. You probably need quite a lot of explosives to pull this off. Perhaps CSAT has an ammo cache at the base.</t>";

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Uncle: We have you on Satnav Viper. Once you have secured the objective, blow the Radar emplacement. You probably need quite a lot of explosives to pull this off. Perhaps CSAT has an ammo cache at the base.</font>
<br/><br/>"]];

