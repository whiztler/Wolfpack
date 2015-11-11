/****************************************************************
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

#include "ADF_JIP.sqf"

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
<font color='#6C7169'>SDV insertion at </font><marker name='mBrief0' color='#9DA698'>Yankee</marker><font color='#6C7169'>, approx 1.5 Mikes </font><marker name='mBrief1' color='#9DA698'>west</marker> <font color='#6C7169'>of your RV<br/>
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
<font color='#6C7169'>The area of operations is partly urban. This will provide opportunity to approach the objectives covertly. Some of the properties are used as CSAT army barracks.<br/>
Weather forecast is similar to yesterday. Slight fog, moderate wind.<br/><br/>

You'll meet Nikko at the RV. He'll update you with the latest ground intel,<br/>
TOC will support with up to date Satnav intel.</font>

<br/><br/><font color='#9da698' size='14'>TACTICAL MOVEMENT</font><br/>
<font color='#6C7169'>AT's will relocate in a bounding fashion unless otherwise ordered. Command troop will provide cover and support for the AT's. TOC wants you to take out the power station first before you engage the communications station.<br/>
Control points, BP's and routes will be briefed on-site by SSC.</font>

<br/><br/><font color='#9da698' size='14'>WEAPONS/FIRE SUPPORT</font><br/>
<font color='#6C7169'>Nikko will have additional supplies in case yours get damaged during insertion.<br/>
DEVGRU TOC / Satnav will be monitoring the op.</font>

<br/><br/><font color='#9da698' size='14'>SPECIAL OPERATIONS</font><br/>
<font color='#6C7169'>No other operations available.</font>

<br/><br/><font color='#9da698' size='14'>CALL SIGN</font><br/>
<font color='#6C7169'>To be briefed en-route.</font>
"]];


///// OBJECTIVES

player createDiaryRecord ["Diary",["Objectives","

<font color='#9da698' size='14'>MISSION OBJECTIVES</font><br/>
<font color='#6C7169'>Primary objective: Sabotage the </font><marker name='mBrief2' color='#9DA698'>communications station</marker><font color='#6C7169'>.<br/>
Secondary objective: Sabotage transformers at the </font><marker name='mBrief3' color='#9DA698'>power station</marker><font color='#6C7169'>.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>CSAT's primary </font><marker name='mBrief2' color='#9DA698'>communications station</marker><font color='#6C7169'> is based on the outskirts of Kavala. It is essential we disrupt communications before we commence the NATO invasion. The nearby </font><marker name='mBrief3' color='#9DA698'>power station</marker><font color='#6C7169'> provides power to the communications station. We need to take both out in order to be sure that their communications ability stays frozen from a while.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>The </font><marker name='mBrief2' color='#9DA698'>communications station</marker><font color='#6C7169'> is moderately protected. The station itself is located on a hill. The main security forces patrol the immediate area.<br/>
The </font><marker name='mBrief3' color='#9DA698'>power station</marker><font color='#6C7169'> has a permanent security detail. The power station also functions as an interim military base, although TOC suggests that the garrison is on manoeuvre elsewhere.</font>

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>

There will be no support on this op as well. This is a 'plausible deniability' op. We cannot offer any help or assistance if you get caught. You are on your own. You know the drill.<br/><br/>
Wolf 4 (call sign Birdie) is on a recon op near Pyrgos on the south eastern peninsula.</font>
"]];