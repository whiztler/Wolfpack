/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Headless Client init
Author: Whiztler
Script version: 2.44

Game type: N/A
File: ADF_HC.sqf
****************************************************************
Instructions:

To configure one or more HC's on the server please visit and read:
https://community.bistudio.com/wiki/Arma_3_Headless_Client

The ADF headless clients supports automatic load balancing (when
enabled in the mission config). When using 2 or 3 HC's the script
will distribute AI groups across the available HC's every 60 seconds.

Name the Headless Clients: ADF_HC1, ADF_HC2, ADF_HC3

In your scripts that you use to spawn objects/units, replace

if (!isserver) exitWith {};

with 

if (!ADF_HC_execute) exitWith {}; // Autodetect: execute on the HC else execute on the server
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_HC.sqf"; // Reporting. Do NOT edit/remove

// Init
ADF_HC_execute = false;
_ADF_HCLB_enable = _this select 0;

// HC check
if (!isServer && !hasInterface) then {
	ADF_HC_connected = true; publicVariable "ADF_HC_connected";
	ADF_HC_execute = true;	
	if (ADF_debug) then {["HC - Headless Client detected",false] call ADF_fnc_log} else {diag_log "ADF RPT: HC - Headless Client detected"};
} else {	
	sleep 3; // Wait for HC to publicVar ADF_HC_connected (if a HC is present)
	if (!ADF_HC_connected && isServer) then { // No HC present. Disable ADF_HC_execute on all clients except the server
		ADF_HC_execute = true;
		if (ADF_debug) then {["HC - NO Headless Client detected, using server",false] call ADF_fnc_log} else {diag_log "ADF RPT: HC - NO Headless Client detected, using server"};
	} else { 
		if (isServer || isDedicated) then {ADF_HC_execute = false;}; // HC is connected. Disable ADF_HC_execute on the server so that the HC runs scripts
	};
};

if (!_ADF_HCLB_enable) exitWith {};	
if (!isServer) exitWith {};
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_HC_loadBalacing.sqf";