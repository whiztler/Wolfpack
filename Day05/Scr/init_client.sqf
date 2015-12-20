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
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 12;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Cowboy. Break.<br />Your call sign: Cougar. Out."] call ADF_fnc_MessageParser; sleep 30;
["TOC","JSOC TOC","Cowboy: Cougar, head out to rv XRAY. Niko's crew dropped off supplies at Chelonisi in case yours have water damage. Break.<br/><br/>CSAT has a large presence in greater Pyrgos. Break.<br/>Exfil is at SUNDANCE. More intel to follow. How copy?"] call ADF_fnc_MessageParser; sleep 26;
["WOLF","","Cougar: Solid copy Cowboy. Supplies at XRAY. Exfil at SUNDANCE. Out."] call ADF_fnc_MessageParser; sleep 12;

ADF_msg_Chelonisi = {
	["WOLF","","Cougar: Cowboy, this is Cougar. We are at XRAY. How copy?"] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Cowboy: Solid copy Cougar. Satnav reported a lot of activity in and around the AO. Keep your head down. Out."] call ADF_fnc_MessageParser;
	
	sleep 800;
	waitUntil {
		sleep 800 + ((random 300) + (random 300));
		if (ADF_endMission) exitWith {};
		["TOC","JSOC TOC","Cowboy: Cougar, interrogative sitrep. Over."] call ADF_fnc_MessageParser; sleep 11;
		if (ADF_endMission) exitWith {};
		private ["_p","_msg"];
		_p = getPosASL (leader (group player));
		_msg = format ["Cougar: Pappa %3. Break.<br/>Objective not located. Break.<br/>Position grid Pappa Victor %1 . %2. Over.",round (_p select 0), round (_p select 1), {alive _x} count (allPlayers - entities "HeadlessClient_F")];
		["WOLF","",_msg] call ADF_fnc_MessageParser; sleep 14;
		if (ADF_endMission) exitWith {};
		["TOC","JSOC TOC","Cowboy: Solid copy Cougar. Out"] call ADF_fnc_MessageParser;		
		ADF_endMission
	};
};

ADF_fnc_intel = {
	params ["_snooze1","_snooze2"];
	ADF_endMission = true;
	["WOLF","","Cougar: Cowboy, this is Cougar. We have found the objective. How copy?"] call ADF_fnc_MessageParser; sleep 15;
	["TOC","JSOC TOC","Cowboy: Cowboy: Solid copy Cougar.<br/><br/>Insert the USB dongle into the laptop to establish the uplink to Tango Oscar Charlie. How copy?"] call ADF_fnc_MessageParser; sleep 17;
	["WOLF","","Cougar: Copy Cowboy, inserting USB dongle now. Out."] call ADF_fnc_MessageParser; sleep 15;
	["TOC","JSOC TOC","Cowboy: Connection established. Downloading data. Out."] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Cowboy: Cougar, this may take a few mikes. Will advice when done. Out."] call ADF_fnc_MessageParser;
	if (MotsActive) then {sleep 10} else {sleep _snooze1};
	["TOC","JSOC TOC","Cowboy: Cougar, we have the data. Excellent work! Break.<br/><br/>Condor is enroute. ETA at SUNDANCE two five mikes. How copy?"] call ADF_fnc_MessageParser; sleep 22;
	["WOLF","","Cougar: Solid copy Cowboy. Cougar is Oscar Mike to SUNDANCE. Out."] call ADF_fnc_MessageParser;
	if (MotsActive) then {sleep 10} else {sleep _snooze2};
	["TOC","JSOC TOC","Cowboy: Cougar, priority message. Over."] call ADF_fnc_MessageParser; sleep 11;
	["WOLF","","Cougar: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Cowboy: Cougar, we just got word that Condor is ineffective. Break.<br/><br/>Standby for alternate exfil. Over."] call ADF_fnc_MessageParser; sleep 15;
	["WOLF","","Cougar: Standing-by. Out."] call ADF_fnc_MessageParser; sleep 8;
	if (MotsActive) then {sleep 10} else {sleep _snooze3};
	["TOC","JSOC TOC","Cowboy: Cougar, message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["WOLF","","Cougar: Send. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Cowboy: Cougar, we have no other SOAR's on station. Break.<br/><br/>Satnav advices that there are several CSAT Attack Vessels at the marina. Break. Secure one or two of these vessels and head south towards the open sea. Break. The USS Wasp is at grid 14400005. How Copy?"] call ADF_fnc_MessageParser; sleep 25;
	["WOLF","","Cougar: Solid copy Cowboy. Head to the Marina, use a CSAT boat to exfil to the WASP south west. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_exfil = {
	["WOLF","","Cougar: Wasp, this is Cougar. On approach for the North. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["NONE","USS Wasp","USS Wasp: Copy Cougar, we have you on Sierra. ETA 10 mikes. All clear ahead. Out."] call ADF_fnc_MessageParser; sleep 5;

	private "_l";
	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 10];
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 05 | Bullseye</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
	sleep 5;
	['END1',true,5] call BIS_fnc_endMission;
};