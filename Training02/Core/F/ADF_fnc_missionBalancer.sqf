/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Mission Balancer
Author: Whiztler
Script version: 1.11

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

diag_log "ADF RPT: Init - executing ADF_fnc_missionBalancer.sqf"; // Reporting. Do NOT edit/remove

// init	the vars
ADF_MB_lite = false;
ADF_MB_normal = false;
ADF_MB_heavy = false;
ADF_missionBalanceStat = "";

private ["_liteNr","_normalNr","_highNr"];
_lowNr = _this select 0;
_highNr = _this select 1;

if (isServer) then {
	// Game Balance function
	ADF_fnc_missionBalance = {
		// Set game balance vars based on the amout of playable units
		
		// Lite - less than X players. Configure in ADF_init_config.sqf (_ADF_ADF_missionBalanceStat_low)
		if ((count playableUnits) <= _lowNr) then {ADF_MB_lite = true; ADF_missionBalanceStat = "Lite";};

		// Normal - Average between lite and high
		if ((count playableUnits > _lowNr) && (count playableUnits < _highNr)) then {ADF_MB_normal = true; ADF_missionBalanceStat = "Normal";};

		// high - X or more players. Configure in ADF_init_config.sqf (_ADF_ADF_missionBalanceStat_high)
		if ((count playableUnits) >= _highNr) then {ADF_MB_heavy = true; ADF_missionBalanceStat = "high";};
		
		ADF_missionBalanceStat;	
		if (true) exitWith {}; // All done here. Exit
	};

	waitUntil {time > 130};
	call ADF_fnc_missionBalance;
	publicVariable "ADF_missionBalanceStat";
};

waitUntil {sleep 5;ADF_missionBalanceStat != ""};

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

if (true) exitWith {}; // All done here. Exit