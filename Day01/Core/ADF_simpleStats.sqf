/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Simple Server/Mission Stats (Headless Client enabled)
Author: Whiztler
Script version: 2.50

Game type: n/a
File: ADF_simpleStats.sqf
****************************************************************
Instructions:

Execute the script using a trigger with radio alpha/bravo/etc
****************************************************************/

// Init
ADF_sStats_textServer = "";
ADF_sStats_textHeadless = "";
ADF_sStats_pause = 1;
_ADF_units_B_DS = 0;
_ADF_units_O_DS = 0;
_ADF_units_I_DS = 0;
_ADF_units_C_DS = 0;
_ADF_units_B_HC = 0;
_ADF_units_O_HC = 0;
_ADF_units_I_HC = 0;
_ADF_units_C_HC = 0;
_ADF_cnt = 0;

while {(_ADF_cnt != 20)} do {
	_ADF_cnt = _ADF_cnt + 1;
	
	if (isDedicated) then {		
		ADF_sStats_serverFPS = round (diag_fps);
		publicVariable "ADF_sStats_serverFPS";
	};	

	if (isDedicated || isServer) then {
		_ADF_units_B_DS = {(local _x) && (side _x == WEST)} count allUnits;
		_ADF_units_O_DS = {(local _x) && (side _x == EAST)} count allUnits;
		_ADF_units_I_DS = {(local _x) && (side _x == INDEPENDENT)} count allUnits;
		_ADF_units_C_DS = {(local _x) && (side _x == CIVILIAN)} count allUnits;
		ADF_sStats_textServer = format ["	
			<t color='#FFFFFF' align='left' size='1.2'>Server:</t><br/>
			<t color='#A1A4AD' align='left'>Units West:</t>
			<t color='#2E64FE' align='right' font='PuristaBold'>%1</t><br/>
			<t color='#A1A4AD' align='left'>Units East:</t>
			<t color='#FE2E2E' align='right' font='PuristaBold'>%2</t><br/>
			<t color='#A1A4AD' align='left'>Units Independent:</t>
			<t color='#A5DF00' align='right' font='PuristaBold'>%3</t><br/>
			<t color='#A1A4AD' align='left'>Units Civilian:</t>
			<t color='#DA81F5' align='right' font='PuristaBold'>%4</t><br/><br/>",
			_ADF_units_B_DS, //1
			_ADF_units_O_DS, //2
			_ADF_units_I_DS, //3
			_ADF_units_C_DS //4
		];
		publicVariable "ADF_sStats_textServer"; // 1.40B01
	};

	if (ADF_HC_connected && !hasInterface && !isDedicated) then {
		_ADF_units_B_HC = {(local _x) && (side _x == WEST)} count allUnits;
		_ADF_units_O_HC = {(local _x) && (side _x == EAST)} count allUnits;
		_ADF_units_I_HC = {(local _x) && (side _x == INDEPENDENT)} count allUnits;
		_ADF_units_C_HC = {(local _x) && (side _x == CIVILIAN)} count allUnits;
		ADF_sStats_textHeadless = format ["	
			<t color='#FFFFFF' align='left' size='1.2'>Headless Client(s):</t><br/>
			<t color='#A1A4AD' align='left'>Units West:</t>
			<t color='#2E64FE' align='right' font='PuristaBold'>%1</t><br/>
			<t color='#A1A4AD' align='left'>Units East:</t>
			<t color='#FE2E2E' align='right' font='PuristaBold'>%2</t><br/>
			<t color='#A1A4AD' align='left'>Units Independent:</t>
			<t color='#A5DF00' align='right' font='PuristaBold'>%3</t><br/>		
			<t color='#A1A4AD' align='left'>Units Civilian:</t>
			<t color='#DA81F5' align='right' font='PuristaBold'>%4</t><br/><br/>",
			_ADF_units_B_HC, //1
			_ADF_units_O_HC, //2
			_ADF_units_I_HC, //3
			_ADF_units_C_HC //4
		];
		if (
			(_ADF_units_B_HC > 0) || 
			(_ADF_units_O_HC > 0) || 
			(_ADF_units_I_HC > 0) || 
			(_ADF_units_C_HC > 0)
		) then {publicVariable "ADF_sStats_textHeadless"};
	};
	
	if (isNil "ADF_sStats_serverFPS") then {ADF_sStats_serverFPS = "N/A";};
		
	_ADF_textIntro = format ["
		<t color='#FFFFFF' size='1.5' font='PuristaSemiBold'>SERVER STATS</t><br/><br/>
		
		<t color='#A1A4AD' align='left'>Game time:</t>
		<t color='#FFFFFF' align='right'>%1</t><br/>	
		<t color='#A1A4AD' align='left'>Server FPS:</t>
		<t color='#FFD11B' align='right' font='PuristaBold'>%2</t><br/><br/>

		<t color='#A1A4AD' align='left'>Total Units:</t>
		<t color='#FFFFFF' align='right'>%3</t><br/>
		<t color='#A1A4AD' align='left'>Total Players:</t>
		<t color='#FFFFFF' align='right'>%4</t><br/>	
		<t color='#A1A4AD' align='left'>Total Groups:</t>
		<t color='#FFFFFF' align='right'>%5</t><br/>
		<t color='#A1A4AD' align='left'>Dead Units:</t>
		<t color='#FFFFFF' align='right'>%6</t><br/><br/>",
		[(round time)] call BIS_fnc_secondsToString, //1
		ADF_sStats_serverFPS,//2
		count allUnits,//3
		count PlayableUnits,//4
		count allGroups,//5
		count allDeadmen//6
	];
		
	_ADF_textTotal = format ["	
		<t color='#A1A4AD' align='left'>Total Objects:</t>
		<t color='#FFFFFF' align='right'>%1</t><br/>
		<t color='#A1A4AD' align='left'>Total Entities:</t>
		<t color='#FFFFFF' align='right'>%2</t><br/>",
		count allMissionObjects "All",//1
		count entities "All"//2
	];	
	
	if (hasInterface) then {hintSilent parseText (_ADF_textIntro + ADF_sStats_textServer + ADF_sStats_textHeadless + _ADF_textTotal);}; // v1.40B01
	
	UiSleep ADF_sStats_pause;
};

hintSilent "";
