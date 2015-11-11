if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

// Crew the static positions
private ["_g","_p"];
_g = CreateGroup EAST; 
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"SERGEANT"]; _p setDir 180; _p moveInGunner oStat_1; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"CORPORAL"]; _p setDir 330; _p moveInGunner oStat_2; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_3; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_4; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_5; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_6; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_7; sleep 0.05;
_p = _g createUnit ["O_Soldier_F",getMarkerPos "mP1",[],0,"PRIVATE"]; _p setDir 330; _p moveInGunner oStat_8; sleep 1;

// Foot patrols
for "_i" from 1 to 6 do {
	private ["_g","_p"];
	_p = format ["mP%1",_i];
	_p = getMarkerPos _p;
	_g = [_p, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry")] call BIS_fnc_spawnGroup;
	[_g, getMarkerPos "mP1", 350, 4, "MOVE", "SAFE", "RED", "LIMITED", "FILE", 5] call ADF_fnc_footPatrol;
};

// (Tech) veh patrols
for "_i" from 1 to 4 do {
	private ["_c","_v","_p","_vc"];
	_p = format ["vSpawn%1",_i];
	_p = getMarkerPos _p;
	_vc = ["O_MRAP_02_hmg_F","O_MRAP_02_F","O_Truck_02_transport_F","O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
	_c = createGroup EAST;
	_v = [_p, 45, _vc, _c] call BIS_fnc_spawnVehicle;
	[_c,_p, 1000, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

