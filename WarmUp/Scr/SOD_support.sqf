if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.
params ["_t"];

// Arti Site
if (_t == "ARTISUP") exitWith {
	_c = createGroup EAST;
	_spawnPos = ["mEVP_1","mEVP_2","mEVP_10"] call BIS_fnc_selectRandom;
	_v = [getMarkerPos _spawnPos, 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	_wp = _c addWaypoint [getMarkerPos "mCP_11", 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
};

// Heli Airport
if (_t == "APTSUP") exitWith {
	_c = createGroup EAST;
	_spawnPos = ["mEVP_3","mJet1b","mSup_1"] call BIS_fnc_selectRandom;
	_v = [getMarkerPos _spawnPos, 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	_wp = _c addWaypoint [getMarkerPos "mOpforRotor", 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
	sleep 60;
	_c = createGroup EAST;
	_spawnPos = ["mEVP_3","mJet1b","mSup_1"] call BIS_fnc_selectRandom;
	_v = [getMarkerPos _spawnPos, 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	_wp = _c addWaypoint [getMarkerPos "mOpforRotor", 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
};

// Paros
if (_t == "PAROSINNER") exitWith {
	_c = createGroup EAST;
	_spawnPos = ["mEVP_4","mSup_2","mSup_3"] call BIS_fnc_selectRandom;
	_v = [getMarkerPos _spawnPos, 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	_wp = _c addWaypoint [getPos tParos, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
	sleep 60;
	_c = createGroup EAST;
	_spawnPos = ["mEVP_4","mSup_2","mSup_3"] call BIS_fnc_selectRandom;
	_v = [getMarkerPos _spawnPos, 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	_wp = _c addWaypoint [getPos tParos, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
};

// Rodopoli
if (_t == "RODOPOLIINNER") exitWith {
	_c = createGroup EAST;
	_spawnPos = ["mEVP_4","mSup_4","mSup_5"] call BIS_fnc_selectRandom;
	_v = [getMarkerPos _spawnPos, 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	_wp = _c addWaypoint [getPos tRodopoli, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
	sleep 60;
	_c = createGroup EAST;
	_spawnPos = ["mEVP_4","mSup_4","mSup_5"] call BIS_fnc_selectRandom;
	_v = [getMarkerPos _spawnPos, 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	_wp = _c addWaypoint [getPos tRodopoli, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
};

// Fuel Depot
if (_t == "DEPOTINNER") exitWith {
	_spawnPos = ["mSup_60","mSup_61","mSup_62"] call BIS_fnc_selectRandom;
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	_wp = _g addWaypoint [getPos tDepot, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
	sleep 300;
	_c = createGroup EAST;
	_spawnPos = ["mSup_60","mSup_61","mSup_62"] call BIS_fnc_selectRandom;
	_g = [getMarkerPos _spawnPos, EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam")] call BIS_fnc_spawnGroup;
	_wp = _g addWaypoint [getPos tDepot, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
};

