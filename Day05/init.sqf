/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Mission init
Author: Whiztler
Script version: 2.65

Game type: n/a
File: init.sqf
****************************************************************
DO NOT EDIT. CONFIGURE IN 'ADF_init_config.sqf' 
****************************************************************/

diag_log "ADF RPT: Init - executing init.sqf"; // Reporting. Do NOT edit/remove

if (!isDedicated && (isNull player)) then {waitUntil {!(isNull player)}; waitUntil {player == player}};

if (hasInterface) then {execVM "Scr\ADF_briefing.sqf"}; // Mission Briefing
#include "Core\ADF_init_pre.sqf"
#include "ADF_init_config.sqf"

// HC init. Init before caching. Is HC is active then caching is disabled
if (_ADF_HC_init) then {_ADF_run_HC = [_ADF_HCLB_enable] execVM "Core\ADF_HC.sqf"; waitUntil {scriptDone _ADF_run_HC}}; // Headless Client. Only executed when a HC is physically present (configured in server.cfg). See 'Core\ADF_HC.sqf' for more info.


/********** Server only Init **********/

if (isServer) then  { //server init
	if (ADF_Tickets) then {[WEST, _ADF_wTixNr] call BIS_fnc_respawnTickets; [EAST, _ADF_eTixNr] call BIS_fnc_respawnTickets}; // init respawn tickets	
	if (_ADF_CleanUp) then {[_ADF_CleanUp_viewDist,_ADF_CleanUp_manTimer,_ADF_CleanUp_vehTimer,_ADF_CleanUp_abaTimer] execVM "Core\TP\delete.sqf"}; // garbage collector.
	if (_ADF_Caching && !ADF_HC_connected) then {[_ADF_Caching_UnitDistance,-1,ADF_debug,_ADF_Caching_vehicleDistance_land,_ADF_Caching_vehicleDistance_air,_ADF_Caching_vehicleDistance_sea,_ADF_Caching_debugInfo] execVM "Core\TP\zbe_cache\main.sqf"}; // Configure in ADF_init_config.sqf
	if (_ADF_suppliesInit) then {execVM "Core\ADF_init_supplies.sqf";}; // crate/vehicle supplies. Configure in ADF_init_config.sqf	
};


/**********  Mission Intro **********/

if (!isDedicated && !ADF_debug && !ADF_missionInit && !ADF_isHC) then {
	if (_ADF_MissionIntroImage == "") then {_ADF_MissionIntroImage = ADF_clanLogo};
	_ADF_MissionDesc = getText (missionConfigFile >> "onLoadMission");  	
	[_ADF_mission_init_time,_ADF_MissionIntroImage,_ADF_MissionDesc] spawn {
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK IN", ((_this select 0) + 10)];
		waitUntil {time > ((_this select 0) - 10)};
		["<img size= '9' shadow='false' image='" + (_this select 1) + "'/><br/><br/><t size='.7' color='#FFFFFF'>" + (_this select 2) + "</t>",0,0,3,12] spawn BIS_fnc_dynamicText;
	};
};


/**********  Execute Core init/scripts **********/

if (!ADF_isHC) then {call compile preprocessFileLineNumbers "Core\f\ADF_fnc_presets.sqf";};
ADF_getLoadOut = [_ADF_customLoadout_MOD,_ADF_uniform_inf,_ADF_uniform_sor,_ADF_add_NVGoggles,_ADF_add_GPS,_ADF_INF_assault_weapon,_ADF_INF_LMG_weapon,_ADF_INF_hand_weapon,_ADF_INF_scopes,_ADF_SOR_assault_weapon,_ADF_SOR_hand_weapon,_ADF_CAV_assault_weapon,_ADF_TFAR_PersonalRadio,_ADF_TFAR_SWRadio,_ADF_TFAR_LRRadio,_ADF_noLoadout,_ADF_TFAR_LRRadioSOR,_ADF_ACE3_microDAGR_all,_ADF_ACE3_microDAGR_leaders,_ADF_cTAB_microDAGR_all,_ADF_cTAB_microDAGR_leaders] execVM "Core\ADF_clientLoadout.sqf"; // Loadout client. Configure in ADF_init_config.sqf
if (_ADF_mhq_enable) then {[_ADF_mhq_enable,_ADF_mhq_respawn_time,_ADF_mhq_respawn_nr,_ADF_mhq_respawn_class,_ADF_mhq_deploy_time,_ADF_mhq_packup_time,_ADF_wTixNr] execVM "Core\ADF_MHQ.sqf"}; // Configure in ADF_init_config.sqf
if (_ADF_misBal) then {[_ADF_misBal_low,_ADF_misBal_high] execVM "Core\F\ADF_fnc_missionBalancer.sqf";};
[_ADF_zeusEagle] execVM "Core\ADF_GM.sqf";
if (_ADF_altitude && hasInterface) then {execVM "Core\ADF_ABF.sqf";};
if (_ADF_crewCheck_Pilots || _ADF_crewCheck_Armoured) then {[_ADF_crewCheck_Pilots,_ADF_crewCheck_Armoured] execVM "Core\ADF_crewCheck.sqf";};

// addon scripts
if (_ADF_civKia_enable) then {execVM "Core\ADF_civKiaCheck.sqf"}; // Civilian KIA checker. Configure in ADF_init_config.sqf
if (_ADF_ambient_uCiv) then {[_ADF_ambient_uCiv_nr, _ADF_ambient_uCiv_dist, _ADF_ambient_uCiv_wpnr,_ADF_civKia_enable] execVM "Core\TP\MADal\MAD_civilians.sqf"}; // Ambient civilians. Configure in ADF_init_config.sqf
if (_ADF_ambient_vCiv) then {[_ADF_ambient_vCiv_nr, _ADF_ambient_vCiv_dist, _ADF_ambient_vCiv_del,_ADF_civKia_enable] execVM "Core\TP\MADal\MAD_traffic.sqf"};// Ambient civilian vehicles. Configure in ADF_init_config.sqf
if (ADF_mod_ACE3 && ADF_sameGearRespawn) then {ACE_Respawn_SavePreDeathGear = true}; // Configure in ADF_init_config.sqf


/**********  Mission Developer Debug **********/

if (ADF_debug) then {execVM "Core\F\ADF_fnc_debug.sqf";}; // Debugging/MM only! Configure in ADF_init_config.sqf


/**********  Mission specific **********/

execVM "Scr\init.sqf"; // Mission custom init

 
/********** Post processing **********/

[_ADF_mission_init_time,ADF_tpl_version,ADF_mission_version,_ADF_devBuild,_ADF_devBuildNr] execVM "Core\ADF_init_post.sqf"; // Nr of secs for mission Init countdown. Should be the last line of the init.sqf
if !(_ADF_Thermal) then {{_x disableTIEquipment true;} forEach vehicles};
[_ADF_preset,_ADF_ACRE_fullDuplex,_ADF_ACRE_interference,_ADF_ACRE_AIcanHear,_ADF_TFAR_microDAGR] execVM "Core\ADF_clientPreset.sqf";