/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Local Player init
Author: Whiztler
Script version: 1.11

Game type: n/a
File: initPlayerServer.sqf
****************************************************************/

diag_log "ADF RPT: Init - executing initPlayerServer.sqf"; // Reporting. Do NOT edit/remove

// Init


// Cuyrator inits
{_x addCuratorEditableObjects [[_this select 0],true]} forEach allCurators;  

