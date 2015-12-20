// Mission Objective Test Script
// DAY 8

diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) started";

private "_a";
if (!isMultiplayer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) only works on a dedicated server environment!</t><br/><br/>"};
if (!isServer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) needs to be executed by the server!</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>Click the </t><t color='#43c3ff' align='left' size='1'>SERVER EXEC </t><t color='#FFFFFF' align='left' size='.9'>button in the debug window. Do NOT use LOCAL EXEC or GLOBAL EXEC!</t><br/><br/>"};
if (MotsActive) exitWith {"MOTS has already been executed!" remoteExec ["hint", -2];};
MotsActive = true;
_a = allPlayers - entities "HeadlessClient_F";
remoteExec ["ADF_fnc_MOTS",_a,true];

"Mission Objective Test Script started. JIP is not supported!" remoteExec ["systemChat", -2]; sleep 2;

if !(ADF_missionInit) then {"Waiting for mission init to finish..." remoteExec ["systemChat", -2];};
waitUntil {ADF_missionInit};

if (!ADF_init_AO) then {
	waitUntil {
		"Waiting for the AO to finish initializing..." remoteExec ["systemChat", -2]; uiSleep 5;
		ADF_init_AO
	};	
	"Done initializing the AO." remoteExec ["systemChat", -2]; uiSleep 2;
};

"Starting MOTS process. Make sure you are NOT in a vehicle!" remoteExec ["systemChat", -2]; uiSleep 5;

while {isNil "tIceTiger"} do {"Waiting for 'Ice Tiger location' to initialize..." remoteExec ["systemChat", -2]; uiSleep 10;};
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Teleporting to the  Ice Tiger location" remoteExec ["systemChat", -2]; uiSleep 5;
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos tIceTiger, ["Man"], 500];
{_x setPos (getPos tIceTiger)} forEach _a; uiSleep 6;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Tag a few of the T100 MBT's by approaching them" remoteExec ["systemChat", -2]; uiSleep 20;
waitUntil {
	sleep 10;
	"Tag a few of the T100 MBT's by approaching them" remoteExec ["systemChat", -2];
	(
		triggerActivated tObj1 ||
		triggerActivated tObj2 ||
		triggerActivated tObj3 ||
		triggerActivated tObj4 ||
		triggerActivated tObj5 ||
		triggerActivated tObj6
	)
};
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Teleporting to exfil location in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_1")} forEach _a; sleep 1;

sleep 10;
"Starting exfil process..." remoteExec ["systemChat", -2]; uiSleep 5;
"Mission Objective Test Script completed" remoteExec ["systemChat", -2];
diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";
