diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

[wolfCrate] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf";
[wolfCrateDemo] execVM "Core\C\ADF_cCargo_B_Demo.sqf";

// Gen Tehrani random pos
private "_TehraniPos";
_TehraniPos = [desk1,desk2,desk3,desk4,desk5] call BIS_fnc_selectRandom;
Tehrani setPos (_TehraniPos modelToWorld [1,1,0]);
Tehrani addEventHandler ["killed", {remoteExec ["ADF_fnc_exfil",0,false];}];

if (ADF_debug) then {
	private "_m";
	_m = createMarker ["mTehraniPos", getPos Tehrani]; // setup the marker			
	_m setMarkerShape "ICON";	
	_m setMarkerType "mil_objective";
	_m setMarkerColor "ColorGreen";
};

ADF_fnc_exfil = {
	deleteMarker "mRV";
	deleteMarker "mBrief0";

	wpExfil = true;
	
	private "_m";
	_m = createMarker ["mReagan",getMarkerPos "mExfil"];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_pickup";
	_m setMarkerSize [.7,.7];
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "USS RONALD REAGAN";
	
	hEvac lock 0;
	
	waitUntil {sleep 1; wpEnd};
	
	{_x setCaptive true; _x allowDamage false} forEach allPlayers;
	hEvac allowDamage false;
};