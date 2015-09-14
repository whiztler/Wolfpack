/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Crew check. Check if Pilot or MBT/APC crew
Author: Whiztler
Script version: 1.00

Game type: N/A
File: ADF_crewCheck.sqf
****************************************************************
Instructions:

Configure in ADF_init_config.sqf to enable/disable crew check.

Below you can configure the classnames for:
- crew allowed to operate aircraft/helicopters.
- crew allowed to operate MBT's and APC's.
- Which aircraft vehicles have crew check restrictions.
- Which armoured vehicles have crew check restrictions.
- Whitelisted vehicles (by name given in the editor or script)

To un-restrict classes simply comment them out (//)

RHS classes can be added/edited in: Core\ADF_crewCheck_RHS/sqf
****************************************************************/

if (hasInterface) then { // Do NOT edit/remove
	"ADF_CC_msg" addPublicVariableEventHandler {
		private ["_ADF_CC_unitMsg"];
		params ["_ADF_CC_unit","_ADF_CC_objectName"];
		_ADF_CC_unitMsg = format ["%1, you cannot operate a %2.", name vehicle player,_ADF_CC_objectName];
		["ADF_noticeMsg",[_ADF_CC_unitMsg]] call BIS_fnc_showNotification;
	};
};

if (!isServer) exitWith {}; // Do NOT edit/remove

diag_log "ADF RPT: Init - executing ADF_crewCheck.sqf"; // Reporting. Do NOT edit/remove

// Enter the CLASSNAMES of units that are ALLOWED to operate (jet) aircraft
ADF_CC_airJetPilotArray 	= [
	"I_Pilot_F",
	"O_Pilot_F",
	"B_Pilot_F"			// never place a comma after the last entry!!!
];

// Enter the CLASSNAMES of units that are ALLOWED to operate a helicopter as a pilot
ADF_CC_airHeliPilotArray 	= [
	"I_helipilot_F",
	"O_helipilot_F",		
	"B_Helipilot_F"		// never place a comma after the last entry!!!
];

// Enter the CLASSNAMES of units that are ALLOWED to helicopter as crew (e.g. board gunner on the Heron)
ADF_CC_airHeliCrewArray 	= [
	"I_helicrew_F",
	"O_helicrew_F",
	"B_helicrew_F"		// never place a comma after the last entry!!!
];

// Enter the CLASSNAMES of units that are ALLOWED to operate armoured vehicles (MBT's and APC's)
ADF_CC_cavCrewArray		= [
	"I_crew_F",
	"O_crew_F",
	"B_crew_F"			// never place a comma after the last entry!!!
];

// Enter the CLASSNAMES of aircraft/helicopters that crew check applies to
ADF_CC_airVeh_Restric	= [
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_unarmed_F",
	"O_Heli_Light_02_v2_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Attack_02_black_F",
	"O_Plane_CAS_02_F",
	"O_Heli_Transport_04_F",
	"O_Heli_Transport_04_ammo_F",
	"O_Heli_Transport_04_bench_F",
	"O_Heli_Transport_04_box_F",
	"O_Heli_Transport_04_covered_F",
	"O_Heli_Transport_04_fuel_F",
	"O_Heli_Transport_04_medevac_F",
	"O_Heli_Transport_04_repair_F",
	"O_Heli_Transport_04_black_F",
	"O_Heli_Transport_04_ammo_black_F",
	"O_Heli_Transport_04_bench_black_F",
	"O_Heli_Transport_04_box_black_F",
	"O_Heli_Transport_04_covered_black_F",
	"O_Heli_Transport_04_fuel_black_F",
	"O_Heli_Transport_04_medevac_black_F",
	"O_Heli_Transport_04_repair_black_F",
	"I_Heli_Transport_02_F",
	"I_Heli_light_03_F",
	"I_Heli_light_03_unarmed_F",
	"I_Plane_Fighter_03_CAS_F",
	"I_Plane_Fighter_03_AA_F",
	"B_Heli_Light_01_F",
	"B_Heli_Light_01_armed_F",
	"B_Heli_Light_01_stripped_F",
	"B_Heli_Attack_01_F",
	"B_Heli_Transport_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_03_F",
	"B_Heli_Transport_03_unarmed_F",
	"B_Heli_Transport_03_black_F",
	"B_Heli_Transport_03_unarmed_green_F",
	"B_Plane_CAS_01_F" 	// never place a comma after the last entry!!!
];

// Enter the CLASSNAMES of armoured vehicles that crew check applies to
ADF_CC_armVeh_Restric	= [
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_MBT_02_cannon_F",
	"O_MBT_02_arty_F",
	"O_APC_Wheeled_02_rcws_F",
	"I_APC_tracked_03_cannon_F",
	"I_MBT_03_cannon_F",
	"I_APC_Wheeled_03_cannon_F",
	"B_APC_Tracked_01_rcws_F",
	"B_APC_Wheeled_01_cannon_F",
	"B_MBT_01_TUSK_F",
	"B_MBT_01_cannon_F",
	"B_APC_Tracked_01_AA_F",
	"B_MBT_01_arty_F","B_MBT_01_mlrs_F" 	// never place a comma after the last entry!!!
];

// Enter the names (editor name) of vehicles that are white listed (both Air, Armored)
ADF_CC_WhiteListed = [
	//NameVehicle								// never place a comma after the last entry!!!						
];

/***********************************   DO NOT EDIT BELOW THIS LINE!   **********************************/

// If Red Hammer Studios Escalation is active, include the RHS vehicle/aircraft/crew classes
if (ADF_mod_RHS) then { 
	#include "ADF_crewCheck_RHS.sqf"
};

params ["_ADF_crewCheck_Pilots","_ADF_crewCheck_Armoured"];
ADF_CC_AirVehArray	= [];
ADF_CC_ArmVehArray	= [];


call compile preprocessFileLineNumbers "Core\F\ADF_fnc_crewCheck.sqf";

///// Populate the arrays with vehicles already on available in-game and attached the EH for each vehicle/aircraft

if (_ADF_crewCheck_Armoured) then { // APC's/MBT's
	{
		if (((typeOf _x) in ADF_CC_armVeh_Restric) && !(_x in ADF_CC_WhiteListed)) then {
			ADF_CC_ArmVehArray pushBack _x;
		};
	} forEach vehicles;
	{[_x] call ADF_CC_addEH;} forEach ADF_CC_ArmVehArray;
	ADF_CC_ArmVehArray = nil; // destroy the array once all vehicles have an EH attached
};

if (_ADF_crewCheck_Pilots) then { // Aircraft
	{
		if (((typeOf _x) in ADF_CC_airVeh_Restric) && !(_x in ADF_CC_WhiteListed)) then {
			ADF_CC_AirVehArray pushBack _x;
		};	
	} forEach vehicles;
	{[_x] call ADF_CC_addEH;} forEach ADF_CC_AirVehArray;
	ADF_CC_AirVehArray = nil; // destroy the array once all aircraft have an EH attached
};

_radioGAGA = radioChannelCreate [[1, 00, 0, 0.8], "Notification", "Unauthorized Access", [player]];
