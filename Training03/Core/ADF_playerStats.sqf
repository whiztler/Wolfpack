/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Player Stats
Author: Whiztler
Script version: 1.1

Game type: n/a
File: ADF_playerStats.sqf
****************************************************************
Instructions:

Execute the script using a trigger with radio alpha/bravo/etc
****************************************************************/

if (local player) exitWith {
	_unit = player;
	_hSquad = "";
	_hTeam = "";
	_hRole = "";
	hRank = rank player;
	_hCallsign = "";

	_chk = toLower str (vehicle _unit); _chk = toArray _chk; _chk resize 4;
	if ((toString _chk != "opc_") && (toString _chk != "fox_") && (toString _chk != "wolf") && (toString _chk != "mdev") && 
		(toString _chk != "knig") && (toString _chk != "rapt") && (toString _chk != "grem")
	) exitWith {}; // Undefined unit > exit
	
	// Split the player variable into Squad, Unit, Role
	_uStr = str _unit;
	_u = [_uStr, "_"] call CBA_fnc_split;
	_s = toLower (_u select 0);
	_t = _u select 1;
	_r = toLower (_u select 2);
	
	ADF_fnc_pstats = {
		_hText =  parseText format["
			<t color='#FFFFFF' size='1.5' align='left'>PLAYER INFO/STATS</t><br/><br/>
			<t color='#A1A4AD' align='left'>%1 you are </t>
			<t color='#FFFFFF' align='left'>%2 </t>
			<t color='#A1A4AD' align='left'>in the </t>
			<t color='#FFFFFF' align='left'>%3 </t>
			<t color='#A1A4AD' align='left'>team, </t>
			<t color='#FFFFFF' align='left'>%4</t><t color='#A1A4AD' align='left'>.</t><br/>
			<t color='#A1A4AD' align='left'>Your team callsign is </t>
			<t color='#FFFFFF' align='left'>%5</t><t color='#A1A4AD' align='left'>.</t>
			<br/><br/>
			<t color='#A1A4AD' align='left'>Client FPS:</t>
			<t color='#FFD11B' align='right' size='1.2'>%6</t>
			<br/><br/>
			<t color='#A1A4AD' align='left'>Kills:</t>
			<t color='#FFFFFF' align='right' size='1.1'>%7</t><br/>
			<t color='#A1A4AD' align='left'>KIA:</t>
			<t color='#FFFFFF' align='right' size='1.1'>%8</t><br/>
			<t color='#A1A4AD' align='left'>Score:</t>
			<t color='#FFFFFF' align='right' size='1.1'>%9</t><br/>		
			<t color='#A1A4AD' align='left'>Rank:</t>
			<t color='#FFFFFF' align='right' size='1'>%10</t><br/>
			
		",name vehicle player, // 1
		_hRole, // 2
		_hTeam, // 3
		_hSquad, // 4
		_hCallsign, //5
		round (diag_fps), // 6
		ADF_killCnt, // 7
		ADF_killed, // 8
		score _unit, // 9
		rank _unit // 10
		];
		hintSilent _hText;
	};

	if (_s == "mdev") exitWith {
		_hRole = "a Developer / Game Master";
		_hTeam = "Developer / Game Master";
		_hSquad = "MM/GM";
		_hCallsign = "Control";		
		[_hSquad, _hTeam, _hRole, _hCallsign] call ADF_fnc_pstats;
	};
	
	if (_s == "opc") exitWith {
		_hTeam = "Operational Command";
		_hSquad = "1st ArmInf Co.";
		_hCallsign = "Gandalf";
		if (_r == "drv") then {_hRole = "the Company Command driver";};
		if (_r == "cmd") then {_hRole = "the OC";};
		if (_r == "sgt") then {_hRole = "the Company Sergeant and RTO";};
		if (_r == "doc") then {_hRole = "the Company Doctor";};
		[_hSquad, _hTeam, _hRole, _hCallsign] call ADF_fnc_pstats;
	};	
	
	if (_s == "fox") exitWith {
		_hSquad = "Fox Infantry Squad";
		if (_r == "sql") then {_hRole = "the Squad Leader";};
		if (_r == "rto") then {_hRole = "the RTO";};
		if (_r == "ftl") then {_hRole = "the Fire Team Leader";};
		if (_r == "wtl") then {_hRole = "the Weapons Team Leader";};
		if (_r == "g") then {_hRole = "the Grenadier and 2IC";};
		if (_r == "ar") then {_hRole = "the Automatic Rifleman";};
		if (_r == "ara") then {_hRole = "the Assistant Automatic Rifleman";};
		if (_r == "cls") then {_hRole = "the Combat Life Saver (medic)";};
		if (_r == "r") then {_hRole = "a Rifleman";};
		if (_r == "eng") then {_hRole = "the Engineer and Demolition Expert";};
		if (_r == "mg") then {_hRole = "the (medium) Machine Gunner";};
		if (_r == "mga") then {_hRole = "the Assistant Machine Gunner";};
		if (_r == "hat") then {_hRole = "the Heavy Anti-Tank specialist";};
		if (_r == "haa") then {_hRole = "the assistant Heavy AT";};
		if (_r == "lat") then {_hRole = "the Light Anti-Tank specialist";};
		if (_r == "mat") then {_hRole = "the Medium Anti-Tank specialist";};
		if (_r == "c") then {_hRole = "a Carabinier";};
		if (_r == "aa") then {_hRole = "the Anti-Air specialist";};
		if (_r == "aaa") then {_hRole = "the assistant Anti-Air specialist";};
		if (_r == "uav") then {_hRole = "the UAV/Aerial Reconnaissance specialist";};
		if (_r == "mm") then {_hRole = "the marksman";};
		
		if (_t == "0") then {_hTeam = "Squad Command";_hCallsign = "Foxhound";};
		if (_t == "1") then {_hTeam = "Fox - 1";_hCallsign = "Fox One";};
		if (_t == "2") then {_hTeam = "Fox - 2";_hCallsign = "Fox Two";};
		if (_t == "3") then {_hTeam = "Fox - 3";_hCallsign = "Fox Three";};
		if (_t == "4") then {_hTeam = "Fox - 4";_hCallsign = "Fox Four";};		
		[_hSquad, _hTeam, _hRole, _hCallsign] call ADF_fnc_pstats;
	};
	
	if (_s == "wolf") exitWith {
		_hSquad = "Wolf Special Operations/Recon Squadron";
		if (_r == "ssc") then {_hRole = "the Squadron Commander";};
		if (_r == "rto") then {_hRole = "the RTO";};
		if (_r == "rtl") then {_hRole = "the Recon Team Leader";};
		if (_r == "rmm") then {_hRole = "the Recon Marksman";};
		if (_r == "dem") then {_hRole = "the Demolition and Explosives Specialist";};
		if (_r == "rs") then {_hRole = "a Recon Specialist";};
		if (_r == "rm") then {_hRole = "the Recon Medic";};
		if (_r == "uav") then {_hRole = "the Aerial Reconnaissance Specialist";};
		if (_r == "atl") then {_hRole = "the Amphibious Team Leader";};
		if (_r == "aa") then {_hRole = "a Amphibious Assault Specialist";};
		if (_r == "ad") then {_hRole = "the Amphibious Demolition and Explosives Specialist";};
		if (_r == "sp") then {_hRole = "a Prophet Spotter";};
		if (_r == "sn") then {_hRole = "a Prophet Sniper";};
		if (_r == "jtc") then {_hRole = "a Joint Terminal Attack Coordinator (JTAC)";};
		
		if (_t == "0") then {_hTeam = "Squadron Command";_hCallsign = "DireWolf";};
		if (_t == "1") then {_hTeam = "Wolf - 1";_hCallsign = "Wolf One";};
		if (_t == "2") then {_hTeam = "Wolf - 2";_hCallsign = "Wolf Two";};
		if (_t == "3") then {_hTeam = "Wolf - 3";_hCallsign = "Wolf Three";};
		if (_t == "4") then {_hTeam = "Wolf - 4";_hCallsign = "Wolf Four";};
		if (_t == "5") then {_hTeam = "Prophet - 1";_hCallsign = "Prophet One";};
		if (_t == "6") then {_hTeam = "Prophet - 2";_hCallsign = "Prophet Two";};
		if (_t == "7") then {_hTeam = "Prophet - 3";_hCallsign = "Prophet Three";};
		if (_t == "8") then {_hTeam = "Angel - 1";_hCallsign = "Angel One";};
		if (_t == "9") then {_hTeam = "Angel - 2";_hCallsign = "Angel Two";};
		[_hSquad, _hTeam, _hRole, _hCallsign] call ADF_fnc_pstats;
	};
	
	if (_s == "knight") exitWith {
		_hSquad = "Knight Cavalry Squadron";
		if (_r == "dc") then {_hRole = "the Squadron Commander and Deputy Company Commander";};
		if (_r == "cmd") then {_hRole = "the Vehicle Commander (VC)";};
		if (_r == "c") then {_hRole = "a Crewman";};
		
		if (_t == "0") then {_hTeam = "Squadron Command";_hCallsign = "Knight";};
		if (_t == "1") then {_hTeam = "Knight - 1";_hCallsign = "Dagger One";};
		if (_t == "2") then {_hTeam = "Knight - 2";_hCallsign = "Dagger Two";};
		if (_t == "3") then {_hTeam = "Knight - 3";_hCallsign = "Dagger Three";};
		if (_t == "4") then {_hTeam = "Knight - 4";_hCallsign = "Broadsword One";};
		if (_t == "5") then {_hTeam = "Knight - 5";_hCallsign = "Broadsword Two";};
		if (_t == "6") then {_hTeam = "Knight - 6";_hCallsign = "Broadsword Three";};		
		[_hSquad, _hTeam, _hRole, _hCallsign] call ADF_fnc_pstats;
	};	
	
	if (_s == "raptor") exitWith {
		_hSquad = "Raptor Air Wing Squadron";
		if (_r == "dc") then {_hRole = "the Squadron Commander and Deputy Company Commander";};
		if (_r == "fwp") then {_hRole = "the Fixed Wing Pilot";};
		if (_r == "fwg") then {_hRole = "the Fixed Wing Co-Pilot/Gunner";};
		if (_r == "rwp") then {_hRole = "the Rotor Wing Pilot";};
		if (_r == "rwg") then {_hRole = "the Rotor Wing Gunner";};
		if (_r == "rwo") then {_hRole = "the Rotor Wing Observer/Co-Pilot";};
		if (_r == "rwc") then {_hRole = "a Rotor Wing Crewman/Door Gunner";};
		
		if (_t == "0") then {_hTeam = "Squadron Command";_hCallsign = "Raptor";};
		if (_t == "1") then {_hTeam = "Raptor - 1";_hCallsign = "Eagle One";};
		if (_t == "2") then {_hTeam = "Raptor - 2";_hCallsign = "Eagle Two";};
		if (_t == "3") then {_hTeam = "Raptor - 3";_hCallsign = "Eagle Three";};
		if (_t == "4") then {_hTeam = "Raptor - 4";_hCallsign = "Hawk One";};
		if (_t == "5") then {_hTeam = "Raptor - 5";_hCallsign = "Hawk Two";};
		if (_t == "6") then {_hTeam = "Raptor - 6";_hCallsign = "Hawk Three";};
		if (_t == "7") then {_hTeam = "Raptor - 7";_hCallsign = "Falcon One";};
		if (_t == "8") then {_hTeam = "Raptor - 8";_hCallsign = "Falcon Two";};
		if (_t == "9") then {_hTeam = "Raptor - 9";_hCallsign = "Falcon Three";};
		if (_t == "10") then {_hTeam = "Raptor - 10";_hCallsign = "Condor One";};
		if (_t == "11") then {_hTeam = "Raptor - 11";_hCallsign = "Condor Two";};
		if (_t == "12") then {_hTeam = "Raptor - 12";_hCallsign = "Condor Three";};		
		[_hSquad, _hTeam, _hRole, _hCallsign] call ADF_fnc_pstats;
	};
	
	if (_s == "gremlin") exitWith {
		_hSquad = "Gremlin Support Squad";
		if (_r == "sql") then {_hRole = "the Squad Leader";};
		if (_r == "ac") then {_hRole = "the Artillery Commander";};
		if (_r == "ag") then {_hRole = "the Artillery Gunner";};
		if (_r == "aga") then {_hRole = "the Assistant Artillery Gunner";};
		if (_r == "doc") then {_hRole = "the Doctor";};
		if (_r == "drv") then {_hRole = "a Driver";};
		
		if (_t == "0") then {_hTeam = "Squad Command";_hCallsign = "Gremlin";};
		if (_t == "1") then {_hTeam = "Gremlin - 1";_hCallsign = "Storm One";};
		if (_t == "2") then {_hTeam = "Gremlin - 2";_hCallsign = "Storm Two";};
		if (_t == "3") then {_hTeam = "Gremlin - 3";_hCallsign = "Rainbow 1";};
		if (_t == "4") then {_hTeam = "Gremlin - 4";_hCallsign = "Razor One";};
		if (_t == "5") then {_hTeam = "Gremlin - 5";_hCallsign = "Razor Two";};
		if (_t == "6") then {_hTeam = "Gremlin - 6";_hCallsign = "Razor Three";};
		if (_t == "7") then {_hTeam = "Gremlin - 7";_hCallsign = "Bear One";};
		if (_t == "8") then {_hTeam = "Gremlin - 8";_hCallsign = "Bear Two";};
		if (_t == "9") then {_hTeam = "Gremlin - 9";_hCallsign = "Bear Three";};
		[_hSquad, _hTeam, _hRole, _hCallsign] call ADF_fnc_pstats;
	};
	
 }; // close if local player

if (true) exitWith {};

