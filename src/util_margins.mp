% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _util_margins_mp:
   expandafter endinput
fi;
_util_margins_mp:=1;

vardef Margins@#(expr pleft, pright, ptop, pbottom)=
  attributes(@#);
  var(numeric) left, right, top, bottom;

  @#left := pleft;
  @#right := pright;
  @#top := ptop;
  @#bottom := pbottom;
enddef;

vardef MarginsCopy@#(text src)=
  Margins@#(src.left, src.right, src.top, src.bottom);
enddef;
