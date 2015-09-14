/****************************************************************
ARMA Mission Development Framework
ADF version: 1.41 / JULY 2015

Script: Civilian KIA Check
Author: Shuko (Adapted for A3 by Whiztler)
Script version: 1.3

Game type: N/A
File: ADF_civKiaCheck.sqf
****************************************************************
Instructions:

This script checks for the number of civilians being killed
by BlueFor. When a civilian is KIA, a warning message is displayed.
The location is marked on the map with a green mil-dot.
****************************************************************/

_ADF_civKia = 0;
if (isServer) then {
	ADF_fnc_civKia_EH = {
		private ["_ADF_side","_ADF_kiaPoss"];
		_ADF_kiaPos = getPos (_this select 0);
		_ADF_side = side (_this select 1);
		ADF_civKiller = _this select 1;
		if (rating ADF_civKiller < 0) then {ADF_civKiller addRating 9999; publicVariable "ADF_civKiller";}; 
		if (_ADF_side == ADF_playerSide) then {
			_ADF_civKia = _ADF_civKia + 1;
			publicVariable "_ADF_civKia"; publicVariable "ADF_civKiller";
			ADF_mCivKia = createMarker [format ["m__ADF_civKia_%1", _ADF_civKia], _ADF_kiaPos];
			ADF_mCivKia setMarkerShape "ICON"; ADF_mCivKia setMarkerType "mil_dot"; ADF_mCivKia setMarkerColor "ColorCIV"; ADF_mCivKia setMarkerText format ["%1",_ADF_civKia];
			publicVariable "ADF_mCivKia";			
		}
	};{
		if ((side _x == Civilian) && (_x isKindOf "Man")) then {
		  _x addEventhandler ["killed",ADF_fnc_civKia_EH];
		};
	} foreach allUnits;
} else {
	ADF_fnc_civKia_msg = {hintSilent parseText format ["
		<t color='#A1A4AD' align='left'>Brigade: a civilian has been killed in action by </t>
		<t color='#FFFFFF' align='left'>%1 </t>
		<t color='#A1A4AD' align='left'>(%2)</t><br/><br/>
		<t color='#A1A4AD' align='left'>The total civilian death toll is: </t>
		<t color='#FFFFFF' align='left' size='1.2'>%3 </t><br/><br/>
		<t color='#A1A4AD' align='left' size='1'>Civilians KIA are marked on the map with a </t>
		<t color='#AE1AB0' align='left' shadow='1.2'>purple dot</t>
		", name vehicle ADF_civKiller, ADF_civKiller, _ADF_civKia];
	};
  "_ADF_civKia" addPublicVariableEventHandler {call ADF_fnc_civKia_msg}; // JIP compatible EH
};