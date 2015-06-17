% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_defaults_mp: 
  expandafter endinput 
fi;
_metauml_defaults_mp:=1;

% txbtt

if not known metauml_defaultFont:
    string metauml_defaultFont;
    metauml_defaultFont  := "ptmr8r";
fi;

if not known metauml_defaultFontOblique:
    string metauml_defaultFontOblique;
    metauml_defaultFontOblique  := "ptmro8r";
fi;

if not known metauml_defaultFontBold:
    string metauml_defaultFontBold;
    metauml_defaultFontBold  := "ptmb8r";
fi;

if not known metauml_defaultFontBoldOblique:
    string metauml_defaultFontBoldOblique;
    metauml_defaultFontBoldOblique  := "ptmbo8r";
fi;


