/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Snippets repo
Author: Whiztler
Script version: 1.0

Game type: n/a
File: ADF_SnipRepo.sqf
****************************************************************
This is a repo with useful snippets
****************************************************************/

// Alt
this setPosASL [setPosASL this select 0, setPosASL this select 1, 20] // asl
this setPosATL [setPosATL this select 0, setPosATL this select 1, 20] // atl

// cTAB
 g = group this; g setGroupID ["XXX"];

// Find units
{
	if (side _x == WEST) then {
		_posp = getPos _x;
		_np = str _posp;
		_m = createMarker [_np,_posp];
		_m setMarkerShape "ICON"; 
		_m setMarkerType "mil_dot";
		_m setMarkerSize [2,2];
		_m setMarkerColor "ColorOrange";
	};
} forEach allUnits;


///// Set group name

_group1 setGroupId ["Delta","GroupColor4"];
_group1 setGroupId ["Assault Squad"];


///// Set all (enemy) units in AWARE mode (certain radius from object/marker)

// ObjectCenter is the name of the object that determinesa the center of the radius. The radius in below example is set to 200,
{if (side _x == EAST) then {_x setBehaviour "AWARE"}} forEach ((getPosATL ObjectName) nearEntities ["All", 200]);


///// Force the AI to watch a direction (or an object)

unit doWatch object; // Where unit is the Units name. -or-
unit setFormDir 90;  // Where unit is the Units name. 90 is the direction
// or when you put it in the unit's init field:
this setFormDir 90;  // Where unit is the Units name. 90 is the direction -or-
this doWatch object; // Where unit is the Units name.
 
 
///// Passing on vehicle attributes (e.g. waypoints) to respawned vehicle 

(group (_this select 1)) copyWaypoints (group (_this select 0));


///// Check if variable exists

if(isNil "debug_serverfps") then {debug_serverfps = 0;};


///// Show FPS

[] spawn {while {true} do {hintSilent str(diag_fps); sleep .5;};};


///// Delete a variable (save server lag)

globalVariable = nil; // or
_localVariable = nil;


///// Find hidden textures

private "_vehicles"; 
_vehicles = configFile >> "CfgVehicles"; 
diag_log "HS: Enumerating Hidden Selections";
for "_i" from 0 to (count _vehicles - 1) do { 
	private "_vehicle"; 
	_vehicle = _vehicles select _i; 
	if (isArray (_vehicle >> "hiddenSelections")) then {
		private "_selections";
		_selections = getArray (_vehicle >> "hiddenSelections");
			if (count _selections > 0) then {
				diag_log format ["HS: %1 %2", configName _vehicle, _selections];
			};
	};
};


///// MH9 Hidden Textures

//null = [this] execVM "heliSkins.sqf";

waituntil {!isnull player};
sleep 1;

_heli = _this select 0;

_skins = 
[

"A3\Air_F\Heli_Light_01\Data\Heli_Light_01_ext_Blufor_CO.paa",
"A3\Air_F\Heli_Light_01\Data\heli_light_01_ext_uni_mc.paa",
"A3\Air_F\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa",
"A3\Air_F\Heli_Light_01\Data\heli_light_01_ext_co.paa",
"A3\Air_F\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa",
"A3\Air_F\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa",
"A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"

];

for "_i" from 0 to (count _skins)-1 do {
_skin = _skins select _i;
player sidechat str _skin;
_heli setObjectTexture [0,_skin];

sleep 5;
};


///// Offroad hidden textures

this animate ["HidePolice", 0];  
this animate ["HideServices", 1]; 
this animate ["HideBackpacks", 1]; 
this animate ["HideBumper1", 1]; 
this animate ["HideBumper2", 1]; 
this animate ["HideConstruction", 1]; 
this animate ["HideDoor1", 1];  
this animate ["HideDoor2", 1]; 
this animate ["HideDoor3", 1]; 
this animate ["HideGlass2", 1]; 

_textures = ["\A3\soft_F\Offroad\Data\offroad_ext_co.paa",  //red
"\A3\soft_F\Offroad\Data\Offroad_ext_BASE01_CO.paa", //yellow 
"\A3\soft_F\Offroad\Data\Offroad_ext_BASE02_CO.paa",  //white
"\A3\soft_F\Offroad\Data\Offroad_ext_BASE03_CO.paa",  //blue
"\A3\soft_F\Offroad\Data\Offroad_ext_BASE04_CO.paa",  //darkred
"\A3\soft_F\Offroad\Data\Offroad_ext_BASE05_CO.paa"]; //darkblue

this setObjectTexture [0, _textures select 0]; //Set color texture
this setObjectTexture [1, _textures select 0]; //Set texture of rims/iron bars and other stuff  


///// Check if a building is destroyed

// Place a trigger over the building and then group the trigger to the building.
// You then get a new option in the trigger “Static Object” just set the trigger to not present.
// -or-

!alive (getPos glBuilding nearestObject 85868) // Setup a trigger with the condition


///// Find al chapels on Altis and put them in  an array

private["_position","_radius","_classnames","_chapels"];
_position = [x,z,y]; //center position to search from
_radius = 10000; //radius from center position to search from
_classnames = ["Land_Chapel_V1_F"]; //classnames to search for
_chapels = nearestObjects [_position,_classnames,_radius]; //get all chapels into an array
{ diag_log format["%1",getPos _x]; } forEach _chapels; //loop through array and log positions


//// Get an Object ID in-game

while {true} do {hintSilent str (nearestObjects [player, [], 3]); sleep 0.01;}}; // Radius from player is 3 meters


///// Attaching a marker to a unit

[] spawn {
  while {!isNull nameUnitHere} do { "mkr_unit1" setMarkerPos getPosASL nameUnitHere; sleep 0.5; };
};


///// Unlimited ammo (put into init field)

// Also for launchers:
this addEventHandler ["Fired",{[_this select 0,getNumber (configFile/"CfgAmmo"/(_this select 4)/"explosive")] spawn {if (_this select 1==1) then {sleep 0.75};_this select 0 setVehicleAmmo 1}}]

// or just for rifles/mgs's/vehicle ammo:
this addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}]


///// Custom explosions / bombs / IED's (run as server!)

// at a specific marker
bomb = "Bo_GBU12_LGB" createVehicle getmarkerPos "explosion";

// at a specific unit/vehicle
bomb = "Bo_GBU12_LGB" createVehicle getPosASL "unit_name";

// explode at 800m altitude
bomb = "Bo_GBU12_LGB"  createVehicle [(getmarkerPos "explosion" select 0),( getmarkerPos "explosion" select 1), 300];


///// Levelling an object placed on a hill

this setVectorup [0,0,0.1]; // [x, y, z]
// https://community.bistudio.com/wiki/setVectorUp
this setVectorDirAndUp [[1,0,0],[0,0,1]]; //[[x, y, z],[x, y, z]]
// https://community.bistudio.com/wiki/setVectorDirAndUp

///// Locality Explained (Kylania): isServer/isDedicated/isMultiplayer 

/* Here is a list of machine types (singleplayer, servers, client) and how various
condition checks will return if run on that machine. For example, if you wanted to
make sure a machine was a MP host and not a dedicated server you could run:

Code: if ((isServer) and (!isDedicated)) then {...);

You don’t usually need to check more than two (and sometimes one will do) but here
is a list of how all three SP/MP condition checks return for all SP/MP game modes:

EDITOR PREVIEW / SINGLEPLAYER:
isMultiplayer returns false
isServer returns true
isDedicated returns false

MULTIPLAYER (NON-DEDICATED) HOST SERVER
isMultiplayer returns true
isServer returns true
isDedicated returns false

MULTIPLAYER DEDICATED SERVER
isMultiplayer returns true
isServer returns true
isDedicated returns true

MULTIPLAYER CLIENT
isMultiplayer returns true
isServer returns false
isDedicated returns false

AL: Command arguments must be local. If the argument is my player unit, I can only issue the command on my PC as on other PCs my player object is REMOTE so it won’t work.

AG: Command accepts global arguments. If the argument is a vehicle, I do not have to find the PC that owns it, I can just reference it from anywhere.

EL: The effect of the command is local, i.e the effect is limited to the PC that executed the command and will not be broadcast.

EG: The effect of the command is global, i.e the changes will be broadcast to and happen on every PC, and often on JIP PCs too.

*/

if (isServer) then {
	//..local hosted server
	//..single player
	//..dedicated server
};
if (!isServer) then {
	//..client on local hosted server (not the host itself!!!)
	//..client on dedicated server
};
if (isDedicated) then {
	//..dedicated server only
};
if (!isDedicated) then {
	//..local hosted server
	//..singleplayer
	//..all clients
};
if (!isDedicated and isServer) then {
	//..local hosted server
	//..singleplayer
};
if (!isDedicated and isServer and not isMultiplayer) then {
	//..local hosted server
};


///// Random Pos

fnc_randomPos = 
{
    private["_center","_radius","_exit","_pos","_angle","_posX","_posY","_size","_flatPos"];
    _center = _this select 0;
    _size = if(count _this > 2) then {_this select 2};
    _exit = false;
    
    while{!_exit} do
    {
        _radius = random (_this select 1);
        _angle = random 360;
        _posX = (_radius * (sin _angle));
        _posY = (_radius * (cos _angle));
        _pos = [_posX + (_center select 0),_posY + (_center select 1),0];
        if(!surfaceIsWater [_pos select 0,_pos select 1]) then 
        {
            if(count _this > 2) then 
            {
                _flatPos = _pos isFlatEmpty [_size / 2,0,0.7,_size,0,false];
                if(count _flatPos != 0) then 
                {
                    _pos = _flatPos;
                    _exit = true
                };
            } else {_exit = true};
        };
    };
    
    _pos;
}; 


///// ARM3 music tracks 
/*
Name, Classname, Duration

01: Proteus, Track01_Proteus, 94
02: Solar Power, Track02_SolarPower, 114
03: On The Road, Track03_OnTheRoad, 88
04: Underwater 1, Track04_Underwater1, 96
05: Underwater 2, Track05_Underwater2, 96
06: Car and Heli, Track06_CarnHeli, 111
07: Action Dark, Track07_ActionDark, 111
08: Night ambient, Track08_Night_ambient, 204,
09: Night_percussions, Track09_Night_percussions, 194
10: StageB_action, Track10_StageB_action, 96
11: StageB_stealth. Track11_StageB_stealth, 184

*/

///// Triggers

if (isServer) then {
	_t = createTrigger ["EmptyDetector", getMarkerPos "pos_obj_exfil"];
	_t setTriggerType "SWITCH";
	_t setTriggerActivation ["ALPHA", "PRESENT", false];
	_t setTriggerArea [0,0,0,false];
	_t setTriggerStatements ["this", "hint 'trigger on'", "hint 'trigger off'"];
	_t setTriggerText "All loaded. Advice Big Foot to depart.";
};


// Activate Trigger at a specific hour- To set off a trigger at a certain hour use the daytime command.  The number would be the hour on a 24 hour clock, so trigger at 7:00PM would be:
daytime > 19


///// Force vehicle lights on (in vehicle init)

 if (isServer) then {0=[this]spawn{while{alive driver (_this select 0)}do{driver (_this select 0) action ["LightOn", (_this select 0)]}}}; 
 
 if (isServer) then {
	0 = [this] spawn {
		while {
			alive driver (_this select 0)
		} do {
			driver (_this select 0) action ["LightOn", (_this select 0)]
		};			
	};
}; 
 
 
///// Mark pre-placed objects on the map (like placed BIS static objects)

if(isserver) then { // By Larrow
    fnc_markerBoundArea = {
        _object = _this select 0;
        _pos = getPosATL _object;
        _bound = boundingBoxReal _object;
        _rot = getDir _object;
        _bmin = _bound select 0;
        _randomName = "";
        while {true} do {
            _randomName = str (random 2000);
            if (([getMarkerPos _randomName, [0,0,0]] call BIS_fnc_arrayCompare)) exitWith {};
        };
        _marker = createMarker [_randomName, _pos];
        _marker setMarkerShape "RECTANGLE";
        _marker setMarkerSize [_bmin select 0, _bmin select 1];
        _marker setMarkerDir _rot;
    };
    {
        [_x] call fnc_markerBoundArea;
    }forEach (synchronizedObjects this );
};  


///// Importing from Lynx Object Positioning

private ["_dist","_banana","_remove"];
_dist = 50;
_pos = position player;
if (count _this > 0) then {_pos = _this select 0};
if (count _this > 1) then {_dist = _this select 1};


_banana = (_pos nearObjects _dist);
_remove = [];
{
              if ((_x isKindOf "Logic") || 
	(typeOf _x == "#mark") ||
	(typeOf _x == "EmptyDetector") ||
	(_x isKindOf "Animal") || 
	(_x isKindOf "Insect") || 
	(_x isKindOf "ThingEffect") ||
	(_x isKindOf "Man") ||
	(_x isKindOf "sign_arrow_large_cyan_f") || 
	(isPlayer _x)) then 
	{_remove = _remove + [_x];};
} forEach _Banana;
_Banana = _Banana - _remove;

_remove = format ["/* %1 entries */ ",count _banana];
_remove = _remove + "private ['_tmp','_x', '_y', '_result']; ";
_remove = _remove + "_x = _this select 0; _y = _this select 1; _result = []; ";
{
	_NewPos = [(getPos _x select 0) - (_pos select 0),(getPos _x select 1) - (_pos select 1),(getPos _x select 2)];
	_tmp = format ["_tmp = '%1' createVehicle [_x + (%2 select 0),_y + (%2 select 1),(%2 select 2)]; _tmp setDir %3; _tmp setPos [_x + (%2 select 0),_y + (%2 select 1),(%2 select 2)]; _result set [count _result,_tmp];",typeOf _x,_NewPos, getDir _x];
	_remove = _remove + _tmp;
} forEach _Banana;
_remove = _remove + " _result";
copyToClipBoard _remove;

_x = 0;
_y = 0;
_angle = 0;
_arrows = [];

while {_angle < (2 * pi)} do
{
	_x = _dist * (cos (_angle * 57));
	_y = _dist * (sin (_angle * 57));
	_arrows set [count _arrows,"Sign_Arrow_Large_Cyan_f" createVehicle [(_pos select 0) + _x,(_pos select 1) + _y,2]];
	_angle = _angle + 0.1;
};

sleep 10;
{deletevehicle _x} forEach _arrows;


///// Delete spawned vehicles (incl crew)

{deleteVehicle _x} forEach (crew vWolf_2); deleteVehicle vWolf_2;};

// or

{deleteVehicle _x} forEach (crew vWolf_2)+[vWolf_2];


///// Randow letters intro text

[str ("Mission Name Here") ,"", str("Mission Location Here")] spawn BIS_fnc_infoText;


///// Only Pilots can enter air/rotorcraft (shuko/Kylania)

_vehicleType = _this select 0;  // "Helicopter" / "Tank"
_crewType = _this select 1;  // "US_Soldier_Pilot_EP1"

//hint format["%1 - %2",_crewType, _vehicleType];
  if (typeof player != _crewType) then {
    private "_v";
    while {alive player} do {
      waituntil {vehicle player != player};
      _v = vehicle player;
      if (_v iskindof _vehicleType && !(_v iskindof "ParachuteBase")) then {
        if (driver _v == player) then {
          player action ["eject",_v];
          waituntil {vehicle player == player};
          hint "We shall leave the piloting to those with the appropriate training.";
        };
      };
    };
  };
  
//Then call that from init.sqf as:
["Helicopter", "US_Soldier_Pilot_EP1"] execVM "pilotCheck.sqf";
["Tank", "US_Soldier_Crew_EP1"] execVM "pilotCheck.sqf";


///// Random spawn

// if spawnmarker is a marker you can use it as a center point and spawn the vehicle somewhere around that point by doing for example this:

_pos = getMarkerPos "spawnmarker";
_RandomPos = [_pos, 0, 200, 30, 0, 5, 0] call BIS_fnc_findSafePos; // http://tactical.nekromantix.com/wiki/doku.php?id=arma2:scripting:bis_fnc_findsafepos
_vehicle = [_RandomPos, 180, "O_MBT_02_cannon_F", _tankcrew] call BIS_fnc_spawnVehicle;


///// Show empty cargo positions of a vehicle

hint str (YourVehicleName emptyPositions "cargo");


///// Damage model

// This will make all WEST units 25% tougher to kill. You can then adjust that multiplier to your liking. You could also exclude yourself with another if-then condition, using either playableUnits (multiplayer only) or isPlayer. 

/*initServer.sqf*/

{
	 if ( side _x == WEST) then {
		if (_x isKindOf "Man") then {
			_x addEventHandler ["HandleDamage", {
				_damage = (_this select 2) * 0.75;
				_damage
			}];
		};
	};
} forEach allUnits; 

// or

if ( side _x == WEST) then {
	if (_x isKindOf "Man") then {
		_x addEventHandler ["HandleDamage", {
			_unit = _this select 0;
			_selection = _this select 1;
			_passedDamage = _this select 2;
			_source = _this select 3;
			_projectile = _this select 4;
			_oldDamage = 0;
				switch (_selection) do {
					case("head"):{_oldDamage = _unit getHitPointDamage "HitHead";};
					case("body"):{_oldDamage = _unit getHitPointDamage "HitBody";};
					case("hands"):{_oldDamage = _unit getHitPointDamage "HitHands";};
					case("legs"):{_oldDamage = _unit getHitPointDamage "HitLegs";};
					case(""):{_oldDamage = damage _unit;};
					default{};
				};
				_return = _oldDamage + ((_passedDamage - _oldDamage) / 20);			
				_return
		}];
	} forEach allUnits;
};

// When using dynamic spawn units then add then add the eventhandler at the end of the script.


///// Heli insertion/land etc

// In the init of the leader put:
Fox_1 = Group this; {_x moveincargo MH9} ForEach units group this;

// In the On Act of the waypoint you want to unload BlackFox put this:
MH9 land "Land"; {unassignvehicle _x; dogetout _x} foreach units (Fox_1);


///// Set patch

scriptsPath = "ca\data\scripts\";


///// Initialization Order
/*When mission is starting, its components are initialized in the following order:

1	Functions with recompile param set to 1 are recompiled
2	Functions with preInit param set to 1 are called
3	Object Init Event Handlers are called
4	Object initialization fields are called
5	init.sqs is executed in singleplayer
6	init.sqf is executed in singleplayer
7	Persistent multiplayer functions are called (client only)
8	Modules are initialized
9	initServer.sqf is executed (server only)
10	initPlayerLocal.sqf is executed
11	initPlayerServer.sqf is executed (server only)
12	Functions with postInit param set to 1 are called
13	BIS_fnc_init" variable is set to true
14	init.sqs is executed in multiplayer
15	init.sqf is executed in multiplayer
*/


///// CBA Taskdefend

[_datGroup, _datLocStat, 50, 3, true] call CBA_fnc_taskDefend

/*
_datGroup - is the group (it can be a object or the actual group).
_datLocStat - can be a pos [x,y,z], object, Location and even a group.
50 - can be any number, designates radius in wich group will man static defences, hide in buildings and go on a patrol (if enabled).
3 - defines the size of a building a group will use (don't know how it works).
true - The group will go on a random patrol depending on the situation and defense area. */


///// helicopter extraction script

if (!isServer) exitwith {};

private ["_group","_heli","_side","_spawnPos","_goToPos","_AirPos","_safePos","_range","_maxGrad","_landPos","_m","_vehicle","_veh","_vehgrp","_x","_wp1","_smokePos","_smoke","_wp2","_units","_strobe","_light"];

//_group = _this select 0;
_heli = _this select 0;
_side = _this select 1;
_spawnPos = _this select 2;
_goToPos = _this select 3;

waituntil {!isnil "bis_fnc_init"};

_AirPos = [(getmarkerpos _spawnPos select 0), (getmarkerpos _spawnPos select 1), 100];

//find safe landing position
_safePos = [];
_range = 35;
_maxGrad = 0.1;

while {((count _safePos) == 0)} do {
    _safePos = [
        ["position", getMarkerPos "lz"],
        ["number", 1],
        ["objDistance", 9],
        ["range", [0, _range]],
        ["maxGradient", _maxGrad]
    ] call RUBE_randomCirclePositions;

   _range = _range * 1.25;
   _maxGrad = _maxGrad + 0.01;
};

_landPos = createVehicle ["Land_HelipadEmpty_F", (_safePos select 0), [], 0, "NONE"];

[["RadioAmbient5"], "sh_sound_fnc", nil, false] call BIS_fnc_MP;

_vehicle = [_AirPos, random 360, _heli, _side] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
_vehgrp = _vehicle select 2;
_veh setVehicleVarName "she_heli";
she_heli = _veh;

_veh setposATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 50];
_veh flyInHeight 50;

{_x setBehaviour "STEALTH"; _x setCombatMode "BLUE"; _x allowFleeing 0; _x disableAI "AUTOTARGET"; _x disableAI "TARGET"; _x disableAI "FSM";} foreach units _vehgrp;

[[_veh], "sh_fnc", nil, true] call BIS_fnc_MP;

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;

_wp1 = _vehgrp addWaypoint [position _landPos, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "NORMAL";
_wp1 setWaypointCompletionRadius 5;
_wp1 setWaypointStatements ["true", "she_heli land 'GET OUT';{she_heli animateDoor [_x, 1]} forEach ['door_back_L','door_back_R','door_L','door_R']"];

sleep 1;

//Smoke or IR Strobe
waitUntil { (_veh distance _landPos) < 350 };
_smokePos = [getPos _landPos, 10, 25, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
_smoke = createVehicle ["SmokeShellYellow", _smokePos, [], 0, "NONE"];

// _smoke = createVehicle ["SmokeShell", _smokePos, [], 0, "NONE"];
// _light = createVehicle ["Chemlight_yellow", _smokePos, [], 0, "NONE"];
// _strobe = createVehicle ["I_IRStrobe", position _smokePos, [], 0, "NONE"];

_units = [] call BIS_fnc_listPlayers;

sleep 0.1;

//Wait until everyone is onboard
waitUntil { {alive _x && _x in she_heli} count _units == count ([] call BIS_fnc_listPlayers) };

{_veh animateDoor [_x, 0]} forEach ["door_back_L","door_back_R","door_L","door_R"];
_veh lock true;

_wp2 = _vehgrp addWaypoint [getmarkerpos _goToPos, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "NORMAL";
_wp2 setWaypointCompletionRadius 5;

/*deleteMarker "exma";*/

//Outro Variable
waitUntil { ([position _veh select 0,position _veh select 1,0] distance _landPos) > 100 };
sh_Outro = true;
publicvariable "sh_Outro";

/*
 * aitohc.sqf
 *
 * By VCRPlayer
 *
 * This script will move ANY ai (ie: zeus-spawned, etc)         to the headless client for processing on every frame
 * 
 * In init.sqf, put "[] execVM "aitohc.sqf";" (without outer quotes)
 *
 * In the description of the HeadlessClient virtual unit, put HC
 */
if (!isServer) exitWith {};
_HC = owner "HC"; //"HC" denotes the name of the unit in-game
waitUntil {!isNil "HC"};

 ["HCS_addToHC", "onEachFrame", {
    if ((isPlayer)||(_x in units group _HC)) exitWith {};
    if (isNull _HC) ExitWith{};

    { _x setGroupOwner _HC; //adding all units that aren't player or aren't already under HC to HC
    }forEach allUnits;

}] call BIS_fnc_addStackedEventHandler;