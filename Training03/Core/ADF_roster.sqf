/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Deployement Roster. Based on Team Roster by Crackman
Author: Whiztler
Script version: 1.4

Game type: n/a
File: ADF_Roster.sqf
****************************************************************/

#include "ADF_JIP.sqf"

if(isDedicated) exitWith {}; // clients only

// Init
private["_ADF_uRole","_ADF_uGroup","_ADF_strColorGrp","_ADF_strFinal","_ADF_gOld","_ADF_gNew","_ADF_gID","_ADF_uArray","_ADF_TFAR_SW_freq","_ADF_TFAR_LR_freq"];
_ADF_uName = "";
_ADF_uRole = "";
_ADF_uGroup = "";
_ADF_uArray =[];
_ADF_gOld	= grpNull;
_ADF_gNew	= grpNull;
_ADF_LR_freq = 0;
_ADF_SW_freq = 0;
_ADF_rosterLine = "";
_ADF_rosterIntro = "";
_ADF_rosterPub = "";

// Create the Roster Subject
player createDiarySubject ["Deployment Roster",ADF_clanName + " Roster"];

// Units araay
if(isMultiplayer) then {_ADF_uArray = playableUnits;} else {_ADF_uArray = switchableUnits};

// Roster create loop
{
	if (side _x == side player) then {
		_ADF_gNew = group _x;
		_ADF_gID = groupID _ADF_gNew;
		
		_ADF_TFAR_SW_freq = 0;
		_ADF_TFAR_LR_freq = 0;
		
		if (ADF_mod_TFAR && ADF_TFAR_preset) then {
			#include "ADF_TFAR-Freq.sqf"
		};
	
		_ADF_uGroup = "";
		_ADF_uRole = " - " + getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName");
		
		if (ADF_mod_TFAR) then {
			if (_ADF_gNew != _ADF_gOld) then {
				_ADF_uGroup = format ["<br/><font size='16' color='#D7DBD5'>%1</font>  <font color='#9DA698'>[</font><font color='#FF9E05'>%2</font><font color='#9DA698'>][</font><font color='#10D471'>%3</font><font color='#9DA698'>]<br/>",_ADF_gID, _ADF_TFAR_LR_freq, _ADF_TFAR_SW_freq];
			}
		} else {
			if (_ADF_gNew != _ADF_gOld) then {
				_ADF_uGroup = format ["<br/><font size='16' color='#D7DBD5'>%1</font><br/>",_ADF_gID];
			}
		};
		
		if (name _x == name player) then {
			_ADF_uName = "<font color='#EFCA35'>" + name _x + "<font color='#9DA698'>";
		} else {
			_ADF_uName = "<font color='#9DA698'>" + name _x;
		};
		_ADF_rosterLine =  _ADF_rosterLine + _ADF_uGroup + _ADF_uName + _ADF_uRole + "</font><br/>";
		_ADF_gOld = group _x;
	};
} forEach _ADF_uArray;

if (ADF_TFAR_preset && ADF_mod_TFAR) then {
	_ADF_rosterIntro = "<br/><br/><font size='18'>" + ADF_clanName + "</font><br/><font size='16'>Deployment Roster</font><br/><br/><font size='14' color='#d7dbd5'>Radio Frequencies</font><br/><font color='#FF9E05'>ORANGE</font><font color='#9DA698'> = team's/group's Long Range radio frequency.<br/><font color='#10D471'>GREEN</font><font color='#9DA698'> = group's Short Wave radio frequency.</font><br/><br/>";
} else {
	_ADF_rosterIntro = "<br/><br/><font size='18'>" + ADF_clanName + "</font><br/><font size='16'>Deployment Roster</font><br/><br/>"
};

_ADF_rosterPub = _ADF_rosterIntro + _ADF_rosterLine; // Roster publish

player createDiaryRecord ["Deployment Roster",["Deployment Roster",_ADF_rosterPub]];	

// ADF
player createDiarySubject ["ADF","ADF"];
player createDiaryRecord ["ADF",["ARMA Mission Development Framework","
<br/><img image='Img\clan_logo_ADF.paa'/><br/><br/>
<br/><br/>-----------------------------------------------------------------
<br/><br/>ARMA Mission Development Framework<br/>
ADF version: 1.38 / MAR 2015
<br/><br/>
"]];