/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Teleport to group leader script
Author: Whiztler
Script version: 1.02

Game type: N/A
File: ADF_teleportToLeader.sqf
****************************************************************
Instructions:

Place an object (flag pole, vehicle, etc.) and add the following
to the init field:
this addAction ["<t align='left' color='#E4F2AA'>Teleport to Troop Leader</t>", "Core\ADF_teleportToLeader.sqf",[],5,true,false,"",""]; this allowDamage false;

****************************************************************/

// Init
params ["_pole","_ADF_unit"];
_ADF_unitName			= name _ADF_unit;
_ADF_unitLeader		= leader (group _ADF_unit);
_ADF_unitLeaderPos	= getPosATL _ADF_unitLeader;
_ADF_unitLeaderDir	= getDirVisual _ADF_unitLeader;
_ADF_unitLeaderName	= name _ADF_unitLeader;

// Check if the unit is the leader of the group (cannot teleport to itself).
if (_ADF_unit == leader (group _ADF_unit)) exitWith {hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left'>%1, it appears that you are the leader of your unit.</t><br/><br/><t color='#6C7169' align='left'>You cannot teleport to yourself.</t><br/><br/>",_ADF_unitName];};
// Check if the leader of the unit is alive. If not alive, display a message.
if (!alive _ADF_unitLeader) exitWith {hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left'>%1, your unit Leader, %2, is currently K.I.A.</t><br/><br/><t color='#6C7169' align='left'>You can teleport to %2's position once he has respawned.</t><br/><br/>",_ADF_unitName,_ADF_unitLeaderName];};

// Leader is alive, let's check if he/she is on foot or in a vehicle
if (vehicle _ADF_unitLeader == _ADF_unitLeader) then { // TL is not in a vehicle

	_ADF_unit setUnitPos "DOWN";
	_ADF_unit setDir _ADF_unitLeaderDir;
	_ADF_unit setPosATL _ADF_unitLeaderPos;
	_ADF_unit setPos (_ADF_unitLeader modelToWorldVisual [0, -5, 0]);
	if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};

} else {	// Tl is in a vehicle

	scopeName "ADF_TeleportVeh";
	if (((vehicle _ADF_unitLeader) emptyPositions "commander") > 0) then {
		_ADF_unit assignAsCommander (vehicle _ADF_unitLeader);
		_ADF_unit moveInCommander (vehicle _ADF_unitLeader);
		breakOut "ADF_TeleportVeh";
	};
	if (((vehicle _ADF_unitLeader) emptyPositions "gunner") > 0) then {
		_ADF_unit assignAsGunner (vehicle _ADF_unitLeader);
		_ADF_unit moveInGunner (vehicle _ADF_unitLeader);
		breakOut "ADF_TeleportVeh";
	};
	if (((vehicle _ADF_unitLeader) emptyPositions "driver") > 0) then {
		_ADF_unit assignAsDriver (vehicle _ADF_unitLeader);
		_ADF_unit moveInDriver (vehicle _ADF_unitLeader);
		breakOut "ADF_TeleportVeh";
	};
	if (((vehicle _ADF_unitLeader) emptyPositions "cargo") > 0) then {
		_ADF_unit assignAsCargo (vehicle _ADF_unitLeader);
		_ADF_unit moveInCargo (vehicle _ADF_unitLeader);
		breakOut "ADF_TeleportVeh";
	};
	// No space in vehicle
	hintSilent parseText format ["<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/><t color='#6C7169' align='left'>%1, your unit Leader, %2, is in a vehicle.</t><br/><br/><t color='#6C7169' align='left'>The vehicle does not have an empty seat at the moment. Please try again later.</t><br/><br/>",_ADF_unitName,_ADF_unitLeaderName];
};

