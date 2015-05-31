HintSilent parseText "
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Big Foot: Don't mind the vessel to your north-west. It is a Russian Signals intelligence Trawler. We are jamming its comms. It should be of no concern to your op.<br /></t>
";
	
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Big Foot: Don't mind the vessel to your north-west. It is a Russian Signals intelligence Trawler. We are jamming its comms. It should be of no concern to your op.</font>
"]];