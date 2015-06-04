/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Call Sings & Radio configuration
Author: Whiztler
Script version: 2.51

Game type: n/a
File: ADF_clientPreset.sqf
****************************************************************
DO NOT EDIT THIS SCRIPT

To configure call sign and radio frequency presets open and
edit: 'Core\f\ADF_fnc_presets.sqf'

DO NOT EDIT THIS SCRIPT

ACRE2 = WIP
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_clientPreset.sqf"; // Reporting. Do NOT edit/remove

if (!hasInterface) exitWith {}; // HC exits

_ADF_perfDiagStart = diag_tickTime;

// Init
private [
	"_ADF_ACRE_init",
	"_ADF_ACRE_fullDuplex",
	"_ADF_ACRE_interference",
	"_ADF_ACRE_AIcanHear",
	"_ADF_uGroup",
	"_ADF_uGroupID",
	"_ADF_preset_companyGroups",
	"_ADF_roster_uRole",
	"_ADF_roster_strColorGrp",
	"_ADF_roster_strFinal",
	"_ADF_roster_uGroup",
	"_ADF_roster_groupOld",
	"_ADF_roster_groupNew",
	"_ADF_roster_groupID",
	"_ADF_roster_pub",	
	"_ADF_preset"
];

_ADF_uGroup = group player;
_ADF_uGroupID = (groupID (_ADF_uGroup));
_ADF_preset = _this select 0;
_ADF_ACRE_fullDuplex = _this select 1;
_ADF_ACRE_interference = _this select 2;
_ADF_ACRE_AIcanHear = _this select 3;
_ADF_TFAR_microDAGR = _this select 4;
_ADF_roster_uRole = "";
_ADF_roster_groupOld = grpNull;
_ADF_roster_groupNew = grpNull;
_ADF_roster_pub = "";
ADF_presetData = [];	
ADF_roster_uArray = [];
ADF_roster_uName = "";
ADF_roster_Intro = "";
ADF_roster_line = "";


///// TFAR pre-init

if (ADF_mod_TFAR) then { // TFAR detected	
	TF_give_microdagr_to_soldier = _ADF_TFAR_microDAGR;
	tf_give_personal_radio_to_regular_soldier = false; // Commander radio for all players
	tf_no_auto_long_range_radio = true; // LR radio for leaders
	TF_speakerDistance = 20; // The propagation distance of sound from radio speakers.
	player setVariable ["tf_voiceVolume", 1.0, true]; // 0 - 1 The volume (gain level) of direct speech — does not affect the propagation distance.
	player setVariable ["tf_globalVolume", 1.0]; // 0 -1 Global volume for radio and speech.
	player setVariable ["tf_receivingDistanceMultiplicator", 1]; // 1-2 A multiplier for increasing, or lowering the distance from transmitter to receiver
	player setVariable ["tf_sendingDistanceMultiplicator", 1.0]; // 0-1 A multiplier for increasing or lowering the range of transmission.	
	{
		if ((side _x == ADF_playerSide) && ((_x isKindOf "Tank") || (_x isKindOf "car"))) then {
		_x setVariable ["tf_range", 30000, true] // Sets the maximum range (meters) of transmission for a vehicle-mounted radio.
		};
	} forEach vehicles;
	if (side player != ADF_playerSide) exitWith {};
	if (ADF_TFAR_preset) then {
		tf_same_sw_frequencies_for_side = false;
	} else {
		tf_same_sw_frequencies_for_side = true;
	};	
	if (ADF_TFAR_preset) exitWith {}; // Exit if per group defined presets are required
	waitUntil {time > 15}; // Let TFAR init properly
	[(call TFAR_fnc_activeSwRadio), 1, "100.0"] call TFAR_fnc_SetChannelFrequency;
	[(call TFAR_fnc_activeLrRadio), 1, "50.0"] call TFAR_fnc_SetChannelFrequency;
};

///// ACRE2 pre-init

if (ADF_mod_ACRE) then { // ACRE2 detected
	_ADF_ACRE_init = [] call acre_api_fnc_isInitialized;
	waitUntil {_ADF_ACRE_init};
	[_ADF_ACRE_fullDuplex] call acre_api_fnc_setFullDuplex;
	[_ADF_ACRE_interference] call acre_api_fnc_setInterference;
	[_ADF_ACRE_AIcanHear] call acre_api_fnc_setRevealToAI;
	if (ADF_debug) then {["MOD - ACRE settings initialized",false] call ADF_fnc_log};
};

///// Apply the call signs and radio freq for each player

// Load all groups (as strings) into an array 
_ADF_preset_companyGroups = [
	"gCC", 																													// XO 		- 0
	"gCO_1",	"gCO_11",	"gCO_11A",	"gCO_11B",	"gCO_12",	"gCO_12A",	"gCO_12B",	"gCO_13",	"gCO_13A",	"gCO_13B", 	// 1 INF PLT 	- 1-10
	"gCO_2",	"gCO_21A",	"gCO_21B",	"gCO_21C",	"gCO_22A",	"gCO_22B",	"gCO_23A",	"gCO_23B", 							// 2 CAV BAT 	- 11-18
	"gCO_3",	"gCO_31A",	"gCO_31B",	"gCO_32A",	"gCO_32B",	"gCO_32C",	"gCO_33A",	"gCO_33B", 							// 3 AIR WING	- 19-26
	"gCO_4",	"gCO_41M",	"gCO_41R",	"gCO_41Y",	"gCO_41Z",	"gCO_42A",	"gCO_42B",	"gCO_43F", 							// 4 SOR SQDR 	- 27-34
	"gGM1",		"gGM2"																										// GM's 		- 35-36
];

// Load the preset configured in ADF_init_config.sqf	
If (_ADF_preset == "NOPRYL") then {ADF_presetData = ADF_preset_NOPRYL;};
If ((_ADF_preset == "SHAPE") || (_ADF_preset == "DEFAULT")) then {ADF_presetData = ADF_preset_DEFAULT;};
If (_ADF_preset == "CUSTOM") then {ADF_presetData = ADF_preset_CUSTOM;};
If (_ADF_preset == "WOLFPACK") then {ADF_presetData = ADF_preset_WP;};
// In case of an undefined preset or a typo, load the Default preset
If ((_ADF_preset != "NOPRYL") && (_ADF_preset != "SHAPE") && (_ADF_preset != "DEFAULT") && (_ADF_preset != "CUSTOM") && (_ADF_preset != "WOLFPACK")) then {
	ADF_presetData = ADF_preset_DEFAULT;
	if (ADF_debug) then {["PRESETS - No preset defined. Applying DEFAULT preset",false] call ADF_fnc_log};
};

// Clan preset has loaded, lets find the units group in the preset and retrieve the Call sign and freq data
_i = _ADF_preset_companyGroups find _ADF_uGroupID;
if (_i == -1) exitwith {["PRESETS - ERROR! Unknown group or unit. Roster NOT created. Call sign NOT applied. Please use ADF units only!",true] call ADF_fnc_log};
_ADF_uPreset	= ADF_presetData select _i;

// Apply the call sign and freq data
_ADF_uGroup setGroupId [_ADF_uPreset select 0];
if (ADF_mod_TFAR) then {
	ADF_TFAR_LR_freq = _ADF_uPreset select 1;
	ADF_TFAR_SW_freq = _ADF_uPreset select 2;
};

// Re-initialize cTAB (if activated) WIP
if (ADF_mod_CTAB) then {
	//player setVariable ["cTab_groupId",_ADF_uPreset select 0,true]; // 1.39 B9 > not updating
	//call cTab_fnc_updateLists; // 1.39 B5 > not updating
	//["cTab_updatePulse",cTab_fnc_updateLists] call CBA_fnc_addEventHandler; // 1.39 B9 > not updating
	if (ADF_debug) then {["PRESETS - cTAB re-initialized",false] call ADF_fnc_log};
};

// Initialize ACE3 BluForce Tracking (if activated) WIP
if (ADF_mod_ACE3) then {
	// insert Blueforce tracking init
	ace_map_BFT_Enabled = true;
	ace_map_BFT_markers = [];
	[ace_map_fnc_blueForceTrackingUpdate, 1, []] call CBA_fnc_addPerFrameHandler;	
	if (ADF_debug) then {["PRESETS - ACE3 BluForce Tracking initialized",false] call ADF_fnc_log};
};

// Reapply for roster inclusion and announce
[[_ADF_uGroup,[_ADF_uPreset select 0]],'setGroupID',true,true] call BIS_FNC_MP;
ADF_set_callSigns = true; publicVariable "ADF_set_callSigns";
if (ADF_debug) then {["PRESETS - Preset call signs applied",false] call ADF_fnc_log};

///// Apply the Radio Frequencies

// Set the frequencies for TFAR
if (ADF_mod_TFAR && ADF_TFAR_preset) then {
	waitUntil {time > 15}; // Let TFAR init properly	
	_ADF_TFAR_SW_radio = call TFAR_fnc_haveSWRadio;
	_ADF_TFAR_LR_radio = call TFAR_fnc_haveLRRadio;
	// Apply SW & LR frequencies
	if (_ADF_TFAR_SW_radio) then {[(call TFAR_fnc_activeSwRadio), 1, str ADF_TFAR_SW_freq] call TFAR_fnc_SetChannelFrequency};
	if (_ADF_TFAR_LR_radio) then {[(call TFAR_fnc_activeLrRadio), 1, str ADF_TFAR_LR_freq] call TFAR_fnc_SetChannelFrequency};
	if (ADF_debug) then {["RADIO - TFAR radios configured",false] call ADF_fnc_log};
	
	// Announce to player
	if (!_ADF_TFAR_LR_radio) then {systemChat format ["%1: %2, TFAR radio tuned in. SW: %3",ADF_clanTAG,name vehicle player,ADF_TFAR_SW_freq]};
	if (_ADF_TFAR_SW_radio && _ADF_TFAR_LR_radio) then {systemChat format ["%1: %2, TFAR radio's tuned in. SW: %3 | LR: %4",ADF_clanTAG,profileName,ADF_TFAR_SW_freq,ADF_TFAR_LR_freq]};
	ADF_set_radios = true;
};

// Set the frequencies for ACRE2
if (ADF_mod_ACRE && ADF_ACRE_preset) then {
	// Apply ACRE channels WIP
	ADF_set_radios = true;
	if (ADF_debug) then {["RADIO - ACRE2 radios configured",false] call ADF_fnc_log};
};

// Set radios to true in case TFAR and ACRE are not active
if !(ADF_mod_ACRE && ADF_mod_TFAR) then {ADF_set_radios = true;};

///// Create the roster

if (isDedicated) exitWith {}; // clients only
waitUntil {ADF_set_callSigns}; // wait until a call sign has been been applied

// Create the Roster Subject
player createDiarySubject ["Deployment Roster",ADF_clanName + " Roster"];

// Units array
if (isMultiplayer) then {ADF_roster_uArray = playableUnits;} else {ADF_roster_uArray = switchableUnits};

// Roster create loop
{
	if (side _x == side player) then {
		_ADF_roster_groupNew = group _x;
		_ADF_roster_uGroup = _ADF_roster_groupNew;
		_ADF_roster_uGroupName = groupID (_ADF_roster_groupNew);
		ADF_roster_userGroup = "";
		_ADF_roster_uRole = " - " + getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName");
		
		if (ADF_TFAR_preset && ADF_mod_TFAR) then {
			if (_ADF_roster_groupNew != _ADF_roster_groupOld) then {
				ADF_roster_userGroup = format ["<br/><font size='16' color='#D7DBD5'>%1</font>  <font color='#9DA698'>[</font><font color='#FF9E05'>%2</font><font color='#9DA698'>][</font><font color='#10D471'>%3</font><font color='#9DA698'>]<br/>",_ADF_roster_uGroupName, ADF_TFAR_LR_freq, ADF_TFAR_SW_freq];
			}
		} else { // to add ACRE2 (WIP)
			if (_ADF_roster_groupNew != _ADF_roster_groupOld) then {
				ADF_roster_userGroup = format ["<br/><font size='16' color='#D7DBD5'>%1</font><br/>",_ADF_roster_uGroupName];
			}
		};
		
		if (name _x == name player) then {
			ADF_roster_uName = "<font color='#EFCA35'>" + name _x + "<font color='#9DA698'>";
		} else {
			ADF_roster_uName = "<font color='#9DA698'>" + name _x;
		};
		ADF_roster_line =  ADF_roster_line + ADF_roster_userGroup + ADF_roster_uName + _ADF_roster_uRole + "</font><br/>";
		_ADF_roster_groupOld = group _x;
	};
} forEach ADF_roster_uArray;

// Display radio freq's?
if (ADF_TFAR_preset && ADF_mod_TFAR) then {
	ADF_roster_Intro = "<br/><br/><font size='18'>" + ADF_clanName + "</font><br/><font size='16'>Deployment Roster</font><br/><br/><font size='14' color='#d7dbd5'>Radio Frequencies</font><br/><font color='#FF9E05'>ORANGE</font><font color='#9DA698'> = team's/group's Long Range radio frequency.<br/><font color='#10D471'>GREEN</font><font color='#9DA698'> = group's Short Wave radio frequency.</font><br/><br/>";
};
if (ADF_ACRE_preset && ADF_mod_ACRE) then {
	// ACRE2 is WIP
	ADF_roster_Intro = "<br/><br/><font size='18'>" + ADF_clanName + "</font><br/><font size='16'>Deployment Roster</font><br/><br/>"
};
if (!(ADF_TFAR_preset && ADF_mod_TFAR) && !(ADF_ACRE_preset && ADF_mod_ACRE)) then {
	ADF_roster_Intro = "<br/><br/><font size='18'>" + ADF_clanName + "</font><br/><font size='16'>Deployment Roster</font><br/><br/>"
};

// Roster publish
_ADF_rosterPub = ADF_roster_Intro + ADF_roster_line;
player createDiaryRecord ["Deployment Roster",["Deployment Roster",_ADF_rosterPub]];
ADF_set_roster = true;

// Announce call sign
if (player == leader (group (vehicle player))) then {player groupChat format ["Our call sign is: %1",groupID (_ADF_uGroup)];};

if (ADF_debug) then {["INIT - Roster generated",false] call ADF_fnc_log};

waitUntil {ADF_set_callSigns && ADF_set_roster && ADF_set_radios};
// Everything is set, lets destroy the variables, we don't need them anymore
ADF_roster_uArray = nil; ADF_roster_uName = nil;
ADF_roster_Intro = nil; ADF_roster_line = nil; ADF_roster_userGroup = nil;
ADF_preset_NOPRYL = nil; ADF_preset_DEFAULT = nil; ADF_preset_CUSTOM = nil; ADF_preset_WP = nil; // dump Call sign arrays

_ADF_perfDiagStop = diag_tickTime;
if (ADF_debug) then {
	_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
	_debugText = "PRESETS - Preset processed.";
	_debugMsg = _debugText + _debugDiag;
	[_debugMsg,false] call ADF_fnc_log;
};

// ADF
player createDiarySubject ["ADF","ADF"];
player createDiaryRecord ["ADF",["ARMA Mission Development Framework","
<br/><img shadow='false' image='Core\I\ADF_logo.paa'/><br/><br/>
<br/><br/>---------------------------------------------------------------
<br/><br/>ARMA Mission Development Framework<br/>
ADF version: 1.40 / JUNE 2015
<br/><br/>
"]];