// Mission Objective Test Script
// DAY 5

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true;

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};


[{systemChat "Waiting for 'intel location' to initialize"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
waitUntil {tIntelSet}; sleep 2;
[{systemChat "Teleporting to first objective: intel location"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; 
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos tIntel, ["Man"], 350];
{
	_x setCaptive true;
	_x allowDamage false;
	_x setPos (getPos tIntel);
} forEach playableUnits;
sleep 5;

[{systemChat "Disabling 'setCaptive' for 1 second to activate trigger"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; 
{_x setCaptive false} forEach playableUnits; sleep 1.5;
[{systemChat "Enabling 'setCaptive'"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; 
{_x setCaptive true} forEach playableUnits; sleep 10;
[{systemChat "Intel scripts running"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 30;
[{systemChat "Teleporting to exfil location..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{
	_x setPos (getPos mLand_2);
} forEach playableUnits;

sleep 10;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Get in one of the Assault Vessels and head West and then South towards the Mediterranean Sea"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  90 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  80 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  70 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  60 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  50 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  40 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  30 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  20 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "The exfil trigger only works with BlueFor units. Disabling 'SetCaptinve' in  10 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
{_x setCaptive false} forEach playableUnits;
[{systemChat "'SetCaptinve' has been disabled"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
