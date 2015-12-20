/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / NOVEMBER 2015

Script: Mobile Respawn
Author: Whiztler
Script version: 3.31

Game type: COOP
File: ADF_MHQ.sqf
****************************************************************
This is a basic Mobile HQ script. The script offers various options
to configure in ADF_init_config.sqf:

- Enable the MHQ? (else just a normal vehicle) > TRUE / FALSE
- Respawn delay time > in minutes
- Number of respawns available > Any number greater than zero
- Vehicle classname of the MHQ > default is the BobCat

The player respawn position is moved to the MHQ location once the FOB has been deployed.
If the MHQ is destroyed the player respawn position is set to the position where the MHQ remained stationary for at least 1 minute. 
If the MHQ is moving then the player respawn is NOT updated to the (moving) MHQ position.

Instructions:
Place a vehicle on the map and name it MHQ.
****************************************************************/

if (isServer) then {diag_log "ADF RPT: Init - executing ADF_MHQ.sqf"}; // Reporting. Do NOT edit/remove

_ADF_perfDiagStart = diag_tickTime;
if (side player == EAST) exitWith {if (ADF_debug) then {["MHQ - MHQ only works for WEST side",true] call ADF_fnc_log;}}; // Blufor only!
if (ADF_isHC) exitWith {}; // HC exits script

// Check if we should run the script at all
if (isNil "MHQ") then {  // Let's see if there is an MHQ vehicle
	if !(isNil "MHQ_1") then {MHQ = MHQ_1};
	if ((isNil "MHQ_1") && !(isNil "MHQ_2")) then {MHQ = MHQ_2};
};
if (isNil "MHQ") exitWith {  // No MHQ vehicle detected
	waitUntil {ADF_missionInit;}; // wait for the mission to initialize
	Sleep 2;
	HintSilent parseText "
		<t color='#FE2E2E'>ERROR!</t><br/><br/>
		<t color='#A1A4AD'>The Mobile HQ (MHQ) is disabled.<br/>No vehicle was defined as MHQ</t><br/><br/>
		<t color='#A1A4AD'>Make sure you place a vehicle in the editor and name it MHQ.</t><br/><br/>
	";
	if (ADF_debug) then {["MHQ - Error! No MHQ vehicle detected",true] call ADF_fnc_log;};
};

waitUntil {ADF_missionInit}; // wait for the mission to initialize

// Init
ADF_MHQ_respawn_time = round ((_this select 1) * 60); // Respawn time in seconds. Set the nr. of MINUTES in the init.sqf
if (ADF_MHQ_respawn_time < 60) then {ADF_MHQ_respawn_time = 60;};
ADF_MHQ_respawnCount = _this select 2; // Nr. of times the MHQ is allowed to respawn. Configure in init.sqf
ADF_MHQ_vehicle = _this select 3; // The classname of the MHQ vehicle. Configure in init.sqf
ADF_MHQ_BuildTime = _this select 4; // time to deploy the MHQ
ADF_MHQ_PackUpTime = _this select 5; // time to deploy the MHQ
ADF_MHQ_orgPos = getPosATL MHQ; // Original spawn position (editor placed)
ADF_MHQ_lastPos = ADF_MHQ_orgPos; // Init the LastPos position
ADF_MHQ_dir = getDir MHQ;
ADF_MHQ_respawnLeft = ADF_MHQ_respawnCount;
ADF_MHQ_respawned = false;
ADF_MHQ_FOB_deployed = false;
ADF_MHQ_PlayerRespawnTimeType = "min";
ADF_MHQ_PlayerRespawnTime = 0;
if (ADF_mod_ACE3) then {MHQ setVariable ["ACE_Medical_isMedicalVehicle", true]}; // MHQ can act as medical vehicle // v1.39 a12
_avail_tickets = [west] call BIS_fnc_respawnTickets;

// Add the MHQ eventhandler and the FOB deploy action menu item
_ADF_MHQ_EH = MHQ addEventHandler ["killed", {[] spawn ADF_fnc_MHQ_respawnClient;}];
if (ADF_debug) then {["MHQ - Init done, EH loaded onto MHQ",false] call ADF_fnc_log;};// debug
ADF_MHQ_FOB_deployAction = MHQ addAction ["<t align='left' color='#CEE5F6'>Deploy the F.O.B.</t>",{remoteExec ["ADF_fnc_fobDeploy"]},[],-95,false,true,"",""];

ADF_MHQ_PlayerRespawnDelay = getNumber (missionConfigFile >> "respawnDelay");  
if (ADF_MHQ_PlayerRespawnDelay >= 60) then {
	ADF_MHQ_PlayerRespawnTimeType = "min";
	ADF_MHQ_PlayerRespawnTime = ADF_MHQ_PlayerRespawnDelay / 60;
} else {
	ADF_MHQ_PlayerRespawnTimeType = "sec";
	ADF_MHQ_PlayerRespawnTime = ADF_MHQ_PlayerRespawnDelay;
};

// MHQ info message
if (!isDedicated) then {  // 1.39 B5
	if (ADF_Tickets) then {
		ADF_MHQ_initMsg = format ["
			<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
			<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>Mobile HQ (MHQ) is enabled. The MHQ vehicle can deploy a F.O.B. when stationary. Once the F.O.B. is deployed players will respawn at the MHQ.</t><br/><br/>
			<t color='#A1A4AD' align='left'>MHQ respawns available:</t>
			<t color='#FFFFFF' align='right' font='PuristaBold'>%1</t><br/>
			<t color='#A1A4AD' align='left'>MHQ respawn time (min):</t>
			<t color='#FFFFFF' align='right' font='PuristaBold'>%2</t><br/><br/>
			<t color='#A1A4AD' align='left'>Player respawn delay (%3):</t>
			<t color='#FFFFFF' align='right' font='PuristaBold'>%4</t><br/>
			<t color='#1262c4' align='left'>BLUEFOR</t><t color='#A1A4AD' align='left'> tickets available: </t>
			<t color='#FFFFFF' align='right' font='PuristaBold'>%5</t><br/><br/>
		",ADF_MHQ_respawnLeft,(ADF_MHQ_respawn_time / 60),ADF_MHQ_PlayerRespawnTimeType,ADF_MHQ_PlayerRespawnTime,_avail_tickets];
	} else {
		ADF_MHQ_initMsg = format ["
			<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
			<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>Mobile HQ (MHQ) is enabled. The MHQ vehicle can deploy a F.O.B. when stationary. Once the F.O.B. is deployed players will respawn at the MHQ.</t><br/><br/>
			<t color='#A1A4AD' align='left'>MHQ respawns available:</t>
			<t color='#FFFFFF' align='right' font='PuristaBold'>%1</t><br/>
			<t color='#A1A4AD' align='left'>MHQ respawn time (min):</t>
			<t color='#FFFFFF' align='right' font='PuristaBold'>%2</t><br/><br/>
			<t color='#A1A4AD' align='left'>Player respawn delay (%3):</t>
			<t color='#FFFFFF' align='right' font='PuristaBold'>%4</t><br/>
		",ADF_MHQ_respawnLeft,(ADF_MHQ_respawn_time / 60),ADF_MHQ_PlayerRespawnTimeType,ADF_MHQ_PlayerRespawnTime];
	};

	sleep 5;
	hint parseText ADF_MHQ_initMsg;
};

// load the functions
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_MHQ.sqf";
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_FOB.sqf";
if (ADF_debug) then {["MHQ - MHQ and FOB Functions loaded",false] call ADF_fnc_log};

if (!isServer) exitWith {}; // from here on end run on the server only

// Setup initial WEST respawn markers
if (!isNil "respawn_west") then { // respawn_west marker exist, move it to the MHQ spawn location
	"respawn_west" setMarkerPos ADF_MHQ_orgPos;
} else { // respawn_west marker does not exit. Create a (new) player respawn marker at the location of the MHQ 
	_m = createMarker ["respawn_west",ADF_MHQ_orgPos];
	_m setMarkerShape "ICON"; 
	_m setMarkerType "Empty";
};

// Create the 'HQ flag' marker
_m = createMarker ["mMHQ",ADF_MHQ_orgPos];
_m setMarkerShape "ICON"; 
_m setMarkerType "b_hq";

if (ADF_debug) then {["MHQ - BluFor Respawn marker initialized",false] call ADF_fnc_log};

// Execute the functions
[] spawn ADF_fnc_MHQ_lastPos; // Create the last safe MHQ position marker (updated every 10 minutes)
[] spawn ADF_fnc_MHQ_PlayerRespawnPos; // Attach the respawn_west marker to the MHQ vehicle (updated every 10 seconds)
[] spawn ADF_fnc_MHQ_MHQmarker; // Attach the HQ Flag marker to the Bobcat HQ vehicle (updated every half second)

_ADF_perfDiagStop = diag_tickTime;
if (ADF_debug) then {
	_debugDiag = format [" (DIAG: %1)",_ADF_perfDiagStop - _ADF_perfDiagStart];
	_debugText = "MHQ - MHQ initialized.";
	_debugMsg = _debugText + _debugDiag;
	[_debugMsg,false] call ADF_fnc_log;
};