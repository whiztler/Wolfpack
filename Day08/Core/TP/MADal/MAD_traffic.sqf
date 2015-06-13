//MAD Ambient Life (Traffic) v1, SP and fully MP compatible
//by MAD T, NSS-Gamers.com
//credits to TPW for TPW MODS: enhanced realism/immersion, without him this would not be possible.

//Note: This is a derivative work of TPW´s TPW MODS: enhanced realism/immersion. It contains some code of it but it´s main difference is that this
//works on dedicated servers. It is still WIP;

if (ADF_isHC) exitWith {}; // HC exits script

MAD_maxCarDensity = _this select 0; //number of cars around 1 player at the same time
MAD_carSpawnDistance = _this select 1; //how far cars spawn away from player
MAD_maxCarDistance = _this select 2; //max distance until cars despawn
_ADF_civKia_enable = _this select 3; // CivKia EH

MAD_carsArray = [];

_centerC = createCenter civilian;

MAD_civlist = [
"C_man_p_beggar_F",
"C_man_1",
"C_man_polo_1_F",
"C_man_polo_2_F",
"C_man_polo_3_F",
"C_man_polo_4_F",
"C_man_polo_5_F",
"C_man_polo_6_F",
"C_man_shorts_1_F",
"C_man_1_1_F",
"C_man_1_2_F",
"C_man_1_3_F",
"C_man_p_fugitive_F",
"C_man_p_shorts_1_F",
"C_man_hunter_1_F",
"C_man_shorts_2_F",
"C_man_shorts_3_F",
"C_man_shorts_4_F"
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
"U_Rangemaster"];

MAD_civCarList = [
"C_Hatchback_01_F",
"C_Hatchback_01_sport_F",
"C_Offroad_01_F",
"C_Offroad_01_repair_F",
"C_Offroad_luxe_F",
"C_Offroad_stripped_F",
"C_Quadbike_01_F",
"C_SUV_01_F"
]; 

MAD_comCarList = [
"C_Van_01_box_F",
"C_Van_01_transport_F",
"C_Van_01_fuel_F"
];

MAD_getDrivingRoads = {
	_position = _this;	
	_roads = _position nearRoads MAD_maxCarDistance;	
	_roads
};

MAD_getSpawnRoads = {
	_position = _this;	
	_roads = _position nearRoads MAD_maxCarDistance;	
	_farRoads = [];
	{
		if (_position distance position _x > MAD_carSpawnDistance) then {_farRoads = _farRoads + [_x];};
	} foreach _roads;	
	_farRoads
};

if (!isDedicated and isMultiplayer) then {
	[] spawn
	{
		while {true} do {
			_roads = (position player) call MAD_getSpawnRoads;
			_var = player getVariable ["MAD_roadsNear", false];

			if (count _roads > 0) then {
				if (!_var) then {player setVariable ["MAD_roadsNear", true, true];};
			} else {
				if (_var) then {player setVariable ["MAD_roadsNear", false, true];};
			};
			sleep 10;
		};
	};
};

MAD_spawnCar = {
	_position = _this select 0;
	_count = _this select 1;
	_roads = _position call MAD_getSpawnRoads;
	
	if (count _roads > 0) then {
		_carlist = MAD_civCarList; 
		if (daytime > 5 or daytime < 20) then {_carlist = MAD_civCarList + MAD_civCarList + MAD_comCarList;};
		_roadseg = _roads select (floor (random (count _roads)));
		_spawnpos = getposasl _roadseg;
		_spawndir = getdir _roadseg;
		_car = _carlist select (floor (random (count _carlist)));
		_sqname = creategroup civilian;
		_spawncar = _car createVehicle _spawnpos;
		_spawncar setdir _spawndir; 
		_spawncar setfuel 0.5 + (random 0.5);
		
		MAD_carsArray = MAD_carsArray + [_spawncar];

		//Driver
		_civtype = MAD_civlist select (floor (random (count MAD_civlist)));
		_driver = _sqname createUnit [_civtype,_spawnpos, [], 0, "FORM"];
		_driver moveindriver _spawncar;
		_driver setbehaviour "SAFE";
		_spawncar setvariable ["MAD_car_driver", _driver];
		if (isServer && _ADF_civKia_enable) then {_civ addEventhandler ["killed",ADF_fnc_civKia_EH];}; // ADF 1.22		
		[leader _sqname] call MAD_carWaypoint;
	};
};

MAD_carWaypoint = {
	_driver = _this select 0;
	_grp = group _driver;
	_locations = nearestLocations [getPos _driver, ["NameVillage","NameCity","NameCityCapital","NameLocal","CityCenter"], 30000];
	_randomLocation = _locations select (floor (random (count _locations)));
	_locationPos = locationPosition _randomLocation;
	
	_roads = _locationPos call MAD_getDrivingRoads;
	
	_road = _roads select (floor (random (count _roads)));
	_wp = getposasl _road; 
	_waypoint = _grp addWaypoint [_wp, 0];
	[_grp,0] setWaypointCompletionRadius 30;
	_waypoint setWaypointStatements ["true", "[this] call MAD_carWaypoint"]
};

MAD_deleteCars = {
	private ["_car", "_owner", "_players", "_driver"];	
	_players = [];

	if (isMultiplayer) then {
		{
			if (isPlayer _x) then {_players = _players + [_x];};
		} forEach playableUnits;
	} else {_players = [player];};

	{
		_car = _x;
		_c = 0;
		{
			if (_car distance _x > MAD_maxCarDistance and ((lineintersects [eyepos _x,getposasl _car,_x,_car]) || (terrainintersectasl [eyepos _x,getposasl _car]))) then {_c = _c + 1;};
		} forEach _players;
		
		if (_c == (count _players)) then {_driver = (_car getvariable ["MAD_car_driver", objNull]);

			if (!isNull _driver) then {
				_group = group _driver;
				moveout _driver;
				deleteVehicle _driver;
				deleteGroup _group;
			};
			
			MAD_carsArray = MAD_carsArray - [_car];
			deleteVehicle _car;
		};
	} forEach MAD_carsArray;
};

if (isServer) then {
	if (isMultiplayer) then {
		while {true} do {
			call MAD_deleteCars;
			{
				_player = _x;
				_count = 0;
				_var = _player getVariable ["MAD_roadsNear", false];

				if (_var) then {
					{
						if (_x distance _player < MAD_maxCarDistance) then {_count = _count + 1;};
					} forEach MAD_carsArray;

					if (_count < MAD_maxCarDensity) then {[(position _player), _count] call MAD_spawnCar;};
				};
			} forEach playableUnits;
			sleep 10;
		};
	} else {
		while {true} do {
			call MAD_deleteCars;
			_count = 0;
			_var = player getVariable ["MAD_roadsNear", false];

			if (_var) then {
				{
					if (_x distance player < MAD_maxCarDistance) then {_count = _count + 1;};
				} forEach MAD_carsArray;

				if (_count < MAD_maxCarDensity) then {[(position player), _count] call MAD_spawnCar;};
			};
			sleep 10;
		};
	};
};