hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Jetson: Scarecrow, try to avoid patrols and covertly approach the airfield.</t><br/><br/>
	<t color='#6C7169' align='left'>Your task is to destroy ALL the Kajman Attack helicopters.</t><br/>
	<t color='#6C7169' align='left'>Local intel suggests that there is an explosives cache in the industrial shed in case you need additional demo equipment.</t><br/>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Jetson: Scarecrow, try to avoid patrols and covertly approach the airfield.<br/><br/>
Your task is to destroy ALL the Kajman Attack helicopters.<br/>
Local intel suggests that there is an explosives cache in the industrial shed in case you need additional demo equipment.</font>
<br/><br/>"]];

[] spawn {
	sleep 30;

	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Jetson: exfil is at </t><t color='#9DA698' align='left'>Ammalofi Bay.</t><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Jetson: exfil is north-east, close to </font><font color='#9DA698'>Ammalofi Bay.</font>
	<br/><br/>"]];
};

[] spawn {
	waitUntil {triggerActivated tDevice};
	hint parseText"
		<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Jetson, this is Scarecrow. We just discovered an unknown device in one of the buildings at our current position. How copy?</t><br /><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Wolf</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Jetson, this is Scarecrow. We just discovered an unknown device in one of the buildings at our current position. How copy?</font>
	<br/><br/>"]];
	sleep 40;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Jetson: Standby Scarecrow.</t><br /><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Jetson: Standby Scarecrow.</font>
	<br/><br/>"]];
	sleep 20;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Jetson: Scarecrow, take some photos and upload to TOC. How copy?</t><br /><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Jetson: Scarecrow, take some pictures and upload to TOC. How copy?</font>
	<br/><br/>"]];
	sleep 10;
	hint parseText"
		<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Scarecrow: Roger that Jetson. Uploading in 2 mikes.</t><br /><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: Wolf</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>JScarecrow: Roger that Jetson. Uploading in 2 mikes</font>
	<br/><br/>"]];
	sleep 112;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Jetson: Receiving the data now. Standby for orders.</t><br /><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Jetson: Receiving the data now. Standby for orders.</font>
	<br/><br/>"]];	
	sleep 92;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Jetson: Scarecrow, your orders are to neutralize the device.</t><br /><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Jetson: Scarecrow, your orders are to neutralize the device.</font>
	<br/><br/>"]];
	waitUntil {!alive ADF_device_1};
	sleep 3;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Jetson: Scarecrow, our engineers are studying the photo's. They suspect that the device was nuclear charged. Better get out of there.</t><br /><br />
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------<br/><br/>
	<font color='#6c7169'>Jetson: Scarecrow, our engineers are studying the photo's. They suspect that the device was nuclear charged. Better get out of there.</font>
	<br/><br/>"]];	
};	


_grp		= [];
_p 		= [];

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Foot patrols
_grp = [getMarkerPos "ap1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap1", 700, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep .05;

_grp = [getMarkerPos "ap2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap2", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;
sleep .05;

_grp = [getMarkerPos "ap3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
[_grp, getMarkerPos "ap3", 500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol;

// Sentries
_grp = CreateGroup EAST; 
_p = _grp createUnit ["O_Soldier_F",getPosASL hmg1,[],0,"SERGEANT"]; _p setDir 60; _p moveInGunner hmg1; sleep .05;
_p = _grp createUnit ["O_Soldier_F",getPosASL gmg1,[],0,"CORPORAL"]; _p setDir 330; _p moveInGunner gmg1; sleep .05;
_p = _grp createUnit ["O_Soldier_LAT_F",getPosASL twr1,[],0,"private"]; sleep .05;
_p = _grp createUnit ["O_Soldier_AR_F",getPosASL twr1,[],0,"private"]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_soldier_M_F",[9144.85,21627.8,14.7702],[],0,"private"]; _p setDir 120; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 8.6]; sleep .05;

_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",getPos fl01,[],0,"private"]; _p setDir 270; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_GL_F",getPos cp1_2,[],0,"private"]; _p setDir 330; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",[8960.03,21268.2,19.4355],[],0,"private"]; _p setDir 270; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_GL_F",[8963.83,21265,19.4298],[],0,"private"]; _p setDir 347; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",[9369.06,21623.09,16.7777],[],0,"private"]; _p setDir 115; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_GL_F",[9365.05,21626.7,16.7748],[],0,"private"]; _p setDir 40; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",[9191.38,21715.8,14.5178],[],0,"private"]; _p setDir 0; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_GL_F",[9188.07,21711.8,14.4971],[],0,"private"]; _p setDir 45; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;

_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",[9256,21511.5,16.8956],[],0,"private"]; _p setDir 150; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_AR_F",[9133.77,21420.3,17.8738],[],0,"private"]; _p setDir 150; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",[8972.09,21438.4,16.3509],[],0,"private"]; _p setDir 290; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_AR_F",[9067.48,21565.9,15.3968],[],0,"private"]; _p setDir 320; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",[9183.53,21669,14.3805],[],0,"private"]; _p setDir 150; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 3.15]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_AR_F",[9187.89,21672.3,14.371],[],0,"private"]; _p setDir 60; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 3.15]; sleep .05;
_grp = CreateGroup EAST; _p = _grp createUnit ["O_Soldier_F",[9258.17,21612.7,16.3197],[],0,"private"]; _p setDir 20; _p setPosATL [getPosATL _p select 0, getPosATL _p select 1, 4.5];  sleep .05;

// Device sentry
_grp = [getMarkerPos "mDeviceSentry", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "UInfantry" >> "OIA_GuardSentry")] call BIS_fnc_spawnGroup;


