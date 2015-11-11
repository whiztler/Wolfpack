if !(isServer) exitWith {};
private ["_g","_p"];
_g = CreateGroup CIVILIAN;	
_p = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc2_1",[],0,"CORPORAL"]; _p addVest "V_BandollierB_oli"; _p setDir 280; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_p = _g createUnit ["C_man_p_fugitive_F",getMarkerPos "rc2_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 90; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_p = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc2_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 100; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon;

// Cleanup Camp1
private "_q";
_q = nearestObjects [getPos trigRCamp_1, ["all"], 50];
while {true} do {
	{deleteVehicle _x} forEach _q
};