_l = ["tLayer"] call BIS_fnc_rscLayer; 
_l cutText ["", "BLACK", 10];
["<img size= '10' shadow='false' image='Img\wpintro.paa'/><br/><br/><t size='.7' color='#FFFFFF'>Day 05 | Bullseye</t>",0,0,3,4] spawn BIS_fnc_dynamicText;
sleep 5;
['END1',true,5] call BIS_fnc_endMission;