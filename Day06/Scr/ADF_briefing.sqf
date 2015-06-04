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
<font color='#6C7169'>NightStalker insert ex </font><marker name='mBrief0' color='#9DA698'>Whiskey</marker><font color='#6C7169'>, approx 7 Mikes south west of the </font><marker name='mManila' color='#9DA698'>Manila</marker><font color='#6C7169'> insertion location which is located east of Panochori Bay.<br/>
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
<font color='#6C7169'>We'll insert your teams at dusk. Move covertly and as quickly as you can towards your first objective. Make sure you get out of the AO before CSAT gets any wiser. There are several bases in the area that surely will send reinforcements once all hell breaks loose.</font>

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
<font color='#6C7169'>1. Destroy the radar installation at </font><marker name='mBarca' color='#9DA698'>Barcelona</marker><font color='#6C7169'>.<br/>
2. Neutralize the AA-emplacements at </font><marker name='mIstanbul' color='#9DA698'>Istanbul</marker><font color='#6C7169'>.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>Wolf Seven reported a large AA-emplacement at a base west of Zoros Bay (codename '</font><marker name='mIstanbul' color='#9DA698'>Istanbul</marker><font color='#6C7169'>'). The Istanbul base gets its intel from a radar site a little north east (codename '</font><marker name='mBarca' color='#9DA698'>Barcelona</marker><font color='#6C7169'>'). It is vital that we neutralize CSAT's AA capabilities before we commence the planned campaign.

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>CSAT has sent more reinforcements to Altis since DEVGru has started the JSOC operations. Barcelona and Istanbul are important sites for CSAT so expect them to be guarded well.  There's a CSAT CP near the </font><marker name='mBrief1' color='#9DA698'>Edessa bridge</marker><font color='#6C7169'> and a small </font><marker name='cBase2_2' color='#9DA698'>naval base</marker><font color='#6C7169'> east of Barcelona. The southern MSR lies across the AO, so expect CSAT foot/vehicle patrols. There are several CSAT bases in the vicinity. Avoid them at all cost!

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support on this op as well. This is a 'plausible deniability' op.<br/><br/>
The Brits are about to undertake a CSAR op near Neochori. Call sign 'Gladiator'.</font>
"]];