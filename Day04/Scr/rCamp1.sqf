_g = [];
_u = [];

if !(isServer) exitWith {};

_g = CreateGroup CIVILIAN;
_u = _g createUnit ["C_Nikos",getMarkerPos "rc1_Nikkos",[],0,"MAJOR"]; _u setDir 10; _u addVest "V_BandollierB_oli"; [_u, "arifle_TRG21_GL_MRCO_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_g = CreateGroup CIVILIAN;	
_u = _g createUnit ["C_man_u_fugitive_F",getMarkerPos "rc1_1",[],0,"CORPORAL"]; _u addVest "V_BandollierB_oli"; _u setDir 280; _u addWeapon "LMG_Zafir_uointer_F"; sleep .05; 
_u = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc1_1",[],0,"PRIVATE"]; _u addVest "V_BandollierB_oli"; _u setDir 90; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_u = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc1_1",[],0,"PRIVATE"]; _u addVest "V_BandollierB_oli"; _u setDir 100; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .2; 
_g = CreateGroup CIVILIAN;
_u = _g createUnit ["C_man_u_fugitive_F",getMarkerPos "rc1_2",[],0,"CORPORAL"]; _u addVest "V_BandollierB_oli"; _u setDir 280; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_u = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc1_2",[],0,"PRIVATE"]; _u addVest "V_BandollierB_oli"; _u setDir 90; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_u = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc1_2",[],0,"PRIVATE"]; _u addVest "V_BandollierB_oli"; _u setDir 100; [_u, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 



