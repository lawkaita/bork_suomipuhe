#include "functions.hpp"
if (not hasInterface) exitWith {};
_OnCuratorObjectPlaced = {
  params ["_curator", "_entity"];
  (format ["_curator = %1, _entity = %2", _curator, _entity]) call FUNC(debugChat);

  if (not (faction _entity in TAGGED(factions))) exitWith {};
  
  if (_entity isKindOf "MAN") then {
    [_entity] call FUNC(changeSpeakerGlobal);
  } else {
    _men = (fullCrew [_entity, "", false]) apply {_x#0 };

    (format ["_men = %1", _men]) call FUNC(debugChat);
    {
      [_x] call FUNC(changeSpeakerGlobal);
    } forEach _men;
  };
};

{
  _x addEventHandler ["CuratorObjectPlaced", _OnCuratorObjectPlaced];
} forEach allCurators;
