/*
	File: fn_updateViewDistance.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {
		setViewDistance tawvd_foot;
		tawvd_dist = tawvd_foot;
	};
	case ((vehicle player) isKindOf "LandVehicle"): {
		setViewDistance tawvd_car;
		tawvd_dist = tawvd_car;
	};
	case ((vehicle player) isKindOf "Air"): {
		setViewDistance tawvd_air;
		tawvd_dist = tawvd_air;
	};
};

if(tawvd_syncObject) then {
	setObjectViewDistance [tawvd_dist,100];
	tawvd_object = tawvd_dist;
};