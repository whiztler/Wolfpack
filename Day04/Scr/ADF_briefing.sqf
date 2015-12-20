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
<font color='#6C7169'>Insert by Assault Boat at </font><marker name='mBrief0' color='#9DA698'>Tango</marker><font color='#6C7169'>, approx 2.5 Mikes west of </font><marker name='mRValpha' color='#9DA698'>RV Alpha</marker><font color='#6C7169'>.<br/>
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
<font color='#6C7169'>This will undoubtedly be your most challenging mission yet. Since intel on the ground changes constantly, we opted to advice you of three insert locations:<br/><br/>

1. </font><marker name='mRValpha' color='#9DA698'>RV ALPHA</marker><font color='#6C7169'><br/>
Rendezvous with Dimitri/Nikkos. They'll have vehicles for you to use for transport. Distance to AO: approx 7 km's. <br/><br/>

2. </font><marker name='mRVhotel' color='#9DA698'>RV HOTEL</marker><font color='#6C7169'><br/>
South east of Faronaki . This RV area is patrolled by CSAT naval forces. Distance to AO: approx 3  km's. No support from Dimitri/Nikkos.<br/><br/>

3. </font><marker name='mRVzulu' color='#9DA698'>RV ZULU</marker><font color='#6C7169'><br/>
The island of Chelonisi just north west of Pyrgos is considered free of CSAT forces. The bay west of the island is patrolled by the CSAT navy. Distance to AO: approx 950  meters. No support from Dimitri/Nikkos.<br/><br/>
Please note that the bay and the peninsula are extensively patrol by ground, sea and air patrols.

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
<font color='#6C7169'>Sabotage the </font><marker name='mABC' color='#9DA698'>ABC headquarters</marker><font color='#6C7169'>.</font>
"]];


///// SITUATION

player createDiaryRecord ["Diary",["Situation","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>CSAT's propaganda campaign is out of control. Their fear and retribution series broadcasted on television and radio has caused grave concerns both locally and abroad. We need the local populous on our side once the invasions commences. We need to shut down the </font><marker name='mABC' color='#9DA698'>Altis Broadcasting Company (ABC)</marker><font color='#6C7169'> in the Capital of Altis, Pyrgos.

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>Pyrgos is at the center of CSAT's military HQ. There are numerous CSAT bases, including the main CSAT naval base. Signit suggests that at least two battalions are currently stationed in the city or in close vicinity of Pyrgos. There is a lot of movement and traffic, ground, naval and air.

<br/><br/><font color='#9da698' size='14'>NATO FORCES</font><br/>
<font color='#6C7169'>Three troops:<br/>
One command troop - SSC, marksman, squadron paramedic and a recon/UAV specialist.<br/>
Two assault troops (AT) - Troop Leader and 4 Assault Specialists<br/><br/>
There will be no support on this op as well. This is a 'plausible deniability' op.<br/><br/>
Wolf 8 (call sign Raven) is on a recon op near Kavala and Wolf 5,6 and 7 (call sign Phantom) are on an assault mission at an undisclosed location north east of Altis.</font>
"]];