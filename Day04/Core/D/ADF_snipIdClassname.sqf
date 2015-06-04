/****************************************************************
ARMA Mission Development Framework
ADF version: 1.40 / JUNE 2015

Script: Identify Classname
Author: Whiztler
Script version: 1.0

Game type: n/a
File: ADF_snipIdClassname.sqf
****************************************************************
Instructions:

Look or point at an object and then select this funtion. The 
classname will be displayed in a hint and copied to your clipboard.
****************************************************************/

if ((typeOf cursorTarget) == "") then {
	hintSilent parseText format["
		<t size='1.2' color='#ffffff' align='left'>Identify Classname</t><br/><br/>
		<t color='#A1A4AD' align='left'>To determine the classname of an object, look/point at the object before starting the Identify Classname tool</t><br/><br/>
		<t align='left' color='#F7D358'>No classname could be determined.</t>
	"];
} else {
hintSilent parseText format["
		<t size='1.2' color='#ffffff' align='left'>Identify Classname</t><br/><br/>
		<t color='#A1A4AD' align='left'>The following classname has been copied to your clipboard</t><br/><br/>
		<t align='left' color='#F7D358'>%1</t></br>
	", typeOf cursorTarget];
	copyToClipboard typeOf cursorTarget;	
};


