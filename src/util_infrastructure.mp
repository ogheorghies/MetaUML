% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _util_infrastructure_mp:
  expandafter endinput
fi;
_util_infrastructure_mp:=1;

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

vardef attributes(text objectName)=
  _n_ := str objectName
enddef;

vardef variables_ext text variables=
  save ret, firstVar;
  string ret;
  ret := "";

  numeric firstVar;
  firstVar := 1;

  forsuffixes v = variables:
    if firstVar = 0:
      ret := ret & ",";
    else:
      firstVar := 0;
    fi;

    ret := ret & " _n." & (str v);
  endfor;

  ret
enddef;

vardef var(text type) text variables =
  save _variables;
  string _variables;
  _variables := variables_ext variables;

  generic_declare(type) scantokens _variables;
enddef;


