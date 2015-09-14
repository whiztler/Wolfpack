/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Mission init
Author: Whiztler
Script version: 2.44

Game type: n/a
File: init.sqf
****************************************************************
DO NOT EDIT. CONFIGURE IN 'ADF_init_config.sqf' 
****************************************************************/

if (!isDedicated && (player != player)) then {waitUntil {!(isNull player)}; waitUntil {player == player}};

#include "Core\ADF_init_vars.sqf"
#include "ADF_init_config.sqf"

// HC init
if (_ADF_HC_init) then {_ADF_run_HC = execVM "Core\ADF_HC.sqf"; waitUntil {scriptDone _ADF_run_HC}}; // Headless Client. Only executed when a HC is physically present (configured in server.cfg). See 'Core\ADF_HC.sqf' for more info.

/********** Server only Init **********/
if (isServer) then  { //server init	
	if (ADF_Tickets) then {[WEST, _ADF_wTixNr] call BIS_fnc_respawnTickets; [EAST, _ADF_eTixNr] call BIS_fnc_respawnTickets}; // init respawn tickets	
	if (_ADF_CleanUp) then {[_ADF_CleanUp_viewDist,_ADF_CleanUp_manTimer,_ADF_CleanUp_vehTimer,_ADF_CleanUp_abaTimer] execVM "Core\TP\delete.sqf"}; // garbage collector.
	if (_ADF_Caching && !ADF_HC_connected) then {[_ADF_Caching_UnitDistance,-1,ADF_debug,_ADF_Caching_vehicleDistance_land,_ADF_Caching_vehicleDistance_air,_ADF_Caching_vehicleDistance_sea] execVM "Core\TP\zbe_cache\main.sqf"}; // Configure in ADF_init_config.sqf	
};

/**********  Mission Intro *********
if (!isDedicated) then {
	if (_ADF_MissionIntroImage == "") then {_ADF_MissionIntroImage = ADF_clanLogo};
	
	[_ADF_mission_init_time,_ADF_MissionIntroImage] spawn {
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK IN", ((_this select 0) + 10)];
		waitUntil {time > ((_this select 0) - 10)};
		["<img size= '9' shadow='false' image='" + (_this select 1) + "'/>",0,0,3,12] spawn BIS_fnc_dynamicText;
	};
};*/

/**********  Execute Core init/scripts **********/
ADF_getLoadOut = [_ADF_customLoadout,_ADF_uniform_inf,_ADF_uniform_sor,_ADF_add_NVGoggles,_ADF_add_GPS,_ADF_INF_assault_weapon,_ADF_INF_LMG_weapon,_ADF_INF_hand_weapon,_ADF_INF_scopes,_ADF_SOR_assault_weapon,_ADF_SOR_hand_weapon,_ADF_CAV_assault_weapon,_ADF_TFAR_PersonalRadio,_ADF_TFAR_SWRadio,_ADF_TFAR_LRRadio] execVM "Core\ADF_loadoutClient.sqf"; // Loadout client. Configure in ADF_init_config.sqf
if !(isNil "MHQ") then {[_ADF_mhq_enable,_ADF_mhq_respawn_time,_ADF_mhq_respawn_nr,_ADF_mhq_respawn_class,_ADF_mhq_deploy_time,_ADF_mhq_packup_time,_ADF_wTixNr] execVM "Core\ADF_MHQ.sqf"}; // Configure in ADF_init_config.sqf
if (_ADF_misBal) then {[_ADF_misBal_low,_ADF_misBal_high] execVM "Core\F\ADF_fnc_missionBalancer.sqf";};
[_ADF_zeusEagle] execVM "Core\ADF_GM.sqf";

// addon scripts
if (_ADF_civKia_enable) then {execVM "Core\ADF_civKiaCheck.sqf"}; // Civilian KIA checker. Configure in ADF_init_config.sqf
if (_ADF_ambient_uCiv) then {[_ADF_ambient_uCiv_nr, _ADF_ambient_uCiv_dist, _ADF_ambient_uCiv_wpnr] execVM "Core\TP\MADal\MAD_civilians.sqf"}; // Ambient civilians. Configure in ADF_init_config.sqf
if (_ADF_ambient_vCiv) then {[_ADF_ambient_vCiv_nr, _ADF_ambient_vCiv_dist, _ADF_ambient_vCiv_del] execVM "Core\TP\MADal\MAD_traffic.sqf"};// Ambient civilian vehicles. Configure in ADF_init_config.sqf
if (ADF_mod_AGM_coreInc && ADF_sameGearRespawn) then {AGM_Respawn_SavePreDeathGear = 1}; // Configure in ADF_init_config.sqf
if (ADF_TFAR_preset) then {execVM "Core\ADF_TFAR-preset.sqf"};

/**********  Mission Developer Debug **********/
if (ADF_debug) then {execVM "Core\F\ADF_fnc_debug.sqf";}; // Debugging/MM only! Configure in ADF_init_config.sqf

/**********  Mission specific **********/
execVM "Scr\init.sqf"; // Mission custom init
 
/**********  Mission Init Briefing **********/
execVM "Scr\ADF_briefing.sqf"; // Mission Briefing
execVM "Core\ADF_roster.sqf"; // Roster

/********** Post processing **********/
[_ADF_mission_init_time,ADF_tpl_version,ADF_mission_version] execVM "Core\ADF_missionInit.sqf"; // Nr of secs for mission Init countdown. Should be the last line of the init.sqf
if !(_ADF_Thermal) then {{_x disableTIEquipment true;} forEach vehicles};
if (!_ADF_customLoadout) exitWith {};
#include "Core\ADF_TFAR.sqf"