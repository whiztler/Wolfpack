![Wolfpack Vol 1 & 2](wolfpack_header_01.png)



# Testing
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
