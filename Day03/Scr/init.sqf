if (ADF_HC_execute || isServer) then {
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
	call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
};

tthint 			= false;
tt1				= 0;
tt2				= 0;
tt3				= 0;
commtwr			= 0;
wpExfil			= false;
WP_convoyStarted	= false;

if (isServer) then {
	private "_m";
	_m = createMarker ["mRV", [3867,17095,0]];
	_m setMarkerSize [1, 1];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "RV";
	
	[wolfCrate] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
	[wolfCrateDemo] execVM "Core\C\ADF_cCargo_B_Demo.sqf";
};

if (hasInterface) then {
	player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
	player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
	<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
	The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
	<br/><br/>
	"]];
	
	waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

	sleep 3; // Loadout finished > pri weapon loaded

	while {time < 25} do {
		if !(isNil "SOD_SSC_1") then {SOD_SSC_1 assignAsCargo vWolf_1; SOD_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
		if !(isNil "SOD_RM_1") then {SOD_RM_1 assignAsDriver vWolf_1; SOD_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
		if !(isNil "SOD_UAV_1") then {SOD_UAV_1 assignAsGunner vWolf_1; SOD_UAV_1 moveInGunner vWolf_1;}; sleep 0.035;
		if !(isNil "SOD_RMM_1") then {SOD_RMM_1 assignAsCargo vWolf_1; SOD_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

		if !(isNil "SOD_ATL_1") then {SOD_ATL_1 assignAsCargo vWolf_2; SOD_ATL_1 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOD_AD_2") then {SOD_AD_2 assignAsDriver vWolf_2; SOD_AD_2 moveInDriver vWolf_2;}; sleep 0.035;
		if !(isNil "SOD_AD_3") then {SOD_AD_3 assignAsGunner vWolf_2; SOD_AD_3 moveInGunner vWolf_2;}; sleep 0.035;
		if !(isNil "SOD_AD_4") then {SOD_AD_4 assignAsCargo vWolf_2; SOD_AD_4 moveInCargo vWolf_2;}; sleep 0.035;
		
		if !(isNil "SOD_ADD_1") then {SOD_ADD_1 assignAsDriver vWolf_3; SOD_ADD_1 moveInDriver vWolf_3;}; sleep 0.035;	
		if !(isNil "SOD_ATL_2") then {SOD_ATL_2 assignAsCargo vWolf_3; SOD_ATL_2 moveInCargo vWolf_3;}; sleep 0.035;
		if !(isNil "SOD_AD_5") then {SOD_AD_5 assignAsGunner vWolf_3; SOD_AD_5 moveInGunner vWolf_3;}; sleep 0.035;
		if !(isNil "SOD_AD_6") then {SOD_AD_6 assignAsCargo vWolf_3; SOD_AD_6 moveInCargo vWolf_3;}; sleep 0.035;
		
		if !(isNil "SOD_AD_7") then {SOD_AD_7 assignAsDriver vWolf_4; SOD_AD_7 moveInDriver vWolf_4;}; sleep 0.035;
		if !(isNil "SOD_AT_1") then {SOD_AT_1 assignAsGunner vWolf_4; SOD_AT_1 moveInGunner vWolf_4;};	
	};
	
	waitUntil {sleep 2; ADF_missionInit}; sleep 5;

	hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>	<t color='#6C7169' align='left'>DEVGRU: Commander, call signs are as follows:<br/><br/>DEVGRU TOC: </t><t color='#9DA698' align='left'>Eagle Eye</t><br /><t color='#6C7169' align='left'>Your call sign: </t><t color='#9DA698' align='left'>Eightball.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>DEVGRU: Commander, call signs are as follows:<br/><br/>
	DEVGRU TOC: </font><font color='#9DA698'>Eagle Eye</font><br/>
	<font color='#6C7169'>Your call sign: </font><font color='#9DA698'>Eightball</font>
	<br/><br/>"]];
	sleep 10;

	hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: Eightball, move to the </t><t color='#9DA698' align='left'>RV </t><t color='#6C7169' align='left'>and meet up with Niko Fotopoulos. He'll brief you re your orders.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: Eightball, move to the </font><font color='#9DA698'>RV </font><font color='#6C7169'>and meet up with Niko Fotopoulos. He'll brief you re your orders.</font>
	<br/><br/>"]];
	sleep 10;

	hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>	<t color='#6C7169' align='left'>Eagle Eye: Niko will bring extra supplies and radios. Your backpacks should carry land weapons/supplies.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: Niko will bring extra supplies and radios. Your backpacks should carry land weapons/supplies.</font>
	<br/><br/>"]];
		sleep 60;

	hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: We have supplied your team with LRI Tagging stickers. The stickers can be attached to targets for long-range strike capability. Niko will fill you in.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: We have supplied your team with LRI Tagging stickers. The stickers can be attached to targets for long-range strike capability. Niko will fill you in.</font>
	<br/><br/>"]];
};

execVM "Scr\blizzard.sqf";
execVM "Scr\exfil.sqf";

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Naval Patrols
_c = createGroup EAST;
_v1 = [getMarkerPos "mNP1", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNP1 = _v1 select 0;
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP6", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";

_c = createGroup EAST;
_v2 = [getMarkerPos "mNP6", 0, "O_Boat_Armed_01_hmg_F", _c] call BIS_fnc_spawnVehicle;
vNP2 = _v2 select 0;
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP1", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP2", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP3", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP4", 0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";
_wp = _c addWaypoint [getMarkerPos "mNP5", 0]; _wp setWaypointType "CYCLE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "FULL";

deleteMarker "mBrief0";

waitUntil {sleep 5; time > 300};
execVM "Scr\patrols.sqf";
waitUntil {sleep 10; time > 600};
execVM "Scr\powerstation.sqf";

