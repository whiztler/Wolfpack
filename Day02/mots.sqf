// Mission Objective Test Script
// DAY 2

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true; publicVariable "MotsActive";

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};

sleep 3;
[{systemChat "Teleporting to first objective: Krya Nero"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

{
	_x setCaptive true;
	_x allowDamage false;
	_x setPos (getPosASL telep);
} forEach playableUnits;
sleep 3;

[{systemChat "Clearing the objective"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
{if (side _x == EAST) then {_x setDamage 1}} forEach nearestObjects [getPos kryasite, ["Man"], 150];
[{systemChat "Krya Nera cleared"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 3;

[{systemChat "Running mission scripts"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 3;
[{systemChat "Please execute the Tomahawk strike manually > Radio Delta [0-0-4]."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Teleporting to next objective in 90 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 80 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 70 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 60 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 50 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 40 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 30 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 20 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting to next objective in 10 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;

[{systemChat "Teleporting to next objective: Abdera Airport"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;

{_x setPos (getPos mLand_1)} forEach playableUnits; sleep 3;
[{systemChat "Destroying Kajman Gunships"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;

_kaj = [kaj_01,kaj_02,kaj_03,kaj_04,kaj_05,kaj_06];
{_x setDamage 1;sleep .5} forEach _kaj;
[{systemChat "All Kajmans destroyed. Objective completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 3;

[{systemChat "Teleporting to exfil location..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{
	_x setPos (getMarkerPos "mC4");
	_x setCaptive false;
} forEach playableUnits;

sleep 10;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
