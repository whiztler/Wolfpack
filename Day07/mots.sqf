// Mission Objective Test Script
// DAY 7

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true;

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
	[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};

sleep 3;
[{systemChat "Teleporting to Nikkos' location: U-12"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

{
	_x setCaptive true;
	_x allowDamage false;
	_x setPos (getPos uNikkos);
} forEach playableUnits;
sleep 3;

[{systemChat "Use action menu to 'rescue Nikkos'"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
waitUntil {NikkosRescued};
[{systemChat "Teleporting to the RV"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 10;

{
	_x setCaptive false;
	_x setPos (getMarkerPos "mRV");	
} forEach playableUnits;

uNikkos setPos (getMarkerPos "mRV");

[{systemChat "Teleporting Assault Vessel to the RV"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
vWolf_1 setPos (getMarkerPos "mWolf1MOTS");
vWolf_1 setDir 135;

[{systemChat "Have Nikkos board the Assault Vessel and head south east"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
sleep 3;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; 