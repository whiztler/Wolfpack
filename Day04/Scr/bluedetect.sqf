{
	if (side _x == EAST) then {
		_x setBehaviour "AWARE";
		_x setCombatMode "RED";
		_x setskill 0.65;		
	};
	if(side _x == EAST && _x isKindOf "Man") then {
		_x addEventHandler ["killed", {_this call ADF_fnc_AddKill}];
	};
} forEach allUnits;


// {if (side _x == EAST) then {_x setBehaviour "AWARE"}} forEach ((getPosATL ObjectName) nearEntities ["All", 200]);