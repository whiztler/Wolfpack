/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR  2015

Script: Crate Cargo Script (BLUEFOR) - Supply Drop Module crate
Author: Whiztler
Script version: 1.4

Game type: n/a
File: ADF_cCargo_SupplyDropModule.sqf
****************************************************************
Instructions:

Copy and paste below lines into the 'Support_Provider_VirtualDrop'
Crate Init field.

The crate contents are similar to that of the IFT crate
****************************************************************/

// Paste everything from here on end
clearWeaponCargoGlobal _this;
clearMagazineCargoGlobal _this;
clearItemCargoGlobal _this;
_this addWeaponCargoGlobal ["arifle_MX_F", 2];
_this addWeaponCargoGlobal ["arifle_MX_GL_F", 1];
_this addWeaponCargoGlobal ["arifle_MX_SW_F", 1];
_this addWeaponCargoGlobal ["hgun_P07_F", 1];
_this addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", 70];
_this addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", 70];
_this addMagazineCargoGlobal ["16Rnd_9x21_Mag", 70];
_this addweaponCargoGlobal ["launch_NLAW_F", 5];
_this addMagazineCargoGlobal ["NLAW_F", 10];
_this addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
_this addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 1];
_this addMagazineCargoGlobal ["ATMine_Range_Mag", 1];
_this addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 1];
_this addItemCargoGlobal ["MineDetector", 1];
_this addItemCargoGlobal ["acc_pointer_IR", 1];
_this addItemCargoGlobal ["optic_ACO", 1];
_this addItemCargoGlobal ["optic_Holosight", 1];
_this addItemCargoGlobal ["acc_flashlight", 1];
_this addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 70];
_this addMagazineCargoGlobal ["3Rnd_HE_Grenade_shell", 70];
_this addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 70];
_this addMagazineCargoGlobal ["3Rnd_Smoke_Grenade_shell", 70];
_this addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 70];
_this addMagazineCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", 70];
_this addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 70];
_this addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", 70];
_this addMagazineCargoGlobal ["1Rnd_SmokePurple_Grenade_shell", 70];
_this addMagazineCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", 70];
_this addMagazineCargoGlobal ["UGL_FlareCIR_F", 70];
_this addMagazineCargoGlobal ["UGL_FlareWhite_F", 70];
_this addMagazineCargoGlobal ["UGL_FlareGreen_F", 70];
_this addMagazineCargoGlobal ["UGL_FlareRed_F", 70];
_this addMagazineCargoGlobal ["HandGrenade", 70];
_this addMagazineCargoGlobal ["SmokeShell", 70];
_this addMagazineCargoGlobal ["SmokeShellGreen", 70];
_this addMagazineCargoGlobal ["SmokeShellRed", 70]; 
_this addMagazineCargoGlobal ["SmokeShellPurple", 70]; 
_this addMagazineCargoGlobal ["Chemlight_green", 70]; 
_this addMagazineCargoGlobal ["Chemlight_red", 70]; 
_this addMagazineCargoGlobal ["B_IR_Grenade", 70]; 
_this addItemCargoGlobal ["FirstAidKit", 10];
_this addItemCargoGlobal ["Medikit", 1];
_this addWeaponCargoGlobal ["Binocular", 6];
_this addItemCargoGlobal ["G_Tatical_Clear", 6];
_this addItemCargoGlobal ["NVGoggles", 6];
_this addItemCargoGlobal ["ItemRadio", 6];
_this addItemCargoGlobal ["ACRE_PRC148", 1];
_this addItemCargoGlobal ["ItemAndroid", 1];
_this addBackpackCargoGlobal ["B_Carryall_Base", 4];
_this addBackpackCargoGlobal ["B_AssaultPack_blk", 4];
_this addBackpackCargoGlobal ["B_Kitbag_mcamo", 4];
_this addItemCargoGlobal ["ItemMap", 1];
_this addItemCargoGlobal ["ItemWatch", 1];
_this addItemCargoGlobal ["ItemCompass", 1];