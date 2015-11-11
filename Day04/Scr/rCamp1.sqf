if !(isServer) exitWith {};
private ["_g","_p"];
_g = CreateGroup CIVILIAN;
_p = _g createUnit ["C_Nikos",getMarkerPos "rc1_Nikkos",[],0,"MAJOR"]; _p setDir 10; _p addVest "V_BandollierB_oli"; [_p, "arifle_TRG21_GL_MRCO_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_g = CreateGroup CIVILIAN;	
_p = _g createUnit ["C_man_p_fugitive_F",getMarkerPos "rc1_1",[],0,"CORPORAL"]; _p addVest "V_BandollierB_oli"; _p setDir 280; _p addWeapon "LMG_Zafir_pointer_F"; sleep .05; 
_p = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc1_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 90; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_p = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc1_1",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 100; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .2; 
_g = CreateGroup CIVILIAN;
_p = _g createUnit ["C_man_p_fugitive_F",getMarkerPos "rc1_2",[],0,"CORPORAL"]; _p addVest "V_BandollierB_oli"; _p setDir 280; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_p = _g createUnit ["C_man_w_worker_F",getMarkerPos "rc1_2",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 90; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 
_p = _g createUnit ["C_man_hunter_1_F",getMarkerPos "rc1_2",[],0,"PRIVATE"]; _p addVest "V_BandollierB_oli"; _p setDir 100; [_p, "arifle_TRG21_ARCO_pointer_F", 4, "30Rnd_556x45_Stanag"] call BIS_fnc_addWeapon; sleep .05; 



