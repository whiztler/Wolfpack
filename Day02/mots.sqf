// Mission Objective Test Script
// DAY 2

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
"Teleporting to first objective (Krya Nera) in 5 seconds." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_1")} forEach _a;
"Clearing the objective" remoteExec ["systemChat", -2]; 
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos tKrya1, ["Man"], 150]; uiSleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Krya Nera cleared" remoteExec ["systemChat", -2]; uiSleep 3;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 10;

"Teleporting to next objective (Abdera Airport) in 5 seconds" remoteExec ["systemChat", -2];
[false] remoteExec ["ADF_fnc_MOTS_captive", _a, false]; sleep 5;
{_x setPos (getPos mLand_1)} forEach _a; uiSleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Destroying Kajman Gunships" remoteExec ["systemChat", -2]; uiSleep 5;
{_x setDamage 1; sleep .5} forEach [kaj_01,kaj_02,kaj_03,kaj_04,kaj_05,kaj_06];
"All Kajmans destroyed. Objective completed" remoteExec ["systemChat", -2]; uiSleep 3;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to exfil location in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_2")} forEach _a;
[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false]; uiSleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];

"Starting exfil process..." remoteExec ["systemChat", -2]; uiSleep 5;
"Mission Objective Test Script completed" remoteExec ["systemChat", -2]; uiSleep 5;
diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";