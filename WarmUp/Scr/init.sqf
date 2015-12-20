private ["_diagTestStart","_diagTestEnd"];
_diagTestStart = diag_tickTime;
diag_log "ADF RPT: Init - executing Scr\init.sqf"; // Reporting. Do NOT edit/remove

ADF_joined = false;
if (hasInterface) then {
	#include "ADF_JIP.sqf"
	waitUntil {ADF_joined};
};

// PreComp
call compile preprocessFileLineNumbers "Scr\ADF_messageParser.sqf";

// Vars init
wpEnd					= false;
wpExfil					= false;
MotsActive				= false;
heliActive 				= false;
ADF_fnc_DeleteVehicles	= {};
ADF_fnc_WTT_tArti			= {};
ADF_fnc_WTT_tAirpt		= {};
ADF_fnc_WTT_tAA			= {};
ADF_fnc_WTT_tHotel		= {};
ADF_fnc_WTT_tRodoCP		= {};
ADF_fnc_WTT_tPetros		= {};
ADF_fnc_WTT_tFuelDepot	= {};
ADF_fnc_objHotel 			= {};

ADF_endMission			= false;
ADF_init_AO				= false;
ADF_fnc_taskObjective		= {diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Objective Message";diag_log "-----------------------------------------------------";};

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