/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Debug functions
Author: whiztler
Script version: 1.46

Game type: N/A
File: ADF_fnc_debug.sqf
****************************************************************
Instructions:

Debug functions add various actions to the the player in editor preview.
It also loads the debug markers function. See below.

Make sure the function is loaded at mission startup. Put this in your init.sqf:
ADF_debug = false; // Make sure to set to false before compiling your final PBO
if (ADF_debug) then {execVM "Core\F\ADF_fnc_debug.sqf";};

To enable the debug markers function, insert the following at the end of your script
that is used to spawn units/vehicles:
[EAST,"OFF"] call ADF_fnc_debugMarkers; // Side, Labels "ON"/"OFF"

Make sure that you call the function AFTER all units have spawned. It does NOT refresh!
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_debug.sqf"; // Reporting. Do NOT edit/remove

// Add menu actions to mission maker for editor preview
if (isServer && !isDedicated) then {
	waitUntil {player == player && alive vehicle player};
	player addAction ["<t align='left' color='#C0C0C0'>––[ <t color='#FFFFFF'>ADF Dev Snippets<t color='#C0C0C0'> ]––––––",nil];
	player addAction ["<t align='left' color='#F7D358'>Show Units / Veh. / Obj.</t>",{execVM "Core\D\ADF_snipOjects.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Show Position</t>",{execVM "Core\D\ADF_snipPosition.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Show Distance Object-Player</t>",{execVM "Core\D\ADF_snipDistance.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Identify Classname</t>",{execVM "Core\D\ADF_snipIdClassname.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Start OpFor Detection</t>",{execVM "Core\D\ADF_snipDetect.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Stop OpFor Detection</t>",{ADF_terminate_detect = true; publicVariable "ADF_terminate_detect"}];
	player addAction ["<t align='left' color='#F7D358'>Set time +6 hours</t>",{skipTime 6;}];
	player addAction ["<t align='left' color='#F7D358'>Set time -6 hours</t>",{skipTime -6;}];
	player addAction ["<t align='left' color='#F7D358'>Phantom Mode ON/OFF</t>",{if (captive player) then {player setcaptive false; player allowDamage true; hintsilent "Phantom Mode OFF";} else {player setcaptive true; player allowDamage false; hintsilent "Phantom Mode ON";};}];	
	player addAction ["<t align='left' color='#F7D358'>Spawn NATO Weapons Squad", {execVM "Core\D\ADF_snipSpawnBluefor.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Spawn CSAT Weapons Squad", {execVM "Core\D\ADF_snipSpawnOpfor.sqf";}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Hummingbird", { _veh = createVehicle [ "B_Heli_Light_01_F", player modelToWorld [0,10,0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90); _veh setVectorUp surfaceNormal position _veh; _veh  setObjectTextureGlobal  [0, "A3\Air_F\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"];}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Hunter", { _veh = createVehicle [ "B_MRAP_01_F", player modelToWorld [0,10,0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90); _veh setVectorUp surfaceNormal position _veh; _veh  setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"]; /*_veh  setObjectTextureGlobal  [1, "#(rgb,8,8,3)color(0.64,0.64,0.64,1)"];*/}];
	player addAction ["<t align='left' color='#F7D358'>Spawn Speedboat", { _veh = createVehicle [ "C_Boat_Civil_01_rescue_F", player modelToWorld [0,10,0], [], 0, "CAN_COLLIDE" ]; _veh setDir (direction player - 90);}];
	player addAction ["<t align='left' color='#C0C0C0'>––––––––––––––––––––––––",nil];
};

// Debug markers function
ADF_fnc_debugMarkers = {
	if (!isServer) exitWith {}; // server only
	if (count _this < 2) exitwith {["DEBUG - OpFor Tracking marker parameters are incorrect",false] call ADF_fnc_log;}; // incorrect config
	_ADF_debug_side = _this select 0;	
	_ADF_debug_labels = _this select 1;
	{
		if (side _x == _ADF_debug_side) then { // Check side
			[_x,_ADF_debug_labels] spawn { // Spawn a script instance per unit per defined side
				_ADF_debug_u = _this select 0;			
				_ADF_debug_uName = format ["obj_%1",_ADF_debug_u]; // define a marker var
				_ADF_debug_uPos = getPosASL _ADF_debug_u;
				_ADF_debug_m = createMarker [_ADF_debug_uName,_ADF_debug_uPos]; // setup the marker			
				_ADF_debug_m setMarkerShape "ICON";
				if (_this select 1 == "ON") then {_ADF_debug_m setMarkerText str _ADF_debug_u;}; // Do we display labels?
				if (vehicle _ADF_debug_u isKindOf "Man") then {_ADF_debug_m setMarkerType "mil_arrow"; _ADF_debug_m setMarkerSize [0.4,0.4]}; // infantry units
				if ((vehicle _ADF_debug_u isKindOf "Car") || (vehicle _ADF_debug_u isKindOf "Ship")) then {_ADF_debug_m setMarkerType "mil_arrow2"; _ADF_debug_m setMarkerSize [0.5,0.5]}; // road & sea vehicles
				if (vehicle _ADF_debug_u isKindOf "Air") then {_ADF_debug_m setMarkerType "mil_triangle"; _ADF_debug_m setMarkerSize [1.2,1.2]}; // aerial vehicles
				_ADF_debug_m setMarkerColor "ColorRed"; // bright red icon colour
				while {alive _ADF_debug_u} do { // Only update the marker whilst the vehicle/unit is alive
					_ADF_debug_m setMarkerPos (getPosASL _ADF_debug_u);
					_ADF_debug_m setMarkerDir (getDir _ADF_debug_u);	
					sleep 1;
				};
				_ADF_debug_m setMarkerColor "ColorBlack"; // define black colour for dead/destroyed units.
				sleep 120;
				deleteMarker _ADF_debug_m; // remove the marker after 2 minutes
			};
		};
	} forEach allUnits;	
};

// Performance logging/debug
ADF_debug_LoggingBreakout = false;

// Server Performance RPT logging
sleep 30; // wait until mission init
waitUntil {
	private ["_ADF_debugLog_pre","_ADF_debugLog_msg","_ADF_serverFPS","_ADF_minServerFPS"];
	_ADF_serverFPS = round (diag_fps);
	_ADF_minServerFPS = round (diag_fpsmin);
	_ADF_GameTime_HMS = [(round time)] call BIS_fnc_secondsToString;
	_ADF_debugLog_pre = "ADF Debug: PERF - ";
	_ADF_debugLog_msg = format ["Elapsed time: %1  --  Server FPS: %2  --  Server Min FPS: %3",_ADF_GameTime_HMS,_ADF_serverFPS,_ADF_minServerFPS];
	ADF_debugLog_write = _ADF_debugLog_pre + _ADF_debugLog_msg;
	if (isServer) then {diag_log ADF_debugLog_write;}; // v1.40 B01
	[ADF_debugLog_write,"systemChat"] call BIS_fnc_MP; // v1.39 B6
	uiSleep 10; // 10 second cycles
	ADF_debug_LoggingBreakout
};


