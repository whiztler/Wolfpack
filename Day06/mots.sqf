// Mission Objective Test Script
// DAY 6

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true;

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};

sleep 3;
[{systemChat "Teleporting to first objective: Barcalona"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

{
	_x setCaptive true;
	_x allowDamage false;
	_x setPos (getMarkerPos "mBarca");
} forEach playableUnits;
sleep 3;

[{systemChat "Destroying the Radar Complex"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
radar_1 setDamage 1;
[{systemChat "Radar Complex destroyed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;

[{systemChat "Teleporting to next objective: Istanbul"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;

{_x setPos (getMarkerPos "mIstanbul")} forEach playableUnits; sleep 3;
[{systemChat "Destroying AA Emplacements"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;

_obj = [sAA_1,sAA_2,sAA_3,sAA_4,sAA_5];
{_x setDamage 1;sleep .5} forEach _obj;
[{systemChat "All AA-emplacements destroyed. All objectives completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;

[{systemChat "Teleporting to exfil location..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{
	_x setCaptive false;
	_x setPos (getPos tExfilEnd);	
} forEach playableUnits;

sleep 3;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
