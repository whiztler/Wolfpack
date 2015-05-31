// Mission Objective Test Script
// DAY 8

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true;

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};

while {isNil "tIceTiger"} do {
	[{systemChat "Waiting for 'Ice Tiger location' to initialize..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
	sleep 15;
};
sleep 5;
[{systemChat "Teleporting to Ice Tiger location"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; 
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos tIceTiger, ["Man"], 500];
{
	//_x setCaptive true;
	_x allowDamage false;
	_x setPos (getPos tIceTiger);
} forEach playableUnits;
sleep 5;

[{systemChat "Tag a few of the T100 MBT's by approaching them"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; 

waitUntil {
	triggerActivated tObj1 ||
	triggerActivated tObj2 ||
	triggerActivated tObj3 ||
	triggerActivated tObj4 ||
	triggerActivated tObj5 ||
	triggerActivated tObj6
};

{_x setCaptive true} forEach playableUnits;
[{systemChat "Wait for 5 minutes for mission to complete"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
