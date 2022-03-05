// include this in CfgFunctions 
class bork_suomipuhe 
{ 
  class fnc 
  { 
    class changeSpeakerFIN 
    { 
      file = "\bork_suomipuhe\functions\fnc\changeSpeakerFIN.sqf"; 
    }; 
    class changeSpeakerGlobal 
    { 
      file = "\bork_suomipuhe\functions\fnc\changeSpeakerGlobal.sqf"; 
    }; 
    class changeSpeakerLocal 
    { 
      file = "\bork_suomipuhe\functions\fnc\changeSpeakerLocal.sqf"; 
    }; 
    class debugChat 
    { 
      file = "\bork_suomipuhe\functions\fnc\debugChat.sqf"; 
    }; 
    class getSpeakerFin 
    { 
      file = "\bork_suomipuhe\functions\fnc\getSpeakerFin.sqf"; 
    }; 
    class initCurators 
    { 
      file = "\bork_suomipuhe\functions\fnc\initCurators.sqf"; 
    }; 
    class isFemale 
    { 
      file = "\bork_suomipuhe\functions\fnc\isFemale.sqf"; 
    }; 
  }; 
  class postinit 
  { 
    class addMEHs 
    { 
      file = "\bork_suomipuhe\functions\postinit\addMEHs.sqf"; 
      postInit = 1; 
    }; 
    class initCuratorsGlobal 
    { 
      file = "\bork_suomipuhe\functions\postinit\initCuratorsGlobal.sqf"; 
      postInit = 1; 
    }; 
    class initUnits 
    { 
      file = "\bork_suomipuhe\functions\postinit\initUnits.sqf"; 
      postInit = 1; 
    }; 
  }; 
}; 
