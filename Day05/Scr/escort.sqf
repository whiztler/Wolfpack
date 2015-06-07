if (!isServer) exitWith {};

_pause = [5,10,20,30,60,90] call BIS_fnc_selectRandom; sleep _pause;
fbEndPos = {private ["_endPos"]; _endPos = ["mAFB2a","mAFB2b","mAFB2c"] call BIS_fnc_selectRandom; _endPos;};	

// Ambient flyby's	
_fbEndPos = [] call fbEndPos; [getMarkerPos "mAFB1c", getMarkerPos _fbEndPos, 15, "NORMAL", "O_Heli_Light_02_F", EAST] call BIS_fnc_ambientFlyby; sleep 12;
_fbEndPos = [] call fbEndPos; [getMarkerPos "mAFB1d", getMarkerPos _fbEndPos, 90, "LIMITED", "O_Heli_Transport_04_medevac_F", EAST] call BIS_fnc_ambientFlyby; sleep 6;
_fbEndPos = [] call fbEndPos; [getMarkerPos "mAFB1d", getMarkerPos _fbEndPos, 90, "LIMITED", "O_Heli_Transport_04_medevac_F", EAST] call BIS_fnc_ambientFlyby;

if !(isnil "mRV") then {deleteMarker "mRV";};


