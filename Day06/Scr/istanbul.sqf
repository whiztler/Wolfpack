waitUntil {sleep 2; ((!alive sAA_1) && (!alive sAA_2) && (!alive sAA_3) && (!alive sAA_4) && (!alive sAA_5))};
// sAA_1 setDamage 1; sAA_2 setDamage 1; sAA_3 setDamage 1; sAA_4 setDamage 1; sAA_5 setDamage 1;

if (hasInterface) then {
	sleep 5;
	hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Uncle: I think you got all AA emplacements Viper. Job well done!<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Uncle: I think you got all AA emplacements Viper. Job well done!</font>
	<br/><br/>"]];
};

sleep 10;
objInstanbul = 1; publicVariable "objInstanbul";

if (objBarcelona == 0) exitWith {
	if (!hasInterface) exitWith {};
	sleep 10;
	hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Uncle: Viper proceed to your next objective, the radar installation at Barcelona<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Uncle: Viper proceed to your next objective, the radar installation at Barcelona</font>
	<br/><br/>"]];
};

if ((objInstanbul == 1) && (objBarcelona == 1)) exitWith {
	sleep 30;

	if (hasInterface) then {
		hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Uncle: Viper, Satnav shows both objectives are completed.<br/><br/>Exfil is at </t><t color='#9DA698' align='left'>Agios Kosmas</t><t color='#6C7169' align='left'>. We'll upload the location to your ComLink. Exfil callsign is </t><t color='#9DA698' align='left'>Naples<br/></t>";
		_logTime = [dayTime] call BIS_fnc_timeToString;
		_logTimeText = "Log: " + _logTime;
		player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
		<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
		<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
		<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
		<font color='#6c7169'>Uncle: Viper, Satnav shows both objectives are completed.<br/><br/>Exfil is at </font><font color='#9DA698'>Agios Kosmas</font><font color='#6C7169'>. We'll upload the location to your ComLink. Exfil callsign is </font><font color='#9DA698'>Naples</font>
		<br/><br/>"]];
	};

	if (isServer) then {
		private ["_m","_c","_v"];
		if !(isNil "vExf1") exitWith {}; // exfil already created
		_m = createMarker ["exfil", getMarkerPos "mExf2"];
		_m setMarkerSize [1,1];
		_m setMarkerShape "ICON";
		_m setMarkerType "hd_pickup";
		_m setMarkerColor "ColorWEST";
		_m setMarkerDir 0;
		_m setMarkerText "Naples";
		
		if !(isNil "vAP1") then {{deleteVehicle _x} forEach (crew vAP1); deleteVehicle vAP1; vAP1 = nil};
		if !(isNil "vNP1") then {{deleteVehicle _x} forEach (crew vNP1); deleteVehicle vNP1; vNP1 = nil};				
	
		_c = createGroup WEST;
		_v = [getMarkerPos "mExf1", markerDir "mExf1", "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle; 
		vExf1 = _v select 0;
		vExf1 setFuel 0;
		_v = [getMarkerPos "mExf2", markerDir "mExf2", "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle;
		vExf2 = _v select 0;
		vExf2 setFuel 0;	
	};	
};
