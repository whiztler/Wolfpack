if (!hasInterface) exitWith {};
hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Big Foot: We just received intel that the package has been eliminated. Good job Phoenix! Proceed to</t><t color='#9DA698'> Cap Agrios </t><t color='#6C7169'>for exfil.<br /></t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Big Foot: We just received intel that the package has been eliminated. Good job Phoenix! Proceed to </font><marker name='mrk_Nikos' color='#9DA698'>Cap Agrios</marker><font color='#6C7169'> for exfil.</font>
"]];
