if (!hasInterface) exitWith {};
hint parseText"
<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: once you have cleared the area, </t><t color='#9DA698' align='left'>tag </t><t color='#6C7169' align='left'>the radar towers and radar installation by approaching them up close.</t><br/><br/><t color='#6C7169' align='left'>Once all the targets have been tagged, you'll be able to call in a missile strike using </t><t color='#9DA698' align='left'>Radio Delta [0-0-4].<br/></t>";

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169' align='left'>Eagle Eye: once you have cleared the area, </font><font color='#9DA698' align='left'>tag </font><font color='#6C7169' align='left'>the radar towers and radar installation by approaching them up close.</font><br/><br/>
<font color='#6C7169' align='left'>Once all the targets have been tagged, you'll be able to call in a missile strike using </font><font color='#9DA698' align='left'>Radio Delta [0-0-4].</font>
<br/><br/>"]];

