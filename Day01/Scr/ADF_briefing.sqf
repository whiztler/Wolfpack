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
<font color='#6C7169'>The USS Pennsylvania will drop you off at </font><marker name='mBrief0' color='#9DA698'>Zulu</marker><font color='#6C7169'> from where you'll insert using RHIB's to the RV point, approx 2 Mikes </font><marker name='mBrief1' color='#9DA698'>South West</marker> <font color='#6C7169'>of Zulu<br/>
Exfil to be briefed on-site by our local on the ground.</font>
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
<font color='#6C7169'>The mission is of vital importance for the remainder of the campaign. Failure is not an option. Make sure you are not detected. If possible, let EI pass by and approach the objective covertly.<br/>
Tactical and strategy will be briefed on site by the CO.</font>

<br/><br/><font color='#9da698' size='14'>TACTICAL MOVEMENT</font><br/>
<font color='#6C7169'>AT's will relocate in a bounding fashion unless otherwise ordered. Command troop will provide cover and support for the AT's.
Control points, BP's and routes will be briefed on-site by SSC.</font>

<font color='#6C7169'><br/><br/><font color='#9da698' size='14'>WEAPONS/FIRE SUPPORT</font><br/>
No support available.<br/>
DEVGRU TOC / Satnav will be monitoring the op.</font>

<br/><br/><font color='#9da698' size='14'>SPECIAL OPERATIONS</font><br/>
<font color='#6C7169'>No other operations available.</font>

<br/><br/><font color='#9da698' size='14'>CALL SIGN</font><br/>
<font color='#6C7169'>To be briefed en-route.</font>
"]];


///// OBJECTIVES

player createDiaryRecord ["Diary",["Objectives","

<font color='#9da698' size='14'>MISSION OBJECTIVES</font><br/>
<font color='#6C7169'>Due to the sensitivity of the mission, objectives will be given on a need to know basis once you have reached the first objective. Our local on the ground will do an extensive briefing.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>June 2034, Altis is in turmoil. The island has been cut off from the outside world due to economical and physical blockades. Since then the local populous has grown impatient with the government and the AFF in particular. Several demonstrations have resulted in the deaths of tens of civilians.<br/>
The government felt like they were losing control rapidly and called in the help from CSAT. A mistake that would cost them dearly. CSAT saw a golden opportunity to get a much needed foothold in the Mediterranean area. The AAF asked for a single battalion of CSAT forces. Instead CSAT send the entire 2nd brigade. CSAT outnumbered AAF by 1:11. Altis government realized that they had lost control completely and stepped down. CSAT General Tehrani has since been in power and controls all of Altis and Stratis.<br/><br/>
CSAT is now proven a serious threat to the European region. As diplomatic efforts have not lead to the anticipated result, NATO has decided to send a rapid task force to free both islands from the CSAT oppression.<br/><br/>
DEVGRU has been ordered by Joint Strategic Command to take out several high value threads on Altis before the NATO campaign commences. Wolf has been tasked with executing 10 missions over a period of 3-4 weeks. Our first mission is crucial and will start tonight.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>Our area of operation lies north of Athira. The area is not of strategic importance to CSAT. Signit has confirmed the presence of 1 infantry company. We also know of a SpecOp unit that is doing training manoeuvres in the area.</font>

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support. This is a 'plausible deniability' op. We cannot offer any help or assistance if you get caught. You are on your own.<br/><br/>
Our operation is the only operation on Altis. No other Bluefor present.</font>
"]];