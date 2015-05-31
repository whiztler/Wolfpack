if (alive Kallaziz_1) then {
	hintSilent parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Big Foot: Satnav reports reports increased activity at and around the objective. You may have been detected. Do not let the package get away! Out.</t>
	";
	
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
		<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
		<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
		<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
		<font color='#6c7169'>Big Foot: Satnav reports reports increased activity at and around the objective. You may have been detected. Do not let the package get away! Out.</font>
	"]];
};

if (!isServer) exitWith {}; 

{
	if (side _x == EAST) then {
		_x setBehaviour "AWARE";
		_x setCombatMode "RED";
		_x setskill 0.65;		
	};
} forEach allUnits;

// {if (side _x == EAST) then {_x setBehaviour "AWARE"}} forEach ((getPosATL ObjectName) nearEntities ["All", 200]);



