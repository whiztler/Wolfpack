diag_log "ADF RPT: Init - executing ADF_fnc_MHQ.sqf"; // Reporting. Do NOT edit/remove

// MHQ ADF_fnc_MHQ

ADF_fnc_MHQ_respawnClient = { // Function fired up by the 'KILLED' eventhandler when the MHQ is destroyed
	ADF_MHQ_respawnLeft = ADF_MHQ_respawnLeft - 1;	
	if (ADF_MHQ_respawnLeft != 0) then { // There are still MHQ vehicle respawns left
		HintSilent parseText format ["
			<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
			<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>The MHQ was destroyed. The MHQ reinforcements arrive in</t>
			<t color='#FFFFFF' align='left'> %1 </t>
			<t color='#A1A4AD' align='left'>minutes.</t><br/><br/>
			<t color='#A1A4AD' align='left'>MHQ reinforcements left: </t><t color='#FFFFFF' align='left'>%2</t><br/>			
		",(ADF_MHQ_respawn_time / 60),ADF_MHQ_respawnLeft];

		if (ADF_MHQ_FOB_deployed) then { // Clean up the FOB if the MHQ was destroyed whilst the FOB was deployed
			[[],"ADF_fnc_fobDeleteObj"] spawn BIS_fnc_MP;		
		};

		ADF_MHQ_FOB_deployed = false; publicVariable "ADF_MHQ_FOB_deployed"; // Announce that the FOB is no longer deployed
		
		[[],"ADF_fnc_MHQ_respawn"] spawn BIS_fnc_MP; // Load the MHQ respawn function
		
	} else { // All mobile HQ respawns used!
		HintSilent parseText format ["
			<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
			<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>The MHQ was destroyed. There are</t>
			<t color='#FFFFFF' align='left'> no </t>
			<t color='#A1A4AD' align='left'>more MHQ reinforcements left.</t><br/><br/>
			<t color='#A1A4AD' align='left'>The new player respawn position is now at grid: </t>
			<t color='#FFFFFF' align='left'>%1 %2</t><br/>
		",round (ADF_MHQ_lastPos select 0),round (ADF_MHQ_lastPos select 1)];
		
		[[],"ADF_fnc_MHQ_FinalSpawn"] call BIS_fnc_MP;	// Create a permanent player respawn location
	};
};

ADF_fnc_MHQ_lastPos = {  // Create the last safe MHQ position marker (updated every 1 minute)
	while {alive MHQ && ADF_MHQ_FOB_deployed} do {
		ADF_MHQ_lastPos = getPosATL MHQ; publicVariable "ADF_MHQ_lastPos";
		if (ADF_debug) then {["MHQ - LastPos set.",false] call ADF_fnc_log};
		sleep 60; // 1 minute
	};	
	if (ADF_debug) then {["MHQ - LastPos updated.",false] call ADF_fnc_log};
};

ADF_fnc_MHQ_PlayerRespawnPos = { // Attach the respawn_west marker to the FOB (updated every 10 seconds)
	while {alive MHQ && ADF_MHQ_FOB_deployed} do {
		private ["_posMHQ"];
		_posMHQ = getPosATL MHQ;
		"respawn_west" setMarkerPos [(_posMHQ select 0) + 3, (_posMHQ select 1) + 3, 0];				
		sleep 10;
		if (ADF_debug) then {["MHQ - Respawn pos updated.",false] call ADF_fnc_log};
	};
	
	"respawn_west" setMarkerPos ADF_MHQ_lastPos; // last safe MHQ position in case MHQ is destroyed or on the move
	if (ADF_debug) then {["MHQ - Respawn set to MHQ LastPos.",false] call ADF_fnc_log};
};

ADF_fnc_MHQ_MHQmarker = {	// Attach the HQ Flag marker to the MHQ vehicle (updated every half second when on the move)
	while {alive MHQ} do {
		"mMHQ" setMarkerPos getPosATL MHQ;
		if (speed MHQ > 0) then {sleep .5;} else {sleep 10}; // Marker refresh time		
	};

	deleteMarker "mMHQ"; // MHQ is destroyed, delete the Flag Marker
	if (ADF_debug) then {["MHQ - Vehicle destroyed, flag marker deleted.",false] call ADF_fnc_log};
};

ADF_fnc_MHQ_respawn = {
	if (isServer) then {
		//MHQ = nil; // destroy the MHQ variable		
		sleep ADF_MHQ_respawn_time; // MHQ vehicle respawn time as configured in init.sqf
		
		MHQ = createVehicle [ADF_MHQ_vehicle,ADF_MHQ_orgPos, [], 0, "none"]; publicVariable "MHQ"; // Create a new MHQ
		MHQ setDir ADF_MHQ_dir;
		
		_m = createMarker ["mMHQ",ADF_MHQ_orgPos]; _m setMarkerShape "ICON"; _m setMarkerType "b_hq"; // Create a new 'HQ flag' marker
		if (ADF_debug) then {["MHQ - Respawn: new vehicle created",false] call ADF_fnc_log};
		
		[[],"ADF_fnc_MHQ_addEH"] call BIS_fnc_MP; // Add a new KILLED eventhandler to the MHQ
		[MHQ] execVM "Core\C\ADF_vCargo_B_MHQ.sqf"; // Load the supplies
		
		if (ADF_debug) then {["MHQ - Respawn: re-loading ADF_fnc_MHQ...",false] call ADF_fnc_log};
		[] spawn ADF_fnc_MHQ_lastPos; // reload to update with new data
		[] spawn ADF_fnc_MHQ_PlayerRespawnPos; // reload to update with new data
		[] spawn ADF_fnc_MHQ_MHQmarker; // reload to update with new data
		[[],"ADF_fnc_MHQ_respawned"] call BIS_fnc_MP; // Display a message that the MHQ has respawned		
		
		if (ADF_debug) then {["MHQ - Respawn: Respawn: done (server).",false] call ADF_fnc_log};
	};
};

ADF_fnc_MHQ_addEH = { // re-add the EH and AddAction (new spawned MHQ)
	_ADF_MHQ_EH = MHQ addEventHandler ["killed", {[] spawn ADF_fnc_MHQ_respawnClient;}];
	MHQ addAction ["<t align='left' color='#CEE5F6'>Deploy the F.O.B.</t>",{[[],"ADF_fnc_fobDeploy"] call BIS_fnc_MP;},[],-98,false,true,"",""];
};

ADF_fnc_MHQ_respawned = { // Display a hint that the MHQ has respawned
	HintSilent parseText format ["
		<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
		<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
		<t color='#A1A4AD'>Mobile HQ respawned at grid:</t><br/>
		<t color='#FFFFFF'>%1 %2</t><br/>
	",round (ADF_MHQ_orgPos select 0), round (ADF_MHQ_orgPos select 1)];
	sleep 8;
	hintSilent "";
};

ADF_fnc_MHQ_FinalSpawn = { // All MHQ's destroyed. Create marker to show final player respawn location
	if (!isServer) exitWith {};
	_m = createMarker ["finalSpawn",getMarkerPos "respawn_west"];
	_m setMarkerShape "ICON"; 
	_m setMarkerType "respawn_inf";	
	_m setMarkerColor "ColorWEST";
	_m setMarkerText "Reinforcements";
	if (ADF_debug) then {["MHQ - Final respawn position created",false] call ADF_fnc_log};
};

if (ADF_debug) then {["MHQ - Function MHQ loaded",false] call ADF_fnc_log};