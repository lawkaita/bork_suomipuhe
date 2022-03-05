#include "functions.hpp"
_this spawn {
  params ["_unit", "_speaker"];
  waitUntil {time > 0};
  _unit setSpeaker _speaker;
};
