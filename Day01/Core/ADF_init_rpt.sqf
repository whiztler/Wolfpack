/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Mission init / Init reporting
Author: Whiztler
Script version: 1.16

Game type: n/a
File: ADF_init_rpt.sqf

Executed on dedicated server only
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_init_rpt.sqf"; // Reporting. Do NOT edit/remove

// Init
private ["_ADF_log_ai","_ADF_log_players","_ADF_log_HC","_ADF_log_rptMods"];
_ADF_log_rptMods	= "";

_ADF_log_HC		= count (entities "HeadlessClient_F");
_ADF_log_players	= count allPlayers - _ADF_log_HC;
_ADF_log_ai		= count (allUnits - (_ADF_log_players + _ADF_log_HC));
if (_ADF_log_ai < 0) then {_ADF_log_ai = 0};

if (ADF_mod_CBA) then {_ADF_log_rptMods = _ADF_log_rptMods + "CBA A3";};
if (ADF_mod_ACRE) then {_ADF_log_rptMods = _ADF_log_rptMods + ", ACRE2";};
if (ADF_mod_TFAR) then {_ADF_log_rptMods = _ADF_log_rptMods + ", TFAR";};
if (ADF_mod_CTAB) then {_ADF_log_rptMods = _ADF_log_rptMods + ", cTab";};
if (ADF_mod_ACE3) then {_ADF_log_rptMods = _ADF_log_rptMods + ", ACE3";};
if (ADF_mod_AIA) then {_ADF_log_rptMods = _ADF_log_rptMods + ", AiATP";};
if (ADF_mod_Ares) then {_ADF_log_rptMods = _ADF_log_rptMods + ", Ares";};
if (ADF_mod_CSAT) then {_ADF_log_rptMods = _ADF_log_rptMods + ", TEC CSAT";};
if (ADF_mod_RHS) then {_ADF_log_rptMods = _ADF_log_rptMods + ", RHS";};

// Init reporting
if (ADF_debug) then {
	diag_log "--------------------------------------------------------------------------------------";
	_ADF_log_compileMsg = format ["Init - ADF version: %1",ADF_tpl_version];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	_ADF_log_compileMsg = format ["Init - Mission version: %1",ADF_mission_version];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	_ADF_log_compileMsg = format ["Init - Number of players connected: %1", _ADF_log_players];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	_ADF_log_compileMsg = format ["Init - Number of HC's connected: %1", _ADF_log_HC];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;	
	_ADF_log_compileMsg = format ["Init - Number of AI's active: %1", _ADF_log_ai];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	diag_log "--------------------------------------------------------------------------------------";
} else { // Live mission logging
	diag_log ""; diag_log "";
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - ADF version: %1",ADF_tpl_version];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - Mission version: %1",ADF_mission_version];
	diag_log format ["ADF RPT: Init - Mission name: %1",(getText (missionConfigFile >> "overviewText"))];
	diag_log format ["ADF RPT: Init - Mission developer: %1",(getText (missionConfigFile >> "author"))];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - Number of players connected: %1", _ADF_log_players];
	diag_log format ["ADF RPT: Init - Number of HC's connected: %1", _ADF_log_HC];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - Number of AI's active: %1", _ADF_log_ai];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - ADF autodetect addons active: %1", _ADF_log_rptMods];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log "ADF_debug mode is disabled (set to 'false'). To debug missions please enable ADF_debug";
	diag_log "by setting 'ADF_debug = true' in the 'ADF_init_config.sqf'";
	diag_log "--------------------------------------------------------------------------------------";
	diag_log ""; diag_log "";
};

// Server FPS reporting in RPT when ADF_debug is disabled. The frequency of the reporting is based on server performance.
if (!ADF_debug && ADF_Log_ServerPerfEnable) then { // ADF_debug already reports on server FPS
	[] spawn {
		waitUntil {
			private ["_ADF_log_players","_ADF_log_ai","_ADF_rptSnooz","_ADF_GameTime_HMS"];
			_ADF_rptSnooz		= 60;
			_ADF_serverFPS	= round (diag_fps);
			_ADF_log_players	= {alive _x} count (allPlayers - entities "HeadlessClient_F");
			_ADF_log_ai		= {(local _x) && (alive _x)} count (allUnits - (_ADF_log_players + _ADF_log_HC));
			if (_ADF_log_ai < 0) then {_ADF_log_ai = 0};
			if (_ADF_serverFPS < 30) then {_ADF_rptSnooz = 10};
			if (_ADF_serverFPS < 20) then {_ADF_rptSnooz = 5};
			if (_ADF_serverFPS < 15) then {_ADF_rptSnooz = 1};
			_ADF_GameTime_HMS = [(round time)] call BIS_fnc_secondsToString;
			diag_log format ["ADF RPT: PERF - Total players: %1  --  Total AI's: %2",_ADF_log_players,_ADF_log_ai];
			diag_log format ["ADF RPT: PERF - Elapsed time: %1  --  Server FPS: %2  --  Server Min FPS: %3",_ADF_GameTime_HMS,_ADF_serverFPS,round (diag_fpsmin)];
			uiSleep _ADF_rptSnooz;
			false
		};
	};
};