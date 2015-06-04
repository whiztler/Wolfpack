/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: customize call signs and radio freq/channels for groups
Author: Whiztler
Script version: 2.2

Game type: n/a
File: ADF_presets.sqf
****************************************************************
This script lets you customize call signs and radio freqs for groups.
The call signs and radio freqs are displayed in the roster, cTAB,
MicroDAGR, etc.
You Only need to configure the call sign for the leader of the
group. All other team members will get the correct call sign
automatically.
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_presets.sqf"; // Reporting. Do NOT edit/remove

///// Nopryl Preset
ADF_preset_NOPRYL = [

	//---------- INFANTRY PLATOON & COMPANY COMMAND ----------
	
	//	Call Sign, 		TFAR LR	TFAR SW
	[	"GANDALF",		30,		55],	// Company Commander 			0
	
	[	"FOXHOUND",		40,		100],	// INF Platoon Cmd 				1
	
	[	"FOX-1",		40,		110],	// INF 1-1 SQUAD Rifle Squad 		2
	[	"FOX-1-1",		40,		111],	// INF 1-1 ALPHA Fire team 		3
	[	"FOX-1-2",		40,		112],	// INF 1-1 BRAVO Fire team 		4
	
	[	"FOX-2",		40,		120],	// INF 1-2 SQUAD Rifle Squad 		5
	[	"FOX-2-2",		40,		121],	// INF 1-2 ALPHA Fire team 		6
	[	"FOX-2-3",		40,		122],	// INF 1-2 BRAVO Fire team 		7
	
	[	"FOX-3",		40,		130],	// INF 1-3 SQUAD Weapons Squad	8
	[	"FOX-3-1",		40,		131],	// INF 1-3 ALPHA Weapons Team		9
	[	"FOX-3-2",		40,		132],	// INF 1-3 BRAVO Weapons Team		10
	
	//---------- CAVALRY BATTERY ----------
	
	//	Call Sign, 		TFAR LR, 	TFAR SW	
	[	"KNIGHT",		50,		200],	// CAV Battery Cmd 				11
	
	[	"DAGGER-1",		50,		211],	// CAV 2-1 ALPHA APC crew		12
	[	"DAGGER-2",		50,		212],	// CAV 2-1 BRAVO APC crew		13
	[	"DAGGER-3",		50,		213],	// CAV 2-1 CHARLIE APC crew		14
	
	[	"BROADSWORD-1",	50,		221],	// CAV 2-2 ALPHA MBT crew		15
	[	"BROADSWORD-2",	50,		222],	// CAV 2-2 BRAVO MBT crew		16
	
	[	"STORM-1",		50,		231],	// CAV 2-3 ALPHA ART crew		17
	[	"STORM-2",		50,		232],	// CAV 2-3 BRAVO ART crew		18
	
	//---------- AIR WING ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"RAPTOR",		60,		300],	// Air Wing Cmd - MH-9 crew		19
	
	[	"HAWK",			60,		311],	// AIR 3-1 ALPHA AH-99 crew		20
	[	"FALCON",		60,		312],	// AIR 3-1 BRAVO AH-9 crew		21

	[	"CONDOR-1",		60,		321],	// AIR 3-2 ALPHA UH-80 crew		22
	[	"CONDOR-2",		60,		322],	// AIR 3-2 BRAVO UH-80 crew		23
	[	"CONDOR-3",		60,		323],	// AIR 3-2 CHARLIE CH-67 crew		24
	
	[	"EAGLE-1",		60,		341],	// AIR 3-3 ALPHA A-164 Pilot		25
	[	"EAGLE-2",		60,		342],	// AIR 3-3 BRAVO A-164 Pilot		26
	
	//---------- SPECIAL OPERATIONS SQUADRON ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"DIREWOLF",		70,		400],	// SOR Squadron Cmd				27
	
	[	"WOLF-1",		70,		411],	// SOR 4-1 MIKE SpecOp team		28
	[	"WOLF-2",		70,		412],	// SOR 4-1 ROMEO Expl team		29
	[	"WOLF-3",		70,		413],	// SOR 4-1 YANKEE Recon UAV		30
	[	"WOLF-4",		70,		413],	// SOR 4-1 ZULU Amph team		31

	[	"PROPHET-1",	70,		421],	// SOR 4-2 ALPHA Sniper team		32
	[	"PROPHET-1",	70,		422],	// SOR 4-2 BRAVO Sniper team		33
	
	[	"ANGEL",		80,		431],	// SOR 4-3 FOXTROT JTAC			34
	
	//---------- GAME MASTER UNITS (ZEUS) ----------

	//	Call Sign,		TFAR LR,	TFAR SW			
	[	"GM-1",			35,		350],	// GM-1						35
	[	"GM-2",			35,		350]	// GM-2						36
];



///// Default/SHAPE Preset
ADF_preset_DEFAULT = [

	//---------- INFANTRY PLATOON & COMPANY COMMAND ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"CO CMD",		30,		55],	// Company Commander			0
	
	[	"1 PLT",		40,		100],	// INF Platoon Cmd				1
	
	[	"1-1 SQUAD",	40,		110],	// INF 1-1 SQUAD Rifle Squad		2
	[	"1-1 ALPHA",	40,		111],	// INF 1-1 ALPHA Fire team		3
	[	"1-1 BRAVO",	40,		112],	// INF 1-1 BRAVO Fire team		4
	
	[	"1-2 SQUAD",	40,		120],	// INF 1-2 SQUAD Rifle Squad		5
	[	"1-2 ALPHA",	40,		121],	// INF 1-2 ALPHA Fire team		6
	[	"1-2 BRAVO",	40,		122],	// INF 1-2 BRAVO Fire team		7
	
	[	"1-3 SQUAD",	40,		130],	// INF 1-3 SQUAD Weapons Squad	8
	[	"1-3 ALPHA",	40,		131],	// INF 1-3 ALPHA Weapons Team		9
	[	"1-3 BRAVO",	40,		132],	// INF 1-3 BRAVO Weapons Team		10
	
	//---------- CAVALRY BATTERY ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"2 BAT",		50,		200],	// CAV Battery Cmd				11
	[	"2-1 ALPHA",	50,		211],	// CAV 2-1 ALPHA APC crew		12
	[	"2-1 BRAVO",	50,		212],	// CAV 2-1 BRAVO APC crew		13
	[	"2-1 CHARLIE",	50,		213],	// CAV 2-1 CHARLIE APC crew		14
	
	[	"2-2 ALPHA",	50,		221],	// CAV 2-2 ALPHA MBT crew		15
	[	"2-2 BRAVO",	50,		222],	// CAV 2-2 BRAVO MBT crew		16
	
	[	"2-3 ALPHA",	50,		231],	// CAV 2-3 ALPHA ART crew		17
	[	"2-3 BRAVO",	50,		232],	// CAV 2-3 BRAVO ART crew		18
	
	//---------- AIR WING ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"3 WING",		60,		300],	// Air Wing Cmd				19
	
	[	"3-1 ALPHA",	60,		311],	// AIR 3-1 ALPHA AH-99 crew		20
	[	"3-1 BRAVO",	60,		312],	// AIR 3-1 BRAVO AH-9 crew		21

	[	"3-2 ALPHA",	60,		321],	// AIR 3-2 ALPHA UH-80 crew		22
	[	"3-2 BRAVO",	60,		322],	// AIR 3-2 BRAVO UH-80 crew		23
	[	"3-2 CHARLIE",	60,		323],	// AIR 3-2 CHARLIE CH-67 crew		24
	
	[	"3-3 ALPHA",	60,		331],	// AIR 3-3 ALPHA A-164 Pilot		25	
	[	"3-3 BRAVO",	60,		332],	// AIR 3-3 BRAVO A-164 Pilot		26
	
	//---------- SPECIAL OPERATIONS SQUADRON ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"4 SQDR",		70,		400],	// SOR Squadron Cmd				27
	
	[	"4-1 LIMA",		70,		411],	// SOR 4-1 MIKE SpecOp team		28
	[	"4-1 MIKE",		70,		412],	// SOR 4-1 ROMEO Expl team		29
	[	"4-1 ROMEO",	70,		413],	// SOR 4-1 YANKEE Recon UAV		30
	[	"4-1 ZULU",		70,		414],	// SOR 4-1 ZULU Amph team		31

	[	"4-2 TANGO",	70,		421],	// SOR 4-2 ALPHA Sniper team		32
	[	"4-2 VICTOR",	70,		422],	// SOR 4-2 BRAVO Sniper team		33
	
	[	"4-3 FOXTROT",	80,		431],	// SOR 4-3 FOXTROT JTAC			34
			
	//---------- GAME MASTER UNITS (ZEUS) ----------

	//	Call Sign,		TFAR LR,	TFAR SW			
	[	"HADES",		35,		350],	// GM-1						35
	[	"APOLLO",		35,		350]	// GM-2						36
];


// Custom preset. Use this preset if you want to create your own call signs and frequencies
ADF_preset_CUSTOM = [

	//---------- INFANTRY PLATOON & COMPANY COMMAND ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"CO CMD",		30,		55],	// Company Commander			0
	
	[	"1 PLT",		40,		100],	// INF Platoon Cmd				1
	
	[	"1-1 SQUAD",	40,		110],	// INF 1-1 SQUAD Rifle Squad		2
	[	"1-1 ALPHA",	40,		111],	// INF 1-1 ALPHA Fire team		3
	[	"1-1 BRAVO",	40,		112],	// INF 1-1 BRAVO Fire team		4
	
	[	"1-2 SQUAD",	40,		120],	// INF 1-2 SQUAD Rifle Squad		5
	[	"1-2 ALPHA",	40,		121],	// INF 1-2 ALPHA Fire team		6
	[	"1-2 BRAVO",	40,		122],	// INF 1-2 BRAVO Fire team		7
	
	[	"1-3 SQUAD",	40,		130],	// INF 1-3 SQUAD Weapons Squad	8
	[	"1-3 ALPHA",	40,		131],	// INF 1-3 ALPHA Weapons Team		9
	[	"1-3 BRAVO",	40,		132],	// INF 1-3 BRAVO Weapons Team		10
	
	//---------- CAVALRY BATTERY ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"2 BAT",		50,		200],	// CAV Battery Cmd				11
	[	"2-1 ALPHA",	50,		211],	// CAV 2-1 ALPHA APC crew		12
	[	"2-1 BRAVO",	50,		212],	// CAV 2-1 BRAVO APC crew		13
	[	"2-1 CHARLIE",	50,		213],	// CAV 2-1 CHARLIE APC crew		14
	
	[	"2-2 ALPHA",	50,		221],	// CAV 2-2 ALPHA MBT crew		15
	[	"2-2 BRAVO",	50,		222],	// CAV 2-2 BRAVO MBT crew		16
	
	[	"2-3 ALPHA",	50,		231],	// CAV 2-3 ALPHA ART crew		17
	[	"2-3 BRAVO",	50,		232],	// CAV 2-3 BRAVO ART crew		18
	
	//---------- AIR WING ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"3 WING",		60,		300],	// Air Wing Cmd				19
	
	[	"3-1 ALPHA",	60,		311],	// AIR 3-1 ALPHA AH-99 crew		20
	[	"3-1 BRAVO",	60,		312],	// AIR 3-1 BRAVO AH-9 crew		21

	[	"3-2 ALPHA",	60,		321],	// AIR 3-2 ALPHA UH-80 crew		22
	[	"3-2 BRAVO",	60,		322],	// AIR 3-2 BRAVO UH-80 crew		23
	[	"3-2 CHARLIE",	60,		323],	// AIR 3-2 CHARLIE CH-67 crew		24
	
	[	"3-3 ALPHA",	60,		331],	// AIR 3-3 ALPHA A-164 Pilot		25	
	[	"3-3 BRAVO",	60,		332],	// AIR 3-3 BRAVO A-164 Pilot		26
	
	//---------- SPECIAL OPERATIONS SQUADRON ----------
	
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"4 SQDR",		70,		400],	// SOR Squadron Cmd				27
	
	[	"4-1 LIMA",		70,		411],	// SOR 4-1 MIKE SpecOp team		28
	[	"4-1 MIKE",		70,		412],	// SOR 4-1 ROMEO Expl team		29
	[	"4-1 ROMEO",	70,		413],	// SOR 4-1 YANKEE Recon UAV		30
	[	"4-1 ZULU",		70,		414],	// SOR 4-1 ZULU Amph team		31

	[	"4-2 TANGO",	70,		421],	// SOR 4-2 ALPHA Sniper team		32
	[	"4-2 VICTOR",	70,		422],	// SOR 4-2 BRAVO Sniper team		33
	
	[	"4-3 FOXTROT",	80,		431],	// SOR 4-3 FOXTROT JTAC			34
			
	//---------- GAME MASTER UNITS (ZEUS) ----------

	//	Call Sign,		TFAR LR,	TFAR SW			
	[	"GM-1",			35,		350],	// GM-1						35
	[	"GM-2",			35,		350]	// GM-2						36
];	


// Wolfpack campaign preset


ADF_preset_WP = [
	[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[], // 0 - 27
	//	Call Sign,		TFAR LR,	TFAR SW	
	[	"WOLF-1",		50,		100],	// Wolfpack Wolf-1				28
	[	"WOLF-2",		50,		200],	// Wolfpack Wolf-2				29
	[	"WOLF-3",		50,		300],	// Wolfpack Wolf-3				30
	[],[],[],[],[],[]	 					//							31-36
// DO NOT EDIT BELOW
];	

if (ADF_debug) then {["PRESETS - presets function processed",false] call ADF_fnc_log};