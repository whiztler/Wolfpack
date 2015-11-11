/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Crew check. Check if Pilot or MBT/APC crew
Author: Whiztler
Script version: 1.05

Game type: N/A
File: ADF_fnc_crewCheck.sqf
****************************************************************
Instructions:

Configure in 'Core\ADF_crewCheck.sqf'
****************************************************************/

// Do not edit!!

ADF_CC_addEH = {
	(_this select 0) addEventHandler ["GetIn", {
		
		// init
		private ["_ADF_CC_uID","_ADF_CC_airRestrict","_ADF_CC_objectType","_ADF_CC_objectName","_ADF_CC_msg"];
		params ["_ADF_CC_object","_ADF_CC_objectPos","_ADF_CC_unit","_ADF_CC_turretPath"];
		_ADF_CC_airRestrict 	= true;
		_ADF_CC_uID			= owner _ADF_CC_unit;
		_ADF_CC_objectType	= typeOf _ADF_CC_object;
		_ADF_CC_objectName 	= getText(configFile >> "CfgVehicles" >> _ADF_CC_objectType >> "displayName");
		ADF_CC_msg = [_ADF_CC_unit, _ADF_CC_objectName];
		
		if ((typeOf player) in ADF_CC_airJetPilotArray) then {ADF_CC_role_JetPilot = true} else {ADF_CC_role_JetPilot = false};
		if ((typeOf player) in ADF_CC_airHeliPilotArray) then {ADF_CC_role_heliPilot = true} else {ADF_CC_role_heliPilot = false};
		if ((typeOf player) in ADF_CC_airHeliCrewArray) then {ADF_CC_role_heliCrew = true} else {ADF_CC_role_heliCrew = false};
		if ((typeOf player) in ADF_CC_cavCrewArray) then {ADF_CC_role_cavCrew = true} else {ADF_CC_role_cavCrew = false};		
		
		// Check vehicle and role player
		if ((_ADF_CC_object isKindOf "Land") && ADF_CC_role_cavCrew) exitWith {}; // Player is authorized to use the APC/MBT vehicle
		
		if (_ADF_CC_object isKindOf "Land") then { // APC/MBT	
			
			if (	(_ADF_CC_objectPos == "driver") || (_ADF_CC_objectPos == "gunner") || (_ADF_CC_objectPos == "commander")) then { // unauthorized access of driver/gunner/Cmd
				ADF_CC_vehicle engineOn false; unassignVehicle _ADF_CC_unit; _ADF_CC_unit action ["Eject", _ADF_CC_object];				
				_ADF_CC_uID publicVariableClient "ADF_CC_msg";				
			} else {	_ADF_CC_unit spawn ADF_CC_checkVehiclePos;}; // player entered cargo position. Start check vehicle position loop
			
		} else { // Aircraft, let's check type and role of player	
			
			// Check if the player role is authorized to operate the aircraft
			if (_ADF_CC_object isKindOf "Helicopter") then {
				if (((_ADF_CC_objectPos == "driver") || (_ADF_CC_objectPos == "gunner")) && ADF_CC_role_heliPilot) then {_ADF_CC_airRestrict = false};
				if ((_ADF_CC_objectPos == "gunner") && ADF_CC_role_heliCrew) then {_ADF_CC_airRestrict = false};
			};
			if (_ADF_CC_object isKindOf "Plane") then {
				if (((_ADF_CC_objectPos == "driver") || (_ADF_CC_objectPos == "gunner")) && ADF_CC_role_JetPilot) then {_ADF_CC_airRestrict = false};
			};			
			if (!_ADF_CC_airRestrict) exitWith {}; // Player is authorized to use the aircraft

			if ((_ADF_CC_objectPos == "driver") || (_ADF_CC_objectPos == "gunner")) then { // unauthorized access of driver/gunner
				ADF_CC_vehicle engineOn false; unassignVehicle _ADF_CC_unit; _ADF_CC_unit action ["getOut", _ADF_CC_object];
				_ADF_CC_uID publicVariableClient "ADF_CC_msg";
			} else {	_ADF_CC_unit spawn ADF_CC_checkVehiclePos;};  // player entered cargo position. Start check vehicle position loop
			
		}; // close else
	}]; // close EH
}; // close function

ADF_CC_checkTurret = {
	private ["_ADF_CC_unitCargo","_ADF_CC_allTurrets","_ADF_CC_unitTurret"];
	params ["_ADF_CC_unit","_ADF_CC_object"];
	_ADF_CC_inTurret 		= !isNull (_ADF_CC_object turretUnit ((allTurrets [_ADF_CC_object, false]) select 0));
	_ADF_CC_unitCmd		= commander _ADF_CC_object == _ADF_CC_unit;
	_ADF_CC_TurretActive	= _ADF_CC_inTurret || _ADF_CC_unitCmd;
	_ADF_CC_TurretActive
};

ADF_CC_checkDriver = {
	private ["_ADF_CC_unitDriver"];
	params ["_ADF_CC_unit","_ADF_CC_object"];
	_ADF_CC_unitDriver	= (driver _ADF_CC_object == _ADF_CC_unit);
	_ADF_CC_unitDriver
};

ADF_CC_checkCargo = {
	private ["_ADF_CC_allTurretsFFV"];
	params ["_ADF_CC_object"];
	_ADF_CC_allTurretsFFV	= allTurrets [_ADF_CC_object, true]
};

ADF_CC_checkVehiclePos = {
	// Player is in cargo, Check if player switches seats to driver/gunner/commander

	private ["_ADF_CC_unit","_ADF_CC_object","_ADF_CC_objectName","_ADF_CC_SwitchedToTurret","_ADF_CC_SwitchedToDriver","_ADF_CC_msg","_ADF_CC_cargoIdx","_ADF_CC_uID"];
	_ADF_CC_unit 		= _this;
	_ADF_CC_uID			= owner _ADF_CC_unit;
	_ADF_CC_object 		= vehicle _ADF_CC_unit;
	_ADF_CC_objectName 	= getText(configFile >> "CfgVehicles" >> (typeOf _ADF_CC_object) >> "displayName");
	ADF_CC_msg 			= [_ADF_CC_unit, _ADF_CC_objectName];
	_ADF_CC_cargoIdx		= _ADF_CC_object getCargoIndex _ADF_CC_unit; // Store the cargo seat of the unit
	
	// Start a loop that checks if the player changes from cargo to a crew position
	while {alive _ADF_CC_unit && ((vehicle _ADF_CC_unit) == _ADF_CC_object)} do { // check every 2 seconds
		
		_ADF_CC_SwitchedToTurret	= [_ADF_CC_unit,_ADF_CC_object] call ADF_CC_checkTurret;
		_ADF_CC_SwitchedToDriver	= [_ADF_CC_unit,_ADF_CC_object] call ADF_CC_checkDriver;		

		if (	(alive _ADF_CC_unit) && ((vehicle _ADF_CC_unit) == _ADF_CC_object) && (_ADF_CC_SwitchedToTurret || _ADF_CC_SwitchedToDriver)) then {
	
			if ((speed _ADF_CC_object) > 10) then { // Vehicle/Aircraft is moving
				_ADF_CC_unit action ["moveToCargo", _ADF_CC_object, _ADF_CC_cargoIdx];		
			} else { // Vehicle/Aircraft is stationary ( < 15 Km/hr)
				if (driver _ADF_CC_object == _ADF_CC_unit) then {_ADF_CC_object engineOn false;};
				unassignVehicle _ADF_CC_unit;
				_ADF_CC_unit action ["getOut", _ADF_CC_object];
			};
			
			_ADF_CC_uID publicVariableClient "ADF_CC_msg";			
		};
		sleep 2;
	}; // close loop
}; // close ADF_CC_checkVehiclePos