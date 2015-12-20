// Mission Objective Test Script
// DAY 5

diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) started";

private "_a";
if (!isMultiplayer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) only works on a dedicated server environment!</t><br/><br/>"};
if (!isServer) exitWith {hint parseText "<t color='#FE2E2E' align='left' size='1.5'>ERROR</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>The Mission Objectibe Test Script (mots.sqf) needs to be executed by the server!</t><br/><br/><t color='#FFFFFF' align='left' size='.9'>Click the </t><t color='#43c3ff' align='left' size='1'>SERVER EXEC </t><t color='#FFFFFF' align='left' size='.9'>button in the debug window. Do NOT use LOCAL EXEC or GLOBAL EXEC!</t><br/><br/>"};
if (MotsActive) exitWith {"MOTS has already been executed!" remoteExec ["hint", -2];};
MotsActive = true;
_a = allPlayers - entities "HeadlessClient_F";
remoteExec ["ADF_fnc_MOTS", -2, true];

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
waitUntil {"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20; time > 60};

"Teleporting to the RV in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getPos tChelonisi)} forEach _a; sleep 1;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to the objective (intel location) in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos tIntel, ["Man"], 350];
{_x setPos (getPos tIntel)} forEach _a; sleep 5;
[true] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Teleporting out of the AO in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getMarkerPos "mMOTS_1")} forEach _a;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;
"Waiting for mission objective messages to finish..." remoteExec ["systemChat", -2]; uiSleep 20;

"Teleporting to exfil location in 5 seconds..." remoteExec ["systemChat", -2]; uiSleep 5;
{_x setPos (getPos mLand_2)} forEach _a; sleep 1;

sleep 10;
"Starting exfil process..." remoteExec ["systemChat", -2]; uiSleep 5;
"Get in one of the Assault Vessels in the harbor and head West and then South towards the Mediterranean Sea..." remoteExec ["systemChat", -2]; uiSleep 5;
for "_i" from 0 to 180 step 10 do {
	private ["_msg","_n"];
	_n = 180 - _i;
	_msg = format ["The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in %1 seonds",_n];
	"Use one of the Assault Vessels and drive towards the USS Wasp" remoteExec ["systemChat", -2];
	_msg remoteExec ["systemChat", -2];
	uiSleep 10;
};
"Disabling 'setCaptive' in 5 seconds" remoteExec ["systemChat", -2]; sleep 5;
[false] remoteExec ["ADF_fnc_MOTS_captive", -2, false];
"'SetCaptinve' has been disabled." remoteExec ["systemChat", -2]; sleep 5;

"Mission Objective Test Script completed" remoteExec ["systemChat", -2];
diag_log "ADF RPT: Debug - Mission Objective Test Script (MOTS) finished";