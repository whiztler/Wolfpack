private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
tt1						= false;
tt2						= false;
tt3						= false;
wpEnd					= false;
ADF_obj_powerStation 		= false;
ADF_obj_commStation 		= false;
WP_convoyStarted			= false;
ADF_blizzard				= false;
MotsActive				= false;
ADF_fnc_DeleteVehicles	= {};

ADF_endMission			= false;
ADF_init_AO				= false;
ADF_fnc_createConvoy		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Convoy created";diag_log "-----------------------------------------------------";};
ADF_msg_rv				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: RV message";diag_log "-----------------------------------------------------";};
ADF_msg_commStation		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Communication Station message";diag_log "-----------------------------------------------------";};
ADF_msg_powerStation		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Power Station message";diag_log "-----------------------------------------------------";};
ADF_msg_endMission		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: End Mission message";diag_log "-----------------------------------------------------";};
ADF_fnc_powerOff			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Power station power-off electrical grid";diag_log "-----------------------------------------------------";};
ADF_fnc_exfil				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Exfil started";diag_log "-----------------------------------------------------";};

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