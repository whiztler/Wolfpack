private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
wpEnd					= false;
NikkosRescued 			= false;
tNR						= false;
MotsActive				= false;
ADF_fnc_DeleteVehicles	= {};
ADF_counter				= 275;

ADF_endMission			= false;
ADF_init_AO				= false;
ADF_msg_U12				= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: U12 message";diag_log "-----------------------------------------------------";};
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
nikkosAction = uNikkos addAction ["<t align='left' color='#9DA698'>Rescue Nikos</t>",{[_this select 0, _this select 1, _this select 2] remoteExec ["ADF_fnc_nikosRescued",0,false]},[],-95,true,true,"",""];

_diagTestEnd = diag_tickTime;
diag_log format ["ADF RPT: Init - FINISHED Scr\init.sqf  [%1]",_diagTestStart - _diagTestEnd];