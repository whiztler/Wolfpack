/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Distance calculator (player to object)
Author: Whiztler
Script version: 1.1

Game type: n/a
File: ADF_snipDetect.sqf
****************************************************************
About:
Function to check if Opfor knows about the player. 
A hint is displayed showing the Opfor units, distance between then
player and the Opfor units and the 'knows about' detection ratio (0-4)

Instructions:
Only works with EAST Opfor units
****************************************************************/

// init
private ["_cnt"];
_cnt = 0;
ADF_detect_stop = false;
ADF_terminate_detect = false; // set variable

ADF_detect_noOpfor = {
	Hint parseText "	
	<t color='#ffffff' align='left' size='1.2'>OpFor Detection Stopped</t><br/><br/>
	<t color='#A1A4AD' align='left'>No OpFor units detected.</t>";
};
ADF_detect_stopped = {
	hintSilent parseText "
	<t size='1.2' color='#ffffff' align='left'>OpFor Detection</t><br/><br/>
	<t color='#A1A4AD' align='left'>Detection stopped by player.</t>";
	sleep 3;
	hintSilent "";
	ADF_detect_stop = true;
};

_cnt = {((side _x) == EAST) && alive _x} count allUnits;
if (_cnt == 0) exitwith {call ADF_detect_noOpfor};

// Start the detection loop
ADF_fnc_detect = [] spawn {
	private ["_msg"];
	while {alive player} do {

		uiSleep 0.5;    
		_msg = "<t size='1.2' color='#FFFFFF' align='left'>OpFor Detection</t><br/><br/><t color='#A1A4AD' align='left'>The function determines if (and by how much) an OpFor unit knows about a target (player). The function returns values between 0 (does not know about the target) and 4 (is fully aware of the target).<br/><br/>When the ratio > 1.3, the player is spotted and OpFor will search and engage. Note that the ratio differs according to weather and time conditions.</t><br/><br/><br/><t color='#A1A4AD' align='left'>OpFor unit</t><t color='#F7D358' align='center'>Detect Ratio</t><t color='#A1A4AD' align='right'>Distance</t>";
		_msg = _msg + "<br/>";	
		{
			if (side _x == EAST) then {
				_msg = _msg + format ["
					<t color='#FFFFFF' align='left'>%1</t><t color='#F7D358' align='center'>%2</t><t color='#FFFFFF' align='right'>%3</t>
				", _x, round ((_x knowsAbout player) * (10 ^ 1)) / (10 ^ 1), round (_x distance player)];	
				_msg = _msg + "<br/>";	
				}
		} forEach AllUnits;		

		hintSilent parseText _msg;

		if ({(side _x == East) && (alive _x)} count allUnits == 0) then {terminate ADF_fnc_detect; call ADF_detect_noOpfor};
		if (ADF_terminate_detect) exitWith {call ADF_detect_stopped};
	}; // /while alive player
	if !(ADF_detect_stop) then {hintSilent parseText "<t size='1.2' color='#FFFFFF' align='left'>OpFor Detection</t><br/><br/><t color='#A1A4AD' align='left'>Player is no longer alive</t>"}; // break out due to dead player
};
