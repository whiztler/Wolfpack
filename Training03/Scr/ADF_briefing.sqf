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

player createDiaryRecord ["Diary",["Wolf Skill: Demolition","
<font color='#9da698' size='14'>DEMOLITION</font><br/>
<font color='#6C7169'>The Expert Training mission is a demo exercise. The how, what and when will be briefed on site.<br/>
Make sure you carry enough demo ammo to complete the objective. Always make sure you carry extra demo ammo just in case you are dealing with duds or targets that require multiple demolitions.<br/><br/>
Demo op considerations:<br/><br/>
- When approaching the demo objective make sure you have several (at least two) exfil strategies.<br/>
- Make sure that only your demo team approach the object.<br/>
- The demo team sets charges. The rest of the squadron provides security and path finding/exfil tactics.<br/>
- Make sure you use the right demo ammo and make sure to use enough to neutralize the object.</font>
"]];


player createDiaryRecord ["Diary",["Expert Training","
<font color='#9da698' size='14'>PREREQUISITES</font><br/>
<font color='#6C7169'>- Advanced training successfully completed<br/>
- Wolfpack day 1-5 (volume 1) completed</font>

<br/><br/><font color='#9da698' size='14'>SKILLSET</font><br/>
<font color='#6C7169'>Basic training prepares Wolf members in regards to the following skill set:<br/>
- Orientation and advanced navigation (without map/GPS)<br/>
- Advanced Tactical planning & scheduling (time pressure/hostile area)<br/>
- Team logistics<br/>
- Overall mission strategy</font>

<br/><br/><font color='#9da698' size='14'>LEADERSHIP</font><br/>
<font color='#6C7169'>Additional leadership (XO/CO) skill set:<br/>
- Overall leadership in dangerous/hostile situations<br/>
- Ability to communicate important information effectively<br/>
- Making decisions under extreme pressure

<br/><br/>Qualification/Result:</font><font color='#9da698' size='14'> Expert / Commander</font>

<br/><br/><font color='#9da698' size='14'>INSTRUCTOR/LEARNING MANAGEMT</font><br/>
<font color='#6C7169'>The instructor will need to pay special attention to the following aspects:<br/>
- Stealth patrol, ability to deal with POI <br/>
- Speed of movement<br/>
- Decision making process<br/><br/>

The expert mission takes places in/around the area of Altis International Airport. The teams will have to complete two separate tasks within a limited time frame. The AO's are difficult to breach unseen, so every skill-set comes into play.
This mission end when a team member is discovered by Opfor or a civilian.<br/><br/>

Since this is the main airport, expect a lot of air traffic.<br/><br/>

Leadership will get 2 minutes ingame time to prepare/brief.</font>
"]];

///// SITUATION

player createDiaryRecord ["Diary",["Wolf Bootcamp Training","

<font color='#9da698' size='14'>SUMMARY</font><br/>
<font color='#6C7169'>The Wolf bootcamp training consists of three training missions:<br/><br/>
1. Basic Training (Part of Wolfpack Vol 1)<br/>
2. Advanced Training (Part of Wolfpack Vol 1)<br/>
3. Expert Training (Part of Wolfpack Vol 2)<br/><br/>
The training missions have specifically been put together to train for Wolfpack missions. The 'Basic Training' and the 'Advanced Training' missions take place in a 6 x 5 Km area. north east Altis. The terrain is ideal for covert operations.<br/>
With the 'Basic Training' and 'Advanced Training' missions you can train yourself in long range covert travel/patrol. The expert mission takes places in/around the area of Altis International Airport. The teams will have to complete two separate tasks within a limited time frame. The AO's are difficult to breach unseen, so every skill-set comes into play.
This mission end when a team member is discovered by Opfor or a civilian.</font>

<br/><br/><font color='#9da698' size='14'>EXPERT TRAINING OBJECTIVE</font><br/>
<font color='#6C7169'>Your exercise objective will be briefed on site.</font>

<br/><br/><font color='#9da698' size='14'>INTEL ON ENEMY FORCES</font><br/>
<font color='#6C7169'>The AO is extensively patrolled by infantry, vehicles and aerial patrols. We cannot provide any intel on numbers or exact whereabouts of any CSAT forces.</font>

<br/><br/><font color='#9da698' size='14'>WEATHER AND MISSION TIME</font><br/>
<font color='#6C7169'>This training exercise starts at around 05:10 hrs. Clear weather, high humidity, moderate visibility. Forecast: moderate visibility, light overcast, chance of light showers.</font>
"]];