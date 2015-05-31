if (commtwr == 1) then {
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Eagle Eye: Eightball, Good job on those generators.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: Eightball, Good job on those generators.</font>
	<br/><br/>"]];
} else {
	hint parseText"
		<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
		<t color='#6C7169' align='left'>Eagle Eye: Eightball, Good job on those generators. Proceed to the next objective.<br/></t>
	";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Eagle Eye: Eightball, Good job on those generators. Proceed to the next objective.</font>
	<br/><br/>"]];
};

if (isServer) then {
	_types = [
	"Lamps_Base_F",
	"Land_LampAirport_F",
	"Land_LampSolar_F",
	"Land_LampStreet_F",
	"Land_LampStreet_small_F",
	"PowerLines_base_F",
	"Land_LampDecor_F",
	"Land_LampHalogen_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_PowerPoleWooden_L_F",
	"Land_NavigLight",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_yellow_F",
	"Land_Runway_PAPI",
	"Land_Runway_PAPI_2",
	"Land_Runway_PAPI_3",
	"Land_Runway_PAPI_4",
	"Land_fs_roof_F", // Fuel station roof lights
	"Land_fs_sign_F"
	];

	for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
	{
		_lamps = (getMarkerPos "ps1") nearObjects [_types select _i, 2000]; // 1000 = distance
		sleep 0.1;
		{_x setDamage 0.95} forEach _lamps;
	};  
		
}; // Close isServer