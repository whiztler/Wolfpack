/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Message parser/log
Author: Whiztler
Script version: 1.02 WP

Game type: n/a
File: ADF_messageParser.sqf
****************************************************************
This script will create and log hint messages based on the caller.
Config the logbook in ADF_fnc_MessageLog (_ADF_logName).
Config the callers in ADF_fnc_MessageParser (if (_ADF_caller == "ACO")).

Use with:
[	"2S",		// caller ID	
	"Name",		// caller Name 
	"Message"		// Message
] call ADF_fnc_MessageParser;

e.g.: ["2S","Name","Message"] call ADF_fnc_MessageParser; sleep 10;
or: : ["ACO","ACO","Message"] call ADF_fnc_MessageParser; sleep 10;
Script is WIP. For now only simple messages (without complex formatting)
****************************************************************/

ADF_fnc_MessageLog = {
	// init
	params ["_ADF_callerName","_ADF_msg"];
	private ["_ADF_logName","_logTime","_logTimeText"];
	
	// Which log?
	_ADF_logName = "Wolfpack Log";

	// Create the logbook entry
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord [_ADF_logName, [_logTimeText,"<br/><br/><font color='#9da698' size='14'>From: " +_ADF_callerName+ "</font><br/><font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/><font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/><font color='#6C7169'>" +_ADF_msg+ "</font><br/><br/>"]];
	false
};

ADF_fnc_MessageParser = {
	if (!hasInterface) exitWith {};
	
	// Init
	params ["_ADF_caller","_ADF_callerName","_ADF_msg"];

	// Caller is player unit? exit (no log)
	if (_ADF_caller == "WOLF") exitWith {playSound "radioTransmit"; hintSilent parseText format ["<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1<br/><br/></t>",_ADF_msg];true};
	
	// Crete the hint message base on the caller and call the log function
	if (_ADF_caller == "TOC") exitWith {playSound "radioTransmit"; hintSilent parseText format ["<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1<br/><br/></t>",_ADF_msg]; [_ADF_callerName,_ADF_msg] call ADF_fnc_MessageLog;};
	if (_ADF_caller == "SOAR") exitWith {playSound "radioTransmit"; hintSilent parseText format ["<img size= '5' shadow='false' image='Img\soar_logo.paa'/><br/><br/><t color='#6C7169' align='left'>%1<br/><br/></t>",_ADF_msg]; [_ADF_callerName,_ADF_msg] call ADF_fnc_MessageLog;};
	if (_ADF_caller == "NONE") exitWith {playSound "radioTransmit"; hintSilent parseText format ["<br/><br/><t color='#6C7169' align='left'>%1<br/><br/></t>",_ADF_msg]; [_ADF_callerName,_ADF_msg] call ADF_fnc_MessageLog;};
};