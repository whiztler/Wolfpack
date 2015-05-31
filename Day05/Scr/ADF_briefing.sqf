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
<font color='#6C7169'>SDV insertion at </font><marker name='mBrief0' color='#9DA698'>Kilo</marker><font color='#6C7169'>, approx 1.5 Mikes west of </font><marker name='mRV' color='#9DA698'>RV Xray</marker><br/>
<font color='#6C7169'>Exfil is at </font><marker name='mExfil' color='#9DA698'>LZ Sundance</marker><font color='#6C7169'>.</font>
"]]; // SDV Seal Delivery Vehicle


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
<font color='#6C7169'>You'll need all your Wolf skills to complete this op Commander. If you get spotted, mission over since your man don't stand a chance against the number of CSAT present at the AO. Most houses in Pyrgos are deserted. They should provide good cover.<br/>
Mission starts around midnight. This should give you sufficient time to complete the objective.</font>

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
<font color='#6C7169'>Find intel on Maj. Farrokhzad. We have marked five possible locations (</font><marker name='mObj_e' color='#9DA698'>Z1</marker><font color='#6C7169'>, </font><marker name='mObj2' color='#9DA698'>Z2</marker><font color='#6C7169'>, </font><marker name='mObj3' color='#9DA698'>Z3</marker><font color='#6C7169'>, </font><marker name='mObj4' color='#9DA698'>Z4</marker><font color='#6C7169'>, </font><marker name='mObj5' color='#9DA698'>Z5</marker><font color='#6C7169'>, </font><marker name='mObj1' color='#9DA698'>Z6</marker><font color='#6C7169'>). We are looking for a laptop or a desktop computer. You'll be given a USB dongle that you'll need to connect to the target computer. The USB dongle will upload the data directly to our servers. Once data transfer is complete, exfil to </font><marker name='mExfil' color='#9DA698'>LZ Sundance</marker><font color='#6C7169'>.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>Maj. F. Kallaziz's replacement has arrived in Pyrgos, Maj. Farrokhzad. We know very little about Maj. Farrokhzad. According to Nikko, the major has already made his mark by having tens of civilians arrested. Supposedly there is a public hanging the day after tomorrow. CIA and MIS are working hard to get more intel about this guy. So it looks like your Wolf troops are going back to Pyrgos.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>CSAT has beefed up security since the explosions at the ABC headquarters last night. They have intensified patrols and increased security at military installations and government buildings. They have also intensified aerial and naval patrols.

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support on this op as well. This is a 'plausible deniability' op.<br/><br/>
Delta Force is currently doing a SAR op somewhere south of your AO. Their call sign is Ivanhoe.</font>
"]];