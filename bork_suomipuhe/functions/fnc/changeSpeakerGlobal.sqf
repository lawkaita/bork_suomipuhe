#include "functions.hpp"
params ["_unit"];
_speakerFin = [_unit] call FUNC(getSpeakerFin);
[_unit, _speakerFin] remoteExec [QUOTE(FUNC(changeSpeakerLocal)), 0, true];
