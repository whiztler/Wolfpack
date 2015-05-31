// Mission Objective Test Script
// DAY 1

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true;

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
	[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};

sleep 3;
[{systemChat "Teleporting to first objective: Maj. F. Kallaziz"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  


{
	_x setCaptive true;
	_x allowDamage false;
	_x setPos (getMarkerPos "mObj1");
} forEach playableUnits;
sleep 3;

[{systemChat "Clearing the objective"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getMarkerPos "mObj1", ["Man"], 150];

[{systemChat "Package eliminated, Objective cleared"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 3;

[{systemChat "Teleporting to exfil location..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{
	_x setPos (getMarkerPos "pos_obj_exfil");
	_x setCaptive false;
} forEach playableUnits;

sleep 10;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
