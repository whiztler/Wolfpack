roundscomplete = false;
if !(hasInterface) exitWith {};
hintSilent parseText "<t color='#6C7169' align='left'>Blizzard: Fire mission received. Fire for Effect, R, F, High Explosive.</t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Blizzard</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Blizzard: Fire mission received. Fire for Effect, R, F, High Explosive.</font>
<br/><br/>"]];
sleep 5;

hintSilent parseText "<t color='#6C7169' align='left'>Blizzard: Roger, Foxtrot, High Explosive in effect, 8 rounds out.</t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Blizzard</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Blizzard: R, F, High Explosive in effect, 8 rounds out.</font>
<br/><br/>"]];
sleep 5;

hintSilent parseText "<t color='#6C7169' align='left'>Blizzard: Shot out.</t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Blizzard</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Blizzard: Shot out.</font>
<br/><br/>"]];
sleep 5;

hintSilent parseText "<t color='#6C7169' align='left'>Blizzard: Splash in 40.</t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Blizzard</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Blizzard: Splash in 40.</font>
<br/><br/>"]];
sleep 35;

hintSilent parseText "<t color='#6C7169' align='left'>Blizzard: Splash out.</t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Blizzard</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Blizzard: Splash out.</font>
<br/><br/>"]];
sleep 5;

wpBlizzard = true; publicVariableServer "wpBlizzard";
waitUntil {sleep 2; roundscomplete};
sleep 2;

hintSilent parseText "<t color='#6C7169' align='left'>Blizzard: Rounds complete. End of fire mission.</t>";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: Blizzard</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Blizzard: Rounds complete. End of fire mission.</font>
<br/><br/>"]];

commtwr = 1; publicVariable "commtwr";
