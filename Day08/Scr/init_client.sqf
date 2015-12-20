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
	["SOAR",">160th SOAR","160th SOAR Lt. Randahl: Commander, 30 seconds! Get ready!"] call ADF_fnc_MessageParser;
};

[] spawn {
	waitUntil {sleep 1; vWolf_takeOff};
	["SOAR",">160th SOAR","160th SOAR Lt. Randahl: Dusting off in 5 seconds."] call ADF_fnc_MessageParser;	
};

["TOC","JSOC TOC","JSOC TOC: Net. Radio check. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 7;
["SOAR","160th SOAR","Raven: This Raven. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 11;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Shepherd. Break.<br />Your call sign: Fox. Out."] call ADF_fnc_MessageParser; sleep 50;
["TOC","JSOC TOC","Shepherd: Fox, Shepherd: Tango Oscar Charlie will advice search grid in a few mikes. Out."] call ADF_fnc_MessageParser;

ADF_msg_locNorth = {
	["TOC","JSOC TOC","Shepherd: Fox, message. Over."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Fox: Send message. Over"] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Shepherd: Fox, intel suggests that Ice Tiger is somewhere further north. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_locWest = {
	["TOC","JSOC TOC","Shepherd: Fox, message. Over."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Fox: Ready to copy. Over."] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Shepherd: Fox, intel suggests that the position of Ice Tiger is to your west of your current position. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_tigerTag = {
	private "_msg";
	tagCount = tagCount + 1;
	_msg = format ["Tiger tagged. Number tagged so far: %1",tagCount];
	["WOLF","",_msg] call ADF_fnc_MessageParser;
};

ADF_msg_timeSeven = {
	["TOC","JSOC TOC","Shepherd: Fox, message. Over."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Fox: Ready to copy Sherherd. Over."] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Shepherd: Fox, we have just received some intel re a possible location of IceTiger. We have send the coordinates to your GPS ComLink. Out."] call ADF_fnc_MessageParser;
};
ADF_msg_timeeight = {
	["TOC","JSOC TOC","Shepherd: Fox, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Fox: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Shepherd: Fox, we have received more information about a possible location. We have send the coordinates to your GPS ComLink. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_iceTigerLocated = {
	["WOLF","","Fox: Shepherd, this Fox. Stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Shepherd: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Fox: Shepherd, Fox has located Ice Tiger. Awaiting further orders. How copy?"] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Shepherd: Wait. Out."] call ADF_fnc_MessageParser; sleep 50;
	["TOC","JSOC TOC","Shepherd: Fox, we need you to tag a few of the T100 Tigers with a GPS tracker. Break.<br/><br/>Get close enough to the Tiger in order to place the GPS tracker. How copy?"] call ADF_fnc_MessageParser; sleep 18;
	["WOLF","","Fox: Solid copy Shepherd. Tag a couple of Tigers wiith a tracker. Out."] call ADF_fnc_MessageParser; sleep 12;

	waitUntil {
		sleep 5;
		(
			triggerActivated tObj1 ||
			triggerActivated tObj2 ||
			triggerActivated tObj3 ||
			triggerActivated tObj4 ||
			triggerActivated tObj5 ||
			triggerActivated tObj6
		);
	};	
	sleep 20;
	
	["WOLF","","Fox: Shepherd, we have Ice Tiger tagged. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["TOC","JSOC TOC","Shepherd: Solid Copy Fox. Tango Oscar Charlie has a clear signal on the location of Ice Tiger. Break.<br/><br/>Standby for exfil tasking. Over."] call ADF_fnc_MessageParser; sleep 19;
	["WOLF","","Fox: Standing by. Out."] call ADF_fnc_MessageParser; sleep 95;
	["TOC","JSOC TOC","Shepherd: Fox, Message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["WOLF","","Fox: Send. Over."] call ADF_fnc_MessageParser; sleep 95;
	["TOC","JSOC TOC","Shepherd: Fox, head north west from your current position. We will advice exfil later. Out."] call ADF_fnc_MessageParser; 
	
	if (MotsActive || ADF_debug) then {sleep 10;} else {sleep ((random 500) + (random 500))};

	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 10];
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 08 | Ice Tiger</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
	sleep 5;
	['END1',true,5] call BIS_fnc_endMission;
};

[] spawn {
	waitUntil {sleep 1; !isNil "iceTigerLoc"};
	if (MotsActive || ADF_debug) then {sleep 40} else {sleep 180};
	
	["TOC","JSOC TOC","Shepherd: Fox, message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["WOLF","","Fox: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 9;
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6C7169'>Shepherd: Fox, we just got word from Nikos. Break. He thinks that 'Ice Tiger's' location is somewhere in the following grid:</font><br/><br/>
	<font color='#9DA698' align='center' size='16'>031223 - 091231</font><br/>
	<font color='#9DA698' align='center' size='16'>042184 - 100164</font><br/><br/>
	<font color='#6C7169'>The 7 x 7 Km area covers the north western tip of Altis to </font>
	<font color='#9DA698'>Krya Nera </font>
	<font color='#6C7169'>and all the way down to </font>
	<font color='#9DA698'>Negades </font>
	<font color='#6C7169'>and just north of </font>	
	<font color='#9DA698'>Agios Dionysios. Break.</font><br/><br/>
	<font color='#6C7169'>Report in once you have located Ice Tiger.<br/></font>
	<font color='#6C7169'>Good hunting Viper!</font>
	<br/><br/>"]];	
	for "_i" from 1 to 30 do {
		hintSilent parseText "<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Shepherd: Fox, we just got word from Nikos. Break. He thinks that 'Ice Tiger's' location is somewhere in the following grid:</t><br/><br/><t color='#9DA698' align='center' size='1.3'>031223 - 091231</t><br/><t color='#9DA698' align='center' size='1.3'>042184 - 100164</t><br/><br/><t color='#6C7169' align='left'>The 7 x 7 Km area covers the north western tip of Altis to </t><t color='#9DA698' align='left'>Krya Nera </t><t color='#6C7169' align='left'>and all the way down to </t><t color='#9DA698' align='left'>Negades </t><t color='#6C7169' align='left'>and just north of </t>	<t color='#9DA698' align='left'>Agios Dionysios. Break</t><br/><br/><t color='#6C7169' align='left'>Good hunting Viper!<br/></t>";
		sleep 1;
	}; sleep 20;
	["WOLF","","Fox: Solid copy Shepherd, Fox is Oscar Mike. Out."] call ADF_fnc_MessageParser;
	
	sleep 1500;
	waitUntil {
		sleep 800 + ((random 300) + (random 300));
		if (ADF_iceTigerLocated) exitWith {};
		["TOC","JSOC TOC","Shepherd: Fox, interrogative sitrep. Over."] call ADF_fnc_MessageParser; sleep 11;
		if (ADF_iceTigerLocated) exitWith {};
		private ["_p","_msg"];
		_p = getPosASL (leader (group player));
		_msg = format ["Fox: Pappa %3. Break.<br/>Objective not located. Break.<br/>Position grid Romeo Victor %1 . %2. Over.",round (_p select 0), round (_p select 1), {alive _x} count (allPlayers - entities "HeadlessClient_F")];
		["WOLF","",_msg] call ADF_fnc_MessageParser; sleep 14;
		if (ADF_iceTigerLocated) exitWith {};
		["TOC","JSOC TOC","Shepherd: Solid copy Fox. Out"] call ADF_fnc_MessageParser;		
		ADF_iceTigerLocated
	};
};