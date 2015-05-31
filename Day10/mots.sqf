// Mission Objective Test Script
// DAY 10

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true; publicVariable "MotsActive";

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
while {time < 260} do {
	[{systemChat "Waiting for mission init to finish (4 minutes!)."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
	sleep 15;
};
waitUntil {time > 260};

sleep 3;
[{systemChat "Teleporting to the objective: General Tehrani"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
{
	_x setCaptive true;
	_x allowDamage false;
	_x setPos (getPos Tehrani);
} forEach playableUnits;
sleep 3;

[{systemChat "Eliminating the package"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  sleep 2;
Tehrani setDamage 1; sleep 3;
[{systemChat "Package eliminated, Objective cleared"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 3;

[{systemChat "Teleporting to exfil location..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{
	_x setPos (getPosASL hEvac);
	_x setCaptive false;
} forEach playableUnits;

sleep 10;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Use the helicopter on the roof of the hospital to exfil...."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
