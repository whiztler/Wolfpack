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
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Eagle Eye. Break.<br />Your call sign: Eightball. Out."] call ADF_fnc_MessageParser; sleep 30;
["TOC","JSOC TOC","Eagle Eye: Eightball, move to the RV and meet up with Niko Fotopoulos. Break.<br />He'll brief you re latest intel. How copy?"] call ADF_fnc_MessageParser; sleep 12;
["WOLF","","Eightball: Solid copy Eagle Eye. Making our way to the RV to meet our contact. Out."] call ADF_fnc_MessageParser; sleep 60;
["TOC","JSOC TOC","Eagle Eye: Eightball, message Over."] call ADF_fnc_MessageParser; sleep 8;
["WOLF","","Eightball: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 11;
["TOC","JSOC TOC","Eagle Eye: Niko will bring extra supplies and radios. Break.<br />Your backpacks should carry land weapons/supplies. Break.<br /><br />We have supplied your team with LRI Tagging stickers. The stickers can be attached to targets for long-range strike capability. Niko will fill you in. How copy."] call ADF_fnc_MessageParser; sleep 20;
["WOLF","","Eightball: Solid Copy Oscar Alpha. Out."] call ADF_fnc_MessageParser;

ADF_msg_rv = {
	["NONE","Niko Fotopoulos","Niko Fotopoulos: Eightball, I am in the destroyed building opposite the church just south east of your position."] call ADF_fnc_MessageParser; sleep 11;
	["WOLF","","Eightball: Copy Niko, we'll head out to your position in a few mikes."] call ADF_fnc_MessageParser;
};

ADF_msg_niko = {
	["NONE","Niko Fotopoulos","Niko Fotopoulos: Good morning Commander, good to see you again."] call ADF_fnc_MessageParser; sleep 5;
	["NONE","Niko Fotopoulos","Niko Fotopoulos: The resistance has been disrupting Telecom networks. We need to take out the power plant and radar and communications station for a lasting effect. Your mission is as follows:<br/><br/>1. Covertly make your way towards the Power Plant. Set charges around the 9 transformers and make sure they are destroyed completely. Make sure you bring enough explosives.<br/><br/>2. Move to the Radar and Communications Station. At the large radar antennas and at the Radar Dome you have to tag the structures with the stickers provided by JSOC.<br/><br/>The objectives are marked on the map. Best of luck Commander."] call ADF_fnc_MessageParser; sleep 30;
	["WOLF","","Eightball: Thanks Niko, we'll be on our way."] call ADF_fnc_MessageParser; sleep 18;
	["WOLF","","Eightball: Eagle Eye, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Eagle Eye: Send message Over."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Eightball: Spoke to our contact. Eightball is Oscar Mike. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_powerStation = {
	["WOLF","","Eightball: Eagle Eye, this is Eightball. We are closing in on the objective. How copy?"] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Eagle Eye: Copy Eightball, we have you on SatNav at the objective. Break.<br />The transformers are quite tough. You probably need a lot of explosives to take them out. Break.<br />Search the premises for explosives if you run out. Break.<br />Make sure you destroy all 9 transformers. How copy?"] call ADF_fnc_MessageParser; sleep 18;
	["WOLF","","Eightball: Solid copy Eagle Eye. 9 transformers to be destroyed. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_powerOff = {
	ADF_obj_powerStation = true;
	["WOLF","","Eightball: Eagle Eye, this is Eightball. Message. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Eagle Eye: Go ahead Eightball."] call ADF_fnc_MessageParser; sleep 7;
	["WOLF","","Eightball: Eagle Eye, Lights are off. How copy?"] call ADF_fnc_MessageParser; sleep 8;
	if (ADF_obj_commStation) then {
		["TOC","JSOC TOC","Eagle Eye: Solid copy Eightball. Stand by for Exfil intel. Over."] call ADF_fnc_MessageParser; sleep 18;
		remoteExec ["ADF_fnc_exfil",2,false];
		["TOC","JSOC TOC","Eagle Eye: Eightball. Move to lz MIAMI for extraction. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["WOLF","","Eightball: Solid copy Eagle Eye. Heading to MIAMI for our ride home. Out."] call ADF_fnc_MessageParser; sleep 70;
		["SOAR","Lt. Mitchell","Lt. Mitchell: Eightball, this is Condor. Inbound from the south west. ETA 12 mikes. Advice vectors on final, how copy?"] call ADF_fnc_MessageParser; sleep 16;
		["WOLF","","Eightball: Copy Condor. Out."] call ADF_fnc_MessageParser;
		waitUntil {sleep 3; wpEnd};
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK", 10];
		["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 03 | Switch Off</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
		sleep 5;
		["END1",true,5] call BIS_fnc_endMission;		
	} else {
		["TOC","JSOC TOC","Eagle Eye: Solid copy Eight Ball. Next tasking is the communications station. Out."] call ADF_fnc_MessageParser;
	};
};

ADF_msg_commStation = {
	["WOLF","","Eightball: Eagle Eye, this is Eightball. We are at the objective. Over"] call ADF_fnc_MessageParser; sleep 12;
	["TOC","JSOC TOC","Eagle Eye: Copy Eightball. Once you have cleared the area, tag the radar towers and radar installation by approaching them up close. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Eightball: Solid copy. tagging the radar equipment now. Out."] call ADF_fnc_MessageParser;
	sleep 312;
	if (ADF_obj_commStation) exitWith {};
	["TOC","JSOC TOC","Eagle Eye: Eightball, interrogative, tag the two radio towers and the radar installation. Break.<br />Get close to them to tag them. Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_commsOff = {
	ADF_obj_commStation = true;
	["WOLF","","Eightball: Eagle Eye, this is Eightball. Message. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Eagle Eye: Send message. Over."] call ADF_fnc_MessageParser; sleep 6;
	["WOLF","","Eightball: Comms station is painted. How copy?"] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Eagle Eye: Solid copy Eightball. Calling in Blizzard. You have 1 mike to vacate the area. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["WOLF","","Eightball: Solid copy Eagle Eye. Getting to a safe distance. Out."] call ADF_fnc_MessageParser; sleep 16;
	["TOC","JSOC TOC","Eagle Eye: Blizzard, stand by for fire mission Oscar. Over"] call ADF_fnc_MessageParser; sleep 6;
	["NONE","Blizzard","Blizzard: Ready to copy. Over."] call ADF_fnc_MessageParser; sleep 5;
	["TOC","JSOC TOC","Eagle Eye: Blizzard, eight R, F, High Explosive with Oscar, target Julliet. Execute Oscar. How copy?"] call ADF_fnc_MessageParser; sleep 6;
	["NONE","Blizzard","Blizzard: Fire mission received with Oscar. Fire for Effect, R, F, High Explosive. Out."] call ADF_fnc_MessageParser; sleep 5;
	["NONE","Blizzard","Blizzard: R, F, High Explosive in effect, 8 rounds. Out."] call ADF_fnc_MessageParser; sleep 5;
	["NONE","Blizzard","Blizzard: Shot. Out."] call ADF_fnc_MessageParser; sleep 5;
	["NONE","Blizzard","Blizzard: Splash in 40. Out."] call ADF_fnc_MessageParser; sleep 35;
	["NONE","Blizzard","Blizzard: Splash. Out."] call ADF_fnc_MessageParser; sleep 5;
	ADF_blizzard = true; publicVariableServer "ADF_blizzard";
	["NONE","Blizzard","Blizzard: Rounds complete. End of fire mission. Out."] call ADF_fnc_MessageParser;	sleep 12;
	["WOLF","","Eightball: Blizzard, this is Eightball. Good effect on target. Out."] call ADF_fnc_MessageParser;
	sleep 14;
	if (ADF_obj_powerStation) then {
		["TOC","JSOC TOC","Eagle Eye: Eightball, stand by for Exfil intel."] call ADF_fnc_MessageParser; sleep 18;
		remoteExec ["ADF_fnc_exfil",2,false];
		["TOC","JSOC TOC","Eagle Eye: Eightball. Move to LZ MIAMI for extraction. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["WOLF","","Eightball: Solid copy Eagle Eye. Heading to MIAMI for our ride home. Out."] call ADF_fnc_MessageParser; sleep 70;
		["SOAR","Lt. Mitchell","Lt. Mitchell: Eightball, this is Condor. Inbound from the south west. ETA 12 mikes. Advice vectors on final, how copy?"] call ADF_fnc_MessageParser; sleep 16;
		["WOLF","","Eightball: Copy Condor. Out."] call ADF_fnc_MessageParser;
		waitUntil {sleep 3; wpEnd};
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK", 10];
		["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 03 | Switch Off</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
		sleep 5;
		["END1",true,5] call BIS_fnc_endMission;
	} else {
		["TOC","JSOC TOC","Eagle Eye: Good job Eightball. Head over to the power station and proceed with the mission. Out."] call ADF_fnc_MessageParser;
	};
};