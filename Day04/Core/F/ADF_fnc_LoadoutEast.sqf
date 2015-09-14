/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Loadouts EAST
Author: Saetheer
Script version: 2.31

Game type: n/a
File: ADF_loadOutsEast.sqf
****************************************************************
Instructions:

This script is called by the loadOutsClient.sqf script. The client
script call for a specific role that matches the name of the playable
unit. Make sure that the names in the client, this script and the names
of your playable units match, else the script will not execute for that
specific player causing him to have an incorrect loadout.

Make sure to check the capacity of the backpack and vest before adding
(more) items. Do not delete lines but comment them out when you do not
want it included.

The script runs on initial join, on jip and on respawn.
****************************************************************/

diag_log "ADF RPT: Init - executing ADF_fnc_LoadoutEast.sqf"; // Reporting. Do NOT edit/remove