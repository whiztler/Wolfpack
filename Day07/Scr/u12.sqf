if (!hasInterface) exitWith {};
hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Gator: Beagle, we have you closing in on the objective on SatNav. Once inside, find Nikos and assign him to your group. A action menu will be available once you are in close proximity of Nikos.<br/><br/>Good luck Beagle!<br/></t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Gator: Beagle, we have you closing in on the objective on SatNav. Once inside, find Nikos and assign him to your group. A action menu will be available once you are in close proximity of Nikos.<br/><br/>Good luck Beagle!</font>
<br/><br/>"]];

