#include "functions.hpp"
(format ["starting %1", QUOTE(FUNC(initCuratorsGlobal))]) call FUNC(debugChat);
if (not TAGGED(enabled)) exitWith{
  "mod is not enabled" call FUNC(debugChat);
};
// arma will look at user profile and set the new unit voice according to that profile
addMissionEventHandler ["TeamSwitch", {
  params ["_previousUnit", "_newUnit"];

  if (
    (_newUnit isKindOf "MAN") and
    {faction _newUnit in TAGGED(factions)}
  ) then {
    // the speaker seems to be correct when querying with speaker-command
    // yet the speaker will actually sound wrong
    // this seems to fix it.
    [_newUnit, speaker _newUnit] remoteExec [QUOTE(setSpeaker), 0, true];
  };
}];

// free to assume that respawning will mess something up also
addMissionEventHandler ["EntityRespawned", {
  params ["_newEntity", "_oldEntity"];
  if (
    (_newEntity isKindOf "MAN") and
    {faction _newEntity in TAGGED(factions)}
  ) then {
    [_newEntity, speaker _newEntity] remoteExec [QUOTE(setSpeaker), 0, true];
  };
}];
