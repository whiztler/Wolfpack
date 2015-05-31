hint parseText"
	<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Eagle Eye this is Cowboy, we are almost within visual range of the depot. How copy?<br/></t>
";
sleep 10;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Eagle Eye: Copy Cowboy. Move in closer and report in armoured CSAT material.</t><br/><br/>
	<t color='#6C7169' align='left'>Use the radio function to call in intel, e.g. </t>
	<t color='#9DA698' align='left'>[0-0-3] </t>
	<t color='#6C7169' align='left'>Depot intel: 3 x BTR-K + 5 x MSE-3 Madrid.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Eagle Eye: Copy Cowboy. Move in closer and report in armoured CSAT material.</font><br/><br/>
<font color='#6C7169'>Use the radio function to call in intel, e.g. </font>
<font color='#9DA698'>[0-0-3] </font>
<font color='#6C7169'>Depot intel: 3 x BTR-K + 5 x MSE-3 Madrid.</font>
<br/><br/>"]];

if (isServer) then {
	tDepot1 = createTrigger ["EmptyDetector", getPos server]; publicVariable "tDepot1";
	tDepot2 = createTrigger ["EmptyDetector", getPos server]; publicVariable "tDepot2";
	tDepot3 = createTrigger ["EmptyDetector", getPos server]; publicVariable "tDepot3";
};

if !(isDedicated) then {
	waituntil {!(isNil "tDepot1") && !(isNil "tDepot2") && !(isNil "tDepot3")};

	tDepot1 setTriggerType "NONE";
	tDepot1 setTriggerActivation ["CHARLIE", "PRESENT", false];
	tDepot1 setTriggerArea [0,0,0,false];
	tDepot1 setTriggerText "Depot intel: 3 x BTR-K + 5 x MSE-3 Madrid";
	tDepot1 setTriggerStatements ["this", "tDepot2 setTriggerText """"; deleteVehicle tDepot2; tDepot3 setTriggerText """"; deleteVehicle tDepot3;", ""];
	
	tDepot2 setTriggerType "NONE";
	tDepot2 setTriggerActivation ["DELTA", "PRESENT", false];
	tDepot2 setTriggerArea [0,0,0,false];
	tDepot2 setTriggerText "Depot intel: 2 x BTR-K + 6 x MSE-3 Madrid";
	tDepot2 setTriggerStatements ["this", "tDepot1 setTriggerText """"; deleteVehicle tDepot1; tDepot3 setTriggerText """"; deleteVehicle tDepot3;", ""];
	
	tDepot3 setTriggerType "NONE";
	tDepot3 setTriggerActivation ["ECHO", "PRESENT", false];
	tDepot3 setTriggerArea [0,0,0,false];
	tDepot3 setTriggerText "Depot intel: 2 x BTR-K + 4 x MSE-3 Madrid";
	tDepot3 setTriggerStatements ["this", "tDepot1 setTriggerText """"; deleteVehicle tDepot1; tDepot2 setTriggerText """"; deleteVehicle tDepot2;", ""];
};

waitUntil {(triggerActivated tDepot1) || (triggerActivated tDepot2) || (triggerActivated tDepot3)};

sleep 3; 

if (triggerActivated tDepot1) exitWith {
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Eagle Eye: copy that Cowboy, 3 times BTR-K APC and 5 times MSE-3 APC.</t><br/><br/>
		<t color='#6C7169' align='left'>Unfortunately, this is not in line with our intel.</t><br/><br/>
		<t color='#6C7169' align='left'>Cowboy, proceed to the </t>
		<t color='#9DA698' align='left'>Stratis Air Base.</t><br/>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Eagle Eye: copy that Cowboy, 3 times BTR-K APC and 5 times MSE-3 APC.</font><br/><br/>
	<font color='#6C7169'>Unfortunately, this is not in line with our intel.</font><br/><br/>
	<font color='#6C7169'>Cowboy, proceed to the </font><font color='#9DA698'>Stratis Air Base.</font>
	<br/><br/>"]];
	// relocate exfil location
};

if (triggerActivated tDepot2) exitWith {
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Eagle Eye: copy that Cowboy, 2 times BTR-K APC and 6 times MSE-3 APC.</t><br/><br/>
		<t color='#6C7169' align='left'>Excellent, this seems to be valuable intel. Good job Cowboy!</t><br/><br/>
		<t color='#6C7169' align='left'>Cowboy, proceed to the </t>
		<t color='#9DA698' align='left'>Stratis Air Base.</t><br/>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Eagle Eye: copy that Cowboy, 2 times BTR-K APC and 6 times MSE-3 APC.</font><br/><br/>
	<font color='#6C7169'>Excellent, this seems to be valuable intel. Good job Cowboy!</font><br/><br/>
	<font color='#6C7169'>Cowboy, proceed to the </font><font color='#9DA698'>Stratis Air Base.</font>
	<br/><br/>"]];	
};

if (triggerActivated tDepot3) exitWith {
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Eagle Eye: copy that Cowboy, 2 times BTR-K APC and 4 times MSE-3 APC.</t><br/><br/>
		<t color='#6C7169' align='left'>Unfortunately, this is not in line with our intel.</t><br/><br/>
		<t color='#6C7169' align='left'>Cowboy, proceed to the </t>
		<t color='#9DA698' align='left'>Stratis Air Base.</t><br/>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Eagle Eye: copy that Cowboy, 2 times BTR-K APC and 4 times MSE-3 APC.</font><br/><br/>
	<font color='#6C7169'>Unfortunately, this is not in line with our intel.</font><br/><br/>
	<font color='#6C7169'>Cowboy, proceed to the </font><font color='#9DA698'>Stratis Air Base.</font>
	<br/><br/>"]];
	// relocate exfil location
};


