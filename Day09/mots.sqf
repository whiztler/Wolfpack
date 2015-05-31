// Mission Objective Test Script
// DAY 9

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true; publicVariable "MotsActive";

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

while {time < 121} do {
	[{systemChat "Waiting for mission init to finish (2 minutes!)."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
	sleep 15;
};
waitUntil {time > 120};

sleep 3;
[{systemChat "Teleporting to the objective: Stratis AB"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

{_x setCaptive true} forEach playableUnits;
{	
	_x allowDamage false;
	_x setPos (getPosASL tStratisAB);
} forEach playableUnits;
sleep 3;

[{systemChat "Destroying the CSAT fighter planes"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;

_jets = [obj_1,obj_2,obj_3,obj_4,obj_5,obj_6,obj_7,obj_8,obj_9];
{_x setDamage 1;sleep .5} forEach _jets;
[{systemChat "All aircraft destroyed. Objective completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 30;

[{systemChat "Teleporting to exfil location..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{
	_x setPos (getPos tExfil);
	_x setCaptive false;
} forEach playableUnits;

sleep 10;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
