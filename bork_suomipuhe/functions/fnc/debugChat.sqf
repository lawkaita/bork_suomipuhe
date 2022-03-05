#include "functions.hpp"
_this spawn {
  if ( not(TAGGED(debugMsgs)) ) exitWith {};
  waitUntil {time > 0};

  _msg = format ["[debug] %1: %2", clientOwner, _this];
  _msg remoteExec ["systemchat", 0, true];
};
