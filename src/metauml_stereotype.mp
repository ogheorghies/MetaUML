% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_stereotype_mp:
  expandafter endinput
fi;
_metauml_stereotype_mp:=1;

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

inputonce metauml_defaults;

FontInfo.assocFont(metauml_defaultFont, .7);
PictureInfo.iStereo(2, 2, 2, 2)(assocFont);
iStereo.ignoreNegativeBase := 1;
