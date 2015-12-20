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

	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_2; SOR_RTL_1 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_2; SOR_RS_2 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_2; SOR_RS_3 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCargo vWolf_2; SOR_RS_4 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsCargo vWolf_2; SOR_DEM_1 moveInCargo vWolf_2;}; sleep 0.035;
	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsCargo vWolf_3; SOR_RTL_2 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_3; SOR_RS_5 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_3; SOR_RS_6 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_3; SOR_RS_7 moveInCargo vWolf_3;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_3; SOR_AT_1 moveInCargo vWolf_3;};
};

if (!ADF_debug) then {waitUntil {ADF_missionInit}; sleep 5};

["TOC","JSOC TOC","JSOC TOC: Net. Radio check. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 7;
["SOAR","160th SOAR","Sparrow: This Sparrow. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 11;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Jetson. Break.<br />Your call sign: Scarecrow. Out."] call ADF_fnc_MessageParser; sleep 20;
["SOAR","160TH SOAR","160th SOAR Lt. Campbell: Commander, we'll drop you off at LZ Popcorn, about 1.5 clicks east of the Naval Base."] call ADF_fnc_MessageParser; sleep 12;
["SOAR","160TH SOAR","160th SOAR Lt. Campbell: The LZ is on a small beach. On touch down, clear the LZ immediately."] call ADF_fnc_MessageParser;

[] spawn {
	waitUntil {sleep 1; vWolf_takeOff};
	["SOAR","160TH SOAR","160th SOAR Lt. Campbell: Dusting off in 5 seconds"] call ADF_fnc_MessageParser; sleep 12;
	sleep 36;
	["TOC","JSOC TOC","Jetson: Scarecrow, make your way to the Krya Nera Naval Base. Break.<br />Secure the area and report in. How copy?"] call ADF_fnc_MessageParser; sleep 18;
	["WOLF","","Scarecrow: Solid copy Jetson. Heading to the Naval Base. Will contact once secure. Out."] call ADF_fnc_MessageParser;
};	

ADF_fnc_kryanera = {
	["WOLF","","Scarecrow: Jetson, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Jetson: Send traffic. Over"] call ADF_fnc_MessageParser; sleep 6;
	["WOLF","","Scarecrow: Jetson, Naval based is secure. How copy?"] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Jetson: Solid copy Scarecrow. Jetson will call in Blizzard in 30 seconds. Over"] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Scarecrow: Roger that Jetson. Fire mission 30 seconds. Out."] call ADF_fnc_MessageParser; sleep 22;
	["TOC","JSOC TOC","Jetson: Blizzard, Stand by for fire mission. Over."] call ADF_fnc_MessageParser; sleep 7;
	["NONE","USS Marauder","Blizzard: Ready to copy Jetson. Over."] call ADF_fnc_MessageParser; sleep 5;
	["TOC","JSOC TOC","Jetson: Blizzard, fire mission Oscar, authorization Delta. How copy?"] call ADF_fnc_MessageParser; sleep 8;
	["NONE","USS Marauder","Blizzard: Fire mission received. Oscar with authorization Delta. Break.<br />SFire for Effect, R, F, Compact Explosive Tactical Missile. Over."] call ADF_fnc_MessageParser; sleep 10;
	["NONE","USS Marauder","Blizzard: R, F, Compact Explosive Tactical Missile in effect, 1 missile. Out."] call ADF_fnc_MessageParser; sleep 6;
	["NONE","USS Marauder","Blizzard: Shot. Out."] call ADF_fnc_MessageParser; sleep 5;
	["NONE","USS Marauder","Blizzard: Splash in 55. Out."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Jetson: Scarecrow, make sure you're clear of those assault boats. Splash in 50. Out."] call ADF_fnc_MessageParser;
	sleep 50;
	["NONE","USS Marauder","Blizzard: Splash. Out."] call ADF_fnc_MessageParser;
	roundsSplash = true; publicVariableServer "roundsSplash";
	sleep 8;
	["NONE","USS Marauder","Blizzard: Fire mission complete. Out."] call ADF_fnc_MessageParser; sleep 9;
	["WOLF","","Scarecrow: Blizzard, this is Scarecrow. Good effect on target. out."] call ADF_fnc_MessageParser; sleep 24;
	["TOC","JSOC TOC","Jetson: Scarecrow, make your way to the Abdera Airfield. Out."] call ADF_fnc_MessageParser; sleep 35;
	["TOC","JSOC TOC","Jetson: Scarecrow, try to avoid patrols and covertly approach the airfield. Break.<br/><br/>Your task is to destroy ALL the Kajman Attack helicopters. Break.<br/>Local intel suggests that there is an explosives cache in the industrial shed in case you need additional demo equipment. How copy?"] call ADF_fnc_MessageParser; sleep 20;
	["WOLF","","Scarecrow: Solid copy Jetson,  Heading to Abdera. Search and destroy all Kajmans. Over."] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Jetson: Scarecrow, Jetson: exfil is north-east, close to Ammalofi Bay. Out."] call ADF_fnc_MessageParser;
	
	[] spawn {
		waitUntil {sleep 2; triggerActivated tDevice};
		["WOLF","","Scarecrow: Jetson, this is Scarecrow. We just discovered an unknown device in one of the buildings at our current position. How copy?"] call ADF_fnc_MessageParser; sleep 15;
		["TOC","JSOC TOC","Jetson: Stand-by Scarecrow."] call ADF_fnc_MessageParser; sleep 35;
		["TOC","JSOC TOC","Jetson: Scarecrow, take some pictures and upload to TOC. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["WOLF","","Scarecrow: Roger that Jetson. Uploading in 2 mikes. How Copy?"] call ADF_fnc_MessageParser; sleep 12;
		["TOC","JSOC TOC","Jetson: Standing by."] call ADF_fnc_MessageParser; sleep 112;
		["TOC","JSOC TOC","Jetson: Receiving the data now. Standby for orders."] call ADF_fnc_MessageParser; sleep 92;
		if (ADF_obj) then {
			["TOC","JSOC TOC","Jetson: Scarecrow, your orders are to neutralize the device. How copy?"] call ADF_fnc_MessageParser;
			sleep 11;		
			["WOLF","","Scarecrow: Copy Jetson. Scarecrow to neutralize the device. Out."] call ADF_fnc_MessageParser;											
		} else {
			["TOC","JSOC TOC","Jetson: Scarecrow, your orders are to neutralize the device after you have neutralized the Kajmans. How copy?"] call ADF_fnc_MessageParser;
			sleep 11;		
			["WOLF","","Scarecrow: Copy Jetson. First neutralize the Kajmans then blow the device. Out."] call ADF_fnc_MessageParser;			
		};

		waitUntil {sleep 2; !alive ADF_device_1};
		sleep 3;
		["WOLF","","Scarecrow: Jetson, message. Over"] call ADF_fnc_MessageParser; sleep 7;
		["TOC","JSOC TOC","Jetson: Ready to copy Scarecrow."] call ADF_fnc_MessageParser; sleep 6;
		["WOLF","","Scarecrow: Device destroyed. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["TOC","JSOC TOC","Jetson: Copy Scarecrow. Our engineers are studying the photo's. They suspect that the device was nuclear charged. Better get out of there. Out."] call ADF_fnc_MessageParser;
	};
};

ADF_fnc_exfil = {
	sleep 5;
	["WOLF","","Scarecrow: Jetson, message. Over"] call ADF_fnc_MessageParser; sleep 7;	
	["TOC","JSOC TOC","Jetson: Go ahead Scarecrow."] call ADF_fnc_MessageParser; sleep 6;
	["WOLF","","Scarecrow: Nine times Kajman destroyed. How copy?"] call ADF_fnc_MessageParser; sleep 11;	
	["TOC","JSOC TOC","Jetson: Excellent work Scarecrow. Condor is on its way to pick you up just NW of Krya Nera Beach, LZ Seattle. How copy?"] call ADF_fnc_MessageParser; sleep 16;
	["WOLF","","Scarecrow: Copy Jetson. Pick up at Seattle. Out."] call ADF_fnc_MessageParser;	
	ADF_endMission = true;
	if (MotsActive) then {sleep 20} else {sleep 190};
	["SOAR","160TH SOAR","Scarecrow, this is Condor. North-west vector. ETA 8 mikes. Out."] call ADF_fnc_MessageParser;
	if (MotsActive) then {sleep 20} else {sleep 500};
	
	waitUntil {sleep 1; wpEnd};
	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 10];
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 02 | Kajman Fire</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
	sleep 5;
	["END1",true,5] call BIS_fnc_endMission;
};

