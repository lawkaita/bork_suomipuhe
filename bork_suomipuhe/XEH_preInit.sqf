#include "script_macros.hpp"

/*
https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#creating-a-setting

about CBA_fnc_addSetting from said url:

Parameters:
    _setting     - Unique setting name. Matches resulting variable name <STRING>
    _settingType - Type of setting. Can be "CHECKBOX", "EDITBOX", "LIST", "SLIDER" or "COLOR" <STRING>
    _title       - Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
    _category    - Category for the settings menu + optional sub-category <STRING, ARRAY>
    _valueInfo   - Extra properties of the setting depending of _settingType. See examples below <ANY>  // see [1]
    _isGlobal    - 1: all clients share the same setting, 2: setting can't be overwritten (optional, default: 0) <NUMBER>
    _script      - Script to execute when setting is changed. (optional) <CODE>
    _needRestart - Setting will be marked as needing mission restart after being changed. (optional, default false) <BOOL>

[1]: https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#setting-type-specific-arguments-_valueinfo
*/

[
    QUOTE(TAGGED(enabled)),
    "CHECKBOX",
    "Bork suomipuhe enabled",
    "Bork suomipuhe",
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QUOTE(TAGGED(debugMsgs)),
    "CHECKBOX",
    "Print debug messages on all clients",
    "Bork suomipuhe",
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QUOTE(TAGGED(factionStrs)),
    "EDITBOX",
    [
        "Which factions should speak finnish",
        'Syntax: ["foo", "bar", ...]'
    ],
    "Bork suomipuhe",
    str ([FACTION_FIN]),
    true,
    {},
    true
] call CBA_fnc_addSetting;

TAGGED(femaleFaces) = [];
