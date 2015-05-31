/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Set view distance for Air Crew
Author: Whiztler
Script version: 1.6

Game type: Coop
File: ADF_setVD.sqf
****************************************************************
Instructions:

This script is executed from the init.sqf and automatically
sets the view distance for air crew and cavalry crew:
Rotor wing crew: 3500 meters
Fixed Wing crew: 5000 meters
Cavalry crew: 2500 meters 

This function runs after 95 secs. after the mission has initialized
****************************************************************/
#include "ADF_JIP.sqf"

if(!isMultiplayer) exitWith {
	waitUntil {time > 95};	
	_unit = player;

	_chk = toLower str (vehicle _unit); _chk = toArray _chk; _chk resize 4;
	if ((toString _chk != "opc_") && (toString _chk != "fox_") && (toString _chk != "wolf") && (toString _chk != "mdev") && 
		(toString _chk != "knig") && (toString _chk != "rapt") && (toString _chk != "grem")
	) exitWith {}; // Undefined unit > exit
	
	// Split the player variable into Squad, Unit, Role
	_uStr = str _unit;
	_u = [_uStr, "_"] call CBA_fnc_split;
	_s = toLower (_u select 0);
	_t = _u select 1;
	_r = toLower (_u select 2);					
		
	// Helicopter Pilot / Gunner / Observer
	if ((_r == "rwp") || (_r == "rwg") || (_r == "rwo")) exitWith {
		setViewDistance 3500;
		hintSilent "ROTOR WING CREW\n\nView distance set to 3500";
	};

	// Fixed Wing Pilot / Gunner
	if ((_r == "fwp") || (_r == "fwg")) exitWith {
		setViewDistance 5000;
		hintSilent "FIXED WING CREW\n\nView distance set to 5000";
	};
	
	// Cavalry Crew
	if (_s == "knight") exitWith {
		setViewDistance 2500;
		hintSilent "CAVALRY CREW\n\nView distance set to 2500";
	};
	
	// Angel
	if (_r == "jtc") exitWith {
		setViewDistance 3000;
		hintSilent "JTAC CREW\n\nView distance set to 3000";
	};
	
	// Prophet
	if ((_s == "wolf") && ((_r == "sn") || (_r == "sp"))) exitWith {
		setViewDistance 2500;
		hintSilent "PROPHET TEAM\n\nView distance set to 2500";
	};
	
	// Instructor/Mission Developer/Observer/Press
	if (_s == "mdev") exitWith {
		setViewDistance 8000;
		hintSilent "Instructor/Special Purpose Role\n\nView distance set to 8000";
	};
};