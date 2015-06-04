/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Hangar lights
Author: Whiztler
Script version: 1.0

Game type: n/a
File: ADF_hangarLights.sqf
****************************************************************
Create lightpoint inside Hangar.

Instructions:

Place a Hangar on the map and put the following in the init:
null = [this] execVM "Core\ADF_hangarLights.sqf";
****************************************************************/

Private ["_h","_hLoc","_lLoc","_hLight"];

_h		= _this select 0; // grab the hangar's name
_hLoc 	= getPosASL _h; // get the hangar's location and alt.
_lLoc	= [0, 0, 0]; // set the light loc offset
_hLight = "#lightpoint" createVehicleLocal _hLoc; // Create the light
_hLight setLightBrightness 0.6; // light config
_hLight setLightAmbient [1.0, 1.0, 0.5]; // light config
_hLight setLightColor [1.0, 1.0, 1.0]; // light config
_hLight lightAttachObject [_h, _lLoc]; // attach the ligh to the hangar
_hLight setPos [getPos _h select 0, getPos _h select 1, 4.5];


