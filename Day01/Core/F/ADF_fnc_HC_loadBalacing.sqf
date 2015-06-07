/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUN 2015

Script: Headless Client init
Author: eulerfoiler - edited by Whiztler
Script version: 1.41

Game type: N/A
File: ADF_HC_loadBalancing.sqf
****************************************************************
This is a load balancer that spreads AI's over multiple HC's
The script assumes HC's are named ADF_HC1, ADF_HC2, ADF_HC3
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_HC_loadBalancing.sqf"; // Reporting. Do NOT edit/remove

if (!ADF_HC_connected) exitWith {if (ADF_debug && isServer) then {["HC - loadBalancing - NO HC detected",false] call ADF_fnc_log};};
waitUntil {time > 20};

_ADF_HCLB_HC1_ID = -1; // Will become the Client ID of HC
_ADF_HCLB_HC2_ID = -1; // Will become the Client ID of HC2
_ADF_HCLB_HC3_ID = -1; // Will become the Client ID of HC3
ADF_HCLB_passTimer = 60;  // Pass through sleep
if (ADF_debug && isServer) then {_ADF_HCLB_compileMsg = format ["HC - loadBalancing pass through starting in %1 seconds", ADF_HCLB_passTimer];[_ADF_HCLB_compileMsg,false] call ADF_fnc_log};

while {ADF_HC_connected} do {
	// Init. Let server initialize and pass through every 60 seconds
	sleep ADF_HCLB_passTimer;
	_ADF_HCLB_loadBalance = false;
	
	///// Let's see which ADF_HC slot is populated with a HC client. If the slot is not populated the HC variable (e.g. ADF_HC2) will be ObjNull
	
	// Get ADF_HC1 Client ID else set variables to null // v1.40B01 
	if (!isNil "ADF_HC1") then {
		_ADF_HCLB_HC1_ID = owner ADF_HC1;
		if (_ADF_HCLB_HC1_ID > 2) then {
			if (ADF_debug && isServer) then {
				_ADF_HCLB_compileMsg = format ["HC - HC1 with clientID %1 detected", _ADF_HCLB_HC1_ID];
				[_ADF_HCLB_compileMsg,false] call ADF_fnc_log
			};
		};			
	} else {	 // NO ADF_HC1 connected
		ADF_HC1 = objNull; _ADF_HCLB_HC1_ID = -1;
		if (ADF_debug && isServer) then {["HC - ADF_HC1 is NOT connected",false] call ADF_fnc_log};			
	};
	
	// Get ADF_HC2 Client ID else set variables to null // v1.40B01 
	if (!isNil "ADF_HC2") then {
		_ADF_HCLB_HC2_ID = owner ADF_HC2;
		if (_ADF_HCLB_HC2_ID > 2) then {
			if (ADF_debug && isServer) then {
				_ADF_HCLB_compileMsg = format ["HC - HC2 with clientID %1 detected", _ADF_HCLB_HC2_ID];
				[_ADF_HCLB_compileMsg,false] call ADF_fnc_log
			};
		};			
	} else {	 // NO ADF_HC2 connected
		ADF_HC2 = objNull; _ADF_HCLB_HC2_ID = -1;
		if (ADF_debug && isServer) then {["HC - ADF_HC2 is NOT connected",false] call ADF_fnc_log};			
	};

	// Get ADF_HC3 Client ID else set variables to null // v1.40B01
	if (!isNil "ADF_HC3") then {
		_ADF_HCLB_HC3_ID = owner ADF_HC3;
		if (_ADF_HCLB_HC3_ID > 2) then {
			if (ADF_debug && isServer) then {
				_ADF_HCLB_compileMsg = format ["HC - HC3 with clientID %1 detected", _ADF_HCLB_HC3_ID];
				[_ADF_HCLB_compileMsg,false] call ADF_fnc_log
			};
		};			
	} else {	 // NO ADF_HC3 connected
		ADF_HC3 = objNull; _ADF_HCLB_HC3_ID = -1;
		if (ADF_debug && isServer) then {["HC - ADF_HC3 is NOT connected",false] call ADF_fnc_log};			
	};
	
	///// Let's check if 1 or more HC's is/are still populated with a client

	if ((isNull ADF_HC1) && (isNull ADF_HC2) && (isNull ADF_HC3)) then { // Wait for at least 1 HC to be active
		waitUntil {
			!isNull ADF_HC1 || 
			!isNull ADF_HC2 || 
			!isNull ADF_HC3
		}
	};
	
	if ( // Only activate loadbalancing with 2 or more HC's
		(!isNull ADF_HC1 && !isNull ADF_HC2) || 
		(!isNull ADF_HC1 && !isNull ADF_HC3) || 
		(!isNull ADF_HC2 && !isNull ADF_HC3)
	) then {_ADF_HCLB_loadBalance = true;}; 

	// Debug
	if (_ADF_HCLB_loadBalance) then {
		if (ADF_debug && isServer) then {["HC - starting loadBalancing to multiple HC's",false] call ADF_fnc_log};
	} else {
		if (ADF_debug && isServer) then {["HC - starting loadBalancing to a single HC",false] call ADF_fnc_log};
	};
	
	///// One or more HC's active. Load balancing from here on

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
					default {_ADF_HCLB_compileMsg = format ["HC - No Valid HC to pass to. ** _ADF_HCLB_currentHC = %1 **", _ADF_HCLB_currentHC]; if (isServer) then {[_ADF_HCLB_compileMsg1,true] call ADF_fnc_log;};};
				};
			} else {
				switch (_ADF_HCLB_currentHC) do {
					case 1: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC1_ID;};
					case 2: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC2_ID;};
					case 3: {_ADF_HCLB_robin = _x setGroupOwner _ADF_HCLB_HC3_ID;};
					default {_ADF_HCLB_compileMsg = format ["HC - No Valid HC to pass to. ** _ADF_HCLB_currentHC = %1 **", _ADF_HCLB_currentHC]; if (isServer) then {[_ADF_HCLB_compileMsg1,true] call ADF_fnc_log;};};
				};
			};			
			
			if (_ADF_HCLB_robin) then {_ADF_HCLB_numTransfered = _ADF_HCLB_numTransfered + 1;};
		};
	} forEach (allGroups);
 
	///// Extended debug reporting
	
	if (ADF_Debug && isServer) then {
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
		if (!isServer) exitWith {};
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
			if (isServer) then {diag_log "ADF RPT: HC - No AI groups to transfer at the moment";};
		};
	};
};

if (isServer) exitWith {["HC - <ERROR> Headless Client(s) disconnected",true] call ADF_fnc_log;}; // v1.39 B5