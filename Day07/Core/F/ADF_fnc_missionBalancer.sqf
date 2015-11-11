/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Mission Balancer
Author: Whiztler
Script version: 2.0

Game type: COOP
File: ADF_fnc_missionBalancer.sqf
****************************************************************
This script is called as a function. It checks for the number of
online clients (connected playable units) and assigns a variable
based on the number of clients playing. It checks the function
each time new units spawn.
This way you can spawn enemies based on the number of player thus
creating some form of balance.

For instance. In your script that you use to spawn enemies you
control the number of enemies spawn by:

If (ADF_MB_normal || ADF_MB_heavy) then {
//your enemy spawn code for a 'normal' or 'heavy' balance goes here...
};

If (ADF_MB_lite) then {
//your enemy spawn code for a 'lite' balance goes here...
};

If (ADF_MB_heavy) then {
//your enemy spawn code for a 'heavy' balance goes here...
};

There are two variables:

_ADF_misBal_low - 10 or less players or whatever you have defined in AFD_init_config.sqf
_ADF_misBal_high - 30 or more players or whatever you have defined in AFD_init_config.sqf

Instructions:
The script should be executed from you init.sqf

At the top of your script that you use to spawn enemies put:
call ADF_fnc_missionBalance;

Then use the If (ADF_MB_normal) then {//yourCode }; for balanced
enemy spawn on demand.
****************************************************************/

////////////////// WIP

/*
if (isServer) then {diag_log "ADF RPT: Init - executing ADF_fnc_missionBalancer.sqf"}; // Reporting. Do NOT edit/remove

ADF_fnc_missionBalanceInit = {
	private ["_s","_n","_c","_m1","_m2"];
	
	_s = getNumber (missionConfigFile >> "maxPlayers");	
	_c = {alive _x} count allPlayers;
	
	if (_s == 0) exitWith {
		private "_msg";
		_msg = parseText "<t color='#FFFFFF' size='1.5'>ERROR</t><br/><br/><t color='#A1A4AD'>The Mission Balancer activated could not initialize.<br/><br/>You need to set maxPlayers in the description.ext</t>";
		_msg remoteExec ["hint", -2]; 
		["The Mission Balancer activated could not initialize. You need to set maxPlayers in the description.ext",true] call ADF_fnc_log;
	};
	
	_m1 = format ["Mission Balancer: maxPlayers (slots) :",_s];
	_m1 = format ["Mission Balancer: Current players    :",_c];
	
	["-------------------------------------------------------------------------------------",false] call ADF_fnc_log;
	[_m1,false] call ADF_fnc_log; [_m2,false] call ADF_fnc_log;

	
	[_s,_c]
};


ADF_fnc_missionBalanceInit = {
	private ["_max","_plr","_high","_med","_low","_cur","_m3","_m4","_m5"];
	
	ADF_MB_
	_a		= call ADF_fnc_missionBalanceInit;
	_max		= _a select 0;
	_plr		= _a select 1;
	_high	= _max;
	_med		= round (_max * .65);
	_low		= round (_max / 2.5);
	_cur		= if (_plr > _med) then {_high} else {if ()}
	
	_m3 = format ["Mission Balancer: HIGH : > %1 players",_high];
	_m4 = format ["Mission Balancer: MED  :",_med];
	_m5 = format ["Mission Balancer: LOW  :",_low];
	_m6 = format ["Mission Balancer current setting:",_cur];
	["-------------------------------------------------------------------------------------",false] call ADF_fnc_log;
	[_m3,false] call ADF_fnc_log; [_m4,false] call ADF_fnc_log; [_m5,false] call ADF_fnc_log; [_m6,false] call ADF_fnc_log;
	["-------------------------------------------------------------------------------------",false] call ADF_fnc_log;
};


// Display info on mission start
HintSilent parseText format ["
	<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
	<t color='#6C7169' size='1.5'>Mission Balancer</t><br/><br/>	
	<t color='#A1A4AD'>Mission Balancer activated.</t><br/><br/>
	<t color='#A1A4AD' align='left'>Nr of connected clients: </t>
	<t color='#FFFFFF' align='right'>%1</t><br/>
	<t color='#A1A4AD' align='left'>Current mission Balance: </t>
	<t color='#FFFFFF' align='right'>%2</t><br/><br/>
",count PlayableUnits,ADF_missionBalanceStat];