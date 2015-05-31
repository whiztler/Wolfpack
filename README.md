# Wolfpack Vol. 1 & 2




## ABOUT WOLFPACK

|  |  |
|-------------:|--------------|
| Version | 1.60 |
| Release date | xx June 2015 |
| ADF | 1.39 |
| ARMA III | 1.46 |


## ADD-ONS

Wolfpack only requires the CBA A3 addon to function. 

### Required add-ons
* Community Based Addons A3 (CBA)

### Optional/Recommended add-ons
* Advanced Combat Radio Environment (ACRE / ACRE 2) -or- Taskforce Arrowhead Radio (TFAR)
* Commanders Tablet (cTab).
* Advanced Combat Environment 3 (ACE3). Note tat AGM is no longer supported


## DESCRIPTION
Wolfpack is a multiplayer (14 slots) special operations campaign consisting of ten challenging assault, demolition and reconnaissance missions and three bootcamp training missions. 

### Features
* 10 SpecOp/Recon Missions;
* 3 Bootcamp training missions;
* Challenging and Immersive gameplay in a lively area of operations;
* Detailed SpecOp style briefings (ingame and PDF/TXT for forum briefings);
* Optimized for dedicated server play;
* Challenging opponents.
* Automatic detection of ACRE(2)/TFAR and AGM mods

### Storyline
June 2034, Altis is in turmoil. The island has been cut off from the outside world due to economical and physical blockades. The local populous has grown impatient with the government and the AFF in particular. Several demonstrations have resulted in the deaths of tens of civilians.

The government was losing control rapidly and called in the help of CSAT. A mistake that would cost them dearly. CSAT saw a golden opportunity to get a much needed foothold in the Mediterranean area. The AAF requested a single battalion of CSAT Infantry. Instead CSAT send the entire 2nd brigade and soon CSAT outnumbers AAF by 11:1. Altis government realized that they lost control completely and stepped down. CSAT General Tehrani has since been in power and controls all of Altis and Stratis.

CSAT is now proven a serious threat to the European region. As diplomatic efforts have not lead to the anticipated result, NATO decided to send a rapid task force to free both islands from CSAT oppression..DEVGRU has been ordered by J.S.O.C. to take out several high value threads on Altis before the NATO campaign commences. Wolf has been tasked with executing 10 missions over a period of 3-4 weeks. Your first mission commences 11 June.

### Author
whiztler / http://forums.bistudio.com/member.php?144637-whiztler"

### Credits & Acknowledgements
This MP campaign was carefully  put together with the assistance, support and scripts from the following individuals/groups:

[Nopryl](www.nopryl.no) - [CIA community](ciahome.net) - [Killzone Kid](http://killzonekid.com/) - Mad T - Anjan Riot - Void -  Zorrobyte - Tonic


## WOLFPACK CAMPAIGN PACKAGE

### Included in the Wolfpack campaign package:
* 10 special operations/recon missions
* 3 bootcamp training missions
* Detailed mission briefings in PDF and TXT (for use on forums etc)
* Media to be used with forum postings (mission cover image, AO map, objectives, etc)
* This readme document

### CHANGELOG

[Changelog can be found here](https://github.com/whiztler/Wolfpack/blob/master/Changelog.md)


## Wolfpack Client / Server information

### Server
Recommend server settings for optimal gameplay
| Option | Recommende settings & information |
|------------|------------------------------------------|
| Difficulty | expert |
| Map | Altis |
| Mods | [CBA A3](http://www.armaholic.com/page.php?id=18767) (Recommended: [ACRE2](http://www.armaholic.com/page.php?id=19324) / [TFAR](http://www.armaholic.com/page.php?id=23615), [cTAB](http://www.armaholic.com/page.php?id=22992), [ACE3](http://www.armaholic.com/page.php?id=18949) |
| Style | COOP |
| Slots | 15  (14 players plus 1 optional HC) |
| Duration | 1-4 hours depending on style of gameplay |

**Add-ons	: Server required add-ons: CBA A3**

### Client
Required add-ons
* [CBA A3 - Community Based Addons](http://www.armaholic.com/page.php?id=18767)

Recommended client add-ons
* [ACRE2](http://www.armaholic.com/page.php?id=19324) -or- [Taskforce Radio (TFAR)](http://www.armaholic.com/page.php?id=23615)
* [Commanders Tablet (cTAB)](http://www.armaholic.com/page.php?id=22992)
* [Advanced Combat Environment 3 (ACE3)](http://www.armaholic.com/page.php?id=18949)

## Testing
Each mission has its own 'Mission Objectives Test Script' to test mission critical triggers and exfil. The 
script works in a dedicated server environment and can be evoked by a server admin (or anyone who 
has server admin access).

* Wait at least 2 minutes before starting the script;
* Head out towards the RV first and/or leave the vehicle before starting the script;
* Make sure you are logged in as server admin
* Hit the escape key to bring up the 'debug console';
* in the execute window enter:  null = execVM "mots.sqf";

> Note that the mots.sqf script exposes all mission spoilers as all players are teleported directly to/from the 
objectives/exfil location. Some action that require radio triggers [0-0-4] need to be executed 
manually. Instructions to do so will be advised when 
needed. 


## Installing
### Multiplayer / Dedicated Server
Copy/Move the .pbo files location in the 'Missions' folder (in case you download the ZIP) to your 
Steam/SteamApps/common/ArmA 3/MPMissions folder.

### Single player
All missions (incl the bootcamp training missions) can  be played in single player mode: 
* Copy/Move the .pbo files location in the 'Missions' folder (in case you download the ZIP) to your Steam/SteamApps/common/ArmA 3/MPMissions folder.
* Start Arma3
* Select Play
* Select Multiplayer
* Click on 'NEW'
* Select LAN as host, click 'OK'
* Select the Wolfpack mission you want to play
* Done!

## Missions Vol. 1

### DAY 01 - THE PACKAGE
Our area of operation lies north of Athira. JSOC expects a HVT to arrive and inspect the CSAR Frini base tomorrow.  Wolf will eliminate the HVT once he arrives at the base. Due to the sensitive nature of this mission, detailed objectives will be given on a need to know basis once you have reached the RV. Our local on the ground will do an extensive briefing.

### DAY 02 - KAJMAN FIRE
CSAT has taken over the Abdera Airfield and turned the airfield into a helicopter base. The base is home to the 127 AAC Squadron with 6 or 8 Kajman Attack helicopters and to the 17 Air Support Group. About one kilometer north east lies the village of Krya Nera. This used to be a little fisherman's village until CSAT stationed a small fleet of attack vessels there. Primary objective: Abdera Airfield, sabotage all Kajman Attack helicopters stationed at the airfield. Secondary objective: Krya Nera Naval Base, take control of the Naval Base and wait for further instructions.

### DAY 03 - SWITCH OFF
CSAT's primary communications station is situated on the outskirts of Kavala. It is essential we disrupt communications before we commence the NATO invasion. The nearby power station provides power to the Kavala region, including the communications station. We need to take both out in order to be sure that CSAT's ability to communicate is disrupted. Primary objective: Sabotage the communications station.  Secondary objective: Sabotage the power station. 

### DAY 04 - TOP SCREEN
CSAT's propaganda campaign is out of control. Their fear and retribution series broadcasted on television and radio has caused grave concerns both locally and abroad. We need the local populous on our side once the invasions commences. We need to shut down the Altis Broadcasting Company (ABC) in the Capital of Altis, Pyrgos.Sabotage the ABC headquarters. You'll be filled in on the specifics once you are close to the objective.

### DAY 05 - BULLSEYE
Maj. F. Kallaziz's replacement has arrived in Pyrgos, Maj. Farrokhzad. We know very little about Maj. Farrokhzad. According to Nikko, the major has already made his mark by having tens of civilians arrested. Supposedly there is a public hanging the day after tomorrow. CIA and MIS are working hard to get more intel about this guy. So it looks like your Wolf troops are going back to Pyrgos. Your objective is to find intel on Maj. Farrokhzad.

## Missions Vol. 2

### DAY 06 - RIGA HILL
Intel shows a large AA-emplacement at a base west of Zoros Bay (codename 'Istanbul'). which gets its intel from a radar site a little north east (codename 'Barcelona'). Your orders are to insert west of Zoros Bay and take out the radar installation at Barcelona and the AA-emplacements at Istanbul.

### DAY 07 - U-12
Our man on the ground, Nikkos got captured by CSAT Intelligence Services. Nikkos knows too much about the upcoming campaign. We need to break him out before they fly him back to the CSAT capital.Nikkos is currently being held in a secret prison codenamed 'U-12'. It is located in Thelos Bay on the east coast of Altis.  Wolf is to secure and retrieve Nikkos Fotopoulos.

### DAY 08 - ICE TIGER
The last two weeks, SatNav has been tracking a heavy armored squadron consisting of 6 T100 MBT's, 1 x Tigris and APC's plus supporting units. SatNav lost Ice Tiger due to severe overcast weather. According to Nikkos, Ice Tiger should be in the North Western part of Altis. We need confirmation on its exact location. Your orders are to locate Ice Tiger.

### DAY 09 - DRAGONFLY
Two days ago the 127 Republican Wing Squadron, an elite squadron of TO-199 bombers touched down at Stratis Airbase. The 13th MEU is scheduled to assault Stratis in three days. This can only happen when those TO-199's have been disposed off.  We'll advise objectives and targets when you're on the ground.

### DAY 10 - DOBERMAN
Your last mission is a high risk mission in Kavala. We are still gathering intel. We'll brief you when you're oscar mike.


## Wolfpack Bootcamp Training Missions

The Wolf bootcamp training consists of three training missions:
1.	Basic Training (Part of Wolfpack Vol 1)
2.	Advanced Training (Part of Wolfpack Vol 1)
3.	Expert Training (Part of Wolfpack Vol 2)

The training missions have specifically been put together to train for Wolfpack missions. The 'Basic Training' and the 'Advanced Training' missions take place in a 6 x 5 Km area. north east Altis. The terrain is ideal for covert operations.
With the 'Basic Training' and 'Advanced Training' missions you can train yourself in long range covert travel/patrol. The objective of both missions is to get to the Thronos Castle without being spotted by the various CSAT EI patrols, vehicles, control posts. Even civilians can detect you and they'll report your position to CSAT!

The exercise is over once you have been detected by CSAT or when you successfully reach Thronos Castle undetected. The mission will then end automatically.

### Wolf skill training

#### Assault
Assault operations are often used in combination with force recon operations. Assault operations require careful planning and tactics to maximize surprise and combat effectiveness.
Wolf operators are hardly ever used for full frontal assault operations. A typical assault operations comprised of taking out HVT's (persons or objects), assault and secure small compounds, assault small convoy's, etc. Assault operations are carried out combat efficiently and swiftly so the enemy has no time to organize a counter attack. By the time the enemy realizes something is wrong, the Wolf troops are long gone.

#### Reconnaissance
Reconnaissance or recce or recon is a term used for gathering intelligence by visual observation or other detection methods, about the activities and resources of an enemy or potential enemy, or about the meteorologic, hydrographic, or geographic characteristics of a particular area.

Path finding or route recon is oriented on a given route or a general direction of travel, to provide information on route conditions or activities along the route. The wolf commander relies on information about locations along his determined route: which those that would provide best cover and concealment; bridge by construction type, dimensions, and classification; or for landing zones or pickup zones, if the need arises.
TOC or the Wolf unit commander may act upon a force-oriented route recon by which the enemy could influence movement along that route. For the recon troops, stealth and speed ?in conjunction with detailed intelligence-reporting?are crucial. The recon unit must remain far enough ahead of the Wolf troop or squadron to assist in early warning and to prevent the troop or squadron from becoming surprised.

#### Covert patrol
The AO terrain is ideal for covert travel. A little preparation re path tactics enables you to travel through the AO without being detected by road vehicles and aerial vehicles.
Depending on team layout, it is wise to send a 2 man scouting party ahead of the troop. Once deemed safe, the troop can advance in a bounding fashion ensuring patrol safety and maintaining situational awareness.
Make sure that each team member knows its task in case of holding (360 security, which direction to secure), in case of contact (how to proceed, how to retreat) and in case of fast travel (which direction to look/cover). This way team members rely on each other for optimal awareness and security. This way, and only this way is the team able to move swiftly.

#### Demolition
The Expert Training mission is a demo exercise. The how, what and when will be briefed during the training exercise.
Make sure you carry enough demo ammo to complete the objective. Always make sure you carry extra demo ammo just in case you are dealing with duds or targets that require multiple demolitions.

##### Demo op considerations:
* When approaching the demo objective make sure you have two exfil strategies. One for in case things go as planned and one for in case things don't go as planned.
* Make sure that only your demo team approaches the object. The demo team sets charges. The rest of the squadron provides security and path finding/exfil tactics.
* Make sure you use the right demo ammo and make sure to use enough to neutralize the object. You do not want to return to the object for a second demo.

Demo and assault ops are the most challenging types of missions for a recon/special operations team. At some point you'll need to break covertness in order to carry out the objective. In order to maintain optimal security, make sure you plan for various scenarios/outcomes. Make sure you troop(leaders) are aware of the scenarios in case things go belly up. Planning for the unexpected increases your chance of getting out alive significantly.

## 1. BASIC TRAINING

### Prerequisites:
* Standard Operating Procedures
* ACRE/TFAR communication skills (incl. whisper mode)
* Standard patrol tactics
* Marksman qualification is recommended.

Basic training prepares Wolf members in regards to the following skill set: 
* Orientation (with map & GPS)
* Navigation
* Stealth patrol
* Radio comms
* Infiltration

### Additional leadership (CO/RTL) skill set:
* Path finding
* Team tactics/Role Specific
* Insert/Exfil tactics
* Comms tactics

Qualification/Result: **Special Operations / Recon Assault Specialist**

### Instructor/Learning Management
The instructor will need to pay special attention to the following aspects:
* Using the map for planning LR stealth patrol. Usage of terrain to the utmost advantage.
* Communication. Only base essential communication. No chit-chat whatsoever! Direct/whisper comm (no radio). 
* Team construction. Right fooks in the right role? Split up teams to get best result. Why/How?
* Patrol strategy. Distance, 2 man recon patrol/path finder. Point rotation.
* Leadership capabilities en-route. Driving the teams. Constant environment awareness.

Map reading/using/planning instructions can be given during the mission init phase when all players go 
from the lobby to the map screen. Instructor will need 10-15 minutes to go through previously mentioned 
topics/skill sets.

Leadership will get 10 minutes ingame time to prepare/brief.

## 2. ADVANCED TRAINING

### Prerequisites:
* Basic training successfully completed
* Wolfpack day 1 completed

Advanced training prepares Wolf members in regards to the following skill set: 
* Orientation (with map, without GPS)
* tactical long-range (OTH) patrol
* Stealth strategy
* Infil/Exfil scenarios
* Roles: demo/recon/marksman/assault
* Leadership (CO/XO/RTL)

### Additional leadership (CO/RTL) skill set:
* Path finding multiple battle points/control points
* Specialized teams (diving, LR Recon/UAV)
* Multiple infil/exfil scenarios
* Speed vs Stealth

Qualification/Result: ** Specialist (role specialization/RTL) **

### Instructor/Learning Management

The instructor will need to pay special attention to the following aspects:
* Accurate navigation (map only, constant 360 awareness, POI navigating). 
* Patrol strategy. Tactical approach per team. Exit scenarios (ERV's)
* Emergency scenarios (under fire, abort, retreat, etc).
* Planning ahead (objective tactics, multiple exfils and ERV's)
* Leadership comms (up/down)

Advanced navigation/patrol instructions can be given during the mission init phase when all players go from the lobby to the map screen. Instructor will need 10-15 minutes to go through previously mentioned topics/skill sets.

Leadership will get 5 minutes ingame time to prepare/brief.

## 3. EXPERT TRAINING

### Prerequisites:
* Advanced training successfully completed
* Wolfpack day 1-5 (volume 1) completed

Expert training prepares Wolf members in regards to the following skill set: 
* Orientation and advanced navigation (without map/GPS)
* Advanced Tactical planning & scheduling (time pressure/hostile area)
* Team logistics
* Overall mission strategy

### Additional leadership (CO) skill set:
* Overall leadership in dangerous/hostile situations
* Ability to comm important information effectively
* Making decisions under extreme pressure
 
Qualification/Result: ** Expert / Commander **

### Instructor/Learning Management

The instructor will need to pay special attention to the following aspects:
* Stealth patrol, ability to deal with POI 
* Speed of movement
* Decision making process

The expert mission takes places in/around the area of Altis International Airport. The teams will have to complete  two separate tasks within a limited time frame. The AO are difficult to breach unseen, so every skillset comes into play.
This mission end when a team member is discovered by Opfor or a civilian. 

Since this is the main airport, expect lots of air traffic.

Leadership will get 2 minutes ingame time to prepare/brief.
