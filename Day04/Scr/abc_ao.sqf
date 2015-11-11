if (isServer) then {	
	// Cleanup Camp2
	if !(isNil "trigRCamp_2") then {
		_q = nearestObjects [getMarkerPos "rc2_1", ["all"], 50];
		while {true} do {
			{deleteVehicle _x} forEach _q
		};
		deleteVehicle trigRCamp_2;
	};
};

if (!hasInterface) exitWith {};

private ["_cnt","_logTime","_logTimeText",];
_cnt = 0;
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Mother: Rattler, we got you on Satnav. The ABC buildings have large antenna's on the roof. You can't miss them.</font><br/><br/>
<font color='#6C7169'>Disable the </font><font color='#9DA698'>power generators</font><font color='#6C7169'> on the roofs of both buildings.</font><br/>
<font color='#6C7169'>Each building has </font><font color='#9DA698'>three</font><font color='#6C7169'> power generators.</font><br/><br/>	
<font color='#6C7169'>I hope you brought enough explosives. Else you'll need to look for explosives at one of the CSAT bases.</font>
<br/><br/>"]];
while {(_cnt != 20)} do {
	_cnt = _cnt + 1;
	hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Mother: Rattler, we got you on Satnav. The ABC buildings have large antenna's on the roof. You can't miss them.</t><br/><br/><t color='#6C7169' align='left'>Disable the </t><t color='#9DA698' align='left'>power generators</t><t color='#6C7169' align='left'> on the roofs of both buildings.</t><br/><t color='#6C7169' align='left'>Each building has </t><t color='#9DA698' align='left'>three</t><t color='#6C7169' align='left'> power generators.</t><br/><br/><t color='#6C7169' align='left'>I hope you brought enough explosives. Else you'll need to look for explosives at one of the CSAT bases.</t>";
	sleep 1;
};

