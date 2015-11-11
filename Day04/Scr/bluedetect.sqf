{
	if (side _x == EAST) then {
		_x setBehaviour "AWARE";
		_x setCombatMode "RED";
		_x setskill 0.65;		
	};
} forEach allUnits;


// {if (side _x == EAST) then {_x setBehaviour "AWARE"}} forEach ((getPosATL ObjectName) nearEntities ["All", 200]);