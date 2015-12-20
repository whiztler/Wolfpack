/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Cfg entries
Author: Whiztler
Script version: 1.2

Game type: n/a
File: missionConfig.hpp
****************************************************************
Config entry registration goes in here.
****************************************************************/

class CfgUnitInsignia {
	class CLANPATCH {
		displayName = "Wolfpack"; // Name displayed in Arsenal
		author = "ADF / Whiztler";
		texture = "Img\clan_patch_Wolfpack.paa";
		textureVehicle = ""; // Does nothing currently, reserved for future use
	};
};

class CfgRespawnTemplates { // F3 Spectator Script
	class f_Spectator {
		onPlayerRespawn = "f_fnc_CamInit";
	};
    class Seagull { //Overwrite Vanilla Seagull
        onPlayerRespawn = "";
    };
};

class cfgNotifications { // Preconfigured messages
	class ADF_noticeMsg
	{
		title = "NOTICE";
		description = "%1";
		iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa";
		iconText = "";
		color[] = {1,1,0,1};		
		duration = 4;
		priority = 7;
	};
};

class CfgSounds {
	sounds[] = {};
	class radioTransmit {
		name = "Radio_Transmit_Sound";
		sound[] = {"Core\S\in2c.ogg", 1, 1}; 		// filename, volume, pitch
		titles[] = {};
	};
};

// End Screen / Debriefing
class CfgDebriefing
{  
	class End1
	{
		title = "Mission Completed";
		subtitle = "The Package";
		description = "Big Foot: Well done men. Vodka and medals await upon your return!";
		pictureBackground = "Img\intro_day1.paa"; // eg. "img\yourpicture.jpg" no picture? use "";
		picture = "b_HQ"; // Marker icon
		pictureColor[] = {0.0,0.3,0.6,1}; // Overlay color
	};
	class End2
	{
		title = "Mission FAILED";
		subtitle = "The Package";
		description = "Big Foot: The package is still alive, This is unacceptable Phoenix!";
		pictureBackground = "Img\intro_day1.paa"; // eg. "img\yourpicture.jpg" no picture? use "";
		pictureColor[] = {0.0,0.3,0.6,1}; // Overlay color
	};
	class Killed
	{
		title = "Entire Wolf team K.I.A.";
		subtitle = "The Package";
		description = "Big Foot: The package is still alive, This is unacceptable Phoenix!";
		pictureBackground = "Img\intro_day1.paa"; // eg. "img\yourpicture.jpg" no picture? use "";
		pictureColor[] = {0.0,0.3,0.6,1}; // Overlay color
	};
};

// ACE3 settings v. 3.3.2.0
/*
class ACE_Settings {
	// Custom ACE3 Setting below

	class ace_common_forceAllSettings {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_common_checkPBOsAction {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_common_checkPBOsCheckAll {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_common_checkPBOsWhitelist {
		value = "[]";
		typeName = "STRING";
		force = 1;
	};
	class ace_finger_enabled {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_finger_maxRange {
		value = 4;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_frag_Enabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_frag_SpallEnabled {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_frag_maxTrack {
		value = 500;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_frag_MaxTrackPerFrame {
		value = 50;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_frag_EnableDebugTrace {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_hitreactions_minDamageToTrigger {
		value = 0.1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_interaction_EnableTeamManagement {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_laserpointer_enabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_magazinerepack_TimePerAmmo {
		value = 1.5;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_magazinerepack_TimePerMagazine {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_magazinerepack_TimePerBeltLink {
		value = 8;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_map_BFT_Interval {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_map_BFT_Enabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_map_BFT_HideAiGroups {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_map_mapIllumination {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_map_mapGlow {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_map_mapShake {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_map_mapLimitZoom {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_map_mapShowCursorCoordinates {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_maptools_EveryoneCanDrawOnBriefing {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_level {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_medicSetting {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_enableFor {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_enableOverdosing {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_bleedingCoefficient {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_painCoefficient {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_enableAirway {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_enableFractures {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_enableAdvancedWounds {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_enableVehicleCrashes {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_enableScreams {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_playerDamageThreshold {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_AIDamageThreshold {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_enableUnconsciousnessAI {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_remoteControlledAI {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_preventInstaDeath {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_enableRevive {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_maxReviveTime {
		value = 120;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_amountOfReviveLives {
		value = -1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_allowDeadBodyMovement {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_allowLitterCreation {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_litterCleanUpDelay {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_medicSetting_PAK {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_medicSetting_SurgicalKit {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_consumeItem_PAK {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_consumeItem_SurgicalKit {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_useLocation_PAK {
		value = 3;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_useLocation_SurgicalKit {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_useCondition_PAK {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_useCondition_SurgicalKit {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_medical_keepLocalSettingsSynced {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_healHitPointAfterAdvBandage {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_painIsOnlySuppressed {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_allowUnconsciousAnimationOnTreatment {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_moveUnitsFromGroupOnUnconscious {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_medical_menu_allow {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_microdagr_MapDataAvailable {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_mk6mortar_airResistanceEnabled {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_mk6mortar_allowComputerRangefinder {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_mk6mortar_allowCompass {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_nametags_showCursorTagForVehicles {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_nametags_playerNamesViewDistance {
		value = 5;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_nametags_playerNamesMaxAlpha {
		value = 0.8;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_engineerSetting_Repair {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_engineerSetting_Wheel {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_repairDamageThreshold {
		value = 0.6;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_repairDamageThreshold_Engineer {
		value = 0.4;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_consumeItem_ToolKit {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_fullRepairLocation {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_engineerSetting_fullRepair {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_repair_addSpareParts {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_repair_wheelRepairRequiredItems {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_respawn_SavePreDeathGear {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_respawn_RemoveDeadBodiesDisconnected {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_respawn_BodyRemoveTimer {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_sitting_enable {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_spectator_filterUnits {
		value = 2;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_spectator_filterSides {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_spectator_restrictModes {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_spectator_restrictVisions {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_switchunits_EnableSwitchUnits {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_switchunits_SwitchToWest {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_switchunits_SwitchToEast {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_switchunits_SwitchToIndependent {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_switchunits_SwitchToCivilian {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_switchunits_EnableSafeZone {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_switchunits_SafeZoneRadius {
		value = 100;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_vehiclelock_DefaultLockpickStrength {
		value = 10;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_vehiclelock_LockVehicleInventory {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_vehiclelock_VehicleStartingLockState {
		value = -1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_viewdistance_enabled {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_viewdistance_limitViewDistance {
		value = 10000;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_weather_enableServerController {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_weather_useACEWeather {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_weather_syncRain {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_weather_syncWind {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_weather_syncMisc {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_weather_serverUpdateInterval {
		value = 60;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_winddeflection_enabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_winddeflection_vehicleEnabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_winddeflection_simulationInterval {
		value = 0.05;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_winddeflection_simulationRadius {
		value = 3000;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_zeus_zeusAscension {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_zeus_zeusBird {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_zeus_remoteWind {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_zeus_radioOrdnance {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_zeus_revealMines {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_zeus_autoAddObjects {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_captives_allowHandcuffOwnSide {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_captives_requireSurrender {
		value = 1;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_captives_allowSurrender {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_cargo_enable {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_explosives_RequireSpecialist {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_explosives_PunishNonSpecialists {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_explosives_ExplodeOnDefuse {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_hearing_EnableCombatDeafness {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_hearing_EarplugsVolume {
		value = 0.5;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_hearing_UnconsciousnessVolume {
		value = 0.4;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_hearing_enabledForZeusUnits {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_enabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_simulateForSnipers {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_simulateForGroupMembers {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_simulateForEveryone {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_disabledInFullAutoMode {
		value = 0;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_ammoTemperatureEnabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_barrelLengthInfluenceEnabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_bulletTraceEnabled {
		value = 1;
		typeName = "BOOL";
		force = 1;
	};
	class ace_advanced_ballistics_simulationInterval {
		value = 0;
		typeName = "SCALAR";
		force = 1;
	};
	class ace_advanced_ballistics_simulationRadius {
		value = 3000;
		typeName = "SCALAR";
		force = 1;
	};
	// Custom ACE3 Setting above
};