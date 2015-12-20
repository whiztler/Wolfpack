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

// Init & randomize the intel location
private "_deskRandom";
_deskRandom = [desk2,desk3,desk4,desk5,desk6]  call BIS_fnc_selectRandom;
LaptopObj setVectorup [0,0,0.1];
LaptopObj setPos (getPos _deskRandom);
LaptopObj attachTo [_deskRandom, [0,0,0.6]];
tIntel setPos (getPos _deskRandom);
tIntel setDir (getDir _deskRandom);
tIntelSet = true; publicVariable "tIntelSet";

ADF_msg_Chelonisi = {
	if (!isNil "tChelonisi") then {deleteVehicle tChelonisi};
	sleep 300;
	deleteMarker "mRV";
};

ADF_fnc_intelInit = {
	params ["_snooze1","_snooze2","_snooze3"];
	_snooze1 = [90,100,110,120,130,140,150] call BIS_fnc_selectRandom;
	_snooze2 = [180,190,200,210,220,230,240] call BIS_fnc_selectRandom;
	_snooze3 = ((random 90) + (random 90));
	[_snooze1,_snooze2,_snooze3] remoteExec ["ADF_msg_intel",0,false];
};

ADF_msg_intel = {
	params ["_snooze1","_snooze2","_snooze3"];
	ADF_endMission = true;
	if (MotsActive) then {sleep 10} else {sleep _snooze1 + 55};
	
	{deleteMarker _x} forEach ["mExfil","mObj1","mObj2","mObj3","mObj4","mObj5","mObj_e"];

	if !(isNil "vWolf_1") then {deleteVehicle vWolf_1;};
	if !(isNil "vWolf_2") then {deleteVehicle vWolf_2;};
	if !(isNil "vWolf_3") then {deleteVehicle vWolf_3;};
	if !(isNil "vWolf_4") then {deleteVehicle vWolf_4;};
	
	if (MotsActive) then {sleep 10} else {sleep _snooze2 + _snooze3 + 35};
	
	_m = createMarker ["mWasp",getMarkerPos "mWaspTmp"];
	_m setMarkerSize [.7,.7];
	_m setMarkerShape "ICON";
	_m setMarkerType "c_ship";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "USS WASP";	
};