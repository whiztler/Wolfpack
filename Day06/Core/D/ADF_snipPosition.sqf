/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Show player position (Lat, Lon, Alt ASL & ATL
Author: Whiztler
Script version: 1.1

Game type: n/a
File: ADF_ShowPosition.sqf
****************************************************************
Instructions:

Create a trigger with the following params:
Axes A = 0
Axes B = 0
Type: none
Activation: Radio Bravo
Repeatedly
On Act.: null = execVM "Core\D\ADF_ShowPosition.sqf";

In your init.sqf, add the following line:
2 setRadioMsg "Show Position (LAT/LONG/ALT)"; // Debugging/MM only!

In game use 0-0-2 to check your position
****************************************************************/

_ADF_unit = player;
n = 2; // nr. of decimals with altitude

_ADF_posLat = getPos _ADF_unit select 0;
_ADF_posLon = getPos _ADF_unit select 1;
_ADF_posAltASL = getPosASL _ADF_unit select 2;
_ADF_posAltASL = round (_ADF_posAltASL * (10 ^ n)) / (10 ^ n);
_ADF_posAltATL = getPosATL _ADF_unit select 2;
_ADF_posAltATL = round (_ADF_posAltATL * (10 ^ n)) / (10 ^ n);

HintSilent parseText format["
<t size='1.2' color='#ffffff' align='left'>My current position</t><br/><br/>
<t color='#A1A4AD' align='left'>Latitude: </t><t align='left' color='#F7D358'>%1</t><br/>
<t color='#A1A4AD' align='left'>Longitude: </t><t align='left' color='#F7D358'>%2</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>My current altitude:</t><br/><br/>
<t color='#A1A4AD' align='left'>Above Sea Level (ASL): </t><t align='left' color='#F7D358'>%3</t><br/>
<t color='#A1A4AD' align='left'>Above Ground Level (ATL): </t><t align='left' color='#F7D358'>%4</t><br/><br/>
<t color='#A1A4AD' align='left'>Above data has been copied to your clipboard</t><br/>"
, _ADF_posLat, _ADF_posLon, _ADF_posAltASL, _ADF_posAltATL];

_ADF_cc = format ["
Position: %1,%2 {lat,lon)
Altitude: %3 (above sea level)
Altitude: %4 (above terrain level)
", _ADF_posLat, _ADF_posLon, _ADF_posAltASL, _ADF_posAltATL];

copyToClipboard _ADF_cc;