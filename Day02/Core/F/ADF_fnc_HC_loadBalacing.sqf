/****************************************************************
ARMA Mission Development Framework
ADF version: 1.39 / MAY 2015

Script: Headless Client init
Author: eulerfoiler - edited by Whiztler
Script version: 1.21

Game type: N/A
File: ADF_HC_loadBalancing.sqf
****************************************************************
This is a load balancer that spreads AI's over multiple HC's
The script assumes HC's are named ADF_HC1, ADF_HC2, ADF_HC3
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_HC_loadBalancing.sqf"; // Reporting. Do NOT edit/remove

if (!ADF_HC_connected) exitWith {if (ADF_debug) then {["HC - loadBalancing - NO HC detected",false] call ADF_fnc_log};};

_ADF_HCLB_HC1_ID = -1; // Will become the Client ID of HC
_ADF_HCLB_HC2_ID = -1; // Will become the Client ID of HC2
_ADF_HCLB_HC3_ID = -1; // Will become the Client ID of HC3
ADF_HCLB_passTimer = 60;  // Pass through sleep
if (ADF_debug) then {_ADF_HCLB_compileMsg = format ["HC - loadBalancing pass through starting in %1 seconds", ADF_HCLB_passTimer];[_ADF_HCLB_compileMsg,false] call ADF_fnc_log};

while {ADF_HC_connected} do {
	sleep ADF_HCLB_passTimer;   // Let server initialize and pass through ever 60 seconds
	_ADF_HCLB_loadBalance = false;
	_ADF_HCLB_HC1_ID = owner ADF_HC1;
	if (ADF_debug && (_ADF_HCLB_HC1_ID > 2)) then {_ADF_HCLB_compileMsg = format ["HC - HC1 with clientID %1 detected", _ADF_HCLB_HC1_ID];[_ADF_HCLB_compileMsg,false] call ADF_fnc_log};


	// Get HC2 Client ID else set variables to null
	if (!isNil "ADF_HC2") then {
		_ADF_HCLB_HC2_ID = owner ADF_HC2;
		if (ADF_debug && (_ADF_HCLB_HC2_ID > 2)) then {_ADF_HCLB_compileMsg = format ["HC - HC2 with clientID %1 detected", _ADF_HCLB_HC3_ID];[_ADF_HCLB_compileMsg,false] call ADF_fnc_log};
		if !(_ADF_HCLB_HC2_ID > 2) then {ADF_HC2 = objNull; _ADF_HCLB_HC2_ID = -1;};
	};

	// Get HC3 Client ID else set variables to null
	if (!isNil "ADF_HC3") then {
		_ADF_HCLB_HC3_ID = owner ADF_HC3;
		if (ADF_debug && (_ADF_HCLB_HC3_ID > 2)) then {_ADF_HCLB_compileMsg = format ["HC - HC3 with clientID %1 detected", _ADF_HCLB_HC3_ID];[_ADF_HCLB_compileMsg,false] call ADF_fnc_log};
		if !(_ADF_HCLB_HC3_ID > 2) then {ADF_HC3 = objNull; _ADF_HCLB_HC3_ID = -1;};
	};

	if ((isNull ADF_HC1) && (isNull ADF_HC2) && (isNull ADF_HC3)) then {waitUntil {!isNull ADF_HC1 || !isNull ADF_HC2 || !isNull ADF_HC3}};  // Wait for at least 1 HC to be active
	if ((!isNull ADF_HC1 && !isNull ADF_HC2) || (!isNull ADF_HC1 && !isNull ADF_HC3) || (!isNull ADF_HC2 && !isNull ADF_HC3) ) then {_ADF_HCLB_loadBalance = true;};

	// Debug
	if (_ADF_HCLB_loadBalance) then {
		if (ADF_debug) then {["HC - starting loadBalancing to multiple HC's",false] call ADF_fnc_log};
	} else {
		if (ADF_debug) then {["HC - starting loadBalancing to a single HC",false] call ADF_fnc_log};
	};

	// Determine first HC to start with
	_ADF_HCLB_currentHC = 0;
	if (!isNull ADF_HC1) then { _ADF_HCLB_currentHC = 1; } else {if (!isNull ADF_HC2) then { _ADF_HCLB_currentHC = 2; } else { _ADF_HCLB_currentHC = 3;}};

	// Pass the AI
	_ADF_HCLB_numTransfered = 0;
	{
		_ADF_HCLB_swap = true;
		{if (isPlayer _x) then {_ADF_HCLB_swap = false;};} forEach (units _x); // Not for player groups

		// If load balance enabled, round robin between the multiple HC's - else pass all to a single HC
		if (_ADF_HCLB_swap) then {
			_ADF_HCLB_robin = false;
			if (_ADF_HCLB_loadBalance) then {
				switch (_ADF_HCLB_currentHC) do {
					case 1: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC1_ID; if (!isNull ADF_HC2) then {_ADF_HCLB_currentHC = 2;} else {_ADF_HCLB_currentHC = 3;};};
					case 2: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC2_ID; if (!isNull ADF_HC3) then {_ADF_HCLB_currentHC = 3;} else {_ADF_HCLB_currentHC = 1;};};
					case 3: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC3_ID; if (!isNull ADF_HC1) then {_ADF_HCLB_currentHC = 1;} else {_ADF_HCLB_currentHC = 2;};};
					default {_ADF_HCLB_compileMsg = format ["HC - No Valid HC to pass to. ** _ADF_HCLB_currentHC = %1 **", _ADF_HCLB_currentHC]; [_ADF_HCLB_compileMsg1,true] call ADF_fnc_log;};
				};
			} else {
				switch (_ADF_HCLB_currentHC) do {
					case 1: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC1_ID;};
					case 2: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC2_ID;};
					case 3: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC3_ID;};
					default {_ADF_HCLB_compileMsg = format ["HC - No Valid HC to pass to. ** _ADF_HCLB_currentHC = %1 **", _ADF_HCLB_currentHC]; [_ADF_HCLB_compileMsg1,true] call ADF_fnc_log;};
				};
			};			
			
			if (_ADF_HCLB_robin) then {_ADF_HCLB_numTransfered = _ADF_HCLB_numTransfered + 1;};
		};
	} forEach (allGroups);
 
	// Extended debug reporting
	if (ADF_Debug) then {
		if (_ADF_HCLB_numTransfered > 0) then {
			_ADF_HCLB_compileMsg = format ["HC - Transferred %1 AI groups to HC(s)",_ADF_HCLB_numTransfered];
			[_ADF_HCLB_compileMsg,false] call ADF_fnc_log;			
			_ADF_HCLB_numHC1 = 0; _ADF_HCLB_numHC2 = 0; _ADF_HCLB_numHC3 = 0;

			{
				switch (owner ((units _x) select 0)) do {
					case _ADF_HCLB_HC1_ID: {_ADF_HCLB_numHC1 = _ADF_HCLB_numHC1 + 1;};
					case _ADF_HCLB_HC2_ID: {_ADF_HCLB_numHC2 = _ADF_HCLB_numHC2 + 1;};
					case _ADF_HCLB_HC3_ID: {_ADF_HCLB_numHC3 = _ADF_HCLB_numHC3 + 1;};
				};
			} forEach (allGroups);
		   
		   _ADF_HCLB_compileMsg1 = format ["HC - %1 AI groups currently on HC1", _ADF_HCLB_numHC1];
		   _ADF_HCLB_compileMsg2 = format ["HC - %1 AI groups currently on HC2", _ADF_HCLB_numHC2];
		   _ADF_HCLB_compileMsg3 = format ["HC - %1 AI groups currently on HC3", _ADF_HCLB_numHC3];

			if (_ADF_HCLB_numHC1 > 0) then {[_ADF_HCLB_compileMsg1,false] call ADF_fnc_log;};
			if (_ADF_HCLB_numHC2 > 0) then {[_ADF_HCLB_compileMsg2,false] call ADF_fnc_log;};
			if (_ADF_HCLB_numHC3 > 0) then {[_ADF_HCLB_compileMsg3,false] call ADF_fnc_log;};

			_ADF_HCLB_compileMsg4 = format ["HC - Transferred: Total %1 AI groups across all HC('s)", (_ADF_HCLB_numHC1 + _ADF_HCLB_numHC2 + _ADF_HCLB_numHC3)];
			[_ADF_HCLB_compileMsg4,false] call ADF_fnc_log;
		} else {
			["HC - No AI groups to transfer at the moment",false] call ADF_fnc_log;
		};
	} else {
		if (_ADF_HCLB_numTransfered > 0) then {
			diag_log format ["ADF RPT: HC - Transferred %1 AI groups to HC(s)",_ADF_HCLB_numTransfered];					
			_ADF_HCLB_numHC1 = 0; _ADF_HCLB_numHC2 = 0; _ADF_HCLB_numHC3 = 0;

			{
				switch (owner ((units _x) select 0)) do {
					case _ADF_HCLB_HC1_ID: {_ADF_HCLB_numHC1 = _ADF_HCLB_numHC1 + 1;};
					case _ADF_HCLB_HC2_ID: {_ADF_HCLB_numHC2 = _ADF_HCLB_numHC2 + 1;};
					case _ADF_HCLB_HC3_ID: {_ADF_HCLB_numHC3 = _ADF_HCLB_numHC3 + 1;};
				};
			} forEach (allGroups); 

			if (_ADF_HCLB_numHC1 > 0) then {diag_log format ["ADF RPT: HC - %1 AI groups currently on HC1", _ADF_HCLB_numHC1];};
			if (_ADF_HCLB_numHC2 > 0) then {diag_log format ["ADF RPT: HC - %1 AI groups currently on HC2", _ADF_HCLB_numHC2];};
			if (_ADF_HCLB_numHC3 > 0) then {diag_log format ["ADF RPT: HC - %1 AI groups currently on HC3", _ADF_HCLB_numHC3];};

			diag_log format ["ADF RPT: HC - Transferred: Total %1 AI groups across all HC('s)", (_ADF_HCLB_numHC1 + _ADF_HCLB_numHC2 + _ADF_HCLB_numHC3)];
		} else {
			diag_log "ADF RPT: HC - No AI groups to transfer at the moment";
		};
	};
};

["HC - <ERROR> Headless Client disconnected",true] call ADF_fnc_log; // v1.39 B5