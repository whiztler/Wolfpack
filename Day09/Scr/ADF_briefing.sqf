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
<font color='#6C7169'>Insert ex </font><marker name='mBrief0' color='#9DA698'>Lima</marker><font color='#6C7169'>, approx 2 Mikes east of the </font><marker name='mRV' color='#9DA698'>Seoul</marker> <font color='#6C7169'> insertion location which is located on northern tip of Stratis.<br/>
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
<font color='#6C7169'>Move to the </font><marker name='mDepot' color='#9DA698'>supply depot</marker><font color='#6C7169'> and wait for further orders.</font>

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
<font color='#6C7169'>T.b.a.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>Two days ago the 127 Republican Wing Squadron, an elite squadron of TO-199 bombers touched down at </font><marker name='cApt' color='#9DA698'>`Stratis Airbase</marker><font color='#6C7169'>. It seems they are there to stay.<br/>
13th MEU is scheduled to assault Stratis in three days. This can only happen when those TO-199's have been disposed off.<br/>
SatNav has been monitoring the </font><marker name='mDepot' color='#9DA698'>supply depot</marker><font color='#6C7169'> at Agia Marina. There's been a build-up of material and equipment the last few days. We need visual confirmation on what's going on at the supply depot.

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>The entire island of Stratis is basically a CSAT military stronghold with only a few civilians in Agia Marina. The </font><marker name='cApt' color='#9DA698'>`Stratis Airbase</marker><font color='#6C7169'> is used as a hub for both Altis and Stratis. Intel shows that the base is well guarded and active 24x7 (air/land/sea). We estimate a full Infantry brigade at the Stratis Airbase plus air support units, naval support units and various air squadrons.<br/>
Stratis has several bases/military outposts that should be avoided if possible.<br/>
The </font><marker name='mDepot' color='#9DA698'>supply depot</marker><font color='#6C7169'> at Agia Marina is moderately secured by CSAT infantry.


<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support on this op as well. This is a 'plausible deniability' op. We cannot offer any help or assistance if you get caught. You are on your own. You know the drill.<br/><br/>
There are no other operations on Stratis that we are aware off.</font>

"]];