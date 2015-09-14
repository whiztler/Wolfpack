/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Distance calculator (player to object)
Author: Whiztler
Script version: 1.0

Game type: n/a
File: ADF_snipDistance.sqf
****************************************************************
Instructions:

Place a small object on the map and name it "obj" (without the ")

Create a trigger with the following params:
Axes A = 0
Axes B = 0
Type: none
Activation: Radio Charlie
Repeatedly
On Act.: null = execVM "Core\D\ADF_snipDistance.sqf";

In your init.sqf, add the following line:
3 setRadioMsg "Show Distance Object-Player"; // Debugging/MM only!

In game use 0-0-3 to check the distance to the object
****************************************************************/

if (isnil "obj") exitwith { // The object does not not exist. Display an error message
	Hint parseText format ["
	<t color='#FE2E2E' align='left' size='1.2'>Error!</t><br/><br/>
	<t color='#A1A4AD' align='left'>You need to place an object on the map and name it: </t><t color='#FFFFFF' align='left'>obj</t><br/><br/>
	<t color='#A1A4AD' align='left'>The script calculates the distance between you (player) and the object.</t>"];
};

nx = 2; nL = 4; // nr. of decimals to round off to

_objDisR = 0;
_objDis = player distance obj; // Check the distance in meters
if (_objDis > 1000) then {disVal = "kilometres"; _objDisR = round ((_objDis * (10 ^ nx)) / (10 ^ nx) / 1000);}; // Set to kilometres (rounded)
if (_objDis < 1000) then {disVal = "meters"; _objDisR = round (_objDis * (10 ^ nx)) / (10 ^ nx);}; // Meters (rounded)
if (_objDis < 1) then {disVal = "centimetres"; _objDisR = round (_objDis * 100);}; // Centimtres (rounded)

_objDir = [player, obj] call BIS_fnc_relativeDirTo; // Check the direction of the object relative to the player
if (_objDir < 0) then {_objDir = (360 + _objDir);};
if (_objDir > 360) then {_objDir = (_objDir - 360);};
_objDir = round _objDir;
_objLat = round (((getPos obj select 0) * (10 ^ nL)) / (100 ^ nL) * 100); // Latitude of the object (rounded)
_objLon = round (((getPos obj select 1) * (10 ^ nL)) / (100 ^ nL) * 100); // Longitude of the object (rounded)
_objAlt = round ((getPosASL obj select 2) * (10 ^ nx)) / (10 ^ nx); // ASL altitude of the object (rounded)

// Create the hint with all the data:
HintSilent parseText format["
<t size='1.2' color='#ffffff' align='left'>Distance Calculator</t><br/><br/>
<t color='#A1A4AD' align='left'>You are </t><t align='left' color='#F7D358'>%1</t><t color='#A1A4AD' align='left'> %2 away from the object.</t><br/><br/>
<t color='#A1A4AD' align='left'>The object is at </t><t align='left' color='#F7D358'>%3</t><t color='#A1A4AD' align='left'> degrees, relative from your current position</t><br/><br/>
<t color='#A1A4AD' align='left'>The object is located at grid: <t align='left' color='#F7D358'>%4 %5 </t>and is <t align='left' color='#F7D358'>%6 </t>meter(s) above sea level.</t>
",_objDisR, disVal, _objDir, _objLat, _objLon, _objAlt];