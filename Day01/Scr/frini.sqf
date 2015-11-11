ADF_fnc_kallaziz = {
	if (!isServer) exitWith {};
	private ["_lzP","_lzA","_lzK","_k","_c","_v","_wp","_wp1"];
	
	_lzP = [14156.8,21254.6,0];
	_lzA = [14248,16229.9,0];
	_lzK = [14222.8,21211.9,0];
	_k = gKallaziz;

	_c = creategroup EAST; 
	_v = [_lzA, 310, "O_Heli_Light_02_unarmed_F", _c] call BIS_fnc_spawnVehicle;
	_k = _k; { _x assignAsCargo (_v select 0); _x moveInCargo (_v select 0);} foreach units _k;

	_wp = _c addWaypoint [_lzP, 0];
	_wp setWaypointType "TR UNLOAD";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointStatements ["true", "this land 'LAND';"];

	_wp1 = _c addWaypoint [_lzA, 1];
	_wp1 setWaypointType "GETOUT";
	_wp1 setWaypointBehaviour "SAFE";
	_wp1 setWaypointSpeed "NORMAL";
	_wp1 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle _v) + [(vehicle _v)];"];
	
	_wp = _k addWaypoint [_lzK, 2];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "LINE";
};

private "_snooze";
_snooze = [700,750,800,850,900,950,1000] call BIS_fnc_selectRandom;
sleep _snooze;
call ADF_fnc_kallaziz;

if (hasInterface) then {
	hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>	<t color='#6C7169' align='left'>Big Foot: Phoenix, Satnav just pick up a helicopter heading towards the Frini base. This must be the package. Get into position to take him out.<br /></t>	";

	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Big Foot: Phoenix, Satnav just pick up a helicopter heading towards the Frini base. This must be the package. Get into position to take him out.</font>
	"]];
};