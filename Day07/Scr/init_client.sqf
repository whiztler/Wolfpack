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
["TOC","JSOC TOC","JSOC TOC: Commander, call signs are as follows:<br/><br/>TOC: Gator. Break.<br />Your call sign: Beagle. Out."] call ADF_fnc_MessageParser; sleep 50;
["TOC","JSOC TOC","Gator: Beagle, Niko's men will be waiting at the RV. Break. They'll provide security for your assault vessels. Break.<br/><br/>They have hidden a small ammo cache at Atinarki, just west of the RV, in case you need additional supplies. Break.<br/><br/>You'll be using your assault vessels for exfil as well. Do not damage them else you'll be stuck on Altis. How Copy?"] call ADF_fnc_MessageParser; sleep 27;
["WOLF","","Beagle: Solid copy Gator. Niko's man at the RV. Supplies at Atinarki and we are using our boats for exfil. Out."] call ADF_fnc_MessageParser;

ADF_msg_nikosKilled = {
	["WOLF","","Beagle: Gator, this is Beagle. Priority Message over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Gator: Send. Over."] call ADF_fnc_MessageParser; sleep 7;
	["WOLF","","Beagle: Gator, we lost the package. How copy?"] call ADF_fnc_MessageParser; sleep 16;
	["TOC","JSOC TOC","Gator: Solid copy. Break. Unacceptable Beagle. Abort mission. Break. RTB immediatly. Out."] call ADF_fnc_MessageParser; sleep 8;
	["END2",false,5] call BIS_fnc_endMission;
};

ADF_fnc_nikosRescued = {	
	NikkosRescued = true; 
	tNR = true;
	["WOLF","","Beagle: Gator, stand by for traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
	["TOC","JSOC TOC","Gator: Send Traffic. Over."] call ADF_fnc_MessageParser; sleep 7;	
	["WOLF","","Beagle: Gator, we have the package. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Gator: Solid copy Beagle. Break. Escort the package back to BILLY. Break. Have the package board the assault vessel. Break. Head south east towards the exfil location where the USS Anchorage will pick you up. Over."] call ADF_fnc_MessageParser; sleep 44;
	["TOC","JSOC TOC","Gator: Did you copy Beagle?. Escort the package back to BILLY. Break. Have the package board the assault vessel and head south east towards the USS Anchorage. How copy?"] call ADF_fnc_MessageParser; sleep 22;
	["WOLF","","Beagle: Solid copy Gator. Beagle is Oscar Mike to BILLY"] call ADF_fnc_MessageParser;
	sleep ADF_counter - 100;
	["TOC","JSOC TOC","Gator: Beagle, standby for priority traffic. Over."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Beagle: Send traffic. Over."] call ADF_fnc_MessageParser; sleep 7;
	["TOC","JSOC TOC","Gator: Beagle, we just received intel from SatNav that several vehicles have left Pyrgos and are heading your way. Break<br/><br/>No matter what, you make sure you get the package to safety asap. How copy?"] call ADF_fnc_MessageParser; sleep 14;
	["WOLF","","Beagle: Copy Gator, thanks for the heads up. Out."] call ADF_fnc_MessageParser;
	sleep ADF_counter;
	["TOC","JSOC TOC","Gator: Beagle, message. Over."] call ADF_fnc_MessageParser; sleep 8;
	["WOLF","","Beagle: Standing by. Over."] call ADF_fnc_MessageParser; sleep 10;
	["TOC","JSOC TOC","Gator: Satnav reports a Kajman gunship just took off from Abdera Heliport and is heading towards U-12. ETA 4 Mikes. Out."] call ADF_fnc_MessageParser;
};

ADF_msg_U12 = {
	["WOLF","","Beagle: Gator this is Beagle, we are closing in on U12. How copy?"] call ADF_fnc_MessageParser; sleep 11;
	["TOC","JSOC TOC","Gator: Solid copy Beagle, we have you on SatNav. Break.<br/><br/>Once inside the compound, find Nikos and assign him to your group. Break. A action menu will be available once you are in close proximity of Nikos.<br/><br/>Good luck Beagle! Out."] call ADF_fnc_MessageParser;
};

ADF_fnc_exfil = {
	if ((alive uNikkos) && NikkosRescued) exitWith {
		["WOLF","","Beagle: Anchorage, this is Beagle. North vectors. How copy?"] call ADF_fnc_MessageParser; sleep 11;
		["NONE","USS Anchorage","USS Anchorage: Copy Beagle, Sierra shows no bandits on your approach. Out."] call ADF_fnc_MessageParser; sleep 5;
		private "_l";
		_l = ["tLayer"] call BIS_fnc_rscLayer; 
		_l cutText ["", "BLACK", 10];
		["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 07 | U-12</t>",0,0,3,4] spawn BIS_fnc_dynamicText;		
		['END1',true,12] call BIS_fnc_endMission;
	};
};