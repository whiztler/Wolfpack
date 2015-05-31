// Mission Objective Test Script
// DAY 4

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true;

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};

sleep 3;
[{systemChat "Teleporting to first objective: ABC Headquarters"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

{
	_x setcaptive true;
	_x allowDamage false;
	_x setPos (getMarkerPos "mABC");
} forEach playableUnits;
sleep 3;

[{systemChat "Destroying the ABC HQ generators"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

gen_1 setDamage 1; sleep .3;
gen_2 setDamage 1; sleep .3;
gen_3 setDamage 1; sleep .3;
gen_4 setDamage 1; sleep .3;
gen_5 setDamage 1; sleep .3;
gen_6 setDamage 1; sleep .3;

[{systemChat "All generators destroyed!"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 3;
[{systemChat "Teleporting to next objective: "},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{_x setPos (getPos tABC2)} forEach playableUnits; sleep 3;
[{systemChat "Destroying the spare generators"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; 

gen_10 setDamage 1; sleep .3;
gen_11 setDamage 1; sleep .3;

[{systemChat "Teleporting to exfil location in 10 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;
[{systemChat "Teleporting..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{
	_x setPos (getPos tExfil);
	_x setCaptive false;
} forEach playableUnits;

sleep 10;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  