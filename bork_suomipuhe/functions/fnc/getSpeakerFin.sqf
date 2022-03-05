#include "functions.hpp"

/*
  if unit is female, use female01fin_fdf voice.

  default assumption is that unit has maleXYeng voice,
  like units of ffp_finland.

  there are 12 maleXYeng voices, but only 9 maleXYfin_fdf voices

  if cannot read integer in [1,9] from voice name, use random int.

  use largest integer read.
  parseNumber "" returns 0.
  parseNumber x returns 0 if x is not a number.
*/

params ["_unit"];

if (
  [_unit] call FUNC(isFemale)
) exitWith {
  "female01fin_fdf"
};

_voiceName = speaker _unit;
_split = _voiceName splitString "";

_largest = 0;
{
  _int = parseNumber _x;
  if (_int > _largest) then {
    _largest = _int;
  };
} forEach _split;

if (_largest == 0) then {
  _largest = [1,9] call BIS_fnc_randomInt;
};
_y = _largest;

/*
  fixme:
  in ffp_finland 
  voice 01 has triple probability and voice 02 has double probability.
*/
_newVoiceName = ["male", "0", _y, "FIN_FDF"] joinString "";
_newVoiceName;
