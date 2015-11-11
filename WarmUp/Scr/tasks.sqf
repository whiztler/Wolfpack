// Objective Checks

fnc_WTT_ObjSuccess = {
	if (!hasInterface) exitWith {};
	params ["_obj"];
	hintSilent parseText format["<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#A1A4AD' size='1.7'>Wolfpack W.T.T.</t><br/><br/><t color='#9DA698' size='1.3'>%1</t><br/><br/><t color='#6C7169' size='1.1'>Objective Completed!</t><br/><br/>",_obj];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<t color='#A1A4AD' size='17'>Wolfpack W.T.T.</t><br/><br/>
	<font color='#6c7169'>" + _obj + "</font><font color='#6c7169'> Objective Completed!</font>
	"]];
};

if (!isServer) exitWith {};

[] spawn { // Rodopoli
	waitUntil {sleep 3; !(alive obj_rodo_1) && !(alive obj_rodo_2) && !(alive obj_rodo_3) && !(alive obj_rodo_4)};
	["Rodopoli Communications Station"] remoteExec ["fnc_WTT_ObjSuccess",-2];
	mOpforUrban_1 setMarkerColor "ColorBlue";
	mObjComm setMarkerColor "ColorBlue";
	deleteVehicle tRodopoli;
	if !(isNil "tRodoInner") then {deleteVehicle tRodoInner;};
};

[] spawn { // Paros
	waitUntil {sleep 3; !(alive obj_paros_1) && !(alive obj_paros_2) && !(alive obj_paros_3) && !(alive obj_paros_4)};
	["Paros Supply Convoy"] remoteExec ["fnc_WTT_ObjSuccess",-2];
	mOpforUrban setMarkerColor "ColorBlue";
	deleteVehicle tParos;
	if !(isNil "tParosInner") then {deleteVehicle tParosInner;};
};

[] spawn { // AA-Site
	waitUntil {sleep 3; !(alive oStat_7)};
	if !(isNil "tAA") then {deleteVehicle tAA;};
	mCP_30 setMarkerColor "ColorBlue";
	["CSAT Anti-Air Site"] remoteExec ["fnc_WTT_ObjSuccess",-2];
};

[] spawn { // Arti Site
	waitUntil {sleep 3; !(alive oArti1) && !(alive oArti2) && !(alive oArti3)};
	if !(isNil "tArti") then {deleteVehicle tArti;};	
	if !(isNil "tArtiInner") then {deleteVehicle tArtiInner;};
	mCP_11 setMarkerColor "ColorBlue";
	["2S9 Artillery Base"] remoteExec ["fnc_WTT_ObjSuccess",-2];
};

[] spawn { // Heliport
	waitUntil {sleep 3; !(alive obj_airpt_1) && !(alive obj_airpt_2)};
	if !(isNil "tAirpt") then {deleteVehicle tAirpt;};
	if !(isNil "tAirptHeli") then {deleteVehicle tAirptHeli;};
	mOpforRotor setMarkerColor "ColorBlue";
	["CSAT Airforce Heliport"] remoteExec ["fnc_WTT_ObjSuccess",-2];
};

[] spawn { // Fuel Depot
	waitUntil {sleep 3; !(alive obj_depot_1) && !(alive obj_depot_2) && !(alive obj_depot_3) && !(alive obj_depot_4)};
	if !(isNil "tFuelDepot") then {deleteVehicle tFuelDepot;};
	if !(isNil "tDepot") then {deleteVehicle tDepot;};
	mDepot setMarkerColor "ColorBlue";	
	["CSAT Fuel Depot"] remoteExec ["fnc_WTT_ObjSuccess",-2];
};

// Hotel task incl in init






