#include "functions.hpp"
(format ["starting %1", QUOTE(FUNC(initUnits))]) call FUNC(debugChat);

if (not isServer) exitWith {
  "you are not server" call FUNC(debugChat);
};

if (not TAGGED(enabled)) exitWith{
  "mod is not enabled" call FUNC(debugChat);
};

[] spawn {
  "server starting work..." call FUNC(debugChat);
  waitUntil { not (isNil QUOTE(TAGGED(factionStrs))) };
  "factionStrs is defined" call FUNC(debugChat);
  TAGGED(factions) = parseSimpleArray TAGGED(factionStrs);
  waitUntil {time > 0};

  (format ["%1 = %2", QUOTE(TAGGED(factions)), TAGGED(factions)]) call FUNC(debugChat);

  _units = allUnits select { (faction _x) in TAGGED(factions) };

  (format ["_units = %1", _units]) call FUNC(debugChat);

  {
    (format ["remoteExec %1 call %2", _x, QUOTE(FUNC(changeSpeakerGlobal))]) call FUNC(debugChat);
    [_x] call FUNC(changeSpeakerGlobal);
  } forEach _units;
};
