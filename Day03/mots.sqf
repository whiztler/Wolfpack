// Mission Objective Test Script
// DAY 3

diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) started";

private "_a";
if (!isMultiplayer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) only works on a dedicated server environment!</t><br/><br/>"};
if (!isServer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) needs to be executed by the server!</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>Click the </t><t color='#43c3ff' align='left' size='1'>SERVER EXEC </t><t color='#FFFFFF' align='left' size='.9'>button in the debug window. Do NOT use LOCAL EXEC or GLOBAL EXEC!</t><br/><br/>"};
if (MotsActive) exitWith {"MOTS has already been executed!" remoteExec ["hint", -2];};
MotsActive = true;
_a = allPlayers - entities "HeadlessClient_F";
remoteExec ["ADF_fnc_MOTS",-2,true];

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

waitUntil {"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20; time > 170};

"Teleporting to Rendezvous (RV) in 5 seconds." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getPos nikos_1)} forEach _a;
uiSleep 5;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to Nikos in 5 seconds." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getPos nikos_2)} forEach _a;
uiSleep 5;

"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to the first objective (powerstation) in 5 seconds." remoteExec ["systemChat", -2];
[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos tPP, ["MAN","CAR"], 250]; uiSleep 5;
{_x setPos (getMarkerPos "mDef51")} forEach _a; uiSleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 25;
"Destroying Generators 1-9" remoteExec ["systemChat", -2]; uiSleep 3;
gen_1 setDamage 1; sleep .3;
gen_2 setDamage 1; sleep .3;
gen_3 setDamage 1; sleep .3;
gen_4 setDamage 1; sleep .3;
gen_5 setDamage 1; sleep .3;
gen_6 setDamage 1; sleep .3;
gen_7 setDamage 1; sleep .3;
gen_8 setDamage 1; sleep .3;
gen_9 setDamage 1; sleep .3;
"All generators destroyed!" remoteExec ["systemChat", -2]; uiSleep 3;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to the second objective (comm station) in 5 seconds." remoteExec ["systemChat", -2];
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos ttmain, ["MAN","CAR"], 250];
[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false]; uiSleep 5;
{_x setPos (getMarkerPos "mDef50")} forEach _a; uiSleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Tagging communication objectives" remoteExec ["systemChat", -2]; uiSleep 3;
tt1 = true; publicVariable "tt1"; "Radar tower 1 tagged successfully" remoteExec ["hintSilent", -2]; sleep 3;
tt2 = true; publicVariable "tt2"; "Radar tower 2 tagged successfully" remoteExec ["hintSilent", -2]; sleep 3;
tt3 = true; publicVariable "tt3"; "Radar Installation tagged successfully" remoteExec ["hintSilent", -2]; sleep 1;
"All communication obkectives tagged succesfully" remoteExec ["systemChat", -2]; uiSleep 3;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to exfil location in 5 seconds..." remoteExec ["systemChat", -2]; sleep 5;
{_x setPos (getPos mStadium_1)} forEach _a;

sleep 10;
"Starting exfil process..." remoteExec ["systemChat", -2]; uiSleep 5;
"Mission Objective Test Script completed" remoteExec ["systemChat", -2];
diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";