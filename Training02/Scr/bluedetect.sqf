//spDetected = true; publicVariable "spDetected";

if (isNil "mdev") then {missionNamespace setVariable ["mdev", objNull]};
if (player == mdev) exitWith {};

sleep 2;

player setPos (getMarkerPos "mStart");

[] spawn {
	["<img size= '8' shadow='false' image='Img\wolf_logo.paa'/><br/><br/><t size='.7' color='#9DA698'>You have been detected. Your training is over</t>",0,0,3,12] spawn BIS_fnc_dynamicText;
};

sleep 5;

_l = ["xLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK OUT", 5];

sleep 4;

['END2',true,2] call BIS_fnc_endMission;
