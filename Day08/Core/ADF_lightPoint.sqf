/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Ambient lights
Author: Whiztler
Script version: 1.2

Game type: n/a
File: ADF_lightPoint.sqf
****************************************************************
Create lightpoint to light up objects (inside/outside)

Instructions:

Place an object or game logic on the map and put the following in the init:
null = [this,0.2,0] execVM "Core\ADF_lightPoint.sqf";

this 	= defines the object that needs the light source. Do not change
0.2		= light brightness. 0.2 for dim light and 1.0 for very bright light
0		= Altitude light position offset from the object

****************************************************************/

// Init
params [
	"_ADF_h",	// grab the object's name
	"_ADF_b",	// grab brightness
	"_ADF_zPos"	// grab altitude
];
_ADF_hLoc 	= getPosASL _ADF_h; // get the location and alt.
_ADF_lLoc	= [0,0,_ADF_zPos]; // set the light loc offset

_ADF_hLight = "#lightpoint" createVehicleLocal _ADF_hLoc; // Create the light
_ADF_hLight setLightBrightness _ADF_b; // light config
_ADF_hLight setLightAmbient [1.0, 1.0, 0.5]; // light config
_ADF_hLight setLightColor [1.0, 1.0, 1.0]; // light config	
_ADF_hLight setLightUseFlare true; // light config	
_ADF_hLight lightAttachObject [_ADF_h, _ADF_lLoc]; // attach the light to the object
_ADF_hLight setPos [getPos _ADF_hLight select 0, getPos _ADF_hLight select 1,_ADF_zPos];
