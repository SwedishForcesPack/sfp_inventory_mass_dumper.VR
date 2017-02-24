#include "debug_console.hpp"

conClose();

_magazines = "getText (_x >> 'dlc') == 'sfp' && getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgMagazines");

{
  _name = configName _x;
  _value = (configFile >> "CfgMagazines" >> _name >> "mass") call BIS_fnc_GetCfgData;

  if (!isNil "_value") then {
    _row = format ["%1,%2", _name, _value];
    conFile(_row);
  };
} forEach _magazines;

_weapons = "getText (_x >> 'dlc') == 'sfp' && getNumber (_x >> 'scope') == 2" configClasses (configFile >> "CfgWeapons");

{
  _name = configName _x;

  {
    _value = (configFile >> "CfgWeapons" >> _name >> _x >> "mass") call BIS_fnc_GetCfgData;

    if (!isNil "_value") then {
      _row = format ["%1,%2", _name, _value];
      conFile(_row);
    };
  } forEach ["ItemInfo", "WeaponSlotsInfo"];
} forEach _weapons;

conClose();
