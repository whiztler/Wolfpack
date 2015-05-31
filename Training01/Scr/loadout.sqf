#include "ADF_JIP.sqf"

If (IsDedicated) exitWith {};
if !(local player) exitWith {};

waitUntil {time > 1};
_ADF_unit = player;

if !(isNil "mdev") then {
	removeHeadgear mdev;
	mdev addVest "V_Rangemaster_belt";
	mdev addBackpack "B_BergenC_blu";
	mdev unassignItem "NVGoggles";
	mdev addWeapon "ItemGPS";
	mdev addWeapon "NVGoggles";
	mdev addWeapon "Laserdesignator";
	mdev addMagazine "Laserbatteries";
	mdev unassignItem "NVGoggles";
	if (ADF_mod_ACRE) then {mdev addWeapon "ACRE_PRC343"};
	if (ADF_mod_TFAR) then {mdev addWeapon "tf_anprc152"};	
	if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {mdev addWeapon "ItemRadio"};
	if (ADF_mod_CTAB) then {(vestContainer mdev) addItemCargoGlobal ["ItemcTab",1]};
	if (ADF_mod_ACE3) then {
		_ADF_unit addItemToUniform "ACE_fieldDressing";
		_ADF_unit addItemToUniform "ACE_fieldDressing";
		_ADF_unit addItemToUniform "ACE_morphine";
		_ADF_unit addItemToVest "ACE_EarPlugs";
		_ADF_unit addItemToVest "ace_mapTools";
		_ADF_unit addItemToVest "ACE_CableTie";
		_ADF_unit addItemToVest "ACE_IR_Strobe_Item";		
	} else {
		_ADF_unit addItemToUniform "FirstAidKit";
		_ADF_unit addItemToUniform "FirstAidKit";			
	};
	
};

if (isNil "mdev") then {missionNamespace setVariable ["mdev", objNull]};
if (isNil "RTL_1") then {missionNamespace setVariable ["RTL_1", objNull]};
if (isNil "RTL_2") then {missionNamespace setVariable ["RTL_2", objNull]};
if (!(isNil "mdev") && (player == mdev)) exitWith {};

// Strip
clearItemCargoGlobal (uniformContainer _ADF_unit); clearMagazineCargoGlobal (uniformContainer _ADF_unit); clearWeaponCargoGlobal (uniformContainer _ADF_unit);
clearItemCargoGlobal (vestContainer _ADF_unit); clearMagazineCargoGlobal (vestContainer _ADF_unit); clearWeaponCargoGlobal (vestContainer _ADF_unit);
clearItemCargoGlobal (backpackContainer _ADF_unit); clearMagazineCargoGlobal (backpackContainer _ADF_unit); clearWeaponCargoGlobal (backpackContainer _ADF_unit);
removeAllWeapons _ADF_unit; removeAllAssigneditems _ADF_unit; removeHeadgear _ADF_unit; removeVest _ADF_unit; removeBackpack _ADF_unit; removeUniform _ADF_unit;
_ADF_unit addWeapon "ItemGPS"; _ADF_unit addWeapon "ItemMap"; _ADF_unit addWeapon "ItemWatch"; _ADF_unit addWeapon "ItemCompass"; _ADF_unit addWeapon "NVGoggles";

_ADF_unit addUniform "U_I_G_Story_Protagonist_F";

_WPheadGear = ["H_Watchcap_camo","H_Watchcap_blk","H_Booniehat_mcamo","H_Cap_khaki_specops_UK","H_Bandanna_gry","H_Shemag_khk"] call BIS_fnc_selectRandom;
_ADF_unit addHeadgear _WPheadGear;
_ADF_unit addBackpack "B_AssaultPack_blk";
_ADF_unit addVest "V_TacVestIR_blk"; 

if (ADF_mod_ACE3) then {
	_ADF_unit addItemToUniform "ACE_fieldDressing";
	_ADF_unit addItemToUniform "ACE_fieldDressing";
	_ADF_unit addItemToUniform "ACE_morphine";
	_ADF_unit addItemToVest "ACE_EarPlugs";
	_ADF_unit addItemToVest "ace_mapTools";
	_ADF_unit addItemToVest "ACE_CableTie";
	_ADF_unit addItemToVest "ACE_IR_Strobe_Item";		
} else {
	_ADF_unit addItemToUniform "FirstAidKit";
	_ADF_unit addItemToUniform "FirstAidKit";			
};
if (ADF_mod_CTAB) then {(vestContainer _ADF_unit) additemcargoGlobal ["ItemcTabHCam",1]};

_ADF_unit addWeapon "G_Tactical_Black";

[_ADF_unit, "hgun_Pistol_heavy_01_snds_F", 3, "11Rnd_45ACP_Mag"] call BIS_fnc_addWeapon; _ADF_unit addHandgunItem "optic_MRD";
if (ADF_mod_ACE3) then {
	[_ADF_unit, "arifle_MX_Black_Hamr_pointer_F", 8, "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"] call BIS_fnc_addWeapon;
} else {
	[_ADF_unit, "arifle_MX_Black_Hamr_pointer_F", 8, "30Rnd_65x39_caseless_mag"] call BIS_fnc_addWeapon;
};

_ADF_unit addPrimaryWeaponItem "muzzle_snds_H";		

(vestContainer _ADF_unit) addmagazinecargoGlobal ["Chemlight_red",1];
(vestContainer _ADF_unit) addmagazinecargoGlobal ["Chemlight_green",1];
(backpackContainer _ADF_unit) addmagazinecargoGlobal ["MiniGrenade",2];
(backpackContainer _ADF_unit) addItemCargoGlobal ["acc_flashlight",1];
(backpackContainer _ADF_unit) addmagazinecargoGlobal ["SmokeShell",2];

if (ADF_mod_ACRE) then {_ADF_unit addWeapon "ACRE_PRC343"};
if (ADF_mod_TFAR) then {_ADF_unit addWeapon "tf_anprc152"};	
if (!ADF_mod_ACRE && !ADF_mod_TFAR) then {_ADF_unit addWeapon "ItemRadio"};

if (((_ADF_unit == RTL_1) || (_ADF_unit == RTL_2)) && ADF_mod_CTAB) then {
	(vestContainer _ADF_unit) addItemCargoGlobal ["ItemAndroid",1];
};

_ADF_unit addWeapon "Rangefinder";	
_ADF_unit unassignItem "NVGoggles";
_ADF_unit selectWeapon (primaryWeapon _ADF_unit);

if (ADF_mod_ACE3) then {[_ADF_unit, currentWeapon _ADF_unit, currentMuzzle _ADF_unit] call ACE_SafeMode_fnc_lockSafety;};
if (ADF_Clan_uniformInsignia) then {[_ADF_unit,"CLANPATCH"] call BIS_fnc_setUnitInsignia};