/*
  SHK_intercept
  
  Version 0.1
  Author: Shuko (shuko@quakenet, miika@miikajarvinen.fi)
  http://forums.bistudio.com/showthread.php?163484-SHK_intercept
  
  Records group position in given interval. The positions are used to calculate of the
  general direction of the group's advance.
  
  Starting Tracking
  
    Required Parameters:
      0 Group/Object  Group to track.
      
    Optional Parameters:
      1 Number        Recording interval, delay in seconds between position checks.
      2 Number        History size, number of newest positions to remember.
    
    Starting Examples:
      nul = dude1 execvm "SHK_intercept.sqf";
      nul = grpWest1 execvm "SHK_intercept.sqf";
      nul = [dude2,5,50] execvm "SHK_intercept.sqf";
      nul = [dude2,5,20] execvm "SHK_intercept.sqf";

    
  Getting the Direction
  
    Function's name is SHK_Intercept_getDir. It takes an object or a group as a parameter
    and returns a direction between 0 and 360.
    
    Required Parameters:
      0 Group/Object  Group to track.
    
    Optional Parameters:
      1 Number      Position info age when calculating direction. Given number is the
                    Nth newest position to compare the current position.
                    Example: positions are [a,b,c,d,e,f,g], you give 3 as info age. The
                    position to be used for direction calculation is e.
        Float       Range 0-1, which is applied to the size of the history. Example: size
                    is 10 and age is 0.5, the dir will be calculated from the 5th
                    position in the history. Or 0.2, the position would be 9th (2nd newest).
      2 Number      Sample size. Number of positions between newest and the one determined
                    by info age, which is included in the average calculation as well.
    
    Examples:
      dir = grpWest1 call SHK_Intercept_getDir;
      dir = [grpWest1,0.3] call SHK_Intercept_getDir;
      dir = [grpWest1,10,5] call SHK_Intercept_getDir;
*/
private ["_grp","_time","_size"];
_time = 5;
_size = 20;

switch (typename _this) do {
  case (typename grpNull): { _grp = _this };
  case (typename objNull): { _grp = group _this };
  case (typename []): {
    _grp = _this select 0;
    if (typename _grp == typename objNull) then {_grp = group _grp};
    if (count _this > 1) then {_time = _this select 1};
    if (count _this > 2) then {_size = _this select 2};
  };
};

SHK_intercept_getDir = {
  private ["_grp","_ldr","_hst","_age","_samples","_cnt","_dir","_old","_prv","_cur","_ave"];
  _age = 3;
  _samples = 0;
  _dir = -1;
  
  switch (typename _this) do {
    case (typename grpNull): { _grp = _this };
    case (typename objNull): { _grp = group _this };
    case (typename []): {
      _grp = _this select 0;
      if (typename _grp == typename objNull) then {_grp = group _grp};
      if (count _this > 1) then {_age     = _this select 1};
      if (count _this > 2) then {_samples = _this select 2};
    };
  };
  _ldr = leader _grp;
  _hst = _ldr getvariable "shk_intercept_positionhistory";
  
  _cnt = count _hst;
  if (_cnt > 0) then {
    _old = _age;
    if (_age < 1) then { _old = floor (_cnt * _age) }; // float used
    _old = (_cnt - _old);
    
    if (_old < 0) then {_old = 0};
    if (_old >= _cnt) then {_old = _cnt - 1};
    
    _prv = _hst select _old;
    _cur = getpos _ldr;
    _ave = _prv;
    
    if (_samples > 0) then {
      // more samples wanted than there are
      if (_samples > (_cnt - _old)) then {
        _samples = (_cnt - _old);
      };
      
      private ["_a","_b","_r","_s","_c","_x","_y"];
      _a = [];
      _b = [];
      
      // copy positions between info age point to the newest
      for "_i" from _old to (_cnt - 1) do {
        _a set [count _a,(_hst select _i)];
      };
      
      // randomly pick samples from the copied array and get average of them
      _x = 0;
      _y = 0;
      for "_i" from 1 to _samples do {
        _r = (floor random count _a);
        _s = _a select _r;
        _x = _x + (_s select 0);
        _y = _y + (_s select 1);
        _b set [count _b,_s];
        _a set [_r,"DELETE"];
        _a = _a - ["DELETE"];
      };
      _x = _x / _samples;
      _y = _y / _samples;
      _ave = [_x,_y];
    };
    
    _dir = (((_cur select 0) - (_ave select 0)) atan2 ((_cur select 1) - (_ave select 1)));
    if (_dir < 0) then {_dir = _dir + 360};
    _dir = round _dir;

    // -- debug -------------------------------------------------------------------
    /*
    private "_m";
    _m = createMarker [format["mAve%1%2%3",(floor(_ave select 0)),(floor(_ave select 1)),floor time],_ave];
    _m setMarkerShape "Icon";
    _m setMarkerType "Dot";
    _m setmarkerColor "ColorBlue";
    */
  };
  _dir
};

private ["_ldr","_old","_hst","_cnt","_cur"];
_ldr = leader _grp;
_ldr setvariable ["shk_intercept_positionhistory",[]];
_old = _ldr;

//_debugCounter = 0; //debug
while { ({alive _x} count units _grp) > 0 } do {
  if (!alive _ldr) then {[_ldr] join grpNull}; // because automatic death detection is slow
  _ldr = leader _grp;
  
  // see if leader changed, move array to new leader
  if (_old != _ldr) then {
    _hst = _old getvariable "shk_intercept_positionhistory";
    _old = _ldr;
  } else {
    _hst = _ldr getvariable "shk_intercept_positionhistory";
  };
  
  // add position
  _cnt = count _hst;
  _cur = getpos _ldr;
  _hst set [_cnt,[_cur select 0,_cur select 1]];
  
  // max size reached, remove first (oldest) position
  if (_cnt == _size) then {
    _hst set [0,"DELETE"];
    _hst = _hst - ["DELETE"];
  };
  
  _ldr setvariable ["shk_intercept_positionhistory",_hst];

  // -- debug -------------------------------------------------------------------
  /*
  private ["_d","_m"];
  if (_debugCounter % 10 == 0) then {
    if (_cnt > 0) then {
      _d = [_grp,5,3] call SHK_Intercept_getDir;
      _m = createMarker [format["mDir%1%2%3",(floor(_cur select 0)),(floor(_cur select 1)),floor time],_cur];
      _m setMarkerShape "Icon";
      _m setMarkerType "mil_arrow";
      _m setmarkerColor "ColorBlack";
      _m setmarkerdir _d;
      _m setmarkersize [0.7,0.7];
      _m setmarkertext str _d;
    };
  } else {
    _m = createMarker [format["mPos%1%2%3",(floor(_cur select 0)),(floor(_cur select 1)),floor time],_cur];
    _m setMarkerShape "Icon";
    _m setMarkerType "Dot";
    _m setmarkerColor "ColorRed";
  };
  _debugCounter = _debugCounter + 1;
  */
  sleep _time;
};