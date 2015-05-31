diag_log "ADF RPT: Init - executing ADF_fnc_FOB.sqf"; // Reporting. Do NOT edit/remove

// FOB functions

ADF_fnc_fobDeploy = { // deploy the fob
	if (ADF_MHQ_FOB_deployed) exitWith { // Exit with a message if the FOB already is deployed
		HintSilent parseText "
			<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
			<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
			<t color='#A1A4AD'>The F.O.B. is already deployed</t><br/>
		";
		if (ADF_debug) then {["MHQ - FOB already deployed msg",false] call ADF_fnc_log};
	};
	
	if (speed MHQ > 1) exitWith {  // Exit with a message if the the MHQ is not stationary
		HintSilent parseText "
			<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
			<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
			<t color='#A1A4AD' align='left'>The MHQ needs to be stationary for the F.O.B. to be deployed!</t><br/>
		";
		if (ADF_debug) then {["MHQ - Not stationary msg",false] call ADF_fnc_log};
	};
	
	// Remove the FOB deploy action menu item 
	MHQ removeAction ADF_MHQ_FOB_deployAction;	
	MHQ setFuel 0; // Once deployed, remove the fuel so the MHQ cannot elope
	if (ADF_debug) then {["MHQ - Deploy EH removed. Fueltank emptied",false] call ADF_fnc_log};
	
	_msg = format ["
		<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
		<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
		<t color='#A1A4AD'>Deploying the F.O.B.</t><br/>
		<t color='#A1A4AD'>F.O.B. ready in:</t><t color='#FFFFFF'> %1 </t><t color='#A1A4AD'>seconds</t><br/><br/>
	",ADF_MHQ_BuildTime];
	hintSilent parseText _msg;
	sleep 5;
	hintSilent "";
	sleep (ADF_MHQ_BuildTime - 5);
	
	if (ADF_debug) then {["MHQ - FOB deploy Timer finished.",false] call ADF_fnc_log};
	
	// Add the FOB packUp action menu item
	ADF_MHQ_FOB_PackupAction = MHQ addAction ["<t align='left' color='#CEE5F6'>Pack up the F.O.B.</t>",{[[],"ADF_fnc_fobPackUp"] call BIS_fnc_MP;},[],-98,false,true,"",""];
	if (ADF_debug) then {["MHQ - Pack-up EH added.",false] call ADF_fnc_log};
		
	if (isServer) then {
		if (ADF_debug) then {["MHQ - Server: FOB objects",false] call ADF_fnc_log};
		private ["_ADF_MHQ_FOB_dir","_ADF_MHQ_FOB_objects"];
		_ADF_MHQ_FOB_dir = getDir MHQ;
		
		_ADF_MHQ_FOB_objects = [
			["Flag_NATO_F",[-5.23633,0.240234,0],70,1,0,[],"","_this setFlagTexture '" + ADF_clanFlag + "';",true,false], 
			["Land_Pallet_MilBoxes_F",[5.23633,2.33203,0],90,1,0,[],"","",true,false], 
			["CamoNet_BLUFOR_F",[6.56055,-0.185547,1],90,1,0,[],"","",true,false], 
			["B_supplyCrate_F",[6.91406,-0.630859,0],0,1,0,[],"","",true,false], 
			["Land_Pallet_MilBoxes_F",[7.19336,2.43555,0],70,1,0,[],"","",true,false], 
			["Land_PaperBox_open_full_F",[6.25,4.49609,0],10,1,0,[],"","",true,false], 
			["Land_Cargo20_military_green_F",[-7.71875,-0.671875,0],90,1,0,[],"","",true,false], 
			["Land_HBarrierBig_F",[-0.175781,-8.28125,0],0,1,0,[],"","",true,false], 
			["Land_HBarrier_3_F",[-7.64063,5.05859,0],90,1,0,[],"","",true,false], 
			["Land_HBarrierBig_F",[-0.0683594,9.27734,0],0,1,0,[],"","",true,false], 
			["Land_HBarrier_3_F",[-7.67578,-4.50586,0],90,1,0,[],"","",true,false], 
			["Land_HBarrierBig_F",[11.9688,3.82813,0],70,1,0,[],"","",true,false], 
			["Land_HBarrierBig_F",[12.0762,-4.19727,0],110,1,0,[],"","",true,false]
		];
		[position MHQ,_ADF_MHQ_FOB_dir,_ADF_MHQ_FOB_objects] call BIS_fnc_ObjectsMapper;	
		
		ADF_MHQ_FOB_deployed = true; publicVariable "ADF_MHQ_FOB_deployed"; // Announce that the FOB has been deployed
		if (ADF_debug) then {["MHQ - FOB objects placed.",false] call ADF_fnc_log};
		
		[] spawn ADF_fnc_MHQ_lastPos; // update LastPos
		[] spawn ADF_fnc_MHQ_PlayerRespawnPos; // update respawn_west
	};
	
	waitUntil {ADF_MHQ_FOB_deployed};
	
	HintSilent parseText "
		<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
		<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
		<t color='#A1A4AD'>F.O.B. deployed</t><br/>
	";
	sleep 5;
	hintSilent "";
	
};
	
ADF_fnc_fobPackUp = { // pack up the fob
	MHQ removeAction ADF_MHQ_FOB_PackupAction;		
	_msg = format ["
		<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
		<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
		<t color='#A1A4AD'>Packing-up the F.O.B.</t><br/>
		<t color='#A1A4AD'>MHQ ready in:</t><t color='#FFFFFF'> %1 </t><t color='#A1A4AD'>seconds</t><br/><br/>
	",ADF_MHQ_PackUpTime];
	hintSilent parseText _msg;
	[[],"ADF_fnc_fobDeleteObj"] spawn BIS_fnc_MP; // Romove all the FOB items (Camo netting, H-Barriers, etc)
	sleep 5;
	hintSilent "";
	sleep (ADF_MHQ_PackUpTime - 5);
	ADF_MHQ_FOB_deployAction = MHQ addAction ["<t align='left' color='#CEE5F6'>Deploy the FOB</t>",{[[],"ADF_fnc_fobDeploy"] call BIS_fnc_MP;},[],-98,false,true,"",""];
};

ADF_fnc_fobDeleteObj = {
	fobDeleted = false;
	if (isServer) then {
		private ["_delArray","_del"];
		_delArray = ["Flag_NATO_F","Land_Pallet_MilBoxes_F","CamoNet_BLUFOR_F","B_supplyCrate_F","Land_PaperBox_open_full_F","Land_Cargo20_military_green_F","Land_HBarrierBig_F","Land_HBarrier_3_F"];
		_del = nearestObjects [getPos MHQ,_delArray,14];
		
		_delTime = ADF_MHQ_PackUpTime / 10;
		{deleteVehicle _x; sleep _delTime;} forEach _del;	
		
		// FOB has been packed completely. Let's update the marker functions:
		[] spawn ADF_fnc_MHQ_lastPos; // update LastPos
		[] spawn ADF_fnc_MHQ_PlayerRespawnPos; // update respawn_west
		fobDeleted = true; publicVariable "fobDeleted";				
	};
		
	ADF_MHQ_FOB_deployed = false; publicVariable "ADF_MHQ_FOB_deployed"; // Announce that the FOB has been packed up		
	// Add the FOB deploy action menu item	
	
	waitUntil {fobDeleted};
	MHQ setFuel 1; // FOB packed up, Adding fuel back to the MHQ			
	HintSilent parseText "
		<img size= '6' shadow='false' image='" + ADF_clanLogo + "'/><br/><br/>
		<t color='#6C7169' size='1.5'>" + ADF_clanName + " Cmd MHQ</t><br/><br/>
		<t color='#A1A4AD'>F.O.B. packed up.<br/>MHQ is ready to go.</t><br/>
	";
	sleep 5;
	hintSilent "";	
	fobDeleted = nil; fobPacking = nil; delTime = nil; ADF_MHQ_FOB_object = nil; 		
};