// Mission Objective Test Script
// DAY 6

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
		"Waiting for the AO to finish initializing..." remoteExec ["systemChat", -2]; sleep 5;
		ADF_init_AO
	};	
	"Done initializing the AO." remoteExec ["systemChat", -2]; sleep 2;
};

"Starting MOTS process. Make sure you are NOT in a vehicle!" remoteExec ["systemChat", -2]; sleep 5;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 20;

"Teleporting to the first objective (Barcalona) in 5 seconds" remoteExec ["systemChat", -2];
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getMarkerPos "mBarca", ["Man"], 350];
{_x setPos (getMarkerPos "mBarca")} forEach _a; sleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 10;
"Destroying the Radar Complex" remoteExec ["systemChat", -2]; sleep 2;
radar_1 setDamage 1; sleep 2;
"Radar Complex destroyed" remoteExec ["systemChat", -2]; sleep 2;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 25;

[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Teleporting to the next objective (Istanbul) in 5 seconds" remoteExec ["systemChat", -2];
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getMarkerPos "mIstanbul", ["Man"], 350];
{_x setPos (getMarkerPos "mIstanbul")} forEach _a; sleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 20;
"Destroying AA Emplacements" remoteExec ["systemChat", -2]; sleep 5;
{_x setDamage 1; sleep .5} forEach [sAA_1,sAA_2,sAA_3,sAA_4,sAA_5]; sleep 2;
{if (alive _x) then {_x setDamage 1; sleep .5}} forEach [sAA_1,sAA_2,sAA_3,sAA_4,sAA_5]; sleep 2;
"All AA-emplacements destroyed. Both objectives completed." remoteExec ["systemChat", -2]; sleep 5;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; sleep 25;

[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Teleporting to exfil location in 5 seconds..." remoteExec ["systemChat", -2]; sleep 5;
{_x setPos (getPos tExfilEnd)} forEach _a; 
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];

sleep 10;
"Starting exfil process..." remoteExec ["systemChat", -2]; sleep 5;
"Mission Objective Test Script completed" remoteExec ["systemChat", -2];
diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";