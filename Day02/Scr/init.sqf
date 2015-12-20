private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
vWolf_takeOff				= false;
kryaActive				= false;
wpEnd					= false;
ADF_obj					= false;
kryaActive 				= false;
roundscinit	 			= false;
roundsSplash	 			= false;
MotsActive				= false;
ADF_fnc_DeleteVehicles	= {};

ADF_endMission			= false;
ADF_init_AO				= false;
ADF_msg_endMission		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: End Mission message";diag_log "-----------------------------------------------------";};
ADF_msg_kallaziz			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Kallaziz message";diag_log	"-----------------------------------------------------";};
ADF_fnc_kryanera			= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Krya Nera";diag_log	"-----------------------------------------------------";};
ADF_fnc_AOinit			= {};
ADF_fnc_exfil				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Exfil";diag_log	"-----------------------------------------------------";};

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

// Server of HC
if (ADF_HC_execute) then {
	#include "init_ao.sqf"
};


// All clients


_diagTestEnd = diag_tickTime;
diag_log format ["ADF RPT: Init - FINISHED Scr\init.sqf  [%1]",_diagTestStart - _diagTestEnd];