player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

sleep 3; // Loadout finished > pri weapon loaded

while {time < 25} do {
	if !(isNil "SOR_SSC_1") then {SOR_SSC_1 assignAsCargo vWolf_1; SOR_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsDriver vWolf_1; SOR_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_2; SOR_RTL_1 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsDriver vWolf_2; SOR_RS_2 moveInDriver vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_2; SOR_RS_3 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;
	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_3; SOR_RTL_2 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsDriver vWolf_3; SOR_RS_5 moveInDriver vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_3; SOR_RS_6 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_3; SOR_RS_7 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_3; SOR_AT_1 moveInCargo vWolf_3;};
};

if (!ADF_debug) then {waitUntil {ADF_missionInit}; sleep 5};
hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Big Foot.</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Phoenix.<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
DEVGRU TOC: </font><font color='#9DA698'>Big Foot.</font><br/>
<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Phoenix.</font>
"]];
sleep 30;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Big Foot: Phoenix, make your way to the </t><t color='#9DA698' align='left'>RV</t><t color='#6C7169' align='left'> location.<br/><br/>At the RV you'll be briefed by our local man on the ground, Nikos Fotopoulos.<br /></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Big Foot: Phoenix, make your way to the </font><marker name='mrk_Nikos' color='#9DA698'>RV</marker><font color='#6C7169'> location.<br/><br/>At the RV you'll be briefed by our local man on the ground, Nikos Fotopoulos.</font>
"]];

Retaliate = false;
NeptuneLive = false;
rvDone = false;

[] spawn {
	waitUntil {Retaliate};	
	sleep 120;	
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Big Foot: Phoenix, SatNav reports a Kajman gunship just took off from Abdera Heliport and is heading towards Frini. ETA 3 Mikes.<br /></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Big Foot: Phoenix, SatNav reports a Kajman gunship just took off from Abdera Heliport and is heading towards Frini. ETA 3 Mikes</font>
	<br/><br/>"]];
	
	if !(isServer) exitWith {};
	
	_c = createGroup EAST; 
	_v = [getMarkerPos "Abdera_Apt", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
	vAP1 = _v select 0;
	vAP1 flyInHeight 30;
	_wp1 = _c addWaypoint [getMarkerPos "p3", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointSpeed "NORMAL";
	waitUntil {(currentWaypoint (_wp1 select 0)) > (_wp1 select 1)};
	_wpS = _c addWaypoint [getMarkerPos "cBase2", 0];
	_c setCombatMode "RED";
	_wpS setWaypointType "SAD";
	
	_delAmmoArray = ["38Rnd_80mm_rockets","8Rnd_LG_scalpel"];
	{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
	
	waitUntil {NeptuneLive};
	
	vAP1 flyInHeight 100;
	_wp2 = _c addWaypoint [getMarkerPos "Abdera_Apt", 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "SAFE";
	_wp2 setWaypointSpeed "FULL";
	waitUntil {(currentWaypoint (_wp2 select 0)) > (_wp2 select 1)};
	vAP1 setDamage .9;	
};

Kallaziz_1 addMPEventhandler ["MPkilled", {null = execVM "Scr\kallaziz.sqf"; Retaliate = true; publicVariableServer "Retaliate";}];
if (!isServer) exitWith {};
waitUntil {time > 600};
deleteMarker "mBrief0";