wpBlizzard = false;
if (!isServer) exitWith {};

waitUntil {sleep 2; wpBlizzard};
private ["_th1","_th2","_th3","_th4","_th5","_th6","_th7","_th8"];
_th1 = "Bo_GBU12_LGB" createVehicle (getPos tTower1); sleep .25;
_th2 = "Bo_GBU12_LGB" createVehicle (getPos tTower1); sleep .25;
_th3 = "Bo_GBU12_LGB" createVehicle (getPos tTower1); sleep .25;
_th4 = "Bo_GBU12_LGB" createVehicle (getPos tTower2); sleep .25;
_th5 = "Bo_GBU12_LGB" createVehicle (getPos tTower2); sleep .25;
_th6 = "Bo_GBU12_LGB" createVehicle (getPos tTower2); sleep .25;
_th7 = "Bo_GBU12_LGB" createVehicle (getPos tTower3); sleep .25;
_th8 = "Bo_GBU12_LGB" createVehicle (getPos tTower3); 
_th1 = nil; _th2 = nil; _th3 = nil; _th4 = nil; _th5 = nil; _th6 = nil; _th7 = nil; _th8 = nil;
roundscomplete = true; publicVariable "roundscomplete";
