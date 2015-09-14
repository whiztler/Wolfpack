/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: customize call signs and radio freq/channels for groups
Author: Whiztler
Script version: 2.3

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

if (isServer) then {diag_log "ADF RPT: Init - executing ADF_fnc_presets.sqf"}; // Reporting. Do NOT edit/remove

///// Nopryl Preset
ADF_preset_NOPRYL = [

	//---------- INFANTRY PLATOON & COMPANY COMMAND ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW
	[	"gCC",			"GANDALF",		30,		55],	// Company Commander 			0
	
	[	"gCO_1",		"FOXHOUND",		40,		100],	// INF Platoon Cmd 				1
	
	[	"gCO_11",		"FOX-1",		40,		110],	// INF 1-1 SQUAD Rifle Squad 		2
	[	"gCO_11A",		"FOX-1-1",		40,		111],	// INF 1-1 ALPHA Fire team 		3
	[	"gCO_11B",		"FOX-1-2",		40,		112],	// INF 1-1 BRAVO Fire team 		4
	
	[	"gCO_12",		"FOX-2",		40,		120],	// INF 1-2 SQUAD Rifle Squad 		5
	[	"gCO_12A",		"FOX-2-2",		40,		121],	// INF 1-2 ALPHA Fire team 		6
	[	"gCO_12b",		"FOX-2-3",		40,		122],	// INF 1-2 BRAVO Fire team 		7
	
	[	"gCO_13",		"FOX-3",		40,		130],	// INF 1-3 SQUAD Weapons Squad	8
	[	"gCO_13A",		"FOX-3-1",		40,		131],	// INF 1-3 ALPHA Weapons Team		9
	[	"gCO_13B",		"FOX-3-2",		40,		132],	// INF 1-3 BRAVO Weapons Team		10
	[	"gCO_13C",		"FOX-3-3",		40,		133],	// INF 1-3 CHARLIE Weapons Team	11
	
	//---------- CAVALRY BATTERY ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW
	[	"gCO_2",		"KNIGHT",		50,		200],	// CAV Battery Cmd 				12
	
	[	"gCO_21A",		"DAGGER-1",		50,		211],	// CAV 2-1 ALPHA APC crew		13
	[	"gCO_21B",		"DAGGER-2",		50,		212],	// CAV 2-1 BRAVO APC crew		14
	[	"gCO_21C",		"DAGGER-3",		50,		213],	// CAV 2-1 CHARLIE APC crew		15
	
	[	"gCO_22A",		"BROADSWORD-1",	50,		221],	// CAV 2-2 ALPHA MBT crew		16
	[	"gCO_22B",		"BROADSWORD-2",	50,		222],	// CAV 2-2 BRAVO MBT crew		17
	
	[	"gCO_23A",		"STORM-1",		50,		231],	// CAV 2-3 ALPHA ART crew		18
	[	"gCO_23B",		"STORM-2",		50,		232],	// CAV 2-3 BRAVO ART crew		19
	
	//---------- AIR WING ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW
	[	"gCO_3",		"RAPTOR",		60,		300],	// Air Wing Cmd - MH-9 crew		20
	
	[	"gCO_31A",		"HAWK",			60,		311],	// AIR 3-1 ALPHA AH-99 crew		21
	[	"gCO_31B",		"FALCON",		60,		312],	// AIR 3-1 BRAVO AH-9 crew		22

	[	"gCO_32A",		"CONDOR-1",		60,		321],	// AIR 3-2 ALPHA UH-80 crew		23
	[	"gCO_32B",		"CONDOR-2",		60,		322],	// AIR 3-2 BRAVO UH-80 crew		24
	[	"gCO_32C",		"CONDOR-3",		60,		323],	// AIR 3-2 CHARLIE CH-67 crew		25
	
	[	"gCO_33A",		"EAGLE-1",		60,		341],	// AIR 3-3 ALPHA A-164 Pilot		26
	[	"gCO_33B",		"EAGLE-2",		60,		342],	// AIR 3-3 BRAVO A-164 Pilot		27
	
	//---------- SPECIAL OPERATIONS SQUADRON ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW
	[	"gCO_4",		"DIREWOLF",		70,		400],	// SOR Squadron Cmd				28
	
	[	"gCO_41M",		"WOLF-1",		70,		411],	// SOR 4-1 MIKE SpecOp team		29
	[	"gCO_41R",		"WOLF-2",		70,		412],	// SOR 4-1 ROMEO Expl team		30
	[	"gCO_41Y",		"WOLF-3",		70,		413],	// SOR 4-1 YANKEE Recon UAV		31
	[	"gCO_41Z",		"WOLF-4",		70,		413],	// SOR 4-1 ZULU Amph team		32

	[	"gCO_42A",		"PROPHET-1",	70,		421],	// SOR 4-2 ALPHA Sniper team		33
	[	"gCO_42B",		"PROPHET-1",	70,		422],	// SOR 4-2 BRAVO Sniper team		34
	
	[	"gCO_43F",		"ANGEL",		80,		431],	// SOR 4-3 FOXTROT JTAC			35
	
	//---------- GAME MASTER UNITS (ZEUS) ----------

	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW		
	[	"gGM1",			"GM-1",			35,		350],	// GM-1						36
	[	"gGM2",			"GM-2",			35,		350]	// GM-2						37
];



///// Default/SHAPE Preset
ADF_preset_DEFAULT = [

	//---------- INFANTRY PLATOON & COMPANY COMMAND ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCC",			"CO CMD",		30,		55],	// Company Commander			0
	
	[	"gCO_1",		"1 PLT",		40,		100],	// INF Platoon Cmd				1
	
	[	"gCO_11",		"1-1 SQUAD",	40,		110],	// INF 1-1 SQUAD Rifle Squad		2
	[	"gCO_11A",		"1-1 ALPHA",	40,		111],	// INF 1-1 ALPHA Fire team		3
	[	"gCO_11B",		"1-1 BRAVO",	40,		112],	// INF 1-1 BRAVO Fire team		4
	
	[	"gCO_12",		"1-2 SQUAD",	40,		120],	// INF 1-2 SQUAD Rifle Squad		5
	[	"gCO_12A",		"1-2 ALPHA",	40,		121],	// INF 1-2 ALPHA Fire team		6
	[	"gCO_12B",		"1-2 BRAVO",	40,		122],	// INF 1-2 BRAVO Fire team		7
	
	[	"gCO_13",		"1-3 SQUAD",	40,		130],	// INF 1-3 SQUAD Weapons Squad	8
	[	"gCO_13A",		"1-3 ALPHA",	40,		131],	// INF 1-3 ALPHA Weapons Team		9
	[	"gCO_13B",		"1-3 BRAVO",	40,		132],	// INF 1-3 BRAVO Weapons Team		10
	[	"gCO_13C",		"1-3 CHARLIE",	40,		133],	// INF 1-3 CHARLIE Weapons Team	11
	
	//---------- CAVALRY BATTERY ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCO_2",		"2 BAT",		50,		200],	// CAV Battery Cmd				12
	[	"gCO_21A",		"2-1 ALPHA",	50,		211],	// CAV 2-1 ALPHA APC crew		13
	[	"gCO_21B",		"2-1 BRAVO",	50,		212],	// CAV 2-1 BRAVO APC crew		14
	[	"gCO_21C",		"2-1 CHARLIE",	50,		213],	// CAV 2-1 CHARLIE APC crew		15
	
	[	"gCO_22A",		"2-2 ALPHA",	50,		221],	// CAV 2-2 ALPHA MBT crew		16
	[	"gCO_22B",		"2-2 BRAVO",	50,		222],	// CAV 2-2 BRAVO MBT crew		17
	
	[	"gCO_23A",		"2-3 ALPHA",	50,		231],	// CAV 2-3 ALPHA ART crew		18
	[	"gCO_23B",		"2-3 BRAVO",	50,		232],	// CAV 2-3 BRAVO ART crew		19
	
	//---------- AIR WING ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCO_3",		"3 WING",		60,		300],	// Air Wing Cmd				20
	
	[	"gCO_31A",		"3-1 ALPHA",	60,		311],	// AIR 3-1 ALPHA AH-99 crew		21
	[	"gCO_31B",		"3-1 BRAVO",	60,		312],	// AIR 3-1 BRAVO AH-9 crew		22

	[	"gCO_32A",		"3-2 ALPHA",	60,		321],	// AIR 3-2 ALPHA UH-80 crew		23
	[	"gCO_32B",		"3-2 BRAVO",	60,		322],	// AIR 3-2 BRAVO UH-80 crew		24
	[	"gCO_32C",		"3-2 CHARLIE",	60,		323],	// AIR 3-2 CHARLIE CH-67 crew		25
	
	[	"gCO_33A",		"3-3 ALPHA",	60,		331],	// AIR 3-3 ALPHA A-164 Pilot		26	
	[	"gCO_33B",		"3-3 BRAVO",	60,		332],	// AIR 3-3 BRAVO A-164 Pilot		27
	
	//---------- SPECIAL OPERATIONS SQUADRON ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCO_4",		"4 SQDR",		70,		400],	// SOR Squadron Cmd				28
	
	[	"gCO_41M",		"4-1 MIKE",		70,		411],	// SOR 4-1 MIKE SpecOp team		29
	[	"gCO_41R",		"4-1 ROMEO",	70,		412],	// SOR 4-1 ROMEO Expl team		30
	[	"gCO_41Y",		"4-1 YANKEE",	70,		413],	// SOR 4-1 YANKEE Recon UAV		31
	[	"gCO_41Z",		"4-1 ZULU",		70,		414],	// SOR 4-1 ZULU Amph team		32

	[	"gCO_42A",		"4-2 TANGO",	70,		421],	// SOR 4-2 ALPHA Sniper team		33
	[	"gCO_42B",		"4-2 VICTOR",	70,		422],	// SOR 4-2 BRAVO Sniper team		34
	
	[	"gCO_43F",		"4-3 FOXTROT",	80,		431],	// SOR 4-3 FOXTROT JTAC			35
			
	//---------- GAME MASTER UNITS (ZEUS) ----------

	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW			
	[	"gGM1",			"HADES",		35,		350],	// GM-1						36
	[	"gGM2",			"APOLLO",		35,		350]	// GM-2						37
];


// Custom preset. Use this preset if you want to create your own call signs and frequencies
ADF_preset_CUSTOM = [

	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCC",			"CO CMD",		30,		55],	// Company Commander			0
	
	[	"gCO_1",		"1 PLT",		40,		100],	// INF Platoon Cmd				1
	
	[	"gCO_11",		"1-1 SQUAD",	40,		110],	// INF 1-1 SQUAD Rifle Squad		2
	[	"gCO_11A",		"1-1 ALPHA",	40,		111],	// INF 1-1 ALPHA Fire team		3
	[	"gCO_11B",		"1-1 BRAVO",	40,		112],	// INF 1-1 BRAVO Fire team		4
	
	[	"gCO_12",		"1-2 SQUAD",	40,		120],	// INF 1-2 SQUAD Rifle Squad		5
	[	"gCO_12A",		"1-2 ALPHA",	40,		121],	// INF 1-2 ALPHA Fire team		6
	[	"gCO_12B",		"1-2 BRAVO",	40,		122],	// INF 1-2 BRAVO Fire team		7
	
	[	"gCO_13",		"1-3 SQUAD",	40,		130],	// INF 1-3 SQUAD Weapons Squad	8
	[	"gCO_13A",		"1-3 ALPHA",	40,		131],	// INF 1-3 ALPHA Weapons Team		9
	[	"gCO_13B",		"1-3 BRAVO",	40,		132],	// INF 1-3 BRAVO Weapons Team		10
	[	"gCO_13C",		"1-3 CHARLIE",	40,		133],	// INF 1-3 CHARLIE Weapons Team	11
	
	//---------- CAVALRY BATTERY ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCO_2",		"2 BAT",		50,		200],	// CAV Battery Cmd				12
	[	"gCO_21A",		"2-1 ALPHA",	50,		211],	// CAV 2-1 ALPHA APC crew		13
	[	"gCO_21B",		"2-1 BRAVO",	50,		212],	// CAV 2-1 BRAVO APC crew		14
	[	"gCO_21C",		"2-1 CHARLIE",	50,		213],	// CAV 2-1 CHARLIE APC crew		15
	
	[	"gCO_22A",		"2-2 ALPHA",	50,		221],	// CAV 2-2 ALPHA MBT crew		16
	[	"gCO_22B",		"2-2 BRAVO",	50,		222],	// CAV 2-2 BRAVO MBT crew		17
	
	[	"gCO_23A",		"2-3 ALPHA",	50,		231],	// CAV 2-3 ALPHA ART crew		18
	[	"gCO_23B",		"2-3 BRAVO",	50,		232],	// CAV 2-3 BRAVO ART crew		19
	
	//---------- AIR WING ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCO_3",		"3 WING",		60,		300],	// Air Wing Cmd				20
	
	[	"gCO_31A",		"3-1 ALPHA",	60,		311],	// AIR 3-1 ALPHA AH-99 crew		21
	[	"gCO_31B",		"3-1 BRAVO",	60,		312],	// AIR 3-1 BRAVO AH-9 crew		22

	[	"gCO_32A",		"3-2 ALPHA",	60,		321],	// AIR 3-2 ALPHA UH-80 crew		23
	[	"gCO_32B",		"3-2 BRAVO",	60,		322],	// AIR 3-2 BRAVO UH-80 crew		24
	[	"gCO_32C",		"3-2 CHARLIE",	60,		323],	// AIR 3-2 CHARLIE CH-67 crew		25
	
	[	"gCO_33A",		"3-3 ALPHA",	60,		331],	// AIR 3-3 ALPHA A-164 Pilot		26	
	[	"gCO_33B",		"3-3 BRAVO",	60,		332],	// AIR 3-3 BRAVO A-164 Pilot		27
	
	//---------- SPECIAL OPERATIONS SQUADRON ----------
	
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCO_4",		"4 SQDR",		70,		400],	// SOR Squadron Cmd				28
	
	[	"gCO_41M",		"4-1 MIKE",		70,		411],	// SOR 4-1 MIKE SpecOp team		29
	[	"gCO_41R",		"4-1 ROMEO",	70,		412],	// SOR 4-1 ROMEO Expl team		30
	[	"gCO_41Y",		"4-1 YANKEE",	70,		413],	// SOR 4-1 YANKEE Recon UAV		31
	[	"gCO_41Z",		"4-1 ZULU",		70,		414],	// SOR 4-1 ZULU Amph team		32

	[	"gCO_42A",		"4-2 TANGO",	70,		421],	// SOR 4-2 ALPHA Sniper team		33
	[	"gCO_42B",		"4-2 VICTOR",	70,		422],	// SOR 4-2 BRAVO Sniper team		34
	
	[	"gCO_43F",		"4-3 FOXTROT",	80,		431],	// SOR 4-3 FOXTROT JTAC			35
			
	//---------- GAME MASTER UNITS (ZEUS) ----------

	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW			
	[	"gGM1",			"HADES",		35,		350],	// GM-1						36
	[	"gGM2",			"APOLLO",		35,		350]	// GM-2						37
];	


// Wolfpack campaign preset


ADF_preset_WP = [
	[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[], // 0 - 28
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[	"gCO_41M",		"WOLF-1",		50,		100],	// Wolfpack Wolf-1				29
	[	"gCO_41R",		"WOLF-2",		50,		200],	// Wolfpack Wolf-2				30
	[	"gCO_41Y",		"WOLF-3",		50,		300],	// Wolfpack Wolf-3				31
	[],[],[],[],											// 32-35
	[	"gGM1",			"TRAINER",		35,		350],	// GM-1						36 > 141B01
	[]	 												// 37
// DO NOT EDIT BELOW
];	

ADF_preset_2S = [
	//	Group (dont edit)	Call Sign, 		TFAR LR	TFAR SW	
	[],													//							0
	
	[	"gCO_1",		"2 PLT",		40,		100],	// INF Platoon Cmd				1
	
	[	"gCO_11",		"2-1 SQUAD",	40,		110],	// INF 1-1 SQUAD Rifle Squad		2
	[	"gCO_11A",		"2-1 ALPHA",	40,		111],	// INF 1-1 ALPHA Fire team		3
	[	"gCO_11B",		"2-1 BRAVO",	40,		112],	// INF 1-1 BRAVO Fire team		4
	
	[	"gCO_12",		"2-2 SQUAD",	40,		120],	// INF 1-2 SQUAD Rifle Squad		5
	[	"gCO_12A",		"2-2 ALPHA",	40,		121],	// INF 1-2 ALPHA Fire team		6
	[	"gCO_12B",		"2-2 BRAVO",	40,		122],	// INF 1-2 BRAVO Fire team		7
	
	[	"gCO_13",		"2-3 SQUAD",	40,		130],	// INF 1-3 SQUAD Weapons Squad	8
	[	"gCO_13A",		"2-3 ALPHA",	40,		131],	// INF 1-3 ALPHA Weapons Team		9
	[	"gCO_13B",		"2-3 BRAVO",	40,		132],	// INF 1-3 BRAVO Weapons Team		10
	[	"gCO_13C",		"2-3 CHARLIE",	40,		133],	// INF 1-3 BRAVO Weapons Team		11
	[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[] 		// 		12 - 37					
];	

if (ADF_debug) then {["PRESETS - presets function processed",false] call ADF_fnc_log};