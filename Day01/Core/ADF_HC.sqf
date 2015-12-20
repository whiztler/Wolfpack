/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Headless Client init
Author: Whiztler
Script version: 2.55

Game type: N/A
File: ADF_HC.sqf
****************************************************************
Instructions:

To configure one or more HC's on the server please visit and read:
https://community.bistudio.com/wiki/Arma_3_Headless_Client

Name the Headless Clients: ADF_HC1, ADF_HC2, ADF_HC3

### IN CASE OF 1 HC ###

In your scripts that you use to spawn objects/units, replace
if (!isserver) exitWith {};
with 
if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server

You can disable the load balancer in the ADF_init_config.sqf

### IN CASE OF MULTIPLE HC'S ###

The ADF headless clients supports automatic load balancing (when
enabled in the mission config). When using 2 or 3 HC's the script
will distribute AI groups across the available HC's every 60 seconds.

The loadbalancer is effective when at least 2 HC's are active.
Note that it is best to spawn the AI's on the server when multiple
HC's are active. The Loadbalancer kicks in after 2 minutes after 
mission start and will start distributing the AI's across the HC's

You can disable the load balancer in the ADF_init_config.sqf

With the load balancer enabled you can blacklist groups from being
transferred to the HC('s). To do this add the following to the group
leaders init: 
_grp = group this;
_grp setVariable ["ADF_noHC_trfr", true];

Note that waypoint information is retained when groups are transferred
to a HC. 
Other information such as garrison orders, skill information, etc is not.
You need to store the information with setVariable and re-apply the instructions
after transfer to the hC. For example in case with CBA_fnc_taskDefend:

_defArr = [_g, _spawnPos, 100, 2, true];
_g setVariable ["ADF_HC_garrisonArr",_defArr];
_defArr call CBA_fnc_taskDefend;

to re-apply:

_storedArr = _g getVariable "ADF_HC_garrisonArr";
_storedArr call CBA_fnc_taskDefend;
****************************************************************/

if (isServer) then {diag_log "ADF RPT: Init - executing ADF_HC.sqf"}; // Reporting. Do NOT edit/remove

// Init
ADF_HC_execute = false; // all connected clients + server
params ["_ADF_HCLB_enable"];

// HC check
if (!isServer && !hasInterface) then {	
	// init
	ADF_HC_connected 	= true; publicVariable "ADF_HC_connected";
	ADF_HC_execute 	= true;
	ADF_isHC 		= true;
	
	// Check which HC slot is occupied and count HC's
	if !(isNil "ADF_HC1") then {if (player == ADF_HC1) then {ADF_log_CntHC = ADF_log_CntHC + 1; publicVariable "ADF_log_CntHC"; ADF_isHC1 = true; diag_log "ADF RPT: HC - Headless Client detected: ADF_HC1";}};
	if !(isNil "ADF_HC2") then {if (player == ADF_HC2) then {ADF_log_CntHC = ADF_log_CntHC + 1; publicVariable "ADF_log_CntHC"; ADF_isHC2 = true; diag_log "ADF RPT: HC - Headless Client detected: ADF_HC2";}};
	if !(isNil "ADF_HC3") then {if (player == ADF_HC3) then {ADF_log_CntHC = ADF_log_CntHC + 1; publicVariable "ADF_log_CntHC"; ADF_isHC3 = true; diag_log "ADF RPT: HC - Headless Client detected: ADF_HC3";}};	
	
	// HC FPS reporting in RPT. The frequency of the reporting is based on HC performance.
	[] spawn {
		waitUntil {			
			private ["_ADF_log_ai","_ADF_players","_ADF_rptSnooz","_ADF_hcFPS","_ADF_GameTime_HMS"];			
			_ADF_rptSnooz = 60;
			_ADF_hcFPS = round (diag_fps);	
			_ADF_players = {alive _x} count allPlayers;
			_ADF_log_ai = {(local _x) && (alive _x)} count allUnits;
			if (_ADF_log_ai < 0) then {_ADF_log_ai = 0};
			if (_ADF_hcFPS < 40) then {_ADF_rptSnooz = 15};
			if (_ADF_hcFPS < 30) then {_ADF_rptSnooz = 10};
			if (_ADF_hcFPS < 20) then {_ADF_rptSnooz = 5};
			if (_ADF_hcFPS < 15) then {_ADF_rptSnooz = 1};
			_ADF_GameTime_HMS = [(round time)] call BIS_fnc_secondsToString;
			diag_log format ["ADF RPT: PERF - Total players: %1  --  Total AI's: %2",_ADF_players,_ADF_log_ai];
			diag_log format ["ADF RPT: PERF - Elapsed time: %1  --  %2 FPS: %3  --  %2 Min FPS: %4",_ADF_GameTime_HMS,name player,_ADF_hcFPS,round (diag_fpsmin)];
			uiSleep _ADF_rptSnooz;
			false
		};
	};
} else {	
	sleep 3; // Wait for HC to publicVar ADF_HC_connected (if a HC is present)
	if (!ADF_HC_connected && isServer) then { // No HC present. Disable ADF_HC_execute on all clients except the server
		ADF_HC_execute = true;
		if (ADF_debug) then {["HC - NO Headless Client detected, using server",false] call ADF_fnc_log} else {diag_log "ADF RPT: HC - NO Headless Client detected, using server"};
	} else { 
		if (isServer || isDedicated) then {ADF_HC_execute = false;}; // HC is connected. Disable ADF_HC_execute on the server so that the HC runs scripts
		diag_log "ADF RPT: HC - Headless Client detected. Using HC for ADF_HC_execute"
	};
};

// Run the HC load balancer (if enabled in ADF_init_config.sqf)
if (!_ADF_HCLB_enable) exitWith {};
if (hasInterface) exitWith {};
execVM "Core\F\ADF_fnc_HC_loadBalacing.sqf";