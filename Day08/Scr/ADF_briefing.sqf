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
<font color='#6C7169'>NightStalker insert ex </font><marker name='mBrief0' color='#9DA698'>Victor</marker><font color='#6C7169'>, approx 7 Mikes north of the </font><marker name='mAmsterdam' color='#9DA698'>Amsterdam</marker> <font color='#6C7169'> insertion location which is located on the Bomos peninsula.<br/>
Exfil to be advised.</font>
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
<font color='#6C7169'>We have marked the grid as advised by Nikkos. The search grid is nearly 40 Km2. We advise you to use your recon specialist to scout the grid with a UAV.<br/>
Weather conditions are poor with heavy rain, thunderstorms and limited visibility.</font>

<br/><br/><font color='#9da698' size='14'>TACTICAL MOVEMENT</font><br/>
<font color='#6C7169'>AT's will relocate in a bounding fashion unless otherwise ordered. Command troop will provide cover and support for the AT's. TOC recommends to approach the airfield from two angles simultaneously. Have two teams cover the airfield whilst a small demo team inserts and applies explosives.<br/>
Control points, BP's and routes will be briefed on-site by SSC.</font>

<br/><br/><font color='#9da698' size='14'>WEAPONS/FIRE SUPPORT</font><br/>
<font color='#6C7169'>No support available.<br/>
DEVGRU TOC / Satnav will not be monitoring the op due to bad weather conditions</font>

<br/><br/><font color='#9da698' size='14'>SPECIAL OPERATIONS</font><br/>
<font color='#6C7169'>No other operations available.</font>

<br/><br/><font color='#9da698' size='14'>CALL SIGN</font><br/>
<font color='#6C7169'>To be briefed en-route.</font>
"]];


///// OBJECTIVES

player createDiaryRecord ["Diary",["Objectives","

<font color='#9da698' size='14'>MISSION OBJECTIVES</font><br/>
<font color='#6C7169'>Locate Ice Tiger.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>The last two weeks, SatNav has been tracking a heavy armored squadron, codename 'Ice Tiger', consisting of 6 T100 MBT's, 1 x Tigris and APC's plus supporting units. SatNav lost Ice Tiger due to severe overcast weather. According to Nikkos, Ice Tiger should be in the North Western part of Altis. We need confirmation on its exact location.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>Besides the Ice Tiger squadron there is not much CSAT activity in the area. Try avoid </font><marker name='mAbdera' color='#9DA698'>Abdera airfield</marker><font color='#6C7169'> as it is once again heavily guarded.</font> 

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support on this op as well. This is a 'plausible deniability' op.<br/><br/>
There are no other operations on Altis that we are aware off.</font>
"]];