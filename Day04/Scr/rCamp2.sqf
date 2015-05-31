_g = [];
_u = [];

if !(isServer) exitWith {};

_g = CreateGroup CIVILIAN;	
_u = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc2_1",[],0,"CORPORAL"]; _u addVest "V_BandollierB_oli"; _u setDir 280; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_u = _g createUnit ["C_man_p_fugitive_F",getMarkerPos "rc2_1",[],0,"PRIVATE"]; _u addVest "V_BandollierB_oli"; _u setDir 90; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_u = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc2_1",[],0,"PRIVATE"]; _u addVest "V_BandollierB_oli"; _u setDir 100; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon;

// Cleanup Camp1
_q = nearestObjects [getPos trigRCamp_1, ["all"], 50];
while {true} do {
	{deleteVehicle _x} forEach _q
};