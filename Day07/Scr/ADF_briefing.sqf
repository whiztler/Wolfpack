/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR  2015

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
<font color='#6C7169'>Insertion by Assault Boat ex </font><marker name='mBrief0' color='#9DA698'>Mike</marker><font color='#6C7169'>, approx 3 Mikes east of </font><marker name='mRV' color='#9DA698'>RV Billy</marker><br/>
<font color='#6C7169'>You'll be using the same vessels to exfil.</font>
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
<font color='#6C7169'>You'll </font><marker name='mRV' color='#9DA698'>RV</marker><font color='#6C7169'> with Nikkos' men just east of Aktinarki. From there you'll head north towards </font><marker name='mObj1' color='#9DA698'>U-12</marker><font color='#6C7169'> where you'll retrieve Nikkos and escort him back to the </font><marker name='mRV' color='#9DA698'>RV</marker><font color='#6C7169'> safely. 

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
<font color='#6C7169'>Secure and retrieve Nikkos Fotopoulos.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>A few hours ago we received news of Nikkos' capture by CSAT Intelligence. CSAT's interrogation reputation is legendary, and not in a good way. Nikkos knows too much about the upcoming campaign. We need to break him out before they fly him back to the CSAT capital where they will break him and spill his guts about our involvement on Altis.<br/><br/>
Nikkos is currently being held in a secret prison codenamed '<marker name='mObj1' color='#9DA698'>U-12</marker><font color='#6C7169'>'. It is located in Thelos Bay on the east coast of Altis.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>We are under the impression that CSAT does not yet know that they have captured the leader of the resistance else they surely would have send a larger protection detail. That said, <marker name='mObj1' color='#9DA698'>U-12</marker><font color='#6C7169'> is very well protected with double walls, guard towers and patrols. The immediate region is predominantly civilian. We are not aware of other CSAT presence in the area.<br/><br/>
Please note that due to bad weather, we haven't been able to secure up to date SatNav intel. All we have is a photo that was taken about a week ago.</font>

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support on this op as well. This is a 'plausible deniability' op.<br/><br/>
Wolf 5 and Wolf 6 (call sign Batman) are on a demo op near Molos.</font>
"]];