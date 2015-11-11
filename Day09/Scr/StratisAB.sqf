if (hasInterface) then {
	hintSilent parseText "<img size= '5' shadow='false' image='Img\wolf_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye this is Cowboy, we are closing in to the airbase. How copy?<br/></t>";

	sleep 10;

	hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: Copy Cowboy. Move in closer. We are repositioning the satellite. Standby for orders.</t><br/>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: Copy Cowboy. Move in closer. We are repositioning the satellite. Standby for orders.</font>
	<br/><br/>"]];
};

if (!MotsActive) then {sleep 300};

if (hasInterface) then {
	hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: Cowboy, SatNav shows nine or ten TO-199's. These can be a real pain in the ass during the campaign. You have been tasked to them them out.</t><br/><br/><t color='#6C7169' align='left'>Cowboy, you orders are to destroy any and all TO-199 fight jet aircraft at Stratis Airbase. We have</t><t color='#9DA698' align='left'> 9 </t><t color='#6C7169' align='left'>confirmed targets.</t><br/><br/><t color='#6C7169' align='left'>Good luck Cowboy!</t><br/>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Eagle Eye: Cowboy, SatNav shows nine or ten TO-199's. These can be a real pain in the ass during the campaign. You have been tasked to them them out.</font><br/><br/>
	<font color='#6C7169'>Cowboy, you orders are to destroy any and all TO-199 fight jet aircraft at Stratis Airbase. We have</font>
	<font color='#9DA698'> 9 </font>
	<font color='#6C7169'>confirmed targets.</font><br/><br/>
	<font color='#6C7169'>Good luck Cowboy!</font>
	<br/><br/>"]];
};

waitUntil {
	sleep 5;
	(
		!(alive obj_1) && 
		!(alive obj_2) && 
		!(alive obj_3) && 
		!(alive obj_4) && 
		!(alive obj_5) && 
		!(alive obj_6) && 
		!(alive obj_7) && 
		!(alive obj_8) && 
		!(alive obj_9)
	);
};

objDone = true; publicVariable "objDone";

//obj_1 setDamage 1; obj_2 setDamage 1; obj_3 setDamage 1; obj_4 setDamage 1; obj_5 setDamage 1; obj_6 setDamage 1; obj_7 setDamage 1; obj_8 setDamage 1; obj_9 setDamage 1

if (isServer) exitWith {
	private ["_m","_c","_v"];
	_m = createMarker ["mExfil2", getMarkerPos "mExfil"];
	_m setMarkerShape "ICON";
	_m setMarkerType "mil_end";
	_m setMarkerColor "ColorWEST";
	_m setMarkerDir 0;
	_m setMarkerText "Bombay";	
	
	_c = createGroup EAST;	
	_v = [getMarkerPos "mOSupport", 0, "O_MRAP_02_hmg_F", _c] call BIS_fnc_spawnVehicle;	
	[_c, getMarkerPos "cApt", 1500, 4, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	sleep 10;
	_c = createGroup EAST;	
	_v = [getMarkerPos "mOSupport", 0, "O_MRAP_02_gmg_F", _c] call BIS_fnc_spawnVehicle;	
	[_c, getMarkerPos "cApt", 1500, 5, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
	sleep 10;	
	_c = createGroup EAST;	
	_v = [getMarkerPos "mOSupport", 0, "O_APC_Tracked_02_cannon_F", _c] call BIS_fnc_spawnVehicle;	
	[_c, getMarkerPos "cApt", 1500, 6, "MOVE", "SAFE", "RED", "LIMITED", 25] call ADF_fnc_vehiclePatrol;
};

if (hasInterface) then {
	sleep 3;
	hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Eagle Eye: Good job Cowboy. SatNav advices that all TO-199's have been neutralized.</t><br/><br/><t color='#6C7169' align='left'>Head towards Limeri Bay, south east of the Island. We'll have a ride home at </t><t color='#9DA698' align='left'>LZ Bombay</t><t color='#6C7169' align='left'>.</t><br/>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Eagle Eye: Good job Cowboy. SatNav advices that all TO-199's have been neutralized.</font><br/><br/>
	<font color='#6C7169'>Head towards Limeri Bay, south east of the Island. We'll have a ride home at </font>
	<font color='#9DA698'>LZ Bombay</font>	
	<font color='#6C7169'>.</font>
	<br/><br/>"]];
};