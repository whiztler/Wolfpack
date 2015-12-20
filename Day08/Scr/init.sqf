private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
wpEnd					= false;
vWolf_takeOff				= false;
vWolf_10Secs				= false;
iceTigerLocated			= false;
MotsActive				= false;
ADF_fnc_DeleteVehicles	= {};
tagCount					= 0;
ADF_iceTigerLocated		= false;

ADF_endMission			= false;
ADF_init_AO				= false;
ADF_msg_iceTigerLocated	= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: IceTiger located";diag_log "-----------------------------------------------------";};
ADF_msg_locNorth			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Too far south message";diag_log "-----------------------------------------------------";};
ADF_msg_locWest			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Too far east message";diag_log "-----------------------------------------------------";};
ADF_msg_tigerTag			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Tiger tagged message";diag_log "-----------------------------------------------------";};
ADF_msg_timeSeven			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: 19:00 hrs message";diag_log "-----------------------------------------------------";};
ADF_msg_timeeight			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: 20:00 hrs message";diag_log "-----------------------------------------------------";};
ADF_fnc_exfil				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Exfil message";diag_log "-----------------------------------------------------";};

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