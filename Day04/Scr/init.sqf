private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
rvDone					= false;
wpEnd					= false;
WP_convoyStarted			= false;
ADF_launchCondor			= false;
MotsActive				= false;
ADF_fnc_DeleteVehicles	= {};

ADF_endMission			= false;
ADF_init_AO				= false;
ADF_fnc_createConvoy		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Convoy created";diag_log "-----------------------------------------------------";};
ADF_msg_rv				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: RV message";diag_log "-----------------------------------------------------";};
ADF_msg_dimitri			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Dimitri message";diag_log "-----------------------------------------------------";};
ADF_fnc_p12				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: P12 camp";diag_log "-----------------------------------------------------";};
ADF_fnc_livadi			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Livadi camp";diag_log "-----------------------------------------------------";};
ADF_msg_nikos				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Nikos message";diag_log "-----------------------------------------------------";};
ADF_msg_ABC_ao			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: ABC AO message";diag_log "-----------------------------------------------------";};
ADF_msg_ABC_demo			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: ABC message";diag_log "-----------------------------------------------------";};
ADF_msg_charkia_demo		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Charkia message";diag_log "-----------------------------------------------------";};
ADF_msg_endMission		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: End Mission message";diag_log "-----------------------------------------------------";};
ADF_fnc_powerOff			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Power station power-off electrical grid";diag_log "-----------------------------------------------------";};
ADF_fnc_exfil				= {};

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