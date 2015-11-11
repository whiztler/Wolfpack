if (!isServer) exitWith {};
params ["_unit"];
_unit setVariable ["BIS_EhAnimDone", true];
nTeam setCombatMode "GREEN";
nTeam setBehaviour "SAFE";
