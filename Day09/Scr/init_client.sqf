diag_log "ADF RPT: Init - executing init_client.sqf"; // Reporting. Do NOT edit/remove

player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

ADF_fnc_MOTS = {player allowDamage false; MotsActive = true};
ADF_fnc_MOTS_captive = {params ["_c"]; player setCaptive _c};

waitUntil {scriptDone ADF_getLoadOut}; // Wait till all units have their gear before continuing

sleep 3; // Loadout finished > pri weapon loaded

while {time < 25} do {
	if !(isNil "SOR_SSC_1") then {SOR_SSC_1 assignAsCargo vWolf_1; SOR_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsDriver vWolf_1; SOR_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_2; SOR_RTL_1 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsDriver vWolf_2; SOR_RS_2 moveInDriver vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_2; SOR_RS_3 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;
	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_3; SOR_RTL_2 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsDriver vWolf_3; SOR_RS_5 moveInDriver vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_3; SOR_RS_6 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_3; SOR_RS_7 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_3; SOR_AT_1 moveInCargo vWolf_3;};
};

if (!ADF_debug) then {waitUntil {ADF_missionInit}; sleep 5};

["TOC","JSOC TOC","JSOC TOC: Net. Radio check. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 7;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Eagle Eye. Break.<br />Your call sign: Roach. Out."] call ADF_fnc_MessageParser; sleep 18;
["TOC","JSOC TOC","Eagle Eye: Roach, our locals on the ground have supplied us with a small support cache north east of Stratis. Break. You'll find diving equipment and all the support gear you need to fulfil the mission. How copy."] call ADF_fnc_MessageParser;
["WOLF","","Roach: Solid copy. Out."] call ADF_fnc_MessageParser;

if (!MotsActive) then {sleep 120} else {sleep 10};

["TOC","JSOC TOC","Eagle Eye: Roach, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Roach: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
["TOC","JSOC TOC","Eagle Eye: Roach, First tasking order: move to the depot at Agia Marina and wait for further instructions. How copy?"] call ADF_fnc_MessageParser; sleep 22;
["WOLF","","Roach: Solid copy Eagle Eye. Get eyes on the depot and report in. Out."] call ADF_fnc_MessageParser; sleep 14;

ADF_fnc_depot = {
	["WOLF","","Roach: Eagle Eye this is Roach. Message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Eagle Eye: Send. Over."] call ADF_fnc_MessageParser; sleep 6;
	["WOLF","","Eagle Eye, we are almost within visual range of the depot. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["TOC","JSOC TOC","Eagle Eye: Solid copy Roach. Move in closer and report in CSAT hard targets.<br/><br/>Use the radio function to call in intel, e.g. [0-0-3] Depot intel: 3 x BTR-K + 5 x MSE-3 Madrid. Over."] call ADF_fnc_MessageParser; sleep 18;
	["WOLF","","Roach: Solid copy Eagle Eye, will call in hardware sightings. Out."] call ADF_fnc_MessageParser;
	
	waitUntil {(triggerActivated tDepot1) || (triggerActivated tDepot2) || (triggerActivated tDepot3)};

	sleep 3;
	["WOLF","","Roach: Eagle Eye, message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Eagle Eye: Standing by."] call ADF_fnc_MessageParser; sleep 9;

	if (triggerActivated tDepot1) exitWith {
		["WOLF","","Roach: Depot hardware intel: 3 times BTR-K APC and 5 times MSE-3 APC. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["TOC","JSOC TOC","Eagle Eye: Solid copy Roach, 3 times BTR-K APC and 5 times MSE-3 APC. Break.<br/><br/>Unfortunately, this is not in line with our intel. Break.<br/><br/>Roach, proceed to the Stratis Airbase and report in when eyes on. How copy?"] call ADF_fnc_MessageParser; sleep 18;
		["WOLF","","Roach: Solid copy Eagle Eye. Roach is Oscar Mike to the airfield. Will advice when on location. Out."] call ADF_fnc_MessageParser; sleep 11;
	};

	if (triggerActivated tDepot2) exitWith {
		["WOLF","","Roach: Depot hardware intel: 2 times BTR-K APC and 6 times MSE-3 APC. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["TOC","JSOC TOC","Eagle Eye: Solid copy Roach, 2 times BTR-K APC and 6 times MSE-3 APC. Break.<br/><br/>Excellent, this seems to be valuable intel. Break.<br/><br/>Roach, proceed to the Stratis Airbase and report in when eyes on. How copy?"] call ADF_fnc_MessageParser; sleep 18;
		["WOLF","","Roach: Solid copy Eagle Eye. Roach is Oscar Mike to the airfield. Will advice when on location. Out."] call ADF_fnc_MessageParser; sleep 11;		
	};

	if (triggerActivated tDepot3) exitWith {
		["WOLF","","Roach: Depot hardware intel: 2 times BTR-K APC and 4 times MSE-3 APC. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["TOC","JSOC TOC","Eagle Eye: Solid copy Roach, 2 times BTR-K APC and 4 times MSE-3 APC. Break.<br/><br/>Unfortunately, this is not in line with our intel. Break.<br/><br/>Roach, proceed to the Stratis Airbase and report in when eyes on. How copy?"] call ADF_fnc_MessageParser; sleep 18;
		["WOLF","","Roach: Solid copy Eagle Eye. Roach is Oscar Mike to the airfield. Will advice when on location. Out."] call ADF_fnc_MessageParser; sleep 11;
	};	
};

ADF_fnc_stratisAB = {
	["WOLF","","Eagle Eye this is Roach, we have eyes on the objective. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["TOC","JSOC TOC","Eagle Eye: Solid copy Roach. Move in closer. Break. We are repositioning the satellite. Break. Standby for further tasking. Over."] call ADF_fnc_MessageParser; sleep 18;
	["WOLF","","Roach: Copy Eagle Eye. Stading by. Over."] call ADF_fnc_MessageParser;
	if (MotsActive) then {sleep 20} else {sleep (random 200) + (random 200)};

	["TOC","JSOC TOC","Eagle Eye: Roach, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 9;
	["WOLF","","Roach: Ready to copy Eagle Eye. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Eagle Eye: Roach, SatNav shows nine or ten TO-199's. Break. Your orders are to destroy any and all TO-199 aircraft at the objective. Break. We have nine confirmed targets. How copy?"] call ADF_fnc_MessageParser; sleep 23;
	["WOLF","","Roach: Solid copy Eagle Eye. Find and destroy nine times TO-199. Out."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Eagle Eye: Good luck Roach. Out."] call ADF_fnc_MessageParser; sleep 9;

	waitUntil {sleep 5; objDone};
	
	["WOLF","","Roach: Eagle Eye, message. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Eagle Eye: Go ahead Roach."] call ADF_fnc_MessageParser; sleep 9;
	["WOLF","","Roach: Objective complete. Nine times TO-199 destroyed. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Eagle Eye: Solid copy Roach. Head towards Limeri Bay, south east of the Island. Break. We'll have a ride home at BOMBAY. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Roach: Solid copy Eagle. Roach is Oscar Mike to Bombay. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_exfil = {
	waitUntil {sleep 1; objDone};
	["SOAR","Raven","Raven: Roach, this is Raven. We're your ride home. ETA 5 mikes. Break.<br/><br/>Make sure we drop into a clean LZ. Over"] call ADF_fnc_MessageParser; sleep 12;
	["WOLF","","Roach: Copy Raven. Making sure the LZ is nice and tidy. Out."] call ADF_fnc_MessageParser; sleep 8;
	
	waitUntil {sleep 1; wpEnd};
	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 10];
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 09 | DragonFly</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
	sleep 5;
	["END1",true,5] call BIS_fnc_endMission;
};