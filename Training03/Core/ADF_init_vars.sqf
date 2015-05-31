/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Mission init / Variables init
Author: Whiztler
Script version: 1.02

Game type: n/a
File: ADF_init_vars.sqf
****************************************************************/

missionInit = false;
ADF_dlc_MarksMan = isClass(configFile/"CfgMods"/"Mark"); // Check if Marksman DLC is present
ADF_dlc_Bundle = isClass(configFile/"CfgMods"/"DLCBundle"); // Check if DLC Bundle is present
ADF_dlc_Heli = isClass(configFile/"CfgMods"/"Heli"); // Check if Helicopters DLC is present
ADF_mod_CBA = isClass(configFile/"CfgPatches"/"cba_main"); // Check if CBA is present
ADF_mod_ACE = isClass(configFile/"CfgPatches"/"ace_main"); // Check if ACE is present
ADF_mod_ACRE = isClass(configFile/"CfgPatches"/"acre_main"); // Check if ACRE is present
ADF_mod_TFAR = isClass(configFile/"CfgPatches"/"task_force_radio"); // Check if TFAR is present
ADF_mod_CTAB = isClass(configFile/"CfgPatches"/"cTab"); // Check if cTab is present
ADF_mod_AGM_coreInc = isClass (configFile >> "CfgPatches" >> "AGM_Core"); // AGM Core
ADF_mod_AGM_grenInc = isClass (configFile >> "CfgPatches" >> "AGM_Grenades"); // AGM Grenades
ADF_mod_AGM_iactInc = isClass (configFile >> "CfgPatches" >> "AGM_Interaction"); // AGM Interaction
ADF_mod_AGM_ballInc = isClass (configFile >> "CfgPatches" >> "AGM_Ballistics"); // AGM Ballistics > SD ammo
ADF_mod_AGM_mediInc = isClass (configFile >> "CfgPatches" >> "AGM_Medical"); // AGM Medical > med supplies
ADF_mod_AGM_explInc = isClass (configFile >> "CfgPatches" >> "AGM_Explosives"); // AGM Explosives > remote trigger / defusal kit
ADF_mod_AGM_hearInc = isClass (configFile >> "CfgPatches" >> "AGM_Hearing"); // AGM Hearing > earplugs
ADF_mod_AGM_overheatInc = isClass (configFile >> "CfgPatches" >> "AGM_Overheating"); // AGM Overheating > spare barrel etc
ADF_mod_AGM_logiInc = isClass (configFile >> "CfgPatches" >> "AGM_Logistics"); // AGM Logistics > UAV battery
ADF_mod_AGM_mapInc = isClass (configFile >> "CfgPatches" >> "AGM_Map"); // AGM Map > Map Tools
ADF_mod_AGM_windInc = isClass (configFile >> "CfgPatches" >> "AGM_Wind"); // AGM Wind > Kestrel
ADF_killCnt = 0;
ADF_killed = 0;
ADF_MB_lite = true; // Mission Balancer vars 
ADF_MB_normal = true; // Mission Balancer vars 
ADF_MB_heavy = true; // Mission Balancer vars
ADF_HC_connected = false; // HC init 
 
player setVariable ["BIS_noCoreConversations",true]; // Disable AI chatter.
allowFunctionsLog = 0;	// Log functions to .rpt. disabled with 0
enableSentences false; // Disable AI chatter.
enableSaving [false,false]; // Disables save when aborting.
enableEngineArtillery false; // Disables BIS arty (map click).
enableTeamSwitch false; // Disables team switch.
