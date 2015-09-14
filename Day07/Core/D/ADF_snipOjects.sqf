/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Objects Counter
Author: Whiztler
Script version: 1.1

Game type: n/a
File: ADF_snipObjects.sqf
****************************************************************
Instructions:

Create a trigger with the following params:
Axes A = 0
Axes B = 0
Type: none
Activation: Radio Alpha
Repeatedly
On Act.: null = execVM "Core\D\ADF_snipOjects.sqf";

In your init.sqf, add the following line:
1 setRadioMsg "Mission Unit/Group Counter"; // Debugging/MM only!

In game use 0-0-1 to check the number of units

Playable slots are only shown in a MP session!
****************************************************************/

_cntO = {(side _x) == EAST} count allUnits;
_cntOg = {(side _x) == EAST} count allGroups;
_cntOp = {(side _x) == EAST} count playableUnits;
_cntB = {(side _x) == WEST} count allUnits;
_cntBg = {(side _x) == WEST} count allGroups;
_cntBp = {(side _x) == WEST} count playableUnits;
_cntI = {(side _x) == RESISTANCE} count allUnits;
_cntIg = {(side _x) == RESISTANCE} count allGroups;
_cntIp = {(side _x) == RESISTANCE} count playableUnits;
_cntC = {(side _x) == CIVILIAN} count allUnits;
_cntCg = {(side _x) == CIVILIAN} count allGroups;
_cntCp = {(side _x) == CIVILIAN} count playableUnits;
_cntD = count allDead;
_cntTTL = count allUnits;
_cntTTLg = count allGroups;
_cntTTLp = count playableUnits;
_cntObj = count (allMissionObjects "All");
_cntV = count vehicles;

HintSilent parseText format["
<t align='left'><t size='1.2' align='left' shadow='3'>Current Active Units/Groups</t><br/><br/>
<t color='#A1A4AD' size='1'>Opfor units: </t><t color='#FE2E2E' size='1'>%1</t><t size='.8' color='#A1A4AD' align='right'>(%2 groups)</t><br/>
<t color='#A1A4AD' size='1'>Bluefor units: </t><t color='#2E64FE' size='1'>%3</t><t size='.8' color='#A1A4AD' align='right'>(%4 groups)</t><br/>
<t color='#A1A4AD' size='1'>Independ. units: </t><t color='#A5DF00' size='1'>%5</t><t size='.8' color='#A1A4AD' align='right'>(%6 groups)</t><br/>
<t color='#A1A4AD' size='1'>Civilian units: </t><t color='#DA81F5' size='1'>%7</t><t size='.8' color='#A1A4AD' align='right'>(%8 groups)</t><br/>
<t color='#000000'>--------------------------------------------------------</t><br/>
<t color='#A1A4AD'>Total units: </t><t color='#F7D358'>%9</t><t size='.8' color='#A1A4AD' align='right'>(Total groups: %10)</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>Current Active Vehicles</t><br/><br/>
<t color='#A1A4AD'>Vehicles count: </t><t color='#F7D358'>%11</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>Current nr. of objects</t><br/><br/>
<t color='#A1A4AD'>Objects count: </t><t color='#F7D358'>%12</t><br/><br/>
<t size='1.2' color='#ffffff' align='left'>Playable units per faction</t><br/><br/>
<t color='#A1A4AD'>Slots: </t><t color='#FE2E2E'>%13</t><t color='#000000'> / </t><t color='#2E64FE'>%14</t><t color='#000000'> / </t><t color='#A5DF00'>%15</t><t color='#000000'> / </t><t color='#DA81F5'>%16</t><t color='#000000'> / </t><t color='#A1A4AD'>TTL: </t><t color='#F7D358'>%17</t>
", _cntO, _cntOg, _cntB, _cntBg, _cntI, _cntIg, _cntC, _cntCg, _cntTTL, _cntTTLg, _cntV, _cntObj, _cntOp, _cntBp, _cntIp, _cntCp, _cntTTLp];