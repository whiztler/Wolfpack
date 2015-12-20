// Mission Objective Test Script
// DAY 9

diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) started";
ADF_mots_1 = false;

private "_a";
if (!isMultiplayer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) only works on a dedicated server environment!</t><br/><br/>"};
if (!isServer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) needs to be executed by the server!</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>Click the </t><t color='#43c3ff' align='left' size='1'>SERVER EXEC </t><t color='#FFFFFF' align='left' size='.9'>button in the debug window. Do NOT use LOCAL EXEC or GLOBAL EXEC!</t><br/><br/>"};
if (MotsActive) exitWith {"MOTS has already been executed!" remoteExec ["hint", -2];};
MotsActive = true; publicVariable "MotsActive";
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

waitUntil {"Waiting for mission triggers to setup..." remoteExec ["systemChat", -2]; uiSleep 20; ADF_mots_1};
"Starting MOTS process. Make sure you are NOT in a vehicle!" remoteExec ["systemChat", -2]; uiSleep 5;

"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to the first objective (depot) in 5 seconds..." remoteExec ["systemChat", -2]; 
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getMarkerPos "mT100_5", ["Man"], 350];
uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_1")} forEach _a; uiSleep 6;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 10;
while {((!triggerActivated tDepot1) && (!triggerActivated tDepot2) && (!triggerActivated tDepot3))} do {"Use the radio function to call in intel, e.g. [0-0-3] Depot intel: 3 x BTR-K + 5 x MSE-3 Madrid." remoteExec ["systemChat", -2]; uiSleep 10;};
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 30;

[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Teleporting to the second objective (Stratis AB) in 5 seconds..." remoteExec ["systemChat", -2]; 
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getMarkerPos "mMOTS_2", ["Man"], 600]; uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_2")} forEach _a; uiSleep 6;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Destroying the CSAT fighter planes" remoteExec ["systemChat", -2]; uiSleep 3;
{_x setDamage 1; sleep 1} forEach [obj_1,obj_2,obj_3,obj_4,obj_5,obj_6,obj_7,obj_8,obj_9];
"All aircraft destroyed. Objective completed" remoteExec ["systemChat", -2]; uiSleep 3;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 10;

[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Teleporting to exfil location in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getPos tExfil)} forEach _a; sleep 6;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];

sleep 10;
"Starting exfil process..." remoteExec ["systemChat", -2]; uiSleep 5;
"Mission Objective Test Script completed" remoteExec ["systemChat", -2];
diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";
