/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Delete vehicle & crew
Author: Whiztler
Script version: 1.00

Game type: N/A
File: ADF_fnc_deleteVehicle.sqf
****************************************************************
Usage:

[veh1, veh2, veh3] call ADF_fnc_DeleteVehicle

Where veh1, veh2, etc are te vehicles you wish to remove. It removes
both the vehicle and the crew. The crew is automatically removed
once the group has 0 members (after deleting the crew).

***************************************************************/

// Functions init
diag_log "ADF RPT: Init - executing ADF_fnc_deleteVehicle.sqf"; // Reporting. Do NOT edit/remove

ADF_fnc_DeleteVehicle = {
	params ["_v"];
	{
		{deleteVehicle _x} forEach crew (vehicle _x) + [(vehicle _x)];
	} forEach _v;
	true
};

