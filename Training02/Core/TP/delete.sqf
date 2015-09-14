/*
    .....               ...     ..           ...     ..      
.H8888888h.  ~-.    .=*8888x <"?88h.     .=*8888x <"?88h.  
888888888888x  `>  X>  '8888H> '8888    X>  '8888H> '8888  
X~     `?888888hx~ '88h. `8888   8888   '88h. `8888   8888  
'      x8.^"*88*"  '8888 '8888    "88>  '8888 '8888    "88>  
`-:- X8888x        `888 '8888.xH888x.   `888 '8888.xH888x.  
      488888>         X" :88*~  `*8888>    X" :88*~  `*8888>
    .. `"88*        ~"   !"`      "888>  ~"   !"`      "888>
  x88888nX"      .   .H8888h.      ?88    .H8888h.      ?88  
!"*8888888n..  :   :"^"88888h.    '!    :"^"88888h.    '!  
'    "*88888888*    ^    "88888hx.+"     ^    "88888hx.+"    
        ^"***"`            ^"**""               ^"**""    

    | TheButcherBay | ARMA 3 ALPHA | ANJAN DELETE ALL |
*/

if (isServer) then {diag_log "ADF RPT: Init - executing delete.sqf"}; // Reporting. Do NOT edit/remove

if (!isServer) exitWith {};

TBB_Included = [];

TBB_Excluded = ["B_soldier_AR_F","B_soldier_exp_F","B_Soldier_GL_F","B_helicrew_F","B_Pilot_F","B_crew_F",
                "B_Helipilot_F","B_soldier_M_F","B_medic_F","B_Soldier_F",
                "B_soldier_repair_F","B_soldier_LAT_F","B_Soldier_SL_F",
                "B_Soldier_lite_F","B_Soldier_TL_F","B_Lifeboat",
                "B_Assaultboat","B_SpeedBoat","B_Quadbike_F",
                "B_Hunter_F","B_Hunter_HMG_F","B_Hunter_RCWS_F","B_Heli_Transport_01_camo_F",
                "B_MH9_F","B_AH9_F","O_Ka60_Unarmed_F","O_Ka60_F","B_Mk6"];

// true/false = on/off.
_canMove = true;          // if vehicles should be deleted when they are to damaged to move and empty, NOTE empty fuel also means it cannot move.
_abandoned = false;      // if vehicles should be deleted after being x time un manned, if 1 unit enters in the time period, time is reset, and vehicle is processed again when empty or destroyed.
_groupDel = true;          // if empty groups should be deleted, to avoid reaching 144 group limit in long missions.
_viewDist = _this select 0;            // min distance in meter from a player unit to allow delete, if you dont care if player sees the delete, set it to 0.
_manTimer = _this select 1;          // x seconds until delete of dead man units.
_vehTimer = _this select 2;          // x seconds until delete of dead vehicles, for destroyed and heavy damaged vehicles.
_abaTimer = _this select 3;          // x seconds a vehicle must be unmanned to be deleted, for _abandoned option.
_incTimer = 30;            // x seconds any object put inside the TBB_Included will be deleted no matter condition.

// DO NOT EDIT PAST THIS LINE //

// delete function.
_delete = {
    _del = _this select 0;
    _dis = _this select 1;
    _tim = _this select 2;
    _aba = _this select 3;
    _abt = _this select 4;
    _cnm = _this select 5;
    if (isPlayer _del) exitWith {};
    
    _abort = true;
    if ("veh" in _this AND (_aba OR _cnm)) then {
        _sec = _abt;
        while {_sec != 0} do {
            sleep 1;
            if (_aba AND (getDammage _del) < 1 AND ({alive _x} count (crew _del)) == 0) then {_sec = _sec - 1};
            if (_aba AND _sec == 0) then {_abort = false};
            if (((_cnm AND canMove _del) OR _aba) AND ({alive _x} count (crew _del)) != 0) then {
                _sec = 0; _abort = true;
                _del setVariable ["TBB_delete_readd", true, true];
            };
            if ((getDammage _del) >= 1) then {
                _sec = 0; _abort = false;
                sleep _tim;
            };
            if (isNull _del) then {_sec = 0; _abort = true};
        };
    } else {
        _abort = false;
        sleep _tim;
    };
    // fail safe for excluded and included.
    if (isNull _del OR _abort OR _del in TBB_Excluded) exitWith {};
    {
        _arr = _x; _obj = ""; _timer = _tim; _dist = _dis;
        if ((typeName _arr) == "ARRAY") then {
            _obj = _arr select 0; _timer = _arr select 1;
            if ((count _arr) == 3) then {_dist = _arr select 2} else {_dist = _viewDist};
        } else {
            _obj = _arr; _timer = _tim; _dist = _dis;
        };
        if (_del == _obj) then {
            _del = _obj;
            _dis = _dist;
            if ((_timer - _tim) > 0) then {sleep (_timer - _tim)};
            // clean up the TBB_Included array of deleted objects.
            TBB_Included = TBB_Included - [_x];
        };
    } foreach TBB_Included;
    
    if (!isNull _del) then {
        _arr = [];
        waitUntil {sleep 1; ({isPlayer _x AND (_del distance (vehicle _x)) < _dis} count playableUnits) == 0};
        waitUntil {sleep 1; ({isPlayer _x AND (_del distance (vehicle _x)) < _dis} count switchableUnits) == 0};
        if ("veh" in _this OR "incVeh" in _this) then {{_arr = _arr + [_x]; _x setPos (getPos _del); deleteVehicle _x} foreach crew _del} else {
            if (_del isKindOf "man") then {hideBody _del; sleep 10};
        };
        _arr = _arr + [_del];
        deleteVehicle _del;
        //{_x = objNull; waitUntil {sleep 1; isNull _x}; _x = nil} foreach _arr;
        
        {if (_x in TBB_delete_respawned) then {_arr = _arr - [_x]}} foreach _arr;
        TBB_delete_respawned = TBB_delete_respawned + _arr;
    };
};

_processed = []; _todo = []; _types = []; _included = []; TBB_delete_respawned = [];
while {true} do {
    // check TBB_Excluded array for changes.
    {if ((typeName _x) == "STRING" AND !(_x in _types)) then {_types = _types + [_x]}} foreach TBB_Excluded;
    // update types/classnames if changed.
    {if (!(_x in TBB_Excluded)) then {_types = _types - [_x]}} foreach _types;
    // clean the processed list of all objects that have been deleted.
    {if (isNull _x) then {_processed = _processed - [_x]}} foreach _processed;
    // clean the included list of all objects that have been deleted.
    {if (isNull _x) then {_included = _included - [_x]}} foreach _included;
    
    // process TBB_Included array.
    {
        _arr = _x; _obj = ""; _timer = 0; _dist = 0;
        if ((typeName _arr) == "ARRAY") then {
            _obj = _arr select 0; _timer = _arr select 1;
            if ((count _arr) == 3) then {_dist = _arr select 2} else {_dist = _viewDist};
        } else {
            _obj = _arr; _timer = _incTimer; _dist = _viewDist;
        };
        if (_x in _included) exitWith {};
        _included = _included + [_obj];
        if (_obj isKindOf "AllVehicles" AND !(_obj isKindOf "Man")) then {
            _null = [_obj,_dist,_timer,false,0,false,"incVeh"] spawn _delete;
        } else {
            _null = [_obj,_dist,_timer,false,0,false,"inc"] spawn _delete;
        };
    } foreach TBB_Included;
    
    // gather all dead.
    _allD = allDead;
    {if (_x in TBB_delete_respawned AND _x in _processed) then {_processed = _processed - [_x]}} foreach _allD;
    {
        _unit = _x;
        if (_x in _included) exitWith {};
        if ((vehicle _x) == _x AND !(_x in _processed) AND ({_unit isKindOf _x} count _types) == 0 AND !(_x in TBB_Excluded)) then {
            if (!(_x in _todo)) then {_todo = _todo + [_x]};
        };
    } foreach _allD;
    
    // gather all vehicles and process depending on options used.
    _allV = vehicles;
    {if (_x in TBB_delete_respawned AND _x in _processed) then {_processed = _processed - [_x]}} foreach _allV;
    {
        _veh = _x;
        if (_x in _included) exitWith {};
        if (_x getVariable ["TBB_delete_readd", false]) then {
            _processed = _processed - [_x];
            _x setVariable ["TBB_delete_readd", false, true];
        };
        if (!(_x in _processed) AND ({_veh isKindOf _x} count _types) == 0 AND !(_x in TBB_Excluded)) then {
            if ((getDammage _x) >= 1 OR (_canMove AND !canMove _x AND ({alive _x} count (crew _x)) == 0) OR (_abandoned AND ({alive _x} count (crew _x)) == 0)) then {
                if (!(_x in _todo)) then {_todo = _todo + [_x]};
            };
        };
    } foreach _allV;
    
    // run the delete script for todo list.
    {
        if (!(_x in _processed)) then {
            if (_x isKindOf "Man") then {
                _null = [_x,_viewDist,_manTimer,_abandoned,_abaTimer,_canMove] spawn _delete;
            } else {
                _null = [_x,_viewDist,_vehTimer,_abandoned,_abaTimer,_canMove,"veh"] spawn _delete;
            };
            _todo = _todo - [_x]; _processed = _processed + [_x];
        };
    } foreach _todo;
    
    // delete empty groups.
    if (_groupDel) then {{if ((count (units _x)) == 0) then {deleteGroup _x; _x = grpNull; _x = nil}} foreach allGroups};
    
    // sleep 10 seconds, then check if there are any changes to dead or vehicles that are not processed.
    sleep 10;
};