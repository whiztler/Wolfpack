diag_log "ADF RPT: Init - executing Scr\init_server.sqf"; // Reporting. Do NOT edit/remove

call compile preprocessFileLineNumbers "Core\F\ADF_fnc_position.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_distance.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_defendArea.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_vehiclePatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_footPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_seaPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_airPatrol.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_objectMarker.sqf";

{[_x] execVM "Core\C\ADF_cCargo_B_SpecOps.sqf"} forEach [wolfCrate_1,wolfCrate_2,wolfCrate_3,wolfCrate_4];
[wolfCrateDemo] execVM "Core\C\ADF_cCargo_B_Demo.sqf";
[wolfCrateWet] execVM "Core\C\ADF_cCargo_B_WetGear.sqf";

{if (_x isKindOf "man" && side _x == WEST) then {[_x,"CLANPATCH"] call BIS_fnc_setUnitInsignia}} forEach allUnits;

// Rodopoli
obj_rodo_1 addEventHandler ["killed", {[] call ADF_fnc_objRodopoli}];
obj_rodo_2 addEventHandler ["killed", {[] call ADF_fnc_objRodopoli}];
obj_rodo_3 addEventHandler ["killed", {[] call ADF_fnc_objRodopoli}];
obj_rodo_4 addEventHandler ["killed", {[] call ADF_fnc_objRodopoli}];

ADF_fnc_objRodopoli = { 
	if ((alive obj_rodo_1) || (alive obj_rodo_2) || (alive obj_rodo_3) || (alive obj_rodo_4)) exitWith {};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Rodopoli objective completed";diag_log "-----------------------------------------------------";
	["Rodopoli Communications Station"] remoteExec ["ADF_fnc_taskObjective",-2,true];
	"mOpforUrban_1" setMarkerColor "ColorBlue";
	"mObjComm" setMarkerColor "ColorBlue";
	deleteVehicle tRodopoli;
	if !(isNil "tRodoInner") then {deleteVehicle tRodoInner;};
};

// Paros
obj_paros_1 addEventHandler ["killed", {[] call ADF_fnc_objParos}];
obj_paros_2 addEventHandler ["killed", {[] call ADF_fnc_objParos}];
obj_paros_3 addEventHandler ["killed", {[] call ADF_fnc_objParos}];
obj_paros_4 addEventHandler ["killed", {[] call ADF_fnc_objParos}];

ADF_fnc_objParos = { 
	if ((alive obj_paros_1) || (alive obj_paros_2) || (alive obj_paros_3) || (alive obj_paros_4)) exitWith {};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Paros objective completed";diag_log "-----------------------------------------------------";
	["Paros Supply Convoy"] remoteExec ["ADF_fnc_taskObjective",-2,true];
	"mOpforUrban" setMarkerColor "ColorBlue";
	if !(isNil "tParos") then {deleteVehicle tParos};
	if !(isNil "tParosInner") then {deleteVehicle tParosInner;};
};

// AA-Site
oStat_7 addEventHandler ["killed", {[] call ADF_fnc_objAAsite}];

ADF_fnc_objAAsite = { 
	if !(isNil "tAA") then {deleteVehicle tAA;};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: AA site objective completed";diag_log "-----------------------------------------------------";
	"mCP_30" setMarkerColor "ColorBlue";
	["CSAT Anti-Air Site"] remoteExec ["ADF_fnc_taskObjective",-2,true];
};

// Arti Site
oArti1 addEventHandler ["killed", {[] call ADF_fnc_objArtiSite}];
oArti2 addEventHandler ["killed", {[] call ADF_fnc_objArtiSite}];
oArti3 addEventHandler ["killed", {[] call ADF_fnc_objArtiSite}];

ADF_fnc_objArtiSite = { 
	if ((alive oArti1) || (alive oArti2) || (alive oArti3)) exitWith {};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Arti site objective completed";diag_log "-----------------------------------------------------";
	if !(isNil "tArti") then {deleteVehicle tArti;};	
	if !(isNil "tArtiInner") then {deleteVehicle tArtiInner;};
	"mCP_11" setMarkerColor "ColorBlue";
	["2S9 Artillery Base"] remoteExec ["ADF_fnc_taskObjective",-2,true];
};

// Heliport
obj_airpt_1 addEventHandler ["killed", {[] call ADF_fnc_objHeliport}];
obj_airpt_2 addEventHandler ["killed", {[] call ADF_fnc_objHeliport}];

ADF_fnc_objHeliport = {
	if ((alive obj_airpt_1) || (alive obj_airpt_2)) exitWith {};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Heliport objective completed";diag_log "-----------------------------------------------------";
	if !(isNil "tAirpt") then {deleteVehicle tAirpt;};
	if !(isNil "tAirptHeli") then {deleteVehicle tAirptHeli;};
	"mOpforRotor" setMarkerColor "ColorBlue";
	["CSAT Airforce Heliport"] remoteExec ["ADF_fnc_taskObjective",-2,true];
};

// Fuel Depot
obj_depot_1 addEventHandler ["killed", {[] call ADF_fnc_objDepot}];
obj_depot_2 addEventHandler ["killed", {[] call ADF_fnc_objDepot}];
obj_depot_3 addEventHandler ["killed", {[] call ADF_fnc_objDepot}];
obj_depot_4 addEventHandler ["killed", {[] call ADF_fnc_objDepot}];

ADF_fnc_objDepot = { // Fuel Depot
	if ((alive obj_depot_1) || (alive obj_depot_2) || (alive obj_depot_3) || (alive obj_depot_4)) exitWith {};
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Fuel depot objective completed";diag_log "-----------------------------------------------------";
	if !(isNil "tFuelDepot") then {deleteVehicle tFuelDepot;};
	if !(isNil "tDepot") then {deleteVehicle tDepot;};
	"mDepot" setMarkerColor "ColorBlue";	
	["CSAT Fuel Depot"] remoteExec ["ADF_fnc_taskObjective",-2,true];
};

// Hotel
ADF_fnc_objHotel = {
	diag_log "-----------------------------------------------------";diag_log "WOLFPACK: Fuel depot objective completed";diag_log "-----------------------------------------------------";
	if !(isNil "tHotel") then {deleteVehicle tHotel;};
	"mHotel" setMarkerColor "ColorBlue";
	["CSAT Colonel H.V.T."] remoteExec ["ADF_fnc_taskObjective",-2,true];
};
