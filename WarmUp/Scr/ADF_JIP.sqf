[] spawn {
	if (!isDedicated && (player != player)) then {
		waitUntil {!isNull player && player == player};
		waitUntil {!isNil "BIS_fnc_init"};
		waitUntil {!(isNull (findDisplay 46))};
	};
	ADF_joined = true;
};