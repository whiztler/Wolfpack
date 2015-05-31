// Objective Checks

fnc_WTT_ObjSuccess = {
	private ["_obj"];
	_obj = _this select 0;
	hint parseText format["
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#A1A4AD' size='1.7'>Wolfpack W.T.T.</t><br/><br/>
		<t color='#9DA698' size='1.3'>%1</t><br/><br/>
		<t color='#6C7169' size='1.1'>Objective Completed!</t><br/><br/>
	",_obj];
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
	waitUntil {sleep 2; !(alive obj_rodo_1) && !(alive obj_rodo_2) && !(alive obj_rodo_3) && !(alive obj_rodo_4)};
	["Rodopoli Communications Station"] call fnc_WTT_ObjSuccess;
	deleteMarker "mOpforUrban_1";
	deleteMarker "mObjComm";
};

[] spawn { // Paros
	waitUntil {sleep 2.1; !(alive obj_paros_1) && !(alive obj_paros_2) && !(alive obj_paros_3) && !(alive obj_paros_4)};
	["Paros Supply Convoy"] call fnc_WTT_ObjSuccess;
	deleteMarker "mOpforUrban";
};

[] spawn { // AA-Site
	waitUntil {sleep 2.2; !(alive oStat_7)};
	["CSAT Anti-Air Site"] call fnc_WTT_ObjSuccess;
};

[] spawn { // Arti Site
	waitUntil {sleep 2.3; !(alive oArti1) && !(alive oArti2) && !(alive oArti3)};
	["2S9 Artillery Base"] call fnc_WTT_ObjSuccess;
};

[] spawn { // Heliport
	waitUntil {sleep 2.4; !(alive obj_airpt_1) && !(alive obj_airpt_2)};
	["CSAT Airforce Heliport"] call fnc_WTT_ObjSuccess;
};

[] spawn { // Fuel Depot
	waitUntil {sleep 2.5; !(alive obj_depot_1) && !(alive obj_depot_2) && !(alive obj_depot_3) && !(alive obj_depot_4)};
	["CSAT Fuel Depot"] call fnc_WTT_ObjSuccess;
};

// Hotel task incl in init




