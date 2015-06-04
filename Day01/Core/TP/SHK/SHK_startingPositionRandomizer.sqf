/*
  SHK_startingPositionRandomizer - Starting position randomizer with object mover
  Author: Shuko (IRC: shuko@quakenet, email: miika@miikajarvinen.fi)
  Contributors: Raws
  Version: 0.5
  http://forums.bistudio.com/showthread.php?162423-SHK_startingPositionRandomizer

  Randomly selects a location for each side from predefined, editor placed, markers.
  
  IMPORTANT!
    The positions of all units and objects to be moved are based on their relative position to the
    first marker (for example startpos_east). What this means is that you should place your
    objects around/on top of the first marker.
    
    For example, if the randomizer decides that the starting position is startpos_east_2 instead of
    startpos_east. All the objects will be moved and placed to same direction and distance from
    the position 2 marker that they were from position marker startpos_east.
  
  Marker naming:
    All markers need to start with "startpos", following an underscore and side. Then an underscore
    and an incremental integer. Only exception is the first marker, it has no number.
    
    Examples:
      startpos_east
      startpos_east_1
      
      startpos_west
      startpos_west_1
      startpos_west_2
  
    Tip: if you first create the marker without number, you can copy & paste that and rest of the
    markers will be named correctly.
  
  Supported sides:
    "east", "west", "guer", "civ"

  Syntax:
    [["side",number,<objectrange>,[]],["side",number,[object1,object2],["color","type","text"]],...] call compile preprocessfile "SHK_startingPositionRandomizer.sqf"
  
  Parameters:
    0   String    One of the four sides.
    1   Integer   How many possible positions (markers) there is for this side.
  
  Optional parameters:
    2   Number    Range in meters from the first marker to move all vehicles etc objects.
        Array     List of objects to move besides playableunits.
    3   Array     If given an empty array ([]) a green "Start" type marker will be shown at the selected starting position.
                  Settings to define the appearance of the start marker.
                  0  Color  Valid colors: black, blue, green, orange, red, white, yellow
                  1  Type   Marker types: http://community.bistudio.com/wiki/cfgMarkers
                  2  Text   Optional. Text to display next to the marker.
  
  Examples:
    [["west",3]] call compile preprocessfile "SHK_startingPositionRandomizer.sqf"
    [["west",3],["east",2]] call compile preprocessfile "SHK_startingPositionRandomizer.sqf"
    [["west",2,20],["east",5,[car1,truck4]]] call compile preprocessfile "SHK_startingPositionRandomizer.sqf"
    [["west",3,0,[]]] call compile preprocessfile "SHK_startingPositionRandomizer.sqf"
    [["west",3,50,["blue","b_inf","Infantry"]]] call compile preprocessfile "SHK_startingPositionRandomizer.sqf"
  
  Briefing:
    If marker parameter(s) is defined for a side, a marker with name "startpos" is created at the starting location.
    This marker will be different for each side, but has same name on each client, which means you can link to this marker
    in briefing and/or notes and it will point to a location of the player's starting position.

  Version history:
    0.5  Changed: Another rewrite to get rid of BIS_fnc_MP and use much simpler publicvariable solution instead.
                  Amount of data send is decreased. Now the server randomized positions are accessible via global variable on clients.
    0.4  Changed: Rewritten to use BIS_fnc_MP function.
    0.3  Changed: Now client moves the player unit instead of server.
    0.2  Switch to Arma 3, changed start marker to A3 equivalent. Now object height is also taken into account.
*/

// Move an object to a new position while retaining direction and distance to a certain position
// [Object, Position of old point of reference, Position of new point of reference]
SHK_RandStaPos_fnc_move = {
	private ["_dir","_dst","_obj","_new","_old","_pos"];
	_obj = _this select 0;
	_old = _this select 1;
	_new = _this select 2;
	_pos = getpos _obj;
	_dir = ((_pos select 0) - (_old select 0)) atan2 ((_pos select 1) - (_old select 1));
	_dst = _old distance _obj;
	_obj setpos [((_new select 0) + (_dst * sin _dir)),((_new select 1) + (_dst * cos _dir)),(_pos select 2)];
};

// Take in an array of numbers, which mean a certain marker for each side
SHK_RandStaPos_fnc_moveObjects = {
  private ["_side","_oldPos","_newPos","_rand"];
  {
    _side = tolower(_x select 0);
    _rand = _this select _forEachIndex;
    
    _oldPos = getmarkerpos format ["startpos_%1",_side];
    _newPos = [];
    
    // Only move if randomly selected position is other than the current/original position
    if (_rand > 0) then {
      _newPos = getmarkerpos format ["startpos_%1_%2",_side,_rand];
      
      // Move objects, AIs and playable (non-human) units on the server
      if isServer then {
        // Move playable units (AIs not picked by a human player)
        {
          if (_side == tolower(format ["%1",side _x])) then {
            [_x,_oldPos,_newPos] call SHK_RandStaPos_fnc_move;
          };
        } foreach (if ismultiplayer then {playableunits} else {switchableunits});

        // Move non-playable objects
        if (count _x > 2) then {
          private ["_range"];
          _range = _x select 2;
          
          // List of objects
          if (typename _range  == (typename [])) then {
            if (count _range > 0) then {
              {
                [_x,_oldPos,_newPos] call SHK_RandStaPos_fnc_move;
              } foreach _range;
            };

          // Only range given
          } else {
            if (_range > 0) then {
              private ["_objects","_xPos","_dir","_dst"];
              _objects = nearestobjects [_oldPos,[],_range];

              {
                _xPos = getpos _x;
                _dir = ((_xPos select 0) - (_oldPos select 0)) atan2 ((_xPos select 1) - (_oldPos select 1));
                _dst = _oldPos distance _xPos;
                _x setpos [((_newPos select 0) + (_dst * sin _dir)),
                          ((_newPos select 1) + (_dst * cos _dir)),
                          0];
              } foreach _objects;
            };
          };
        }; // objects
      }; //isServer
    }; // rand > 0
  } foreach SHK_RandStaPos_Parameters;
  
  // Clients
  if !isDedicated then {
    // Move the player unit on the client side
    _this spawn {
      private ["_sidePlayer","_side","_oldPos","_newPos","_mrkPos"];
      
      waituntil {!isnull player};
      
      _sidePlayer = tolower(str (side player));
      {
        _side = tolower(_x select 0);
        _rand = _this select _forEachIndex;
        
        _oldPos = getmarkerpos format ["startpos_%1",_side];
        _mrkPos = _oldPos;
        
        // Only move if randomly selected position is other than the current/original position
        if (_rand > 0) then {
          _newPos = getmarkerpos format ["startpos_%1_%2",_side,_rand];
          _mrkPos = _newPos;
          
          if (_sidePlayer == _side) then {
            if !isServer then {
              [player,_oldPos,_newPos] call SHK_RandStaPos_fnc_move;
            };
          };
        };
      
        // Marker data
        if (count _x > 3) then {
          private ["_p","_color","_type","_text"];
          _p = _x select 3;
          _text = "";
          if (count _p == 0) then {
            _type = "mil_start";
            _color = "ColorGreen";
          } else {
            _color =  format ["Color%1", (_p select 0)];
            _type = (_p select 1);
            if (count _p > 2) then {
              _text = (_p select 2);
            };
          };
          
          // Create local marker
          if (_sidePlayer == _side) then {
            _marker = createMarkerLocal ["startpos",_mrkPos];
            _marker setMarkerShapeLocal "ICON";
            _marker setMarkerTypeLocal _type;
            _marker setMarkerColorLocal _color;
            _marker setMarkerTextLocal _text;
          };
        };
      } foreach SHK_RandStaPos_Parameters;
    };
  };
};


// Save input parameters, they are needed inside the moveObject functions but are not passed as parameter,
// because it would cause unneeded network traffic
SHK_RandStaPos_Parameters = _this;

if isServer then {
  // Pick random location for each side. Random number is chosen between 0 and parameter given maximum.
  // This number is used in the marker names for the wanted locations.
  private ["_randomizerResults","_random"];
  _randomizerResults = [];
  {
    _random = floor(random (_x select 1));
    _randomizerResults set [count _randomizerResults,_random];
  } foreach _this;
  
  // Send the results to clients
  SHK_RandStaPos_RandomResults = _randomizerResults;
  publicvariable "SHK_RandStaPos_RandomResults";
};

waituntil {!isnil "SHK_RandStaPos_RandomResults"};
SHK_RandStaPos_RandomResults call SHK_RandStaPos_fnc_moveObjects;