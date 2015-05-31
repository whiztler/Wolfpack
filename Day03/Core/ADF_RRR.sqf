/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Reload/Rearm/Repair Script
Author: Xeno (Adapted for A3 by Whiztler)
Script version: 2.61

Game type: N/A
File: ADF_RRR.sqf
****************************************************************
Instructions:

Create a trigger, make it the size of the service area. Set it to
Activation Anybody Present
Repeat

For Helicopters:
Condition: ("Helicopter" countType thislist  > 0) && ((getpos (thislist select 0)) select 2 < 1)
On activation: _xhandle = [(thislist select 0)] execVM "Core\ADF_RRR.sqf";

For Airplanes:
Condition: (("Plane" countType thislist  > 0) || ("airplane" countType thislist  > 0) || ("airplanex" countType thislist  > 0)) && ((getpos (thislist select 0)) select 2 < 1) && (speed (thislist select 0) < 10)
On activation: _xhandle = [(thislist select 0)] execVM "Core\ADF_RRR.sqf";

For Vehicles:
Condition: ("LandVehicle" countType thislist  > 0) && ((getpos (thislist select 0)) select 2 < 1)
On activation: _xhandle = [(thislist select 0)] execVM "Core\ADF_RRR.sqf";
****************************************************************/

// Init
private [
			"_turretConfig","_turretCount","_i","_vehMag","_object","_vehType",
			"_vehType","_vehCat","_vehDriver","_objectDamage","_objectFuel",
			"_repairSleep","_reloadSleep","_refuelSleep","_maxTime","_serviceStartTime",
			"_serviceTime","_serviceTimeType"
		];

_object = _this select 0;
_vehType = typeof _object;
_vehName = getText(configFile >> "CfgVehicles" >> _vehType >> "displayName");


if (_object isKindOf "ParachuteBase") exitWith {};
if (!alive _object) exitWith {};

if ((_object isKindOf "Plane") || (_object isKindOf "Helicopter")) then {
	_vehDriver = "Pilot";
	_vehCat = "aircraft";
} else {
	_vehDriver = "Driver";
	_vehCat = "vehicle";
};

_repairSleep = ADF_FARP_repairTime / 25; // Configure in ADF_init_Config.sqf
_reloadSleep = ADF_FARP_reloadTime / 3; // Configure in ADF_init_Config.sqf
_refuelSleep = ADF_FARP_refuelTime / 60; // Configure in ADF_init_Config.sqf

_objectFuel = fuel _object;
_objectDamage = damage _object;
_object setFuel 0;
_maxTime = round ((ADF_FARP_repairTime + ADF_FARP_reloadTime + ADF_FARP_refuelTime + 30) / 60); // maximum time in MIN
_serviceStartTime = time;

_object vehicleChat format ["%1 F.A.R.P.", ADF_clanName];
_object vehicleChat format ["Servicing %1", _vehName];
_object vehicleChat format ["%1, please switch off your engine and remain in the %2", _vehDriver, _vehCat];
_object vehicleChat format ["F.A.R.P. Service can take up to %1 minutes.",_maxTime];

sleep 5;

// REARM
_vehMag = getArray (configFile >> "CfgVehicles" >> _vehType >> "magazines");

if (count _vehMag > 0) then {
	_vehMagDel = [];
	{
		if (!(_x in _vehMagDel)) then {
			_object removeMagazines _x;
			_vehMagDel = _vehMagDel + [_x];
		};
	} forEach _vehMag;
	{
		_object vehicleChat format ["Reloading %1", _x];
		sleep _reloadSleep;
		if (!alive _object) exitWith {};
		_object addMagazine _x;
	} forEach _vehMag;
};

_turretCount = count (configFile >> "CfgVehicles" >> _vehType >> "Turrets");

if (_turretCount > 0) then {
	for "_i" from 0 to (_turretCount - 1) do {
		scopeName "ADF_Reload";
		_turretConfig = (configFile >> "CfgVehicles" >> _vehType >> "Turrets") select _i;
		_vehMag = getArray(_turretConfig >> "magazines");
		_vehMagDel = [];
		{
			if (!(_x in _vehMagDel)) then {
				_object removeMagazines _x;
				_vehMagDel = _vehMagDel + [_x];
			};
		} forEach _vehMag;
		{
			_object vehicleChat format ["Reloading %1", _x];
			sleep _reloadSleep;
			if (!alive _object) then {breakOut "ADF_Reload"};
			_object addMagazine _x;
			sleep _reloadSleep;
			if (!alive _object) then {breakOut "ADF_Reload"};
		} forEach _vehMag;
		// check if the main turret has other turrets
		_turretCount_other = count (_turretConfig >> "Turrets");

		if (_turretCount_other > 0) then {
			for "_i" from 0 to (_turretCount_other - 1) do {
				_turretConfig2 = (_turretConfig >> "Turrets") select _i;
				_vehMag = getArray(_turretConfig2 >> "magazines");
				_vehMagDel = [];
				{
					if (!(_x in _vehMagDel)) then {
						_object removeMagazines _x;
						_vehMagDel = _vehMagDel + [_x];
					};
				} forEach _vehMag;
				{
					_object vehicleChat format ["Reloading %1", _x]; 
					sleep _reloadSleep;
					if (!alive _object) then {breakOut "ADF_Reload"};
					_object addMagazine _x;
					sleep _reloadSleep;
					if (!alive _object) then {breakOut "ADF_Reload"};
				} forEach _vehMag;
			};
		};
	};
};
_object setVehicleAmmo 1; // Reload all turrets
sleep 2;
_object vehicleChat format ["%1 is fully rearmed",_vehName];
sleep 2;

// REPAIR
if (!alive _object) exitWith {};
if (_objectDamage > 0) then {
	while {_objectDamage > 0 && alive _object} do {
		_object vehicleChat format ["Repairing %1",_vehName];
		sleep _repairSleep;
		_object setDamage (_objectDamage - 0.05);
		_objectDamage = damage _object;		
	};
	sleep 2;
	_object vehicleChat "Repairs completed";
	sleep 2;	
} else {
	_object vehicleChat "No repair services required.";
	if (!alive _object) exitWith {};
	sleep 2;
};

// REFUEL
if (!alive _object) exitWith {};
if (_objectFuel < 1) then {
	_object vehicleChat format ["Refuelling %1",_vehName];
	while {_objectFuel < 1 && alive _object} do {		
		_object setFuel (_objectFuel + 0.01);
		_objectFuel = fuel _object;
		sleep _refuelSleep;
	};
	sleep 2;
	_object vehicleChat format ["%1 is fully refuelled",_vehName];
	sleep 2;
} else {
	_object vehicleChat "No refuel services needed.";
	if (!alive _object) exitWith {};
	sleep 2;
};
if (!alive _object) exitWith {};

// SERVICE FINISHED
_serviceTime = round ((time - _serviceStartTime) / 60);
_serviceTimeType = "minutes";
_dayType = "day";
_dayTime = date select 3;
if (_dayTime < 12) then {_dayType = "day"};
if (_dayTime > 12) then {_dayType = "day"};
if (_dayTime > 18) then {_dayType = "evening"};
if ((time - _serviceStartTime) < 90) then {_serviceTime = 1;_serviceTimeType = "minute"};
_object vehicleChat format ["%1 was serviced in %2 %3. Enjoy your %4", _vehName,_serviceTime,_serviceTimeType,_dayType];