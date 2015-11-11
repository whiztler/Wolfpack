waitUntil {sleep 2; (objInstanbul == 1) && (objBarcelona == 1)};
sleep 25;

_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK", 10];
["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 06 | Riga Hill</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
sleep 5;
['END1',true,5] call BIS_fnc_endMission;