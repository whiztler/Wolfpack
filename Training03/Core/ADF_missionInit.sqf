/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Mission initialization countdown timer
Author: Whiztler
Script version: 1.2

Game type: n/a
File: ADF_missionInit.sqf
****************************************************************
Instructions:

This script is executed from the init.sqf. Set the number of secs
that the timer needs to run in the init.sqf. E.g.:
[45] execVM "Core\ADF_missionInit.sqf"; 
****************************************************************/

if (time > 300) exitWith {missionInit = true;publicVariable "missionInit";};

// Init
_cnt = 0;
_TimerInput = _this select 0;
_tVersion = str (_this select 1);
_mVersion = str (_this select 2);
_timer = _TimerInput / 100;
missionInit = false;

while {(_cnt != 100)} do {
	_cnt = _cnt + 1;
	sleep _timer;
	hintSilent parseText format ["
		<br/>
		<t align='left' size='1.1' color='#A1A4AD'>Mission Initializing: </t>
		<t size='1.1' align='left' color='#F7D358'>%1&#0037;</t><t size='1.1' align='left' color='#A1A4AD'> done</t><br/><br/>
		<t align='left' color='#A1A4AD'>- Refrain from moving!</t><br/>
		<t align='left' color='#A1A4AD'>- Do not use your radio!</t><br/>
		<t align='left' color='#A1A4AD'>- Follow TL orders</t><br/>
		<t align='left' color='#A1A4AD'>- Init takes approx %2 secs</t><br/><br/>
		<t align='left' color='#A1A4AD'>Tpl: <t color='#FFFFFF' align='left'>%3</t>  |  Mission: </t><t color='#FFFFFF' align='left'>%4</t><br/>
	", _cnt,_TimerInput,_tVersion,_mVersion];
};

hint parseText format ["
	<br/>
	<t size='1.1' color='#FFFFFF' align='left'>Mission initializing complete</t>
	<t size='1' align='left' color='#A1A4AD'><br/><br/>
	- Refrain from moving!<br/>
	- Do not use your radio!<br/>
	- Follow TL orders<br/>
	- Init takes approx %1 secs<br/><br/>
	Tpl: %2  |  Mission: %3</t><br/><br/>
",_TimerInput,_tVersion,_mVersion];
missionInit = true; publicVariable "missionInit"; 
sleep 3; hintSilent "";
 