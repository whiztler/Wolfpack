private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
wpEnd					= false;
MotsActive				= false;
ADF_endMission			= false;
ADF_init_AO				= false;
ADF_msg_Chelonisi			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Chelonisi message";diag_log "-----------------------------------------------------";};
ADF_fnc_intelInit			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Intel found";diag_log "-----------------------------------------------------";};
ADF_fnc_intel				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Intel messages";diag_log "-----------------------------------------------------";};
ADF_spawn_harbor			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Harbor spawn";diag_log "-----------------------------------------------------";};
ADF_spawn_base			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Pyrgos Base spawn";diag_log "-----------------------------------------------------";};
ADF_fnc_exfil				= {};
ADF_fnc_DeleteVehicles	= {};

// Server Init
if (isServer) then {
	#include "init_server.sqf"
};

// Client init
if (hasInterface) then {
	#include "init_client.sqf"
};

// HC init
if (ADF_isHC) then {
	#include "init_hc.sqf"
};

// Server or HC
if (ADF_HC_execute) then {
	#include "init_ao.sqf"
};


// All clients


_diagTestEnd = diag_tickTime;
diag_log format ["ADF RPT: Init - FINISHED Scr\init.sqf  [%1]",_diagTestStart - _diagTestEnd];