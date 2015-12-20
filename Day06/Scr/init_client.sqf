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
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsCargo vWolf_1; SOR_RM_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsCargo vWolf_1; SOR_UAV_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsCargo vWolf_1; SOR_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_1; SOR_RTL_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_1; SOR_RS_2 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_1; SOR_RS_3 moveInCargo vWolf_1;}; sleep 0.035;
	
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_2; SOR_RTL_2 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_2; SOR_RS_5 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_2; SOR_RS_6 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_2; SOR_RS_7 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_2; SOR_AT_1 moveInCargo vWolf_2;};
};

if (!ADF_debug) then {waitUntil {ADF_missionInit}; sleep 5};

[] spawn {
	waitUntil {sleep 1; vWolf_10Secs};
	["SOAR","160th SOAR","160th SOAR Lt. Campbell: Commander, 20 seconds! Get ready!"] call ADF_fnc_MessageParser;
};

[] spawn {
	waitUntil {sleep 1; vWolf_takeOff};
	["SOAR","160th SOAR","160th SOAR Lt. Campbell: Dusting off in 5 seconds."] call ADF_fnc_MessageParser; sleep 15;
	["WOLF","","Viper: Uncle, this is Viper at Manilla. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Uncle: Solid copy Viper. Head out east for tasking. Break. No FRAGO. Good luck. Out."] call ADF_fnc_MessageParser;
};

["TOC","JSOC TOC","JSOC TOC: Net. Radio check. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 8;
["SOAR","160th SOAR","Rabbit: This Rabbit. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 11;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Uncle. Break.<br />Your call sign: Viper. Out."] call ADF_fnc_MessageParser; sleep 18;
["TOC","JSOC TOC","Uncle: Viper, interrogative, advice when at Manilla. Out."] call ADF_fnc_MessageParser;

ADF_msg_Barcelona = {
	["WOLF","","Viper: Uncle, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Uncle: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Viper: Uncle, we are approaching Barcelona. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Uncle: Solid copy Viper. We have you on Satnav. Break.<br />Once you have secured the objective, destroy the Radar emplacement. Break. You need a lot of explosives. Break. Perhaps CSAT has an ammo cache at the site. How copy?"] call ADF_fnc_MessageParser; sleep 26;
	["WOLF","","Viper: Solid copy Uncle. Destroy radar emplacement at Barcelona. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_objBarcelona = {
	objBarcelona = true;
	sleep 5;
	["WOLF","","Viper: Uncle, objective Barcelona completed. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	if (!objInstanbul) then {;
		["TOC","JSOC TOC","Uncle: Solid copy Viper. Mighty fireworks!<br/><br/>Proceed to Istanbul for tasking. Over."] call ADF_fnc_MessageParser; sleep 18;
		["WOLF","","Viper: Copy Uncle. Next objective is Istanbul. Viper is Oscar Mike. Out."] call ADF_fnc_MessageParser;
	} else {
		["TOC","JSOC TOC","Uncle: copy Viper. Mighty fireworks!<br/><br/>Exfil is at Agios Kosmas. Break. We'll upload the location to your ComLink. Break. Exfil callsign is Naples. Over."] call ADF_fnc_MessageParser; sleep 18;
		["WOLF","","Viper: Copy Uncle. Viper is Oscar Mike to Naples for exfil. Out."] call ADF_fnc_MessageParser;
	};
};

ADF_msg_Istanbul = {
	["WOLF","","Viper: Uncle, Message. Over."] call ADF_fnc_MessageParser; sleep 6;
	["TOC","JSOC TOC","Uncle: Send. Over."] call ADF_fnc_MessageParser; sleep 7;
	["WOLF","","Viper: Uncle, we have a visual on Istanbul. How copy?"] call ADF_fnc_MessageParser; sleep 17;
	["TOC","JSOC TOC","Uncle: Solid copy Viper. Break. Satnav shows 2 or 3 AA emplacements on the tower and 2 emplacements on the ground. Break. Destroy all AA emplacements. How copy?"] call ADF_fnc_MessageParser; sleep 24;
	["WOLF","","Viper: Solid copy Uncle. Search and destroy five times Alpha Alpha. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_objInstanbul = {
	objInstanbul = true;
	sleep 5;
	["WOLF","","Viper: Uncle, objective Istanbul completed. How copy?"] call ADF_fnc_MessageParser; sleep 12;
	if (!objBarcelona) then {;
		["TOC","JSOC TOC","Uncle: Solid Copy Viper. Break.<br/><br/>Proceed to Barcelona for tasking. Over."] call ADF_fnc_MessageParser; sleep 18;
		["WOLF","","Viper: Copy Uncle. Next objective is Barcelona. Viper is Oscar Mike. Out."] call ADF_fnc_MessageParser;
	} else {
		["TOC","JSOC TOC","Uncle: Solid copy Viper.<br/><br/>Exfil is at Agios Kosmas. Break. We'll upload grids to your ComLink. Break. Exfil callsign is NAPLES. Over."] call ADF_fnc_MessageParser; sleep 18;
		["WOLF","","Viper: Copy Uncle. Viper is Oscar Mike to Naples for exfil. Out."] call ADF_fnc_MessageParser;
	};
};

ADF_fnc_exfil = {
	waitUntil {sleep 2; (objInstanbul && objBarcelona)}; // double check
	["NONE","NAPLES","Lt. Kroger: Good to see you Viper. Hop on board. We'll take you fellas home."] call ADF_fnc_MessageParser;
	sleep 25;

	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 10];
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 06 | Riga Hill</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
	sleep 5;
	['END1',true,5] call BIS_fnc_endMission;
};