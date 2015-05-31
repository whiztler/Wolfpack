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
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsCommander vWolf_1; SOR_RM_1 moveInCommander vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsGunner vWolf_1; SOR_UAV_1 moveInGunner vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsDriver vWolf_1; SOR_RMM_1 moveInDriver vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_1; SOR_RTL_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_1; SOR_RS_2 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_1; SOR_RS_3 moveInCargo vWolf_1;}; sleep 0.035;
	
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCommander vWolf_2; SOR_RS_4 moveInCommander vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsGunner vWolf_2; SOR_DEM_1 moveInGunner vWolf_2;}; sleep 0.035;	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsDriver vWolf_2; SOR_RTL_2 moveInDriver vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_2; SOR_RS_5 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_2; SOR_RS_6 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_2; SOR_RS_7 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_2; SOR_AT_1 moveInCargo vWolf_2;};
};

WP_fnc_NikkosKIA = {
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Gator: Beagle, we just received word that the package is K.I.A. Mission aborted. RTB asap!<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Gator: Beagle, we just received word that the package is K.I.A. Mission aborted. RTB asap!</font>
	<br/><br/>"]];	
	sleep 8;
	["END2",false,5] call BIS_fnc_endMission;
};

WP_fnc_missionSuccesful = {
	if ((alive uNikkos) && NikkosRescued) exitWith {
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK", 10];
		["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 07 | U-12</t>",0,0,3,4] spawn BIS_fnc_dynamicText;		
		['END1',true,12] call BIS_fnc_endMission;
	};
};

WP_fnc_nikkosRescued = {
	[uNikkos] joinSilent player;
	NikkosRescued = true; publicVariable "NikkosRescued";	
	tNR = 1; publicVariable "tNR";
	
	hint parseText"
		<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Beagle: Gator this is Beagle, we have the package, I repeat we have the package. How copy?<br/></t>
	";	
	
	sleep 10;

	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Gator: Good job Beagle. Escort the package back to the RV. Have the package board the assault vessel and head south east towards the exfil location where the USS Anchorage will pick you up.<br/><br/></t>
		<t color='#6C7169' align='left'>I repeat, the package has to be on board as we need to debrief him. We'll drop him off at Altis after the debrief.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Gator: Good job Beagle. Escort the package back to the RV. Have the package board the assault vessel and head south east towards the exfil location where the USS Anchorage will pick you up.<br/><br/></font>
	<font color='#6C7169'>I repeat, the package has to be on board as we need to debrief him. We'll drop him off at Altis after the debrief.</font>
	<br/><br/>"]];	
	sleep 90;
	
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Gator: Did you copy Beagle?. Escort the package back to the RV. Have the package board the assault vessel and head south east towards the exfil location where the USS Anchorage will pick you up.<br/><br/></t>
		<t color='#6C7169' align='left'>I repeat, the package has to be on board as we need to debrief him. We'll drop him off at Altis once we have debriefed him.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Gator: Did you copy Beagle?. Escort the package back to the RV. Have the package board the assault vessel and head south east towards the exfil location where the USS Anchorage will pick you up.<br/><br/></font>
	<font color='#6C7169'>I repeat, the package has to be on board as we need to debrief him. We'll drop him off at Altis once we have debriefed him.</font>
	<br/><br/>"]];
};

// Nikos init
NikkosRescued = false;
tNR = 0; // exfil trigger check
uNikkos allowFleeing 0;
uNikkos setBehaviour "CARELESS";
uNikkos setName ["Nikos Fotopoulos","Nikos","Fotopoulos"];
//uNikkos addAction ["<t align='left' color='#9DA698'>Rescue Nikkos</t>",{[[],"WP_fnc_nikkosRescued",true,false,false] spawn BIS_fnc_MP;}];
uNikkos addAction ["<t align='left' color='#9DA698'>Rescue Nikos</t>",WP_fnc_nikkosRescued];
uNikkos addEventHandler ["killed", {[[],"WP_fnc_NikkosKIA",true,false,false] spawn BIS_fnc_MP;}];

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Gator.</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Beagle.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
DEVGRU TOC: </font><font color='#9DA698'>Gator</font><br/>
<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Beagle</font>
<br/><br/>"]];

sleep 50;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Gator: Beagle, Niko's men will be waiting at the RV. They'll provide security for your assault vessels.</t><br/><br/>
	<t color='#6C7169' align='left'>They have hidden a small ammo cache at </t><t color='#9DA698' align='left'>Atinarki</t><t color='#6C7169' align='left'>, just west of the RV, in case you need additional supplies.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Gator: Beagle, Niko's men will be waiting at the RV. They'll provide security for your assault vessels.</font><br/><br/>
<font color='#6C7169'>They have hidden a small ammo cache at </font><font color='#9DA698'>Atinarki</font><font color='#6C7169'>, just west of the RV, in case you need additional supplies.</font>
<br/><br/>"]];

sleep 90;

hintSilent parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Gator: You'll be using your assault vessels for exfil as well. Do not damage them else you'll be stuck on Altis.</t><br/>	
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6C7169'>Gator: You'll be using your assault vessels for exfil as well. Do not damage them else you'll be stuck on Altis.</font>
<br/><br/>"]];

_c = []; _v = []; _p = [];

if (isServer) then {deleteMarker "mBrief0"};

[] spawn {
	waitUntil {NikkosRescued};
	
	if (isServer) then {
		for "_i" from 1 to 4 do {		
			_g = createGroup EAST; _v = [getMarkerPos "mCounterSpawn", 100, "O_MRAP_02_hmg_F", _g] call BIS_fnc_spawnVehicle;		
			[_g, getmarkerpos "mObj1", 2500, 7, "MOVE", "AWARE", "RED", "NORMAL", "", "", [3,12,30]] call CBA_fnc_taskPatrol;
			sleep 10;		
		};
	};
	
	sleep 5;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Gator: We just received intel from SatNav that several vehicles have left Pyrgos and are heading your way.</t><br/>
		<t color='#6C7169' align='left'>No matter what, you make sure you get the package to safety asap.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Gator: We just received intel from SatNav that several vehicles have left Pyrgos and are heading your way.</font><br/>
	<font color='#6C7169'>No matter what, you make sure you get the package to safety asap.</font>
	<br/><br/>"]];

	sleep 400;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Gator: Satnav reports a Kajman gunship just took off from Abdera Heliport and is heading towards U-12. ETA 4 Mikes.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Gator: Satnav reports a Kajman gunship just took off from Abdera Heliport and is heading towards U-12. ETA 4 Mikes</font>
	<br/><br/>"]];	
	
	if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server
	_c = createGroup EAST; 
	_v = [getMarkerPos "mCounterAir", 0, "O_Heli_Attack_02_black_F", _c] call BIS_fnc_spawnVehicle;
	vAP1 = _v select 0;
	vAP1 flyInHeight 30;
	_wp1 = _c addWaypoint [getMarkerPos "ap1", 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "AWARE";
	_wp1 setWaypointSpeed "NORMAL";
	waitUntil {(currentWaypoint (_wp1 select 0)) > (_wp1 select 1)};
	[_c, getMarkerPos "ap1", 2000, 7, "SAD", "COMBAT", "RED", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol;
	
	_delAmmoArray = ["38Rnd_80mm_rockets","8Rnd_LG_scalpel"];
	{vAP1 removeMagazineTurret [_x,[0]]} forEach _delAmmoArray;
};	

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

[] spawn {
	waitUntil {NikkosRescued};

	_m = createMarker ["mExfil2", getMarkerPos "mExfil"];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_end";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText " USS Anchorage";

	if (isNil "MotsActive") then {sleep 600};

	// Cleanup	
	if !(isNil "vAP2") then {{deleteVehicle _x} forEach (crew vAP2);deleteVehicle vAP2;};
};

// Naval Patrols
_c = createGroup EAST;
_v = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
sleep 2;

// Chalkeia Bay beach patrol
_g = [getMarkerPos "mP1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
_wp = _g addWaypoint [getMarkerPos "mP1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getMarkerPos "mP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getMarkerPos "mP3", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";	

// Road patrols
_c = createGroup EAST; _v = [getMarkerPos "mVP1", 90, "O_MRAP_02_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "mVP1", 3000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 2;
_c = createGroup EAST; _v = [getMarkerPos "mVP2", 90, "O_Truck_02_covered_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "mVP2", 3000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 2;
_c = createGroup EAST; _v = [getMarkerPos "mVP3", 90, "O_APC_Tracked_02_cannon_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "mVP3", 3000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 2;
sleep 15;
_c = createGroup EAST; _v = [getMarkerPos "mVP1", 90, "O_APC_Tracked_02_AA_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "mVP1", 5000, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 2;
_c = createGroup EAST; _v = [getMarkerPos "mVP2", 90, "O_Truck_02_Ammo_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "mVP2", 2500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 2;
_c = createGroup EAST; _v = [getMarkerPos "mVP3", 90, "O_Truck_02_fuel_F", _c] call BIS_fnc_spawnVehicle;
[_c, getmarkerpos "mVP3", 2500, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "", "", [3,6,9]] call CBA_fnc_taskPatrol; sleep 2;

// Naval Static Patrols
_c = createGroup EAST;
_v = [getMarkerPos "mNS1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
sleep 2;
_c = createGroup EAST;
_v = [getMarkerPos "mNS2", 90, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
sleep 2;

_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getPosASL oStat_1,[],0,"SERGEANT"]; _p setDir 40; _p moveInGunner oStat_1; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPosASL oStat_2,[],0,"CORPORAL"]; _p setDir 180; _p moveInGunner oStat_2; sleep 1;
_p = _g createUnit ["O_Soldier_F",getPosASL bridgeCP,[],0,"PRIVATE"]; _p setDir 180; _p moveInGunner bridgeCP; sleep 1; // Irfit @ Bridge CP

// U12 patrols
_g = [getPosASL oU12_CP1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
_wp = _g addWaypoint [getPosASL oU12_CP1, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP3, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP4, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP6, 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; sleep 2;

_g = [getPosASL oU12_CP4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
_wp = _g addWaypoint [getPosASL oU12_CP4, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP6, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP1, 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED";
_wp = _g addWaypoint [getPosASL oU12_CP3, 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "LIMITED"; sleep 2;

// U12 CP's
_g = [getPosASL oU12_CP1, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP1, 15, 2, true] call CBA_fnc_taskDefend; sleep 2;
_g = [getPosASL oU12_CP2, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP2, 15, 2, true] call CBA_fnc_taskDefend; sleep 2;
_g = [getPosASL oU12_CP3, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP3, 15, 2, true] call CBA_fnc_taskDefend; sleep 2;
_g = [getPosASL oU12_CP4, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP4, 15, 2, true] call CBA_fnc_taskDefend; sleep 2;
_g = [getPosASL oU12_CP5, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP5, 15, 2, true] call CBA_fnc_taskDefend; sleep 2;
_g = [getPosASL oU12_CP6, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_CP6, 15, 2, true] call CBA_fnc_taskDefend; sleep 2;

// Checkpoints
_g = [getMarkerPos "mCP_1", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getMarkerPos "mCP_1", 50, 2, true] call CBA_fnc_taskDefend; sleep 2;
_g = [getMarkerPos "mCP_2", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getMarkerPos "mCP_2", 50, 2, true] call CBA_fnc_taskDefend;	sleep 2;
_g = [getMarkerPos "mCP_3", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup; 
[_g, getMarkerPos "mCP_3", 50, 2, true] call CBA_fnc_taskDefend;	

// U12 OP
_g = [getPosASL oU12_OP, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
[_g, getPosASL oU12_OP, 150, 4, "MOVE", "SAFE", "YELLOW", "LIMITED", "COLUMN", "this spawn CBA_fnc_taskSearchHouse", [1,4,9]] call CBA_fnc_taskPatrol; sleep 2;	

// Debug
if (ADF_debug) then {[EAST,"OFF"] call ADF_fnc_debugMarkers;}; // Side, Labels "ON"/"OFF"
