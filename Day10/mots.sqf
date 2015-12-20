// Mission Objective Test Script
// DAY 10

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
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to Rendezvous (RV) in 5 seconds." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getMarkerPos "mRV")} forEach _a;
uiSleep 10;

"Teleporting to the AO in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_2"); sleep .5; _x setPosATL [getPos _x select 0, getPosATL _x select 1, 10]} forEach _a; uiSleep 6;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false]; 

"Eliminating the package" remoteExec ["systemChat", -2]; uiSleep 5;
Tehrani setDamage 1; uiSleep 3;
"Package eliminated, Objective cleared" remoteExec ["systemChat", -2]; uiSleep 5;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 10;

[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false]; 
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos hEvac, ["Man"], 350];
"Teleporting to the exfil location in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getPosASL hEvac)} forEach _a;  uiSleep 6;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false]; 
"Use the helicopter on the roof of the hospital to exfil...." remoteExec ["systemChat", -2]; uiSleep 5;
"Head towards the USS Ronald Reagan (South East of of your current position)" remoteExec ["systemChat", -2]; uiSleep 5;

sleep 10;
"Starting exfil process..." remoteExec ["systemChat", -2]; uiSleep 5;
"Mission Objective Test Script completed" remoteExec ["systemChat", -2];
diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";