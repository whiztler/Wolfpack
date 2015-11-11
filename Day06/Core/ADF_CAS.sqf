/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: CAS request with 9-liner
Author: Whiztler
Script version: 1.03

Game type: n/a
File: ADF_SOD_CAS.sqf
****************************************************************
This script will create a CAS request radio trigger with 9-liner simulated communication messages.

Instructions:
The script needs configuration. See the top part of the script for options. All are required!

To prepare the map, you'll need to place two markers
1. marker where the aircraft will spawn. (ADF_CAS_spawn)
2. marker for the approach vector (North, East, South or West) of the AO

The CAS request can only be called by 1 player. WIP
****************************************************************/

///// CONFIGURATION

// the name of the unit that can request the CAS. Use a commander or JTAC.
ADF_CAS_requester		= "INF_PC";
if (isNil ADF_CAS_requester) exitWith {}; // If the CAS authorized player is not ingame, exit the script

// This is where the CAS aircraft will spawn. Place on edge of map far from the AO.
ADF_CAS_spawn			= getMarkerPos "mAirSupport"; 

 // Approach vector marker. The CAS aircraft will first fly to an appraoch vector before he flies to the CAS AO.
ADF_CAS_vector		= getMarkerPos "mAirSupportVector";

// Delay for the CAS to be created. Simulate that CAS aircraft needs to depart from a distant airbase.
ADF_CAS_delay			= round (180 + (random 60)); 

 // Time spend in the CAS area. After which the CAS aircraft returns to the spawn location and is deleted.
ADF_CAS_onSite		= round (20 + (random 30));

// classname of CAS aircraft. E.g. "B_Heli_Attack_01_F" in case of BluFor (Attach Helicopter).
ADF_CAS_vehClass		= "B_Heli_Attack_01_F"; 

// Size of the CAS radius. Marker that shows the CAS ao. 
ADF_CAS_aoTriggerRad	= 800; 

// ingame Callsign of CAS aircraft. Used for hint messages to simulate CAS request radio transmissions.
ADF_CAS_callSign		= "RAPTOR"; 

// ingame name of the pilot of the CAS aircraft. Used for hint messages to simulate CAS request radio transmissions.
ADF_CAS_pilotName		= "Lt. Russel (Cowboy) McDevon";

// ingame name of the CAS station. Used for hint messages to simulate CAS request radio transmissions.
ADF_CAS_station		= "OSCAR";

// ingame name of OpFor. E.g. TANGO, CSAT, etc. Used for hint messages to simulate CAS request radio transmissions.
ADF_CAS_targetName	= "ELVIS"; 

// Ingame decription of target (keep it short). 
ADF_CAS_targetDesc	= "victors, small arms"; 

// CAS requirements (interdict, destroy, area security, laser target, etc. Used for hint messages to simulate CAS request radio transmissions.
ADF_CAS_result		= "interdict";

// directrion of the apprach vector (from AO). Depends on ADF_CAS_vector marker placement. Used for hint messages to simulate CAS request radio transmissions.
ADF_CAS_apprVector	= "WEST";

// Callsign of HQ / Command / Base. Used for hint messages to simulate CAS request radio transmissions.
ADF_ACO_callSign		= "FIRESTONE";

// Callsign of HQ / Command / Base. Used for hint messages to simulate CAS request radio transmissions.
ADF_CAS_image			= "Img\6SQDR_logo.paa";

// Callsign of HQ / Command / Base. Used for hint messages to simulate CAS request radio transmissions.
ADF_ACO_image			= "";


/***** DO NOT EDIT BELOW *********************************************************************************************************************************/


ADF_CAS_pos 			= []; 
ADF_CAS_active 		= false;
ADF_CAS_marker		= false;
ADF_CAS_bingoFuel 	= false;
ADF_CAS_requesterStr	= ADF_CAS_requester;
ADF_CAS_requester		= call compile format ["%1",ADF_CAS_requester];
vCASkia				= false;
ADF_CAS_clanName		= toUpper ADF_clanName;

ADF_fnc_CAS_supportRq = {
	// Init
	params ["_unit", "_actionID"];
	// Removed the action
	_unit removeAction _actionID;
	// Map click process.
	if (player == ADF_CAS_requester) then {openMap true; hintSilent format ["\n%1, click on a location\n on the map where you want\n Close Air Support.\n\n", name vehicle _unit];};
	ADF_CAS_requester onMapSingleClick {
		ADF_CAS_pos = _pos;
		publicVariableServer "ADF_CAS_pos";
		onMapSingleClick ""; true;
		openMap false; hint "";
		[] spawn ADF_fnc_CAS_Activated;
	};
};

ADF_fnc_CAS_Activated = {
	// Init
	private ["_ADF_CAS_posToString","_ADF_CAS_posString","_ADF_CAS_targetTime","_ADF_CAS_delayMin","_ADF_CAS_locVeh","_ADF_CAS_altVeh","_ADF_CAS_MSLlong","_ADF_CAS_MSL"];	
	_ADF_CAS_posToString 	= format ["%1,%2",ADF_CAS_pos select 0,ADF_CAS_pos select 1];
	_ADF_CAS_posString 	= str _ADF_CAS_posToString;
	_ADF_CAS_locVeh		= createVehicle ["Land_HelipadEmpty_F", position player, [], 0, "NONE"];
	_ADF_CAS_altVeh		= getPosASL _ADF_CAS_locVeh;
	_ADF_CAS_MSLlong		= _ADF_CAS_altVeh select 2;
	_ADF_CAS_MSL			= round _ADF_CAS_MSLlong; deleteVehicle _ADF_CAS_locVeh;
	_ADF_CAS_targetTime 	= [(dayTime + 600)] call BIS_fnc_secondsToString;
	_ADF_CAS_delayMin		= str (round (ADF_CAS_delay/60));
	_ADF_CAS_logName		= format ["%1 log",ADF_clanName];
	ADF_CAS_marker 		= true; publicVariableServer "ADF_CAS_marker";

	if (!hasInterface) exitWith {};
	// 9=liner CAS proc
	hintSilent parseText format ["<img size= '5' shadow='false' image='%4'/><br/><br/><t color='#6C7169' align='left'>%1 this is %3. Request %2. How copy?</t><br/><br/>",ADF_CAS_callSign, ADF_CAS_station,ADF_CAS_clanName,ADF_clanLogo];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: TWO SIERRA</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>"+ ADF_CAS_callSign +" this is "+ ADF_CAS_clanName +". Request "+ ADF_CAS_station +". How copy?</font><br/><br/>"]];
	
	sleep 6;

	hintSilent parseText format ["<img size= '5' shadow='false' image='Img\6SQDR_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1: TWO SIERRA this is %2. Ready to copy.</t><br/><br/>",ADF_CAS_pilotName, ADF_CAS_callSign];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: "+ ADF_CAS_callSign +"</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>	<font color='#6C7169'>"+ ADF_CAS_pilotName +": TWO SIERRA this is "+ ADF_CAS_callSign +". Ready to copy.</font><br/><br/>"]];
	
	sleep 9;
	
	hintSilent parseText format ["<img size= '5' shadow='false' image='Img\2SIERRA_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1 with %2:</t><br/><br/><t color='#6C7169' align='left'>PRIORIY: #1</t><br/><t color='#6C7169' align='left'>TARGET: %3, %4</t><br/><t color='#6C7169' align='left'>LOCATION: %5, %6 MSL</t><br/><t color='#6C7169' align='left'>TARGET TIME: NLT %7</t><br/><t color='#6C7169' align='left'>RESULT: %8</t><br/><t color='#6C7169' align='left'>CONTROL: 2S PC</t><br/><t color='#6C7169' align='left'>REMARKS: Vectors %9, Friendlies close. How copy?</t><br/><br/>",ADF_CAS_callSign, ADF_CAS_station, ADF_CAS_targetName, ADF_CAS_targetDesc, _ADF_CAS_posString, _ADF_CAS_MSL, _ADF_CAS_targetTime, ADF_CAS_result, ADF_CAS_apprVector];
	
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: TWO SIERRA</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>"+ ADF_CAS_callSign +" with "+ ADF_CAS_station +":<br/><br/>PRIORIY: #1<br/><br/>TARGET: " +ADF_CAS_targetName+ ", " +ADF_CAS_targetDesc+ "<br/><br/>LOCATION: "+ _ADF_CAS_posString +", "+ str _ADF_CAS_MSL +" MSL<br/><br/>TARGET TIME: NLT "+ _ADF_CAS_targetTime +"<br/><br/>RESULT: " +ADF_CAS_result+ "<br/><br/>CONTROL: 2S PC<br/><br/>REMARKS: Vectors "+ ADF_CAS_apprVector +", Friendlies close. How copy?</font><br/><br/>"]];
	
	sleep 30;
	
	hintSilent parseText format ["<img size= '5' shadow='false' image='Img\6SQDR_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>%1: Read back. PRIORIY: #1, TARGET: %2, %3, LOCATION: %4, %5 MSL, TARGET TIME: NLT %6, RESULT: %7, CONTROL: 2S PC, REMARKS: Vectors %8, Friendlies close. </t><br/><br/>",ADF_CAS_pilotName, ADF_CAS_targetName, ADF_CAS_targetDesc, _ADF_CAS_posString, _ADF_CAS_MSL, _ADF_CAS_targetTime, ADF_CAS_result,ADF_CAS_apprVector];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_CAS_callSign+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>"+ ADF_CAS_pilotName +": Read back. PRIORIY: #1, TARGET: " +ADF_CAS_targetName+ ", " +ADF_CAS_targetDesc+ ", LOCATION: "+ _ADF_CAS_posString +", "+ str _ADF_CAS_MSL +" MSL, TARGET TIME: NLT "+ _ADF_CAS_targetTime +", RESULT: " +ADF_CAS_result+ ", CONTROL: 2S PC, REMARKS: Vectors "+ ADF_CAS_apprVector +", Friendlies close.</font><br/><br/>"]];

	sleep 18;
	
	hintSilent parseText format ["<img size= '5' shadow='false' image='Img\2SIERRA_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Read back correct. Execute %1. Cleared %1. How Copy?</t><br/><br/>",ADF_CAS_station];
	
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: TWO SIERRA</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>Read back correct. Execute " +ADF_CAS_station+ ". Cleared " +ADF_CAS_station+ ". How Copy?</font><br/><br/>"]];
	
	sleep 8;
	
	hintSilent parseText format ["<img size= '5' shadow='false' image='Img\6SQDR_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1: Go on %2. ETA %3 Mikes.</t><br/><br/>",ADF_CAS_pilotName,ADF_CAS_station,_ADF_CAS_delayMin];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +ADF_CAS_callSign+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>" +ADF_CAS_callSign+ ": Go on " +ADF_CAS_station+ ". ETA "+ _ADF_CAS_delayMin +" Mikes.</font><br/><br/>"]];

	sleep ADF_CAS_delay; // Time from map entrance it will take CAS to reach the AO

	ADF_CAS_active = true; publicVariableServer "ADF_CAS_active"; // Inform the server to create the CAS vehicle
	
	waitUntil {sleep 3; ADF_CAS_bingoFuel}; // Wait till the CAS ao timer runs out
	
	if (!alive vCAS) exitWith { // CAS is kia!
		hintSilent parseText format ["<img size= '5' shadow='false' image='Img\2SIERRA_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1 this is TWO SIERRA. %2 is down. How copy?</t><br/><br/>",ADF_ACO_callSign,ADF_CAS_callSign];
		sleep 12;
		hintSilent parseText"<img size= '5' shadow='false' image='Img\ACO_logo.paa'/><br/><br/><t color='#6C7169' align='left'>" +ADF_ACO_callSign+ ": Copy TWO SIERRA. We'll inform MOTHER. Stay on mission. Out.</t><br/><br/>";
		_logTime = [dayTime] call BIS_fnc_timeToString;
		_logTimeText = "Log: " + _logTime;
		player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: ACO</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>" +ADF_ACO_callSign+ ": Copy TWO SIERRA. We'll inform AOC. Stay on mission. Out.</font><br/><br/>"]];
		call ADF_fnc_destroyVars;
	};	
	
	hintSilent parseText format ["<img size= '5' shadow='false' image='Img\6SQDR_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%2: TWO SIERRA this is %1 with bingo fuel. We are RTB. Out.</t><br/><br/>",ADF_CAS_callSign,ADF_CAS_pilotName];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: "+ ADF_CAS_callSign +"</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>"+ ADF_CAS_pilotName +": TWO SIERRA this is " +ADF_CAS_callSign+ " with bingo fuel. We are RTB. Out.</font><br/><br/>"]];
	call ADF_fnc_destroyVars;
};

ADF_fnc_destroyVars = {
	// Destroy not needed variables:
	vCAS 				= nil; 
	ADF_CAS_pos 			= nil;
	ADF_CAS_active 		= nil;
	ADF_CAS_marker		= nil;
	ADF_CAS_bingoFuel 	= nil; 
	ADF_CAS_spawn			= nil;
	ADF_CAS_vector		= nil;
	ADF_CAS_delay			= nil;
	ADF_CAS_onSite		= nil;
	ADF_fnc_CAS_supportRq = nil;
	ADF_fnc_CAS_Activated = nil;
	ADF_CAS_callSign		= nil;
	ADF_CAS_station		= nil;
	ADF_CAS_targetName	= nil;
	ADF_CAS_targetDesc	= nil;
	ADF_CAS_result		= nil;
	ADF_CAS_apprVector	= nil;
	ADF_ACO_callSign		= nil;
	ADF_CAS_aoTriggerRad	= nil;
	ADF_CAS_vehClass		= nil;
	if (!isServer) exitWith {};
	diag_log	"-----------------------------------------------------";
	diag_log "TWO SIERRA: CAS (server) terminated";
	diag_log	"-----------------------------------------------------";
};

// Add the action to the unit that can request CAS
if !(isNil ADF_CAS_requesterStr) then {
	if (player != ADF_CAS_requester) exitWith {};
	_actionText = format ["<t align='left' color='#f4c300' shadow='false'>Request CAS: %1",ADF_CAS_callSign];
	_actionID = ADF_CAS_requester addAction [_actionText,{[_this select 1, _this select 2] remoteExec ["ADF_fnc_CAS_SupportRq",0,true]},[],-95,false,true,"",""];
};

if (hasInterface) then {
	if (ADF_CAS_active) exitWith {};
	sleep ((random 150) + (random 150));
	if (ADF_CAS_active) exitWith {};
	hintSilent parseText format ["<img size= '5' shadow='false' image='Img\6SQDR_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1: TWO SIERRA this is %2. Standing by with %3. Out.</t><br/><br/>",ADF_CAS_pilotName, ADF_CAS_callSign, ADF_CAS_station];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_CAS_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: "+ ADF_CAS_callSign +"</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>" +ADF_CAS_pilotName+ ": TWO SIERRA this is " +ADF_CAS_callSign+ ". Standing by with " +ADF_CAS_station+ ". Out.</font><br/><br/>"]];	
};

// From here on server only. Create the CAS vehicle, create markers etc.
if (!isServer) exitWith {};

waitUntil {ADF_CAS_marker}; // wait till the CAS request action was executed

diag_log	"-----------------------------------------------------";
diag_log "ADF RPT: CAS (server) activated";
diag_log	"-----------------------------------------------------";

// Create the CAS circle marker
_m = createMarker ["mRaptorSAD", ADF_CAS_pos];
_m setMarkerSize [500, 500];
_m setMarkerShape "ELLIPSE";
_m setMarkerBrush "Border";
_m setMarkerColor "ColorWEST";
_m setMarkerDir 0;

// Create the CAS AO triggerActivated
tCAS = createTrigger ["EmptyDetector", ADF_CAS_pos];
tCAS setTriggerActivation ["WEST","PRESENT",true];
tCAS setTriggerArea [ADF_CAS_aoTriggerRad,ADF_CAS_aoTriggerRad,0,false];
tCAS setTriggerStatements ["{vehicle _x in thisList && ((getPosATL _x) select 2) > 25} count allUnits > 0;","",""];

waitUntil {ADF_CAS_active}; // wait till the 9-liners are finished and CAS-delay timer is 0. 

// Create CAR aircraft
_c = createGroup WEST;
_c setGroupIdGlobal [format ["%1",ADF_CAS_callSign]];
_v = [ADF_CAS_spawn, 90, ADF_CAS_vehClass, _c] call BIS_fnc_spawnVehicle;
vCAS = _v select 0; publicVariable "vCAS";

// Add an EH to the CAS aircraft. If the aircraft is killed/shot down it will trigger a CAS KIA message and exit the script
vCAS addEventHandler ["killed", "ADF_CAS_bingoFuel = true; publicVariable 'ADF_CAS_bingoFuel';vCASkia = true;"];

// Attach marker to CAS aircraft
[vCAS] spawn {	
	params ["_vX"];
	private ["_m"];
	_m = createMarker ["mCasIcon", getPosASL _vX];
	_m setMarkerSize [.8, .8];
	_m setMarkerShape "ICON";
	_m setMarkerType "b_air";
	_m setMarkerColor "ColorWEST";
	_m setMarkerText format [" %1",ADF_CAS_callSign];
	while {alive _vX} do {"mCasIcon" setMarkerPos (getPosASL _vX); sleep .5;};
	_m setMarkerColor "ColorGrey"; // CAS aircraft is no more...
};

// Create waypoints for CAS aircraft based on appraoch vectors
_wp = _c addWaypoint [ADF_CAS_vector, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "FULL";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointCompletionRadius 250;

_wp = _c addWaypoint [ADF_CAS_pos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "COMBAT";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointCombatMode "RED";

waitUntil {triggerActivated tCAS}; // Let CAS aircraft reach the AO

vCAS flyInHeight 100;

if (vCASkia) exitWith {call ADF_fnc_destroyVars;};
sleep ADF_CAS_onSite; // Limited time in AO
if (vCASkia) exitWith {call ADF_fnc_destroyVars;};

// RTB Bingo Fuel
deleteMarker "mRaptorSAD";
{_x disableAI "FSM"} forEach units _c; // v1.03
ADF_CAS_bingoFuel = true; publicVariable "ADF_CAS_bingoFuel";
vCAS setFuel 0.3;
{_x enableAI "FSM"} forEach units _c; // v1.03
vCAS flyInHeight 800;
_c setCombatMode "BLUE"; // v1.03
_c setBehaviour "SAFE"; // v1.03

_wp = _c addWaypoint [ADF_CAS_vector, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "FULL";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointCompletionRadius 350;

_wp = _c addWaypoint [ADF_CAS_spawn, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "FULL";
_wp setWaypointCombatMode "BLUE";
waitUntil {if (vCASkia) exitWith {call ADF_fnc_destroyVars;};(currentWaypoint (_wp select 0)) > (_wp select 1)};

// Delete Raptor and Raptor crew
if !(isNil "vCAS") then {{deleteVehicle _x} forEach (crew vCAS); deleteVehicle vCAS;};
deleteMarker "mCasIcon";

call ADF_fnc_destroyVars;