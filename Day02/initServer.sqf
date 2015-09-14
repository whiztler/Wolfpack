/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Mission init
Author: Whiztler
Script version: 1.13

Game type: n/a
File: initServer.sqf
****************************************************************
Executed on the server at mission start. NOT executed on any
(player) clients and not on JIP.
****************************************************************/

diag_log "ADF RPT: Init - executing initServer.sqf"; // Reporting. Do NOT edit/remove

// add mission data to RPT log
diag_log text ""; diag_log text ""; diag_log text ""; 
diag_log text format["####################   %1   ####################", missionName]; // stamp mission name in RPT log
diag_log text "";

waitUntil {time > 0}; // V1.40B04
enableEnvironment FALSE; // V1.40B04	
//  Execute Core Third Party SERVER scripts: (comment out if not applicable)

	
