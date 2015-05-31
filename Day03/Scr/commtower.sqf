sleep 5;

hintSilent parseText "
	<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/>
	<t color='#6C7169' align='left'>All radar towers and radar equipment have been tagged.<br/><br/>Blizzard is on station for a fire mission.<br/></t>
";
_logTime = [dayTime] call BIS_fnc_timeToString;
_logTimeText = "Log: " + _logTime;
player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
<font color='#6c7169'>All radar towers and radar equipment have been tagged.<br/><br/>Blizzard is on station for a fire mission.</font>
<br/><br/>"]];

//add trigger on server (hosted or dedicated)

if (isServer) then { 
	trBlizzard = createTrigger ["EmptyDetector", getPos ttRadar];
	publicVariable "trBlizzard"; //setup trigger on every client
}; 
	
if (!isDedicated) then {
	waitUntil {!isNil "trBlizzard"};
	trBlizzard setTriggerType "NONE";
	trBlizzard setTriggerActivation ["DELTA", "PRESENT", false];
	trBlizzard setTriggerArea [0,0,0,false];
	trBlizzard setTriggerStatements ["this", "0 = execVM 'Scr\missilestrike.sqf';",""];
	trBlizzard setTriggerText "Blizzard - missile strike";
};