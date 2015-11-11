kryaActive = false;

if (!isServer) exitWith {};

waitUntil {sleep 2; kryaActive};

private ["_th1","_th2","_th3","_th4","_th5"];
_th1 = "Bo_GBU12_LGB" createVehicle (getPos gbu1); deletevehicle gbu1;
_th2 = "Bo_GBU12_LGB" createVehicle (getPos gbu2); deletevehicle gbu2;
_th3 = "Bo_GBU12_LGB" createVehicle (getPos gbu3); deletevehicle gbu3;
_th4 = "Bo_GBU12_LGB" createVehicle (getPos gbu4); deletevehicle gbu4;
_th5 = "Bo_GBU12_LGB" createVehicle (getPos gbu5); deletevehicle gbu5;
_th1 = nil; _th2 = nil; _th3 = nil; _th4 = nil; _th5 = nil;
roundscomplete = true; publicVariable "roundscomplete";

sleep 15;

deleteMarker "mKrya";

_m = createMarker ["AbderaApt", [9140.85,21476.2,0]];
_m setMarkerSize [1.5, 1.5];
_m setMarkerShape "ICON";
_m setMarkerType "o_air";
_m setMarkerColor "ColorEAST";
_m setMarkerDir 0;
_m setMarkerText "Abdera Airfield";








