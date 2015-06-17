% Copyright 2006 2015 Radu-George Radulescu
% Licensed under the Apache License, Version 2.0.

if known _metauml_package_relations_mp:
  expandafter endinput
fi;
_metauml_package_relations_mp:=1;

defaultRelationHeadWidth  := 25;
defaultRelationHeadHeight := 10;

vardef NestInfo@# =
  LinkInfo@#;

  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawCrossedCircle";

  @#drawMethod = "drawLine";
enddef;

NestInfo.nest;

vardef drawRelation(text iLink)(expr myPath)=
  link(iLink)(myPath);
enddef;

vardef drawLine(expr my_path) =
  draw my_path;
enddef;

vardef drawNothing(text pA)(text pB)(text base) =
enddef;
