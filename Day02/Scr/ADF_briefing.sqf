/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Mission Briefing
Author: Whiztler
Script version: 1.0

Game type: COOP
File: ADF_Briefing.sqf
****************************************************************
Instructions:

Note the reverse order of topics. Start from the bottom.
Change the "Text goes here..." line with your info. Use a <br/> to
start a new line.
****************************************************************/

///// CREDITS

player createDiaryRecord ["Diary",["Credits","
<font color='#6C7169'>Wolfpack Vol. 1 &amp; 2 by Whiztler</font><br/><br/>
"]];

///// SUPPORT & LOGISTICS

player createDiaryRecord ["Diary",["M.O.B. & Logistics","

<font color='#9da698' size='14'>PLAYER RESPAWN / PLAYER JIP</font><br/>
<font color='#6C7169'>No respawn available.<br/>
JIP is disabled. New players join as seagull.</font>

<br/><br/><font color='#9da698' size='14'>PLAYER LOADOUT</font><br/>
<font color='#6C7169'>Pre-defined, role-specific loadout</font>

<br/><br/><font color='#9da698' size='14'>VEHICLE RESPAWN</font><br/>
<font color='#6C7169'>No respawn available.</font>

<br/><br/><font color='#9da698' size='14'>VEHICLE SUPPLY CARGO</font><br/>
<font color='#6C7169'>Not applicable.</font>

<br/><br/><font color='#9da698' size='14'>TRANSPORT ARRANGEMENTS</font><br/>
<font color='#6C7169'>Insertion by MH-9 ex </font><marker name='mBrief0' color='#9DA698'>Romeo</marker><font color='#6C7169'>, approx 1.5 Mikes </font><marker name='mBrief1' color='#9DA698'>east</marker> <font color='#6C7169'>of Krya Nera<br/>
Exfil to be briefed on-site.</font>
"]];


///// SIGNAL & COMMS

player createDiaryRecord ["Diary",["Signal & Comms","

<font color='#9da698' size='14'>SIGNALS</font><br/>
<font color='#6C7169'>White smoke - smoke concealment. No signal<br/>
Green Smoke - safe area signal<br/>
Red Smoke - hostiles area signal (position known)<br/>
Orange smoke -  hostiles area signal (position unknown)<br/>
Purple smoke - Bluefor at smoke, hostiles near signal<br/><br/>

Green chemlight - Safe/Searched (in buildings)<br/>
Red chemlight - Not Safe/Not searched (in buildings)</font>
"]];


///// TACTICAL PLAN & EXECUTION

player createDiaryRecord ["Diary",["Tactical / Execution","

<font color='#9da698' size='14'>CONCEPT OF OPERATIONS</font><br/>
<font color='#6C7169'>The area of operations is nice and compact, just 2 square Mikes. You'll need solid tactics to stay covert maintain your cover.<br/><br/>
The terrain and weather are ideal for covert routing tactics. TOC will support with up to date Satnav intel.</font>

<br/><br/><font color='#9da698' size='14'>TACTICAL MOVEMENT</font><br/>
<font color='#6C7169'>AT's will relocate in a bounding fashion unless otherwise ordered. Command troop will provide cover and support for the AT's. TOC recommends to approach the airfield from two angles simultaneously. Have two teams cover the airfield whilst a small demo team inserts and applies explosives.<br/>
Control points, BP's and routes will be briefed on-site by SSC.</font>

<br/><br/><font color='#9da698' size='14'>WEAPONS/FIRE SUPPORT</font><br/>
<font color='#6C7169'>No support available.<br/>
DEVGRU TOC / Satnav will be monitoring the op.</font>

<br/><br/><font color='#9da698' size='14'>SPECIAL OPERATIONS</font><br/>
<font color='#6C7169'>No other operations available.</font>

<br/><br/><font color='#9da698' size='14'>CALL SIGN</font><br/>
<font color='#6C7169'>To be briefed en-route.</font>
"]];


///// OBJECTIVES

player createDiaryRecord ["Diary",["Objectives","

<font color='#9da698' size='14'>MISSION OBJECTIVES</font><br/>
<font color='#6C7169'>Primary objective: </font><marker name='mBrief3'>Abdera Airfield</marker>, <font color='#6C7169'>sabotage all Kajman Attack helicopters stationed at the airfield.<br/>
Secondary objective: </font><marker name='mBrief2'>Krya Nera Naval Base</marker>, <font color='#6C7169'>take control of the Naval Base and wait for further instructions.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>Following last night's successful operation, J.S.O.C. wants your men to get back into the game immediately now their military intelligence is in disarray.<br/><br/>
So far CSAT is unaware of our operations. And we intend to keep it that way. We are currently structuring a lot of intel that we have acquired through Nikko's team, Satnav and Wolf 6's mission of last night. So far we have determined that CSAT's forces are more formidable than we anticipated.<br/>
CSAT has taken over the </font><marker name='mBrief3'>Abdera Airfield</marker><font color='#6C7169'> and turned the airfield into a helicopter base. The base is home to the 127 AAC Squadron with 6 or 8 Kajman Attack helicopters and to the 17 Air Support Group. The Kajman is a formidable opponent and can do some serious damage to the upcoming campaign.<br/><br/>
About one kilometer north east lies the village of </font><marker name='mBrief2'>Krya Nera</marker><font color='#6C7169'>. This used to be a little fisherman's village until CSAT stationed a small fleet of attack vessels here.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>The Krya Nera Naval Base is moderately protected by one CSAT platoon. Satnav picked up two small patrols in the immediate area.<br/>
The Abdera Airfield has tight security with 4 checkpoints, numerous observation towers and patrols. Strategic command ensures that the Kajmans can be sabotaged covertly. I leave the MO up to you.</font>

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support on this op as well. This is a 'plausible deniability' op.<br/><br/>
Wolf 7 (call sign Redbuck) is on a recon op near Camp Delta, North East Altis.</font>
"]];