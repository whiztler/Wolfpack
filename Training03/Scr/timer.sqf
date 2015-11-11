waitUntil {ADF_missionInit};
spDetected = false;
WPtraining = "Expert";

sleep 2;

// init
private ["_timer1","_timer2","_prepTimer","_preTimerMin","_prepMinLeft","_pause","_msg"];
_timer1 = 2700; // 45 min
_timer2 = 1800; // 30 min
_prepTimer = 180;
_preTimerMin = 3;
_prepMinLeft = _preTimerMin;
_pause = 20; // sleep time

TimesUp = {
	player setPos (getMarkerPos "mStart");
	[] spawn {["<img size= '8' shadow='false' image='Img\wolf_logo.paa'/><br/><br/><t size='.7' color='#9DA698'>You have run out of time. Your training is over</t>",0,0,3,12] spawn BIS_fnc_dynamicText;};
	sleep 5;
	_l = ["xLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK OUT", 5];
	sleep 4;
	['END2',true,2] call BIS_fnc_endMission;
};

_msg = format ["
		<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
		<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
		<t color='#6C7169' align='left'>Two objectives. First objective:</t><br/><br/>
		<t color='#9DA698' align='left'>Destroy 2 x TO199 CAS Jets at Altis International Airport</t><br/><br/>
		<t color='#6C7169' align='left'>You have</t>
		<t color='#9DA698' align='left'> %2 </t>
		<t color='#6C7169' align='left'>minutes to complete the task.</t><br/><br/>
		<t color='#6C7169' align='left'>If you are detected by OpFor or a civilian, or if your time runs out then you have failed the training objective and your mission is over.</t><br/><br/>		
		<t color='#6C7169' align='left'>The second objective will be advised once you have completed your first task.</t><br/><br/>
",WPtraining,_timer1/60];
hintSilent parseText _msg;
if (spDetected) exitWith {};

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
<font color='#6c7169'>Two objectives. First objective:<br/>
Destroy 2 x TO199 CAS Jets at Altis International Airport<br/><br/>
If you are detected by OpFor or a civilian, or if your time runs out then you have failed the training objective and your mission is over.<br/>
The second objective will be advised once you have completed your first task.</font>
"]];
sleep _pause;

while {_prepTimer > 0} do {
	_prepTimer = _prepTimer - 1;  	
	_prepMinLeft = [((_prepTimer)/60)+.01,"HH:MM"] call BIS_fnc_timetostring;
	_msg = format ["
			<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
			<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
			<t color='#6C7169' align='left'>Commander, you have %2 minutes to prepare your team for this training exercise.</t><br/><br/>		
			<t color='#6C7169' align='left'>The containers blocking the exit will be removed once your preparation time has finished.</t><br/><br/>			
			<t color='#6C7169' align='left'>Preparation time left:</t>
			<t color='#9DA698' align='left'> %3 </t><br/><br/>
	",WPtraining,_preTimerMin,_prepMinLeft];
	hintSilent parseText _msg;
	if (spDetected) exitWith {};
	sleep 1;
};

if (spDetected) exitWith {};
sleep 2;

if (isServer) then {
	_del = [timerGate_1,timerGate_2,timerGate_3,timerGate_4,timerGate_5,timerGate_6,timerGate_7,timerGate_8,timerGate_9,timerGate_10,timerGate_11,timerGate_12,wp_sign];
	{deleteVehicle _x} forEach _del;
};

_msg = format ["
		<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
		<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
		<t color='#6C7169' align='left'>You're free to go. Your %2 minutes to complete both objectives starts now!</t><br/><br/>				
",WPtraining,_timer1/60];
hintSilent parseText _msg;
if (spDetected) exitWith {};
sleep 5;

while {_timer1 > 0} do {
	_timer1 = _timer1 - 1;  	
	_timeLeft = [((_timer1)/60)+.01,"HH:MM"] call BIS_fnc_timetostring;
	_pmsg = format ["
			<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
			<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
			<t color='#6C7169'>Time left: </t>
			<t color='#9DA698' size='1.1'>%2</t><br/><br/>
	",WPtraining,_timeLeft];
	hintSilent parseText _pmsg;
	if (spDetected || obj1Done) exitWith {};
	if ((_timer1 < 1) && !obj1Done) exitWith {call TimesUp};
	uiSleep 1;
};

if (spDetected) exitWith {};

waitUntil {sleep 2; obj1Done};

_msg = format ["
		<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
		<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
		<t color='#6C7169' align='left'>First objective completed! Your second objective is as follows:</t><br/><br/>		
		<t color='#9DA698' align='left'>Destroy all Kajman Attack Helicopters at the helibase at Altis International Airport.</t><br/><br/>
		<t color='#6C7169' align='left'>You have</t>
		<t color='#9DA698' align='left'> %2 </t>
		<t color='#6C7169' align='left'>minutes to complete the task.</t><br/><br/>
		<t color='#6C7169' align='left'>If you are detected by OpFor or a civilians or if your time runs out, then you have failed the training.</t><br/><br/>		
",WPtraining,_timer2/60];
hintSilent parseText _msg;
if (spDetected) exitWith {};

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
<font color='#6c7169'>First objective completed! Your second and final objective is as follows:<br/>
Destroy all Kajman Attack Helicopters at the helibase at Altis International Airport.<br/><br/>
If you are detected by OpFor or a civilian, or if your time runs out then you have failed the training objective and your mission is over.</font>
"]];
sleep _pause;

sleep 30;

while {_timer2 > 0} do {
	_timer2 = _timer2 - 1;  	
	_timeLeft = [((_timer2)/60)+.01,"HH:MM"] call BIS_fnc_timetostring;
	_pmsg = format ["
			<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
			<t color='#A1A4AD' size='1.4'>%1 Training</t><br/><br/>
			<t color='#6C7169'>Time left: </t>
			<t color='#9DA698' size='1.1'>%2</t><br/><br/>
	",WPtraining,_timeLeft];
	hintSilent parseText _pmsg;
	if (spDetected || obj2Done) exitWith {};
	if ((_timer2 < 1) && !obj2Done) exitWith {call TimesUp};
	uiSleep 1;
};

if (spDetected) exitWith {};

waitUntil {sleep 2; obj2Done};

deleteVehicle blueDect1;
deleteVehicle blueDect2;

sleep 5;
hintSilent "";

["
	<img size= '7' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
	<t size='1' color='#119F75'>EXPERT TRAINING COMPLETED!</t><br/><br/>
	<t size='.7' color='#9DA698'>You have made it! You have successfully<br/>completed both training objectives!</t>
",0,0,3,12] spawn BIS_fnc_dynamicText;
sleep 5;
['END1',true,15] call BIS_fnc_endMission;

