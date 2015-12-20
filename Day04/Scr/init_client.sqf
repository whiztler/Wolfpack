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
	if !(isNil "SOR_RM_1") then {SOR_RM_1 assignAsCommander vWolf_1; SOR_RM_1 moveInCommander vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_UAV_1") then {SOR_UAV_1 assignAsGunner vWolf_1; SOR_UAV_1 moveInGunner vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RMM_1") then {SOR_RMM_1 assignAsDriver vWolf_1; SOR_RMM_1 moveInDriver vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RTL_1") then {SOR_RTL_1 assignAsCargo vWolf_1; SOR_RTL_1 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_2") then {SOR_RS_2 assignAsCargo vWolf_1; SOR_RS_2 moveInCargo vWolf_1;}; sleep 0.035;
	if !(isNil "SOR_RS_3") then {SOR_RS_3 assignAsCargo vWolf_1; SOR_RS_3 moveInCargo vWolf_1;}; sleep 0.035;
	
	if !(isNil "SOR_RS_4") then {SOR_RS_4 assignAsCommander vWolf_2; SOR_RS_4 moveInCommander vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_DEM_1") then {SOR_DEM_1 assignAsGunner vWolf_2; SOR_DEM_1 moveInGunner vWolf_2;}; sleep 0.035;	
	if !(isNil "SOR_RTL_2") then {SOR_RTL_2 assignAsDriver vWolf_2; SOR_RTL_2 moveInDriver vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_5") then {SOR_RS_5 assignAsCargo vWolf_2; SOR_RS_5 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_6") then {SOR_RS_6 assignAsCargo vWolf_2; SOR_RS_6 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_RS_7") then {SOR_RS_7 assignAsCargo vWolf_2; SOR_RS_7 moveInCargo vWolf_2;}; sleep 0.035;
	if !(isNil "SOR_AT_1") then {SOR_AT_1 assignAsCargo vWolf_2; SOR_AT_1 moveInCargo vWolf_2;};
};

if (!ADF_debug) then {waitUntil {ADF_missionInit}; sleep 5};

["TOC","JSOC TOC","JSOC TOC: Net. Radio check. Over."] call ADF_fnc_MessageParser; sleep 9;
["WOLF","","Wolf: This is Wolf. Lima Charlie. Out."] call ADF_fnc_MessageParser; sleep 12;
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Mother. Break.<br />Your call sign: Rattler. Out."] call ADF_fnc_MessageParser; sleep 30;
["TOC","JSOC TOC","Mother: Rattler, as per the briefing earlier today, please insert at your own accord. Your options are:<br/><br/>1. RV ALPHA<br/>Rendezvous with Dimitri/Nikos. They'll have vehicles for you to use for transport. Distance to AO: approx 7 km's. Break.<br/><br/>2. RV HOTEL<br/>Just south of Faronaki. This RV area is patrolled by CSAT naval forces. Distance to AO: approx 3 km's. Break.<br/><br/>3. RV ZULU<br/>The island of Chelonisi is considered free of CSAT forces. The bay west of it is patrolled by the CSAT navy. Distance to AO: approx 950 meters. How copy?"] call ADF_fnc_MessageParser; sleep 35;
["WOLF","","Rattler: Solid copy Mother. We are Oscar Mike. Out."] call ADF_fnc_MessageParser;

ADF_msg_rv = {
	if (rvDone) exitWith {};
	["NONE","Dimitri Tsakonas","Commander, diz iz Dimitri. Me 100 metres north west yes. Me at chappel."] call ADF_fnc_MessageParser; sleep 11;
	["WOLF","","Rattler: Understood Dimitri. We are on our way to the chapel."] call ADF_fnc_MessageParser;
};

ADF_msg_dimitri = {
	rvDone = true;
	["NONE","Dimitri Tsakonas","Dimitri Tsakonas: Hi Kommender, so sory but my Inglis no good. Name is Dimitri, good to see yu yes.<br/><br/>Nikos at Camp P12 yes. He see yu their. I put on map for yu yes. Me now go."] call ADF_fnc_MessageParser; sleep 17;
	["WOLF","","Rattler: Thank you Dimitri. Advice Nikos we will see him in a few mikes."] call ADF_fnc_MessageParser; sleep 11;
	["WOLF","","Rattler: Mother, message. Over."] call ADF_fnc_MessageParser; sleep 9;
	["TOC","JSOC TOC","Mother: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Rattler: We're at ALPHA. Spoke to Dimitri. Break.<br />Nikos wants us to go to one of his camps, about 1 click north east of our current. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["TOC","JSOC TOC","Mother: Copy Rattler. Go to the camp and talk to Nikos. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_nikos = {
	["NONE","Niko Fotopoulos","Niko Fotopoulos: Ahhh Commander, good to see you my friend. Welcome to one of our camps.<br/><br/>I understand you are going to sabotage the ABC headquarters. It is about time we get rid of CSAT propaganda.<br/>Pyrgos is well defended. A large army bases is just north of the ABC buildings. There is at least a battalion at the base. Beware of urban area's. CSAT has presence in every town now. And they patrol the entire peninsula actively.<br/><br/>I have two trucks waiting for your at our supply camp just north west of here, at Livadi. I asked the guys drop a chemlight for you at the camp. Beware of patrols. There are many!<br/><br/>Good luck Commander!"] call ADF_fnc_MessageParser; sleep 30;
	["WOLF","","Rattler: Thanks Nikos. We better get moving right away."] call ADF_fnc_MessageParser; sleep 12;
	["WOLF","","Rattler: Mother, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Mother: Ready to copy Rattler."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Rattler: We are at P12. Just got briefed by Nikos. Break.<br />We'll pick up two trucks Nikos left for as at Livadi. Break.<br />From Livadi we'll head out towards the objective. How copy?"] call ADF_fnc_MessageParser; sleep 16;
	["TOC","JSOC TOC","Mother: Solid copy Rattler. Good luck. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_ABC_ao = {
	["WOLF","","Rattler: Mother, this is Rattler. We are closing in on the objective. How copy?"] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Mother: Rattler, we have you on Satnav. Break. The ABC buildings have large antenna's on the roof. You can't miss them. Break.<br /><br/>Disable the power generators on the roof of both buildings. Break. Each building has three power generators. Break.<br/><br/>I hope you brought enough explosives. Else you'll need to look for explosives at one of the CSAT bases. How Copy?"] call ADF_fnc_MessageParser; sleep 18;
	["WOLF","","Rattler: Solid copy Mother. 2 buildings with 3 power generators each to neutralize. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_ABC_demo = {
	params ["_wait1","_wait2"];
	["WOLF","","Rattler: Mother, this is Rattler. Message. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Mother: Send message. Over."] call ADF_fnc_MessageParser; sleep 6;
	["WOLF","","Rattler: Objective completed. How copy?"] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Mother: Solid copy Rattler. Proceed to SYDNEY for exfil. Over."] call ADF_fnc_MessageParser; sleep 17;
	["WOLF","","Rattler: Roger. Rattler is Oscar Mike. Out."] call ADF_fnc_MessageParser;
	if (MotsActive) then {sleep 10} else {sleep (_wait1 - 26)}; 
	["TOC","JSOC TOC","Mother: Rattler, hold your position and standby for tasking. Out."] call ADF_fnc_MessageParser;
	if (MotsActive) then {sleep 10} else {sleep _wait2};
	["TOC","JSOC TOC","Mother: Rattler, standby for traffic. Over."] call ADF_fnc_MessageParser; sleep 6;
	["WOLF","","Rattler: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Mother: Rattler, additional tasking. Break.<br/><br/>Head towards Charkia, north of your current. Break. At Charkia there is a storage facility on the north side of the city. Break.<br/>Updates to follow. How copy?"] call ADF_fnc_MessageParser; sleep 25;
	["WOLF","","Rattler: Solid copy Mother. Head to storage facility at Charkia. Await further orders. Out."] call ADF_fnc_MessageParser;
	if (MotsActive) then {sleep 10} else {sleep _wait1};
	["TOC","JSOC TOC","Mother: Rattler, message. Over."] call ADF_fnc_MessageParser; sleep 10;
	["WOLF","","Rattler: Ready to copy."] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Mother: Rattler, apparently there are two spare generators at the storage facility. Break. Your orders are to destroy those two generators. Break.<br/><br/>Nikos crew will leave you additional explosives at the entrance of the facility.<br/><br/>Good luck Rattler. Over."] call ADF_fnc_MessageParser; sleep 27;
	["WOLF","","Rattler: Copy Mother. Search and destroy two generators at the storage facility. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_charkia_demo = {
	["WOLF","","Rattler: Mother, this is Rattler. Charkia generators destroyed. Over."] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Mother: Copy Rattler. Time to come home. Head to lz ROMEO in the Limni Swamps east of your current position. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Rattler: Solid copy Mother. Heading to ROMEO for exfil. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_exfil = {
	["SOAR","Condor","Condor: Rattler, this is Condor. ETA 5 mikes. Make sure the LZ is secure. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["WOLF","","Rattler: Solid copy Condor. Out."] call ADF_fnc_MessageParser; 
	if (MotsActive) then {sleep 20} else {sleep 300};
	ADF_launchCondor = true; publicVariableServer "ADF_launchCondor";
	waitUntil {sleep 1; wpEnd};
	private "_l";
	_l = ["tLayer"] call BIS_fnc_rscLayer; 
	_l cutText ["", "BLACK", 10];
	["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 04 | Top Screen</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
	sleep 5;
	["END1",true,5] call BIS_fnc_endMission;
};