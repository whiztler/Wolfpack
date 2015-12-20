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
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 12;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Big Foot. Break.<br />Your call sign: Phoenix. Out."] call ADF_fnc_MessageParser; sleep 30;
["TOC","JSOC TOC","Big Foot: Phoenix, make your way to the RV location. Break.<br/><br/>At the RV you'll meet our local man on the ground, Nikos Fotopoulos. How copy?"] call ADF_fnc_MessageParser; sleep 12;
["WOLF","","Phoenix: Solid copy Big Foot, head to te RV and meet up with local contact. Out."] call ADF_fnc_MessageParser; sleep 40;
["TOC","JSOC TOC","Big Foot: Phoenix: Don't mind the vessel to your north-west. Break.<br/>It is a Russian Signals intelligence Trawler. Break.<br/>We are jamming its comms. It should be of no concern to your op. Out."] call ADF_fnc_MessageParser;

ADF_fnc_Retaliate = {
	sleep 120;		
	["TOC","JSOC TOC","Big Foot: Phoenix, priority traffic."] call ADF_fnc_MessageParser; sleep 9;
	["WOLF","","Phoenix: Send traffic."] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Big Foot: SatNav reports a Kajman gunship just took off from Abdera Heliport and is heading towards Frini. ETA 3 Mikes. Over."] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Phoenix: Solid copy. Out."] call ADF_fnc_MessageParser; sleep 12;
};

ADF_msg_kallaziz = {
	["WOLF","","Phoenix: Big Foot, this is Phoenix. Message over."] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Ready to copy Phoenix."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Phoenix: Big Foot, package is bagged. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Wait. Out."] call ADF_fnc_MessageParser; sleep 22;
	["TOC","JSOC TOC","Big Foot: Bagged package confirmed. Break/<br /><br />Proceed to Victor for exfil. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Phoenix: Solid copy. Victor for our ride home. out."] call ADF_fnc_MessageParser; 
};

ADF_msg_rv = {
	if (rvDone) exitWith {};
	["WOLF","","Phoenix: Big Foot, this is Phoenix. We are at the RV. How copy?"] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Big Foot: Copy Phoenix. Your contact should be at the Church. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_nikos = {
	rvDone = true;
	["NONE","Nikos Fotopoulos","Phoenix, welcome to Altis. My name is Nikos Fotopoulos. I am your contact person on Altis."] call ADF_fnc_MessageParser; sleep 11;
	["NONE","Nikos Fotopoulos","I have just been in touch with Big Foot for a sitrep. Your mission is as follows:<br/><br/>1. Covertly make your way towards Frini M.O.B.<br/>2. Observe the base and wait for the package to arrive by helicopter.<br/>3. The package is Maj. F. Kallaziz, head of the CSAT Intelligence Services. Eliminate the package.<br/>4. Covertly make your way to the exfil location at Cap. Agrios where you'll board a patrol boat.<br/><br/>I have taken the liberty to mark the positions on your map. Godspeed Commander."] call ADF_fnc_MessageParser; sleep 24;
	["WOLF","","Phoenix: Thanks Nikos."] call ADF_fnc_MessageParser; sleep 5;
	["WOLF","","Phoenix: Big Foot, message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Big Foot: Send traffic."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Phoenix: Got briefed by our contact. Break.</br>We're oscar mike for tasking. Over."] call ADF_fnc_MessageParser; sleep 5;
	["TOC","JSOC TOC","Big Foot: Copy Big Foot. No additional inel at this time. Out."] call ADF_fnc_MessageParser; sleep 8;
};

ADF_fnc_kallazizActive = {
	sleep 190;
	["TOC","JSOC TOC","Big Foot: Phoenix, interrogative sitrep. Over."] call ADF_fnc_MessageParser; sleep 11;
	private ["_p","_msg"];
	_p = getPosASL (leader (group player));
	_msg = format ["Phoenix: Pappa %3. Break.<br/>Position grid Pappa Victor %1 . %2. Over.",round (_p select 0), round (_p select 1), {alive _x} count (allPlayers - entities "HeadlessClient_F")];
	["WOLF","",_msg] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Copy Phoenix. Out."] call ADF_fnc_MessageParser; sleep 11;
	waitUntil {sleep 2; kallaziz_active};
	["TOC","JSOC TOC","Big Foot: Phoenix, message over."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Phoenix: Send message. Over."] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Big Foot: Phoenix, Satnav just picked up a helicopter heading towards the Frini base. Break.</br>This must be the package. Get into position to take him out. How copy?"] call ADF_fnc_MessageParser; sleep 22;
	["WOLF","","Phoenix: Solid copy. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_exfil = {
	["NONE","Neptune","Phoenix, this is Neptune. We're your ride home. ETA 3 mikes. Over."] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Phoenix: Copy Neptune. Out."] call ADF_fnc_MessageParser;
	ADF_endMission = true;
	
	waitUntil {sleep 1; wpEnd};
	Sleep 10;
	if (!alive Kallaziz_1) exitWith {
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK", 10];
		["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 01 | The Package</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
		sleep 5;
		['END1',true,5] call BIS_fnc_endMission;
	};
	if (alive Kallaziz_1) exitWith {["END2",false,5] call BIS_fnc_endMission;};
};

