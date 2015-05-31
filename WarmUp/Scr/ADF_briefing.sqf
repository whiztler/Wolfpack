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

ADF_joined = false;
#include "ADF_JIP.sqf"
waitUntil {ADF_joined};

///// CREDITS

player createDiaryRecord ["Diary",["Credits","
<font color='#6C7169'>Wolfpack Vol. 1 &amp; 2 by Whiztler</font><br/><br/>
"]];

///// SUPPORT & LOGISTICS

player createDiaryRecord ["Diary",["M.O.B. & Logistics","

<font color='#9da698' size='14'>PLAYER RESPAWN / PLAYER JIP</font><br/>
<font color='#6C7169'>Respawn: 10 seconds. Respawn at </font><marker name='mBlueBase' color='#9DA698'>base</marker><font color='#6C7169'><br/>
JIP is enabled.</font>

<br/><br/><font color='#9da698' size='14'>PLAYER LOADOUT</font><br/>
<font color='#6C7169'>Vanilla role-specific loadout.<br/>
Crates with specop/recon gear at </font><marker name='mBlueBase' color='#9DA698'>base</marker><font color='#6C7169'>. Crates are resupplied frequently.</font>

<br/><br/><font color='#9da698' size='14'>TRANSPORT ARRANGEMENTS</font><br/>
<font color='#6C7169'>Several civilian vehicles are at your disposal at base.<br/>
Vehicle respawn-delay is set to 10 minutes for destroyed/abandoned vehicles.</font>
"]];

///// OBJECTIVES

player createDiaryRecord ["Diary",["EASY Objectives","

<font color='#9da698' size='14'>PEFKAS OBSERVATION POST</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mPefkasObs'>206201</marker><font color='#6C7169'><br/>
Difficulty: Easy<br/>
Objective: Take full control of the observation post</font>

<br/><br/><font color='#9da698' size='14'>AA-SITE</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mCP_30'>198178</marker><font color='#6C7169'><br/>
Difficulty: Easy<br/>
Objective: Neutralize the ZSU-39</font>

<br/><br/><font color='#9da698' size='14'>ALPHA PATROL</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mBP_A1'>205193</marker><font color='#6C7169'><br/>
Difficulty: Easy<br/>
Objective: Go on a recon patrol. WP Alpha 1-7</font>
"]];

player createDiaryRecord ["Diary",["MEDIUM Objectives","

<font color='#9da698' size='14'>PEFKAS BASE</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mPefkas'>209192</marker><font color='#6C7169'><br/>
Difficulty: Medium<br/>
Objective: Control the base and its surrounding CP's</font>

<br/><br/><font color='#9da698' size='14'>ARTILLERY BASE</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mCP_11'>195191</marker><font color='#6C7169'><br/>
Difficulty: Medium/Hard<br/>
Objective: Destroy all three 2S9 Sochor's</font>

<br/><br/><font color='#9da698' size='14'>IRAKLIA RESORT</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mHotel'>219210</marker><font color='#6C7169'><br/>
Difficulty: Medium<br/>
Objective: Eliminate CSAT Colonel at the old Iraklia Resort</font>

<br/><br/><font color='#9da698' size='14'>BRAVO PATROL</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mBP_B1'>209196</marker><font color='#6C7169'><br/>
Difficulty: Medium<br/>
Objective: Go on a recon patrol. WP Bravo 1-11</font>
"]];

player createDiaryRecord ["Diary",["HARD Objectives","

<font color='#9da698' size='14'>ARTILLERY BASE</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mCP_11'>195191</marker><font color='#6C7169'><br/>
Difficulty: Medium/Hard<br/>
Objective: Destroy all three 2S9 Sochor's</font>

<br/><br/><font color='#9da698' size='14'>HELIPORT</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mOpforRotor'>230185</marker><font color='#6C7169'><br/>
Difficulty: Hard<br/>
Objective: Destroy all CSAT air assets</font>

<br/><br/><font color='#9da698' size='14'>FUEL DEPOT</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mCP_60'>233197</marker><font color='#6C7169'><br/>
Difficulty: Hard<br/>
Objective: Secure the fuel depot. Destroy all CSAT assets</font>

<br/><br/><font color='#9da698' size='14'>RODOPOLI</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mObjComm'>188165</marker><font color='#6C7169'><br/>
Difficulty: Hard<br/>
Objective: Destroy the communication station</font>

<br/><br/><font color='#9da698' size='14'>PAROS</font><br/>
<font color='#6C7169'>Location: </font><marker name = 'mOpforUrban'>209169</marker><font color='#6C7169'><br/>
Difficulty: Hard<br/>
Objective: Neutralize a Supply Convoy (stationary)</font>
"]];

player createDiaryRecord ["Diary",["About Wolfpack WTT","
<font color='#9da698' size='14'>WARMUP, TRAINING &amp; TESTING</font><br/>
<font color='#6C7169'>- Warmup for a game event.<br/>
- Train your recon and covert operations skills.<br/>
- Test the mods required for the Wolfpack mission(s).</font>
"]];