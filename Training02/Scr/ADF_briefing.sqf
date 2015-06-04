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

player createDiaryRecord ["Diary",["Support and Logistics","

<font color='#9da698' size='14'>PLAYER RESPAWN / PLAYER JIP</font><br/>
<font color='#6C7169'>No respawn available.<br/>
JIP is disabled. New players join as seagull.</font>

<br/><br/><font color='#9da698' size='14'>PLAYER LOADOUT</font><br/>
<font color='#6C7169'>Vanilla Wolfpack</font>

<br/><br/><font color='#9da698' size='14'>VEHICLE RESPAWN</font><br/>
<font color='#6C7169'>Not applicable.</font>

<br/><br/><font color='#9da698' size='14'>VEHICLE SUPPLY CARGO</font><br/>
<font color='#6C7169'>Not applicable.</font>

<br/><br/><font color='#9da698' size='14'>TRANSPORT ARRANGEMENTS</font><br/>
<font color='#6C7169'>Start at the '</font><marker name='mStart' color='#9DA698'>Start</marker><font color='#6C7169'>' marker</font>
"]];

player createDiaryRecord ["Diary",["Wolf Skill: Assault","
<font color='#9da698' size='14'>ASSAULT</font><br/>
<font color='#6C7169'>Assault operations are often used in combination with force recon operations. Assault operations require careful planning and tactics to maximize surprise and combat effectiveness.<br/><br/>
Wolf operators are hardly ever used for full frontal assault operations. A typical assault operations comprised of taking out HVT's (persons or objects), assault and secure small compounds, assault small convoy's, etc. Assault operations are carried out combat efficiently and swiftly so the enemy has no time to organise a counter attack. By the time the enemy realizes something is wrong, the Wolf troops are long gone.</font>
"]];

player createDiaryRecord ["Diary",["Wolf Skill: Reconnaissance","
<font color='#9da698' size='14'>RECONNAISSANCE</font><br/>
<font color='#6C7169'>Reconnaissance or recce or recon is a term used for gathering intelligence by visual observation or other detection methods, about the activities and resources of an enemy or potential enemy, or about the meteorologic, hydrographic, or geographic characteristics of a particular area.<br/><br/>

Path finding or route recon is oriented on a given route or a general direction of travel, to provide information on route conditions or activities along the route. The wolf commander relies on information about locations along his determined route: which those that would provide best cover and concealment; bridge by construction type, dimensions, and classification; or for landing zones or pickup zones, if the need arises.<br/>
TOC or the Wolf unit commander may act upon a force-oriented route recon by which the enemy could influence movement along that route. For the recon troops, stealth and speed —in conjunction with detailed intelligence-reporting—are crucial. The recon unit must remain far enough ahead of the Wolf troop or squadron to assist in early warning and to prevent the troop or squadron from becoming surprised.</font>
"]];

player createDiaryRecord ["Diary",["Wolf Skill: Covert Patrol","
<font color='#9da698' size='14'>COVERT PATROL</font><br/>
<font color='#6C7169'>The AO terrain is ideal for covert travel. A little preparation re path tactics enables you to travel through the AO without being detected by road vehicles and aerial vehicles.<br/><br/>
Depending on team layout, it is wise to send a 2 man scouting party ahead of the troop. Once deemed safe, the troop can advance in a bounding fashion ensuring patrol safety and maintaining situational awareness.<br/>
Make sure that each team member knows its task in case of holding (360 security, which direction to secure), in case of contact (how to proceed, how to retreat) and in case of fast travel (which direction to look/cover). This way team members rely on each other for optimal awareness and security. This way, and only this way is the team able to move swiftly.</font>
"]];

player createDiaryRecord ["Diary",["Advanced Training","
<font color='#9da698' size='14'>PREREQUISITES</font><br/>
<font color='#6C7169'>- Basic training successfully completed<br/>
- Wolfpack day 1 completed</font>

<br/><br/><font color='#9da698' size='14'>SKILLSET</font><br/>
<font color='#6C7169'>Basic training prepares Wolf members in regards to the following skill set:<br/>
- Orientation (with map, without GPS)<br/>
- tactical long-range (OTH) patrol<br/>
- Stealth strategy<br/>
- Infil/Exfil scenarios<br/>
- Roles: demo/recon/marksman/assault<br/>
- Leadership (CO/XO/RTL)</font>

<br/><br/><font color='#9da698' size='14'>LEADERSHIP</font><br/>
<font color='#6C7169'>Additional leadership (CO/RTL) skill set:<br/>
- Path finding multiple battle points/control points<br/>
- Specialized teams (diving, LR Recon/UAV)<br/>
- Multiple infil/exfil scenarios<br/>
- Speed vs Stealth</font>

<br/><br/>Qualification/Result:</font><font color='#9da698' size='14'> Specialist (role specialization/RTL)</font>

<br/><br/><font color='#9da698' size='14'>INSTRUCTOR/LEARNING MANAGEMT</font><br/>
<font color='#6C7169'>The instructor will need to pay special attention to the following aspects:<br/>
- Accurate navigation (map only, constant 360 awareness, POI navigating)<br/>
- Patrol strategy. Tactical approach per team. Exit scenarios (ERV's)<br/>
- Emergency scenarios (under fire, abort, retreat, etc)<br/>
- Planning ahead (objective tactics, multiple exfils and ERV's)<br/>
- Leadership comms (up/down)<br/><br/>

Advanced navigation/patrol instructions can be given during the mission init phase when all players go from the lobby to the map screen. Instructor will need 10-15 minutes to go through previously mentioned topics/skill sets.<br/><br/>

Leadership will get 5 minutes ingame time to prepare/brief</font>
"]];

///// SITUATION

player createDiaryRecord ["Diary",["Wolf Bootcamp Training","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>The Wolf bootcamp training consists of three training missions:<br/><br/>
1. Basic Training (Part of CO15 - Wolfpack Vol 1)<br/>
2. Advanced Training (Part of CO15 - Wolfpack Vol 1)<br/>
3. Expert Training (Part of CO15 - Wolfpack Vol 2)<br/><br/>
The training missions have specifically been put together to train for Wolfpack missions. The 'Basic Training' and the 'Advanced Training' missions take place in a 6 x 5 Km area. north east Altis. The terrain is ideal for covert operations.<br/>
With the 'Basic Training' and 'Advanced Training' missions you can train yourself in long range covert travel/patrol. The objective of both missions is to get to the Thronos Castle without being spotted by the various CSAT EI patrols, vehicles, control posts. Even civilians can detect you and they'll report your position to CSAT!<br/><br/>
The exercise is over once you have been detected by CSAT or when you successfully reach Thronos Castle undetected. The mission will then end automatically.</font>

<br/><br/><font color='#9da698' size='14'>ADVANCED TRAINING OBJECTIVE</font><br/>
<font color='#6C7169'>Get to the </font><marker name='mEnd' color='#9DA698'>Thronos castle</marker><font color='#6C7169'> undetected.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>The area is patrolled by infantry, vehicles and aerial patrols. You'll come across various CP's with static defences.</font>

<br/><br/><font color='#9da698' size='14'>WEATHER AND MISSION TIME</font><br/>
<font color='#6C7169'>This training exercise starts at around 04:30 hrs. High fog, high humidity, low visibility. Forecast: medium visibility, light overcast, change of light showers.</font>
"]];