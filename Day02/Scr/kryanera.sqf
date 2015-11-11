if (hasInterface) then {
	hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Jetson: Scarecrow, once you have cleared the Krya Nera Naval Base, call in a </t><t color='#9DA698' align='left'>Tomahawk strike</t><t color='#6C7169' align='left'> to destroy the attack vessels.<br/><br/>Use </t><t color='#9DA698' align='left'>radio Delta (0-0-4] </t><t color='#6C7169' align='left'>to call in the strike<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Jetson: Scarecrow, once you have cleared the Krya Nera Naval Base, call in a </font><font color='#9DA698'>Tomahawk strike</font><font color='#6C7169'> to destroy the attack vessels.<br/><br/>Use <fontt><font color='#9DA698'>radio Delta (0-0-4] </font><font color='#6C7169'>to call in the strike</font>
	<br/><br/>"]];
};

roundscomplete = false;
if (isServer) then {
	toma = createTrigger ["EmptyDetector", getMarkerPos "gbu1"];
	toma setTriggerType "NONE";
	toma setTriggerActivation ["DELTA", "PRESENT", false];
	toma setTriggerArea [0,0,0,false];
	toma setTriggerText "Call in the Tomahawk strike @ Krya Nera";
};

sleep 2;
waituntil {sleep 1; triggeractivated toma;};

Sleep 5;
if (hasInterface) then {hintSilent parseText"<t color='#6C7169' align='left'>USS Marauder: Fire mission received. Fire for Effect, R, F, Compact Explosive Tactical Missile.</t>";};
Sleep 10;
if (hasInterface) then {hintSilent parseText"<t color='#6C7169' align='left'>USS Marauder: R, F, Compact Explosive Tactical Missile in effect, 1 missile out.</t>";};
Sleep 6;
if (hasInterface) then {hintSilent parseText"<t color='#6C7169' align='left'>USS Marauder: Shot out.</t>";};
Sleep 5;
if (hasInterface) then {hintSilent parseText "<t color='#6C7169' align='left'>USS Marauder: Splash in 55.</t>";};
sleep 55;
if (hasInterface) then {hintSilent parseText "<t color='#6C7169' align='left'>USS Marauder: Splash out.</t>";};
sleep 5;
if (hasInterface) then {hintSilent parseText "<t color='#6C7169' align='left'>USS Marauder: Fire mission complete.</t>";};
sleep 2;

if (hasInterface) then {
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: USS Marauder</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>USS Marauder: Fire mission received. Fire for Effect, R, F, Compact Explosive Tactical Missile.
	USS Marauder: R, F, Compact Explosive Tactical Missile in effect, 1 missile out.<br/><br/>
	USS Marauder: Shot out.<br/><br/>
	USS Marauder: Splash in 55.<br/><br/>
	USS Marauder: Splash out.<br/><br/>
	USS Marauder: Fire mission complete.
	</font>
	<br/><br/>"]];
};

kryaActive = true;
publicVariableServer "kryaActive";

waitUntil {sleep 1; roundscomplete};
Sleep 15;

if (hasInterface) then {
	hintSilent parseText"<img size= '5' shadow='false' image='Img\jsoc_logo.paa'/><br/><br/><t color='#6C7169' align='left'>Jetson: Scarecrow, make your way to the Abdera Airfield.<br/></t>";
	_logTime = [dayTime] call BIS_fnc_timeToString;
	_logTimeText = "Log: " + _logTime;
	player createDiaryRecord ["Wolfpack Log", [_logTimeText,"
	<br/><br/><font color='#9da698' size='14'>From: JSOC TOC</font><br/>
	<font color='#9da698' size='14'>Time: " + _logTime + "</font><br/><br/>
	<font color='#6c7169'>------------------------------------------------------------------------------------------</font><br/><br/>
	<font color='#6c7169'>Jetson: Scarecrow, make your way to the Abdera Airfield.</font>
	<br/><br/>"]];
};

if (!isServer) exitWith {};

deleteMarker "mKrya";

_m = createMarker ["AbderaApt", [9140.85,21476.2,0]];
_m setMarkerSize [1.5, 1.5];
_m setMarkerShape "ICON";
_m setMarkerType "o_air";
_m setMarkerColor "ColorEAST";
_m setMarkerDir 0;
_m setMarkerText "Abdera Airfield";