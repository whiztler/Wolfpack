/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Local Player init
Author: Whiztler
Script version: 1.12

Game type: n/a
File: initPlayerServer.sqf
****************************************************************/

 // Reporting. Do NOT edit/remove
if (isMultiplayer) then {
	diag_log format ["ADF RPT: Init - executing initPlayerServer.sqf -- player: %1 -- JIP: %2", _this select 0, _this select 1];
} else {
	diag_log "ADF RPT: Init - executing initPlayerServer.sqf";
};

// Init


// Cuyrator inits
{_x addCuratorEditableObjects [[_this select 0],true]} forEach allCurators;  

