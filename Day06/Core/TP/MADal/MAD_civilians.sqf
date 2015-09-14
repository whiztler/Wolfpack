//MAD Ambient Life (Civilians) v1, SP and fully MP compatible
//by MAD T, NSS-Gamers.com - edited by Whiztler for ADF v1.39
//credits to TPW for his TPW´s TPW MODS: enhanced realism/immersion, without him this would not be possible.

//Note: This is a derivative work of TPW´s TPW MODS: enhanced realism/immersion. It contains some code of it but it´s main difference is that this
//works on dedicated servers. It is still WIP;

if (isServer) then {diag_log "ADF RPT: Init - executing MAD_civilians.sqf"}; // Reporting. Do NOT edit/remove
if (ADF_isHC) exitWith {}; // HC exits script

MAD_maxCivDensity = _this select 0; // number of civs around 1 player at the same time
MAD_maxCivDistance = _this select 1;	// max distance until civs despawn
MAD_maxCivWaypoints = _this select 2; // number of civ waypoints
_ADF_civKia_enable = _this select 3; // CivKia EH
ADF_terminateCivScr = false;

MAD_CivsArray = [];

_centerC = createCenter civilian;

MAD_civlist = [
"C_man_1",
"C_man_1_1_F",
"C_man_1_2_F",
"C_man_1_3_F",
"C_man_polo_1_F",
"C_man_polo_2_F",
"C_man_polo_3_F",
"C_man_polo_4_F",
"C_man_polo_5_F",
"C_man_polo_6_F",
"C_man_shorts_1_F",
"C_man_p_beggar_F",
"C_man_p_fugitive_F",
"C_man_p_shorts_1_F",
"C_man_hunter_1_F",
"C_man_shorts_2_F",
"C_man_shorts_3_F",
"C_man_shorts_4_F",
"C_journalist_F",
"C_Orestes",
"C_Nikos_aged"
];

MAD_civClothes = [
	"U_Competitor",
	"U_C_HunterBody_grn",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_redwhite",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_Poor_1",
	"U_C_Poor_2",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_NikosBody",
	"U_Rangemaster"
];

MAD_housesList = [
	"Land_i_House_Small_01_V1_F",
	"Land_i_House_Small_01_V2_F",
	"Land_i_House_Small_01_V3_F",
	"Land_i_House_Small_02_V1_F",
	"Land_i_House_Small_02_V2_F",
	"Land_i_House_Small_02_V3_F",
	"Land_i_House_Small_03_V1_F",
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_i_House_Big_01_V3_F",
	"Land_i_House_Big_02_V1_F",
	"Land_i_House_Big_02_V2_F",
	"Land_i_House_Big_02_V3_F"
];

MAD_getHouses = {
	_position = _this;
	_allhouses = nearestObjects [_position,["House"],MAD_maxCivDistance];
	_temphouses = [];

	{
		if (_x getvariable ["MAD_isHouse",false]) then {
			_temphouses = _temphouses + [_x];
		} else {
			_housestring = str (typeof _x);
			_ishouse = ["_i_house", _housestring] call BIS_fnc_inString;

			if (_ishouse) then {
				_temphouses = _temphouses + [_x];
				_x setvariable ["MAD_isHouse",true];
			};
		};
	} forEach _allhouses;

	_temphouses
};

MAD_spawnciv = {
	_position = _this select 0;
	_count = MAD_maxCivDensity - (_this select 1);

	_temphouses = _position call MAD_getHouses;

	if (count _temphouses > 0) then {
		for "_b" from 1 to _count do {
			if (count MAD_CivsArray > 100) exitWith {};

			_spawnpos = getPosASL (_temphouses select (floor (random (count _temphouses))));
			_class = MAD_civlist select (floor (random (count MAD_civlist)));

			_sqname = creategroup civilian;
			_class createUnit [_spawnpos, _sqname];

			_civ = leader _sqname;
			
			if (ADF_debug) then {diag_log format ["ADF Debug: Civilians - Spawned %1 civilian (%2) at position %3",_class,_civ,_spawnpos];};

			MAD_CivsArray = MAD_CivsArray + [_civ];

			removeUniform _civ;
			_civ addUniform (MAD_civClothes select (floor (random (count MAD_civClothes))));
			_civ setVariable ["MAD_civ_owner", "server"]; // Whiz: what does this do? No reference to MAD_civ_owner
			_civ setspeedmode "LIMITED";
			_civ setBehaviour "SAFE";
			if (isServer && _ADF_civKia_enable) then {_civ addEventhandler ["killed",ADF_fnc_civKia_EH];}; // ADF 1.22

			for "_i" from 0 to MAD_maxCivWaypoints do {
				_house = _temphouses select (floor (random (count _temphouses)));

				_waypoint = _sqname addWaypoint [getposasl _house,_i];
				_waypoint setWaypointType "Move";
			};

			_waypoint = _sqname addWaypoint [_spawnpos,(count waypoints _sqname)];
			_waypoint setWaypointType "Cycle";
		};
	};

};

if (!isDedicated and isMultiplayer) then {
if (ADF_terminateCivScr) exitWith {};
	[] spawn {
		while {true} do {
			_houses = (position player) call MAD_getHouses;
			_var = player getVariable ["MAD_housesNear", false];

			if (count _houses > 0) then {
				if (!_var) then {player setVariable ["MAD_housesNear", true, true];};
			} else {
				if (_var) then {player setVariable ["MAD_housesNear", false, true];};
			};
			sleep 10;
			if (ADF_terminateCivScr) exitWith {};
		};
	};
};

MAD_deleteCivs = {
if (ADF_terminateCivScr) exitWith {};
	private ["_civ", "_players"];

	{
		if (!alive _x or isNull _x) then {
			MAD_CivsArray set [_forEachIndex, objNull];
		};
	} forEach MAD_CivsArray;

	MAD_CivsArray = MAD_CivsArray - [objNull];
	_players = [];

	if (isMultiplayer) then {
		{
			if (isPlayer _x) then {_players = _players + [_x];};
		} forEach playableUnits;
	} else {_players = [player];};

	{
		_civ = _x;
		_c = 0;
		{
			if (_civ distance _x > MAD_maxCivDistance and ((lineintersects [eyepos _x,getposasl _civ,_x,_civ]) || (terrainintersectasl [eyepos _x,getposasl _civ]))) then {	_c = _c + 1;};
		} forEach _players;

		if (_c == (count _players)) then
		{
			if (_civ in MAD_CivsArray) then {MAD_CivsArray = MAD_CivsArray - [_civ];};
			_group = group _civ;
			deleteVehicle _civ;
			deleteGroup _group;
		};
	} forEach MAD_CivsArray;
};

if (isServer) then {
	if (ADF_terminateCivScr) exitWith {};
	if (isMultiplayer) then {
		while {true} do {
			call MAD_deleteCivs;

			{
				_player = _x;
				_count = 0;
				_var = _player getVariable ["MAD_housesNear", false];

				if (_var) then {
					{
						if (_x distance _player < MAD_maxCivDistance) then {_count = _count + 1;};
					} forEach MAD_CivsArray;

					if (_count < MAD_maxCivDensity) then {[(position _player), _count] call MAD_spawnciv;};
				};
			} forEach playableUnits;
			sleep 10;
			if (ADF_terminateCivScr) exitWith {};
		};
	} else {
		while {true} do {
			call MAD_deleteCivs;			
			_count = 0;
			{
				if (_x distance player < MAD_maxCivDistance) then {_count = _count + 1;};
			} forEach MAD_CivsArray;

			if (_count < MAD_maxCivDensity) then {[(position player), _count] call MAD_spawnciv;};
			sleep 10;
			if (ADF_terminateCivScr) exitWith {};
		};
	};
};