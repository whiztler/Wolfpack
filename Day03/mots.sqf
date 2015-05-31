// Mission Objective Test Script
// DAY 3

if !(isNil "MotsActive") exitWith {hint "MOTS has already been executed"};
MotsActive = true;

[{systemChat "Mission Objective Test Script started..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  
if (time < 31) then {
[{systemChat "Waiting for mission init to finish."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;
};
waitUntil {time > 30};

sleep 3;
[{systemChat "Teleporting to first objective: PowerSation"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

{
	_x setcaptive true;
	_x allowDamage false;
	_x setPos (getPosASL tPP);
} forEach playableUnits;
sleep 3;

[{systemChat "Destroying Generators 1-9"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  

gen_1 setDamage 1; sleep .3;
gen_2 setDamage 1; sleep .3;
gen_3 setDamage 1; sleep .3;
gen_4 setDamage 1; sleep .3;
gen_5 setDamage 1; sleep .3;
gen_6 setDamage 1; sleep .3;
gen_7 setDamage 1; sleep .3;
gen_8 setDamage 1; sleep .3;
gen_9 setDamage 1; sleep .3;

[{systemChat "All generators destroyed!"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 3;
[{systemChat "Teleporting to next objective"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
{_x setPos (getMarkerPos "pos_obj_tower")} forEach playableUnits; sleep 3;
[{systemChat "Tagging communication objectives"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;

tt1 = 1; publicVariable "tt1"; hintSilent "Radar tower 1 tagged successfully"; sleep 1;
tt2 = 1; publicVariable "tt2"; hintSilent "Radar tower 2 tagged successfully"; sleep 1;
tt3 = 1; publicVariable "tt3";  hintSilent "Radar Installation tagged successfully"; sleep 1;

[{systemChat "Running CommTower/Exfil scripts"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;

_comm = execVM "Scr\commtower.sqf";
waitUntil {scriptDone _comm};

[{systemChat "Teleporting to exfil location in 90 seconds"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
sleep 90;
[{systemChat "Teleporting..."},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 2;
sleep 1;
{
	_x setPos (getPos mStadium_1);
	_x setCaptive false;
} forEach playableUnits;

sleep 10;
[{systemChat "Running exfil as normal"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP; sleep 5;
[{systemChat "Mission Objective Test Script completed"},"BIS_fnc_call",true,false] spawn BIS_fnc_MP;  