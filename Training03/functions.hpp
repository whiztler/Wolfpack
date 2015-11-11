/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Config Functions
Author: Whiztler
Script version: 1.1

Game type: n/a
File: functions.hpp
****************************************************************
Functions registration goes in here.
****************************************************************/

class CfgFunctions {
	class TAWVD 	{
		tag = "TAWVD";
		class TAW_VD {
			file = "Core\TP\taw_vd";
			class onSliderChange {};
			class onTerrainChange {};
			class updateViewDistance {};
			class openTAWVD {};
			class trackViewDistance {};
			class tawvdInit {postInit = 1;};
		};
	};

	class F 	{ // F3 Framework (http://ferstaberinde.com/f3/en/)
		class fspectator {
			file = "Core\TP\spect";
			class CamInit{};
			class OnUnload{};
			class DrawTags{};
			class EventHandler{};
			class FreeCam{};
			class GetPlayers{};
			class ReloadModes{};
			class UpdateValues{};
			class HandleCamera{};
			class ToggleGUI{};
			class OnMapClick{};
			class DrawMarkers{};
			class ForceExit{};
			class HandleMenu{};
			class showMenu{};
		};
	};
};