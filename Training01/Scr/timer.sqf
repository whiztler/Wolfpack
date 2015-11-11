waitUntil {ADF_missionInit};
spDetected = false;
WPtraining = "Basic";

sleep 2;

// init
private ["_timer","_prepTimer","_preTimerMin","_prepMinLeft","_pause","_msg"];
_timer = (paramsArray select 0) * 60;
_prepTimer = (paramsArray select 1) * 60;
_preTimerMin = paramsArray select 1;
_prepMinLeft = _preTimerMin;
_pause = 20; // sleep time

_msg = format ["
		<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
		<t color='#A1A4AD' size='1.7'>Wolfpack</t><br/>
		<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
		<t color='#6C7169' align='left'>Reach the finish marker at Thronos Castle within</t>
		<t color='#9DA698' align='left'> %2 </t>
		<t color='#6C7169' align='left'>minutes.</t><br/><br/>
		<t color='#6C7169' align='left'>If you have not reached the flag at the castle within %2 minutes the training mission has failed.</t><br/><br/>
",WPtraining,_timer/60];
hintSilent parseText _msg;
if (spDetected) exitWith {};

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
<font color='#6c7169'>Reach the finish marker at Thronos Castle within the designated time limit<br/><br/>
If you have not reached the flag at the castle within the time frame the training mission has failed.<br/><br/>
If you are detected by OpFor then the training mission has failed.<br/><br/>
Avoid any and all contact with both OpFor and the civilian populous.<br/>
Please refer to the briefing for more information on Special Operations / Reconnaissance training.</font>
"]];
sleep _pause;

_msg = format ["<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/><t color='#A1A4AD' size='1.7'>Wolfpack</t><br/><t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/><t color='#6C7169' align='left'>If you are detected by OpFor then the training mission has failed.</t><br/><br/><t color='#6C7169' align='left'>Avoid any and all contact with both OpFor and the civilian populous.</t><br/><br/><t color='#6C7169' align='left'>Please refer to the briefing for more information on Special Operations / Reconnaissance training.</t><br/><br/>",WPtraining];
hintSilent parseText _msg;
if (spDetected) exitWith {};
sleep _pause;

while {_prepTimer > 0} do {
	_prepTimer = _prepTimer - 1;  	
	_prepMinLeft = [((_prepTimer)/60)+.01,"HH:MM"] call BIS_fnc_timetostring;
	_msg = format ["<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/><t color='#A1A4AD' size='1.7'>Wolfpack</t><br/><t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/><t color='#6C7169' align='left'>Commander, you have %2 minutes to prepare your team for this training exercise.</t><br/><br/><t color='#6C7169' align='left'>The containers blocking the exit will be removed once your preparation time has finished.</t><br/><br/>	<t color='#6C7169' align='left'>Preparation time left:</t><t color='#9DA698' align='left'> %3 </t><br/><br/>",WPtraining,_preTimerMin,_prepMinLeft];
	hintSilent parseText _msg;
	if (spDetected) exitWith {};
	uiSleep 1;
};
if (spDetected) exitWith {};
sleep 2;

if (isServer) then {
	_del = [timerGate_1,timerGate_2,timerGate_3,timerGate_4];
	{deleteVehicle _x} forEach _del;
};

_msg = format ["<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/><t color='#A1A4AD' size='1.7'>Wolfpack</t><br/><t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/><t color='#6C7169' align='left'>You're free to go. Your %2 minutes start now!</t><br/><br/>",WPtraining,_timer/60];
hintSilent parseText _msg;
if (spDetected) exitWith {};
sleep 5;

while {_timer > 0} do {
	_timer = _timer - 1;  	
	_timeLeft = [((_timer)/60)+.01,"HH:MM"] call BIS_fnc_timetostring;
	_pmsg = format ["
			<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
			<t color='#A1A4AD' size='1.7'>Wolfpack</t><br/>
			<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
			<t color='#6C7169'>Time left: </t><t color='#9DA698'size='1.1'>%2</t><br/><br/>
	",WPtraining,_timeLeft];
	hintSilent parseText _pmsg;
	if (spDetected) exitWith {};
	uiSleep 1;
};

if (spDetected) exitWith {};
if !(triggerActivated tCompleted) then {["END2",false,5] call BIS_fnc_endMission;}