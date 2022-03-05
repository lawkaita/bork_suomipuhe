#include "functions.hpp"
(format ["starting %1", QUOTE(FUNC(initCuratorsGlobal))]) call FUNC(debugChat);
if (not isServer) exitWith {
  "you are not server" call FUNC(debugChat);
};

if (not TAGGED(enabled)) exitWith{
  "mod is not enabled" call FUNC(debugChat);
};

(format ["remoteExec %1", QUOTE(FUNC(initCurators))]) call FUNC(debugChat);

remoteExec [QUOTE(FUNC(initCurators)), 0, true];
