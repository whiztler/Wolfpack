/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Mission init / Init reporting
Author: Whiztler
Script version: 1.05

Game type: n/a
File: ADF_init_rpt.sqf

Executed on server only
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_init_rpt.sqf"; // Reporting. Do NOT edit/remove

// Init
ADF_log_CntHC = 0;
ADF_log_rptMods = "";
if !(isNil "ADF_HC1") then {ADF_log_CntHC = ADF_log_CntHC + 1};
if !(isNil "ADF_HC2") then {ADF_log_CntHC = ADF_log_CntHC + 1};
if !(isNil "ADF_HC3") then {ADF_log_CntHC = ADF_log_CntHC + 1};
if (isMultiplayer) then {ADF_log_pUnits = playableUnits;} else {ADF_log_pUnits = switchableUnits};
if (((count allUnits)-(count ADF_log_pUnits)) < 0) then {ADF_log_aiUnits = 0} else {ADF_log_aiUnits = ((count allUnits)-(count ADF_log_pUnits))};
if (ADF_mod_CBA) then {ADF_log_rptMods = ADF_log_rptMods + "CBA A3";};
if (ADF_mod_ACRE) then {ADF_log_rptMods = ADF_log_rptMods + ", ACRE2";};
if (ADF_mod_TFAR) then {ADF_log_rptMods = ADF_log_rptMods + ", TFAR";};
if (ADF_mod_CTAB) then {ADF_log_rptMods = ADF_log_rptMods + ", cTab";};
if (ADF_mod_ACE3) then {ADF_log_rptMods = ADF_log_rptMods + ", ACE3";};
if (ADF_mod_AIA) then {ADF_log_rptMods = ADF_log_rptMods + ", AiATP";};
if (ADF_mod_Ares) then {ADF_log_rptMods = ADF_log_rptMods + ", Ares";};
if (ADF_mod_CSAT) then {ADF_log_rptMods = ADF_log_rptMods + ", TEC CSAT";};
if (ADF_mod_RHS) then {ADF_log_rptMods = ADF_log_rptMods + ", RHS";};

// Init reporting
if (ADF_debug) then {
	diag_log "--------------------------------------------------------------------------------------";
	_ADF_log_compileMsg = format ["Init - ADF version: %1",_ADF_tpl_version];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	_ADF_log_compileMsg = format ["Init - Mission version: %1",_ADF_mission_version];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	_ADF_log_compileMsg = format ["Init - Number of clients connected: %1", (count ADF_log_pUnits)];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	_ADF_log_compileMsg = format ["Init - Number of HC's connected: %1", ADF_log_CntHC];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;	
	_ADF_log_compileMsg = format ["Init - Number of AI's active: %1", ADF_log_aiUnits];
	[_ADF_log_compileMsg,false] call ADF_fnc_log;
	diag_log "--------------------------------------------------------------------------------------";
	ADF_log_pUnits = nil; ADF_log_aiUnits = nil;
} else { // Live mission logging
	diag_log ""; diag_log "";
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - ADF version: %1",_ADF_tpl_version];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - Mission version: %1",_ADF_mission_version];
	diag_log format ["ADF RPT: Init - Mission name: %1",(getText (missionConfigFile >> "overviewText"))];
	diag_log format ["ADF RPT: Init - Mission developer: %1",(getText (missionConfigFile >> "author"))];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - Number of clients connected: %1", (count ADF_log_pUnits)];
	diag_log format ["ADF RPT: Init - Number of HC's connected: %1", ADF_log_CntHC];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - Number of AI's active: %1", ADF_log_aiUnits];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log format ["ADF RPT: Init - ADF autodetect addons active: %1", ADF_log_rptMods];
	diag_log "--------------------------------------------------------------------------------------";
	diag_log "ADF_debug mode is disabled (set to 'false'). To debug missions please enable ADF_debug";
	diag_log "by setting 'ADF_debug = true' in the 'ADF_init_config.sqf'";
	diag_log "--------------------------------------------------------------------------------------";
	diag_log ""; diag_log "";
	ADF_log_pUnits = nil; ADF_log_aiUnits = nil; ADF_log_rptMods = nil; ADF_log_CntHC = nil;
};

if (!ADF_mod_CBA) exitWith { // Terminate init as CBA is NOT present	
	["### ERROR! CBA_A3 not present. CBA is required by ADF ###","systemChat"] call BIS_fnc_MP;
	diag_log "";diag_log "";
	diag_log "######################################################################################";
	diag_log "ADF RPT: <ERROR>  CBA_A3 not present. CBA is required by ADF. Terminating init!";
	diag_log "######################################################################################";
	diag_log "";diag_log "";
};

// Server FPS reporting in RPT when ADF_debug is disabled. The frequency of the reporting is based on server performance.
if (!ADF_debug && ADF_Log_ServerPerfEnable) then { // ADF_debug already reports on server FPS
	[] spawn {
		if (isMultiplayer) then {ADF_log_players = playableUnits;} else {ADF_log_players = switchableUnits};
		waitUntil {
			_ADF_rptSnooz = 60;
			_ADF_serverFPS = round (diag_fps);			
			if (((count allUnits)-(count ADF_log_players)) < 0) then {ADF_log_ai = 0} else {ADF_log_ai = ((count allUnits)-(count ADF_log_players))};
			if (_ADF_serverFPS < 40) then {_ADF_rptSnooz = 15};
			if (_ADF_serverFPS < 30) then {_ADF_rptSnooz = 10};
			if (_ADF_serverFPS < 20) then {_ADF_rptSnooz = 5};
			if (_ADF_serverFPS < 15) then {_ADF_rptSnooz = 1};
			_ADF_GameTime_HMS = [(round time)] call BIS_fnc_secondsToString;
			diag_log format ["ADF RPT: PERF - Total players: %1  --  Total AI's: %2",count ADF_log_players,ADF_log_ai];
			diag_log format ["ADF RPT: PERF - Elapsed time: %1  --  Server FPS: %2  --  Server Min FPS: %3",_ADF_GameTime_HMS,_ADF_serverFPS,round (diag_fpsmin)];
			uiSleep _ADF_rptSnooz;
			false
		};
	};
};