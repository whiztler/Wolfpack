#include "ADF_JIP.sqf"

waitUntil {!alive radar_1};

// radar_1 setDamage 1;

sleep 5;

hint parseText"
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>Uncle: Mighty fireworks Viper!<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>Uncle: Mighty fireworks Viper!</font>
<br/><br/>"]];

objBarcelona = 1; publicVariable "objBarcelona";

if  (objInstanbul == 0) exitWith {
	sleep 20;
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Uncle: Viper proceed to your next objective, the AA-emplacements at Istanbul.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Uncle: Viper proceed to your next objective, the AA-emplacements at Istanbul.</font>
	<br/><br/>"]];	
};

if ((objInstanbul == 1) && (objBarcelona == 1)) exitWith {

	sleep 30;

	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Uncle: Viper, Satnav shows both objectives are completed.<br/><br/>Exfil is at </t><t color='#9DA698' align='left'>Agios Kosmas</t><t color='#6C7169' align='left'>. We'll upload the location to your ComLink. Exfil callsign is </t><t color='#9DA698' align='left'>Naples<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Uncle: Viper, Satnav shows both objectives are completed.<br/><br/>Exfil is at </font><font color='#9DA698'>Agios Kosmas</font><font color='#6C7169'>. We'll upload the location to your ComLink. Exfil callsign is </font><font color='#9DA698'>Naples</font>
	<br/><br/>"]];		
	
	_c = []; _v = [];

	if (isServer) then {
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
		sleep 0.5;
		_v = [getMarkerPos "mExf2", markerDir "mExf2", "B_Boat_Armed_01_minigun_F", _c] call BIS_fnc_spawnVehicle;
		vExf2 = _v select 0;
		vExf2 setFuel 0;	
	}	
};
