if (WP_convoyStarted) exitWith {}; // double check
WP_convoyStarted = true;

if (!ADF_HC_execute) exitWith {}; // HC Autodetect. If no HC present execute on the Server.

private ["_c","_v","_WP","_startPause"];
_startPause = _this select 0;

ADF_fnc_DeleteVehicles = {
	private ["_vehToDelete"];
	_vehToDelete = _this select 0;	
	{
		{deleteVehicle _x} forEach crew (vehicle _x) + [(vehicle _x)];
	} forEach _vehToDelete;
	true
};

sleep _startPause;
_c = createGroup EAST;
_v = [getMarkerPos "mConvoy_Spawn", markerDir "mConvoy_Spawn", "O_APC_Wheeled_02_rcws_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_1 = _v select 0; 
_v = [(trptConvoy_1 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_covered_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_2 = _v select 0;
_v = [(trptConvoy_2 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_ammo_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_3 = _v select 0;
_v = [(trptConvoy_3 modelToWorld [0,-15,0]), getDir trptConvoy_1, "O_Truck_03_repair_F", _c] call BIS_fnc_spawnVehicle; trptConvoy_4 = _v select 0;
_c setCombatMode "GREEN";
_wp = _c addWaypoint [getMarkerPos "mConvoy_1",0]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp = _c addWaypoint [getMarkerPos "mConvoy_2",1]; _wp setWaypointType "MOVE"; 
_wp = _c addWaypoint [getMarkerPos "mConvoy_3",2]; _wp setWaypointType "MOVE"; 
_wp = _c addWaypoint [getMarkerPos "mConvoy_4",3]; _wp setWaypointType "MOVE"; 
_wp = _c addWaypoint [getMarkerPos "mConvoy_5",4]; _wp setWaypointType "MOVE";
_wp = _c addWaypoint [getMarkerPos "mConvoy_end",5]; _wp setWaypointType "MOVE"; _wp setWaypointBehaviour "SAFE"; _wp setWaypointSpeed "NORMAL";
_wp setWaypointStatements ["true", "[[trptConvoy_1,trptConvoy_2,trptConvoy_3,trptConvoy_4]] call ADF_fnc_DeleteVehicles"];

while {!(isNil "trptConvoy_1")} do {
	trptConvoy_1 limitSpeed 30;		
	trptConvoy_2 limitSpeed (speed trptConvoy_1);
	trptConvoy_3 limitSpeed (speed trptConvoy_1);
	trptConvoy_4 limitSpeed (speed trptConvoy_1);	
	sleep 1;
};
