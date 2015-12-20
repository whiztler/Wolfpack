diag_log "ADF RPT: Init - executing init_client.sqf"; // Reporting. Do NOT edit/remove

player createDiarySubject ["Wolfpack Log","Wolfpack Log"];
player createDiaryRecord ["Wolfpack Log",["Wolf Communications Log","
<br/><br/><font color='#6c7169'>The Wolfpack Log is a logbook of all operational radio comms between Wolf and TOC<br/>
The messages are logged once displayed on screen. All messages are time-stamped and saved in order of appearance.</font>
<br/><br/>
"]];

ADF_fnc_taskObjective = {
	if (!hasInterface) exitWith {};
	params ["_obj"];
	hintSilent parseText format["<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#A1A4AD' size='1.7'>Wolfpack W.T.T.</t><br/><br/><t color='#9DA698' size='1.3'>%1</t><br/><br/><t color='#6C7169' size='1.1'>Objective Completed!</t><br/><br/>",_obj];
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<t color='#A1A4AD' size='17'>Wolfpack W.T.T.</t><br/><br/>
	<font color='#6c7169'>" + _obj + "</font><font color='#6c7169'> Objective Completed!</font>
	"]];
};

removeHeadgear player;
_WPheadGear = ["H_Watchcap_camo","H_Watchcap_blk","H_Cap_usblack","H_Bandanna_gry","H_Beret_blk"] call BIS_fnc_selectRandom;
player addHeadgear _WPheadGear;

// (re-apply) SOR uniform texture
if ((typeOf player) IN ["B_recon_F","B_recon_LAT_F","B_recon_exp_F","B_recon_medic_F","B_recon_TL_F","B_recon_M_F","B_recon_JTAC_F"]) then {
	[player] spawn {
		ADF_sorUnits = [];		
		// Check if the SOR groups are populated/exist and add to ADF_sorUnits array
		if !(isNil "gCO_4") then {ADF_sorUnits pushBack gCO_4};
		if !(isNil "gCO_41M") then {ADF_sorUnits pushBack gCO_41M};
		if !(isNil "gCO_41R") then {ADF_sorUnits pushBack gCO_41R};
		if !(isNil "gCO_41Y") then {ADF_sorUnits pushBack gCO_41Y};
		if !(isNil "gCO_41Z") then {ADF_sorUnits pushBack gCO_41Z};			
	
		waitUntil {time > 10};
		
		player setObjectTexture [0, "\A3\Characters_F\Common\Data\basicbody_black_co.paa"];
		{
			{			
				_x setObjectTexture [0, "\A3\Characters_F\Common\Data\basicbody_black_co.paa"];
			} forEach units _x;
		} forEach ADF_sorUnits;
	};
};

waitUntil {sleep 1; ADF_missionInit};
sleep 5;

_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<t color='#A1A4AD' size='17'>Wolfpack W.T.T.</t><br/><br/>
<font color='#6c7169'>Warmup for a Wolfpack mission<br/><br/>	
Train your recon skills<br/><br/>
Test Wolfpack mission mods<br/><br/>
11 Tasks/Objective<br/>to choose from<br/><br/>
JIP / Respawn enabled<br/><br/>
Teleport to Troop Leader at Flagpole<br/><br/>
Vanilla loadout. Extra kit in crates</font>
"]];

hint parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#A1A4AD' size='1.7'>Wolfpack W.T.T.</t><br/><br/><t color='#6C7169'>Warmup for a<br/>Wolfpack mission</t><br/><br/>	<t color='#6C7169'>Train your recon skills</t><br/><br/><t color='#6C7169'>Test Wolfpack<br/>mission mods</t><br/><br/><t color='#6C7169'>11 Tasks/Objective<br/>to choose from</t><br/><br/><t color='#6C7169'>JIP / Respawn enabled</t><br/><br/><t color='#6C7169'>Teleport to Troop<br/>Leader at Flagpole</t><br/><br/><t color='#6C7169'>Vanilla loadout. Extra<br/>kit in crates</t><br/><br/>";

