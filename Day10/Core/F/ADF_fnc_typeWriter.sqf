/****************************************************************
ARMA Mission Development Framework
ADF version: 1.42 / SEPTEMBER 2015

Script: Typewrite effect for dynamic text
Author: BIS / Larrow. Adapted for ADF by Whiztler
Script version: 1.00

Game type: N/A
File: ADF_fnc_typeWriter.sqf
****************************************************************
INSTRUCTIONS:
load the function on mission start (e.g. in Scr\init.sqf):
call compile preprocessFileLineNumbers "Core\F\ADF_fnc_typeWriter.sqf";

Edit and copy the following in your init.sqf

[
	["19 MAY 2019","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
	["Your fantastic tagline here","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"],
	["Another tagline here","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]
] spawn ADF_fnc_typeWriter;

****************************************************************/


ADF_fnc_typeWriter = {
	// Init
	private["_blocks","_block","_blockCount","_blockNr","_blockArray","_blockText","_blockTextF","_blockTextF_","_blockFormat","_formats","_inputData","_processedTextF","_char","_cursorBlinks","_cursorInvis"];

	_blockCount = count _this;

	_invisCursor = "<t color ='#00000000' shadow = '0'>_</t>";
	_blocks = [];
	_formats = [];

	{
		_inputData	= _x;
		_block		= [_inputData, 0, "", [""]] call BIS_fnc_param;
		_format		= [_inputData, 1, "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>", [""]] call BIS_fnc_param;

        //convert strings into array of chars
		_blockArray = toArray _block;
		{_blockArray set [_forEachIndex, toString [_x]]} forEach _blockArray;

		_blocks  = _blocks + [_blockArray];
		_formats = _formats + [_format];
	} forEach _this;
 
	_processedTextF  = "";

	{
		_blockArray	= _x;
		_blockNr		= _forEachIndex;
		_blockFormat	= _formats select _blockNr;
		_blockText	= "";
		_blockTextF	= "";
		_blockTextF_	= "";

		{
			_char 		= _x;
			_blockText	= _blockText + _char;
			_blockTextF	= format[_blockFormat, _blockText + _invisCursor];
			_blockTextF_	= format[_blockFormat, _blockText + "_"];

			//print the output
			[(_processedTextF + _blockTextF_), 0, 0.5, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			playSound "click";
			sleep 0.08;
			[(_processedTextF + _blockTextF), 0, 0.5, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep 0.02;
		} forEach _blockArray;

		if (_blockNr + 1 < _blockCount) then {_cursorBlinks = 5;} else {_cursorBlinks = 15;};

		for "_i" from 1 to _cursorBlinks do {
			[_processedTextF + _blockTextF_, 0, 0.5, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep 0.08;
			[_processedTextF + _blockTextF, 0, 0.5, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
			sleep 0.02;
		};

		//store finished block
		_processedTextF= _processedTextF + _blockTextF;
	} forEach _blocks;

	//clean the screen
	["", 0, 0.15, 5, 0, 0, 90] spawn BIS_fnc_dynamicText;
};