_ADF_h		= _this select 0; // grab the object's name
_ADF_g		= _this select 1; // grab brightness
_ADF_aPos	= _this select 2; // grab altitude offset from object

_ADF_dir	= getDir _ADF_h;
_ADF_hLoc 	= getPosASL _ADF_h; // get the location and alt.
_ADF_lLoc	= [0,0,0]; // set the light loc offset

 // create the floodlight
_ADF_fl = "Land_floodLight_F" createVehicleLocal _ADF_hloc;

for "_i" from 1 to 2 do { // exec twice do to SetDir bug
	_ADF_fl attachto [_ADF_h,[0,-0.2,_ADF_aPos]];
	_ADF_fl setVectorDirAndUp [[1,0,0],[0,-0.9,0]];
};

 // Create the light
_ADF_hLight = "#lightpoint" createVehicleLocal _ADF_lLoc;
_ADF_hLight setLightBrightness _ADF_g; // light config
_ADF_hLight setLightAmbient [0, 0, 0]; // light config
_ADF_hLight setLightColor [1.0, 1.0, 1.0]; // light config	
_ADF_hLight lightAttachObject [_ADF_fl, _ADF_lLoc]; // attach the light to the object
