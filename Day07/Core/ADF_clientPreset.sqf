/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Call Sings & Radio configuration
Author: Whiztler
Script version: 2.60

Game type: n/a
File: ADF_clientPreset.sqf
****************************************************************
DO NOT EDIT THIS SCRIPT

To configure call sign and radio frequency presets open and
edit: 'Core\f\ADF_fnc_presets.sqf'

DO NOT EDIT THIS SCRIPT

ACRE2 = WIP
****************************************************************/

if (isServer) then {diag_log "ADF RPT: Init - executing ADF_clientPreset.sqf"}; // Reporting. Do NOT edit/remove

if (ADF_isHC) exitWith {}; // HC exits script

////  Init

private [
	"_ADF_ACRE_init",
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
	"_ADF_roster_pub"
];

params [
	["_ADF_preset", "DEFAULT", ["SHAPE","DEFAULT","CUSTOM","WOLFPACK","2SIERRA"]],
	"_ADF_ACRE_fullDuplex",
	"_ADF_ACRE_interference",
	"_ADF_ACRE_AIcanHear",
	"_ADF_TFAR_microDAGR"
];
_ADF_perfDiagStart 		= diag_tickTime;
_ADF_uGroup 				= group player;
_ADF_uGroupID 			= (groupID (_ADF_uGroup));
_ADF_roster_uRole 		= "";
_ADF_roster_groupOld 		= grpNull;
_ADF_roster_groupNew		= grpNull;
_ADF_roster_pub 			= "";
ADF_presetData 			= [];	
ADF_roster_uArray 		= [];
ADF_roster_uName 			= "";
ADF_roster_Intro			= "";
ADF_roster_line 			= "";

// Load the preset configured in ADF_init_config.sqf	
If (_ADF_preset == "NOPRYL") then {ADF_presetData = ADF_preset_NOPRYL;};
If ((_ADF_preset == "SHAPE") || (_ADF_preset == "DEFAULT")) then {ADF_presetData = ADF_preset_DEFAULT;};
If (_ADF_preset == "CUSTOM") then {ADF_presetData = ADF_preset_CUSTOM;};
If (_ADF_preset == "WOLFPACK") then {ADF_presetData = ADF_preset_WP;};
If (_ADF_preset == "2SIERRA") then {ADF_presetData = ADF_preset_2S;};

ADF_fnc_PresetSetGroupID = { // 1.40B03
	private ["_g","_cs"];
	if (!isNil (_this select 0)) then {
		_g = call compile format ["%1",_this select 0];
		_cs = _this select 1;
		_g setGroupId [format ["%1",_cs]];
	};
	ADF_set_callSigns = true;
	true	
};

// Load all groups (as strings) into an array 
_ADF_preset_companyGroups = [
	"gCC", 																																// XO 		- 0
	"gCO_1",	"gCO_11",	"gCO_11A",	"gCO_11B",	"gCO_12",	"gCO_12A",	"gCO_12B",	"gCO_13",	"gCO_13A",	"gCO_13B",	"gCO_13C",	// 1 INF PLT 	- 1-11
	"gCO_2",	"gCO_21A",	"gCO_21B",	"gCO_21C",	"gCO_22A",	"gCO_22B",	"gCO_23A",	"gCO_23B", 										// 2 CAV BAT 	- 12-19
	"gCO_3",	"gCO_31A",	"gCO_31B",	"gCO_32A",	"gCO_32B",	"gCO_32C",	"gCO_33A",	"gCO_33B", 										// 3 AIR WING	- 20-27
	"gCO_4",	"gCO_41M",	"gCO_41R",	"gCO_41Y",	"gCO_41Z",	"gCO_42A",	"gCO_42B",	"gCO_43F", 										// 4 SOR SQDR 	- 28-35
	"gGM1",		"gGM2"																													// GM's 		- 37-37
];

///// Finish player loadout init
waitUntil {ADF_gearLoaded}; 
if !(isNil "GM_1") then {if (player == GM_1) then {waitUntil {ADF_GM_init}}};  // > 141B01
if !(isNil "GM_2") then {if (player == GM_2) then {waitUntil {ADF_GM_init}}};  // > 141B01

///// TFAR pre-init

if (ADF_mod_TFAR) then { // TFAR detected
	waitUntil {time > 5}; // Let TFAR init initially
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


///// Apply Call Sign and get Freq data

if (hasInterface) then {
	waitUntil {time > 10}; // Let TFAR init properly
	// Find the players group in the '_ADF_preset_companyGroups' array
	_i = _ADF_preset_companyGroups find _ADF_uGroupID;
	if (_i == -1) exitWith {["PRESETS - ERROR! Unknown group or unit. Roster NOT created. Call sign NOT applied. Please use ADF units only!",true] call ADF_fnc_log};
	ADF_uPreset = [ADF_presetData select _i, []] select (_i < 0);

	//  Apply call signs across the board
	{_x call ADF_fnc_PresetSetGroupID} forEach ADF_presetData;
	waitUntil {ADF_set_callSigns}; // wait until a call sign has been been applied > 140B05
	//_ADF_uGroup setGroupIdGlobal [ADF_uPreset select 1]; // 141B01
	
	if (ADF_debug) then {["PRESETS - Preset call signs applied",false] call ADF_fnc_log};

	if (ADF_mod_TFAR) then {
		ADF_TFAR_LR_freq = ADF_uPreset select 2; // 1.40B03
		ADF_TFAR_SW_freq = ADF_uPreset select 3; // 1.40B03
	};
};

// Initialize ACE3 BluForce Tracking (if activated)
if (ADF_mod_ACE3 && (ADF_microDAGR == "ACE_microDAGR")) then { //  140B06
	// insert Blueforce tracking init
	ace_map_BFT_Enabled = true;
	ace_map_BFT_markers = [];
	[ace_map_fnc_blueForceTrackingUpdate, 1, []] call CBA_fnc_addPerFrameHandler;	
	if (ADF_debug) then {["PRESETS - ACE3 BluForce Tracking initialized",false] call ADF_fnc_log};
};

///// Apply the Radio Frequencies

// Set the frequencies for TFAR
if (ADF_mod_TFAR && ADF_TFAR_preset && !isDedicated) then {
	waitUntil {time > 15 && ADF_missionInit}; // finish init, 15 secs in case of debug
	_ADF_TFAR_SW_radio = call TFAR_fnc_haveSWRadio;
	_ADF_TFAR_LR_radio = call TFAR_fnc_haveLRRadio;
	// Apply SW & LR frequencies
	if (_ADF_TFAR_SW_radio) then {[(call TFAR_fnc_activeSwRadio), 1, str ADF_TFAR_SW_freq] call TFAR_fnc_SetChannelFrequency};
	if (_ADF_TFAR_LR_radio) then {[(call TFAR_fnc_activeLrRadio), 1, str ADF_TFAR_LR_freq] call TFAR_fnc_SetChannelFrequency};
	if (ADF_debug) then {["RADIO - TFAR radios configured",false] call ADF_fnc_log};
	
	// Announce to player
	if (!_ADF_TFAR_LR_radio && _ADF_TFAR_SW_radio) then {systemChat format ["%1: %2, TFAR radio tuned in. SW: %3",ADF_clanTAG,name vehicle player,ADF_TFAR_SW_freq]};
	if (_ADF_TFAR_LR_radio && !_ADF_TFAR_SW_radio) then {systemChat format ["%1: %2, TFAR radio tuned in. LR: %3",ADF_clanTAG,name vehicle player,ADF_TFAR_LR_freq]};
	if (_ADF_TFAR_LR_radio && _ADF_TFAR_LR_radio) then {systemChat format ["%1: %2, TFAR radio's tuned in. SW: %3 | LR: %4",ADF_clanTAG,profileName,ADF_TFAR_SW_freq,ADF_TFAR_LR_freq]};
	if (!_ADF_TFAR_LR_radio && !_ADF_TFAR_SW_radio) then {systemChat format ["%1: %2, You do not carry a TFAR radio. No frequencies configured.",ADF_clanTAG,name vehicle player,ADF_TFAR_LR_freq]};
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
		_ADF_roster_uRole = " - " + roleDescription _x + " - (" + getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName") + ")"; // V1.41B01
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
if (player == leader (group player)) then {player groupChat format ["Our call sign is: %1",groupID (_ADF_uGroup)];};

if (ADF_debug) then {["INIT - Roster generated",false] call ADF_fnc_log};

waitUntil {ADF_set_roster && ADF_set_radios};
// Everything is set, lets destroy the variables, we don't need them anymore
ADF_roster_uArray = nil; ADF_roster_uName = nil;
ADF_roster_Intro = nil; ADF_roster_line = nil; ADF_roster_userGroup = nil; ADF_fnc_PresetSetGroupID = nil; // v1.40B03
ADF_preset_NOPRYL = nil; ADF_preset_DEFAULT = nil; ADF_preset_CUSTOM = nil; ADF_preset_WP = nil; ADF_presetData = nil; // dump Call sign arrays

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
<img width='375' height='375' shadow='false' image='Core\I\ADF_logo.paa'/><br/><br/>
<font size='14' color='#d7dbd5'>          ARMA Mission Development Framework</font><br/>
<font color='#9DA698'>                     ADF version: 1.41 / JULY 2015</font><br/><br/>
"]];