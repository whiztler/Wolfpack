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
		if !(isNil "SOD_SSC_1") then {SOD_SSC_1 assignAsCargo vWolf_1; SOD_SSC_1 moveInCargo vWolf_1;}; sleep 0.035;
		if !(isNil "SOD_RM_1") then {SOD_RM_1 assignAsDriver vWolf_1; SOD_RM_1 moveInDriver vWolf_1;}; sleep 0.035;
		if !(isNil "SOD_UAV_1") then {SOD_UAV_1 assignAsGunner vWolf_1; SOD_UAV_1 moveInGunner vWolf_1;}; sleep 0.035;
		if !(isNil "SOD_RMM_1") then {SOD_RMM_1 assignAsCargo vWolf_1; SOD_RMM_1 moveInCargo vWolf_1;}; sleep 0.035;

		if !(isNil "SOD_ATL_1") then {SOD_ATL_1 assignAsCargo vWolf_2; SOD_ATL_1 moveInCargo vWolf_2;}; sleep 0.035;
		if !(isNil "SOD_AD_2") then {SOD_AD_2 assignAsDriver vWolf_2; SOD_AD_2 moveInDriver vWolf_2;}; sleep 0.035;
		if !(isNil "SOD_AD_3") then {SOD_AD_3 assignAsGunner vWolf_2; SOD_AD_3 moveInGunner vWolf_2;}; sleep 0.035;
		if !(isNil "SOD_AD_4") then {SOD_AD_4 assignAsCargo vWolf_2; SOD_AD_4 moveInCargo vWolf_2;}; sleep 0.035;
		
		if !(isNil "SOD_ADD_1") then {SOD_ADD_1 assignAsDriver vWolf_3; SOD_ADD_1 moveInDriver vWolf_3;}; sleep 0.035;	
		if !(isNil "SOD_ATL_2") then {SOD_ATL_2 assignAsCargo vWolf_3; SOD_ATL_2 moveInCargo vWolf_3;}; sleep 0.035;
		if !(isNil "SOD_AD_5") then {SOD_AD_5 assignAsGunner vWolf_3; SOD_AD_5 moveInGunner vWolf_3;}; sleep 0.035;
		if !(isNil "SOD_AD_6") then {SOD_AD_6 assignAsCargo vWolf_3; SOD_AD_6 moveInCargo vWolf_3;}; sleep 0.035;
		
		if !(isNil "SOD_AD_7") then {SOD_AD_7 assignAsDriver vWolf_4; SOD_AD_7 moveInDriver vWolf_4;}; sleep 0.035;
		if !(isNil "SOD_AT_1") then {SOD_AT_1 assignAsGunner vWolf_4; SOD_AT_1 moveInGunner vWolf_4;};	
};

if (!ADF_debug) then {waitUntil {ADF_missionInit}; sleep 5};

["TOC","JSOC TOC","JSOC TOC: Net. Radio check. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 7;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Caesar. Break<br />Your call sign: Nightshade. Out."] call ADF_fnc_MessageParser; sleep 35;
["TOC","JSOC TOC","Caesar: Nightshade, head towards the coast. The objective is in Kavala. Nikos men dropped off supplies at HELSINKI in case you need additional dry gear. Break.<br/><br/>We'll brief you re tasking in a few mikes. Break. We're still processing intel we just received from Nikos. How copy?"] call ADF_fnc_MessageParser; sleep 24;
["WOLF","","Nightshade: Solid copy Caesar. Nightshade is Oscar Mike. Out."] call ADF_fnc_MessageParser;
if (MotsActive) then {sleep 10} else {sleep 170};
["TOC","JSOC TOC","Caesar: Nightshade, message. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Nightshade: Ready to copy Caesar."] call ADF_fnc_MessageParser; sleep 9;
["TOC","JSOC TOC","Caesar: A few days ago we received intel re General Tehrani's (codename: 'Doberman') plans to visit Kavala. Break.<br/><br/>Nikos tried to apprehend Doberman's travel itinerary and schedule. Break. Unfortunately he was unsuccessful. Break.<br/>This means we have no intel on his exact location at the moment. Break. We presume Doberman is at one of the CSAT locations in Kavala as marked on your comms device and map. Break.<br/><br/>Your mission is to find and eliminate Doberman. How copy?"] call ADF_fnc_MessageParser; sleep 26;
["WOLF","","Nightshade: Solid copy Ceasar. Find and eliminate Doberman. Out."] call ADF_fnc_MessageParser;
if (MotsActive) then {sleep 10} else {sleep 65};
["TOC","JSOC TOC","Caesar: Nightshade, we are still working on your exfil. Break. We'll advise in due time. Break. Maintain radio silence until you have found and eliminated Doberman. Good luck! Out."] call ADF_fnc_MessageParser;

ADF_fnc_exfil = {
	wpExfil = true;
	["WOLF","","Nightshade: Caesar, sstand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Caesar: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 7;
	["WOLF","","Nightshade: Caesar, Doberman found and eliminated. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Caesar: Solid copy nightshade. Break.<br/><br/>We've spotted an EVAC helicopter at the Kavala General Hospital helipad. Break. Grab the helicopter and head south towards the USS Ronald Reagan. How copy?"] call ADF_fnc_MessageParser; sleep 24;
	["WOLF","","Nightshade: Ceasar, interrogative, steal a medivac heli for exfil. Over."] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Caesar: Confirmed Nightshade. We'll replace the helicopter as soon as possible. Break. Grab the heli. That's an order. Out."] call ADF_fnc_MessageParser;
	
	waitUntil {sleep 1; wpEnd};
	
	sleep 10;

	enableRadio false;
	enableEnvironment false;
	clearRadio; 

	playMusic "LeadTrack01c_F";

	sleep 10;

	["<img size= '15' shadow='false' image='Img\wpintro.paa'/><br/><br/>",0,-.3,103,1,0,1001] spawn BIS_fnc_dynamicText; sleep 3;
	["<t size='1' color='#FFFFFF' shadow='false'>Campaign Completed</t>",0.02,0.8,7,-1,0,1002] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 01 | Operation The Package</t>",0.02,0.8,7,-1,0,1003] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 02 | Operation Kajman Fire</t>",0.02,0.8,7,-1,0,1004] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 03 | Operation Switch Off</t>",0.02,0.8,7,-1,0,1005] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 04 | Operation Top Screen</t>",0.02,0.8,7,-1,0,1006] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 05 | Operation Bullseye</t>",0.02,0.8,7,-1,0,1007] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 06 | Operation Riga Hill</t>",0.02,0.8,7,-1,0,1008] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 07 | Operation U-12</t>",0.02,0.8,7,-1,0,1009] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 08 | Operation Ice Tiger</t>",0.02,0.8,7,-1,0,1010] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 09 | Operation DragonFly</t>",0.02,0.8,7,-1,0,1011] spawn BIS_fnc_dynamicText; sleep 7.5;
	["<t size='1' color='#FFFFFF' shadow='false'>Day 10 | Operation Doberman</t>",0.02,0.8,7,-1,0,1012] spawn BIS_fnc_dynamicText; sleep 10;
	["<t size='1' color='#FFFFFF' shadow='false'>Concept &amp; Development</t><br/><br/><t size='.9' color='#FFFFFF' shadow='false'>whiztler</t>",0.02,0.8,15,-10,0,1013] spawn BIS_fnc_dynamicText; sleep 7.5;

	sleep 1;
	15 fadeSound 0;
	sleep 1;
	15 fadeMusic 0;
	enableRadio true;
	enableEnvironment true;  

	sleep 10;

	["END1",true,12] call BIS_fnc_endMission;
};

[] spawn {
	sleep 1800;
	waitUntil {
		sleep 1200 + ((random 500) + (random 500));
		if (wpExfil) exitWith {};
		["TOC","JSOC TOC","Caesar: Nightshade, interrogative sitrep. Over."] call ADF_fnc_MessageParser; sleep 11;
		if (wpExfil) exitWith {};
		private ["_p","_msg"];
		_p = getPosASL (leader (group player));
		_msg = format ["Nightshade: Pappa %3. Break.<br/>Objective not located. Break.<br/>Position grid Romeo Victor %1 . %2. Over.",round (_p select 0), round (_p select 1), {alive _x} count (allPlayers - entities "HeadlessClient_F")];
		["WOLF","",_msg] call ADF_fnc_MessageParser; sleep 14;
		if (wpExfil) exitWith {};
		["TOC","JSOC TOC","Caesar: Solid copy Nightshade. Out"] call ADF_fnc_MessageParser;		
		wpExfil
	};
};
