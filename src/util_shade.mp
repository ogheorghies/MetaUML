% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _util_shade_mp:
  expandafter endinput
fi;
_util_shade_mp:=1;

% Sadly, this copy of the macro is needed to prevent multiple file loads being shown by MetaPost.
% The guard values (such as _metauml_mp) do ensure that the file isn't loaded multiple times, 
% but this macro makes sure that MetaPost won't try to load the file and display a message for that.
def inputonce text libraryFile=
	if not known scantokens ("_" & str libraryFile & "_mp"):
		%includeonce% show "Loading " & str libraryFile;
		scantokens ("input " & str libraryFile);
	else:
		%includeonce% show str libraryFile & " already loaded.";
	fi;
enddef;

inputonce util_log;

vardef ShadeInfo@#=
  _n_ := str @#;
  generic_declare(numeric) _n.shift;
  generic_declare(color) _n.background;

  @#shift := 1;
  @#background := .7white;
enddef;

vardef ShadeInfoCopy@#(text src)=
  ShadeInfo.@#;
  ShadeInfo_copy@#(src);
enddef;

vardef ShadeInfo_copy@#(text src)=
  @#shift := src.shift;
  @#background := src.background;
enddef;

vardef ShadeInfo_toString@#=
  save @#ret;
  string @#ret;
  @#ret := "Shade (shift: " & (decimal @#shift) & " back: (" &
    (decimal redpart @#background) & ", " &
    (decimal greenpart @#background) & ", " &
    (decimal bluepart @#background) & ")";

  @#ret
enddef;


