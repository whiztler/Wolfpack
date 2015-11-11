/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Mission Config
Author: Whiztler
Script version: 1.58

Game type: n/a
File: ADF_init_config.sqf
****************************************************************
Use this file to configure and define mission parameters,
modules and scripts.
****************************************************************/

/********** GENERAL **********/
ADF_mission_version = 1.63; // Mission version
_ADF_mission_init_time = 20; // Mission Init time counter. Min 30 secs. Add 1 sec per 2 players. 10 players = 35 secs.
_ADF_HC_init = true; // Enable the Headless Client [true/false].
_ADF_HCLB_enable = false; // Enable load balancing across multiple HC's (max 3)
ADF_playerSide = WEST; // Which side are playable units on [WEST / EAST / GUER / CIV]
ADF_debug = false; // For mission testing/debugging set to true. Make sure to set to false before compiling your final PBO.
ADF_Log_ServerPerfEnable = true; // Enable server performance logging in RPT. [true/false]
ADF_clanName = "Wolfpack"; // What is the name of your community/clan. Used in Hints, intro's etc.
ADF_clanTAG = "Wolfpack"; // What is the tag of your community/clan. Used in Hints, intro's etc.
ADF_clanLogo = "Img\jsoc_logo.paa"; // Full path to the clan logo. 
ADF_clanFlag = "Img\clan_flag_ADF.paa"; // Full path to the clan flag (dimensions 512 x 256, pref PAA format).
_ADF_MissionIntroImage = "Img\wpintro.paa"; // Full path to the mission intro image (dimensions: 2038 x 1024, PAA format only). 
ADF_Clan_uniformInsignia = true; // Apply custom clan insignia on uniform. It uses the 'Img\clan_logo.paa' unless otherwise specified in the description.ext [true/false]. 
_ADF_preset = "WOLFPACK"; // pre-defined call sign/radio freq presets. [DEFAULT / SHAPE / NOPRYL / CUSTOM]. Configure the presets in 'Core\F\ADF_fnc_presets.sqf'

/********** GEAR & LOADOUT **********/
ADF_sameGearRespawn = false; // enable respawn with same gear (either ADF or ACE3)? [true/false]
_ADF_customLoadout_MOD = true; // Are you using ADF loadout/gear or BIS Vanilla gear. Set to true for preset ADF gear (+ ACE, CTAB, Radios)? [true/false]
_ADF_noLoadout = false; // Set to true if you use your own loadout script or loadout mod. [true/false]
_ADF_uniform_inf = "U_B_CombatUniform_mcam"; // Infantry. Use uniform class name. Crew, pilots etc keep their Vanilla uniform.
_ADF_uniform_sor = "U_B_CombatUniform_mcam_vest"; // Recon. Use uniform class name.
_ADF_add_NVGoggles = true; // add NV Goggles as default loadout [true/false].
_ADF_add_GPS = true; // Enable GPS for all unit (true) or only specialist/leadership roles (false).
_ADF_Thermal = true; // Enable/disable thermal imaging equipment such as FLIR [true/false].
// Weapons
_ADF_INF_assault_weapon = 1; // Infantry assault rifle: 1 = MX series  #  2 = TRG series.
_ADF_INF_LMG_weapon = 1; // Infantry light MG: 1 = MX SW  #  2 = MK200.
_ADF_INF_hand_weapon = 1; // Infantry Hand weapon: 1 = P07  #  2 = 4-five .45.
_ADF_INF_scopes = false; // add MRCO scopes to all infantry units [true/false].
_ADF_SOR_assault_weapon = 1; // SpecOp/Recon assault rifle: 1 = MX black series  #  2 = TRG series  #  3 = MX Compact series.
_ADF_SOR_hand_weapon = 1; // SpecOp/Recon Hand weapon: 1 = 4-five .45.  #  2 = P07
_ADF_CAV_assault_weapon = 1; // Cavalry crew weapon: 1 = MX Compact series  #  2 = Vermin SMG.
// ACE
_ADF_ACE3_microDAGR_all = true; // enable the ACE3 MicroDAGR for all players [true/false]
_ADF_ACE3_microDAGR_leaders = false; // enable the ACE3 MicroDAGR for leadership only [true/false]
// cTAB
_ADF_cTAB_side = ADF_playerSide; // Gets the information from ADF_playerside. Only change (EAST, WEST) if needed to.
_ADF_cTAB_microDAGR_all = false; // enable the ACE3 MicroDAGR for all players [true/false]
_ADF_cTAB_microDAGR_leaders = false; // enable the ACE3 MicroDAGR for leadership only [true/false]
// TFAR
_ADF_TFAR_personalRadio = "tf_rf7800str"; // TaskForce Radio. Personal (rifleman) radio [classname].
_ADF_TFAR_SWRadio = "tf_anprc152"; // TaskForce Radio. ShortWave radio [classname].
_ADF_TFAR_LRRadio = "tf_rt1523g_big"; // TaskForce Radio. Long Range radio [classname].
_ADF_TFAR_LRRadioSOR = "tf_rt1523g_black"; // TaskForce Radio. Long Range radio Special Operations Squadron [classname].
_ADF_TFAR_microDAGR = false; // enable/add the TFAR MicroDAGR [true/false]
ADF_TFAR_preset = true; // Preset TFAR freq's per group? Define in 'Core\ADF_TFAR-freq.sqf'. [true/false].
// ACRE
_ADF_ACRE_personalRadio = "ACRE_PRC343"; // ACRE2. Personal (rifleman) radio [classname].
_ADF_ACRE_SWRadio = "ACRE_PRC148"; // ACRE2. ShortWave radio [classname]. Eg "ACRE_PRC148" or "ACRE_PRC152"
_ADF_ACRE_LRRadio = "ACRE_PRC117F"; // ACRE2. Long Range radio [classname].
_ADF_ACRE_fullDuplex = true; // Sets the duplex of radio transmissions. If set to true, it means that you will receive transmissions even while talking and multiple people can speak at the same time. [true/false].
_ADF_ACRE_interference = true; // Sets whether transmissions will interfere with each other. This, by default, causes signal loss when multiple people are transmitting on the same frequency. [true/false].
_ADF_ACRE_AIcanHear = true; // Sets whether AI can detect players speaking. [true/false].
ADF_ACRE_preset = false; // Preset ACRE freq's per group? Define in 'Core\ADF_ACRE-freq.sqf'. [true/false].
// Crates / Vehicle supplies
_ADF_suppliesInit = false; // load crate/vehicle supplies for ADF template crates/vehicles

/********** MISSION BALANCING **********/
_ADF_misBal = false; // Enable/disable Mission Balancer [true/false]. See 'Core/F/ADF_fnc_missionBalancer.sqf' for more info.
_ADF_misBal_low = 10; // Mission Balancer > Low number of players (spawns less enemies). Medium/Normal number of players is average low/high.
_ADF_misBal_high = 30; // Mission Balancer > high number of players (spawns all enemies).

/********** UNIT/VEHICLE CACHING **********/
_ADF_Caching = true; // // Enable/disable caching of units and vehicles. Auto Disabled when HC is active. [true/false].
_ADF_Caching_unitDistance = 1500; // AI Unit caching distance default = 1000 meters.
_ADF_Caching_vehicleDistance_land = 750; // Cars caching distance default = 250 meters.
_ADF_Caching_vehicleDistance_air = 2000; // aircraft caching distance default = 250 meters.
_ADF_Caching_vehicleDistance_sea = 1500; // boats caching distance default = 250 meters.
_ADF_Caching_debugInfo = true; // Show caching debug info in ADF_debug mode

/********** VIEW DISTANCE **********/
setViewDistance 1750; // Default view distance.
ADF_VD_foot = 2000; // Maximum view distance on foot.
ADF_VD_vehicle = 2500; // Maximum view distance in a vehicle.
ADF_VD_air = 7500; // Maximum view distance when airborne.
ADF_VD_allowNoGrass = true; // Set 'false' if you want to disable "Low" option for terrain [true/false].

/********** F.A.R.P. REPAIR/REFUEL/REARM **********/
ADF_FARP_repairTime = 180; // Maximum time in seconds it takes to repair a vehicle at the FARP.
ADF_FARP_reloadTime = 10; // Maximum time in seconds it takes to re-arm per turret magazine at the FARP.
ADF_FARP_refuelTime = 90; // Maximum time in seconds it takes to refuel a vehicle at the FARP.

/********** RESPAWN / MOBILE HQ (MOBILE RESPAWN FOB) **********/
ADF_Tickets = false; // enable respawn tickets [true/false]. Make sure to configure in description.ext as well!!
_ADF_wTixNr = 10; // Respawn Tickets. Number available respawns for WEST Blufor.
_ADF_eTixNr = 15; // Respawn Tickets. Number available respawns for EAST Opfor.

_ADF_mhq_enable = false; // enable the MHQ function [true/false].
_ADF_mhq_respawn_nr = 3; // Number of MHQ vehicle respawn available.
_ADF_mhq_respawn_time = 15; // MHQ vehicle respawn time in minutes.
_ADF_mhq_respawn_class = "B_APC_Tracked_01_CRV_F"; // MHQ vehicle classname (default is the 'Bobcat').
_ADF_mhq_deploy_time = 120; // MHQ deployment time in seconds.
_ADF_mhq_packup_time = 180; // MHQ packup time in seconds.

/********** VEHICLE RESTRICTION (CREW CHECK) **********/
_ADF_crewCheck_Pilots = false; // enable the crew check function for Jet/Heli (co-)pilots and heli pilot/crew. [true/false]. Vehicles can be configured here: 'Core\F\ADF_fnc_crewCheckClasses.sqf'
_ADF_crewCheck_Armoured = false; // enable the crew check function for armored vehicle crew [true/false]. Vehicles can be configured here: 'Core\F\ADF_fnc_crewCheckClasses.sqf'

/********** THIRD PARTY MODS/SCRIPTS **********/
_ADF_DAC = false; // Dynamic AI Creator. Auto detects MOD/Addon version. Manual set the script version -> WIP
_ADF_civKia_enable = false; // CivKia. A functions that keeps track of civilian kills by players.

_ADF_ambient_uCiv = true; // enable ambient civilian PERSONS that spawn around the player(s) [true/false].
_ADF_ambient_uCiv_nr = 1; // number of civilians to spawn around the players. This nr. is the max nr. of civilian spawns (no matter the amount of players).
_ADF_ambient_uCiv_wpnr = 5; // number of waypoints that civilians use when walking around (use between 4-8, lower is better performance).
_ADF_ambient_uCiv_dist = 500; // Civilian Spawn distance from player in meters.

_ADF_ambient_vCiv = true; // enable ambient civilians VEHICLES that spawn around the player(s) [true/false].
_ADF_ambient_vCiv_nr = 2; // number of vehicles to spawn around the players. This nr. is the max nr. of civilian vehicle spawns (no matter the amount of players).
_ADF_ambient_vCiv_dist = 500; // Vehicle spawn distance from player in meters.
_ADF_ambient_vCiv_del = 1000; // Vehicle delete distance from player in meters.

//Garbage collector
_ADF_CleanUp = true; // enable cleaning up of dead bodies (friendly, enemy, vehicles, etc.) [true/false].
_ADF_CleanUp_viewDist = 500; // min distance in meter from a player unit to allow delete, if you dont care if player sees the delete, set it to 0.
_ADF_CleanUp_manTimer = 300; // x seconds until delete of dead man units.
_ADF_CleanUp_vehTimer = 600; // x seconds until delete of dead vehicles, for destroyed and heavy damaged vehicles.
_ADF_CleanUp_abaTimer = 6000; // x seconds a vehicle must be unmanned to be deleted, for _abandoned option.

/********** MISC SETTINGS **********/
_ADF_zeusEagle = true; // Enable the Zeus Eagle? False removes the eagle [true/false].
_ADF_altitude = false; // Enable altitude based fatigue (altitude mountain sickness)? True increases fatigue when > 1500 meter altitude [true/false].

/********** ADF DEV BUILD SETTINGS **********/
ADF_tpl_version = 1.42; // ADF version DO NOT EDIT
_ADF_devBuild = "Production"; // [Alpha/Beta/Production] DO NOT EDIT
_ADF_devBuildNr = "03"; // Build number. DO NOT EDIT