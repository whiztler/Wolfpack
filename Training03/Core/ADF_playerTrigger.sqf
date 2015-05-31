/****************************************************************
ARMA Mission Development Framework
ADF version: 1.38 / MAR 2015

Script: Specific Player Trigger
Author: Whiztler
Script version: 1.4

Game type: Coop
File: ADF_playerTrigger.sqf
****************************************************************
Instructions:

>>> CURRENTLY NOT WORKING WITH A3 1.06 <<<<

Creates a Trigger that can be called by Radio Charlie.

Add this to your init.sqf:
3 setRadioMsg "Radio Charlie (Gandalph only!)";

Create a Trigger with the following params:
Name: pTrigManual
Axis A: 0
Axis B: 0
Type: None
Activation: Radio Charlie
Set the Trigger as repeatedly.
Condition: this
On act.: null = execVM "Core\ADF_playerTrigger.sqf";

The script checks for a specific player name (in this case Gandalph).
Only that player can fire up the action. If another player tries
to activate radio Charlie than a warning hint will be presented.
The action can only be fired up once by the authorized player. Even
when the trigger is set to repeatedly. It hides the radio trigger
function after being used and deactivates the action.
****************************************************************/

#include "ADF_JIP.sqf"

authp = "Gandalph"; // If for another player, change "Gandalph" into the specific units name (e.g. "Fox-1 Fire Team Leader").
publicVariable authp; // 1.4

if (player == OPC_0_CMD) exitWith { // If for another player, change OPC_0_CMD into the specific units name (e.g. Fox_1_FTL).

	// Action/triggered code below.
	hintSilent parseText format ["The trigger was fired by %1", player];
	// End action/triggered code.
				
	3 setRadioMsg "NULL"; // Once fired up by authorized player, hide the radio trigger.
	pTrigManual setTriggerActivation ["NONE", "PRESENT", false]; // Deactivate the trigger
}; // close if player

if (local player) then {
	_trigp = (name vehicle player);
	hintSilent parseText format ["<t color='#e28080'>%1</t>, only %2 can use this radio function!", _trigp, authp]; // Warning hint
}; // close if local player 