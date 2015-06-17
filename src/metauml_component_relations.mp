% Copyright 2006 2015 Radu-George Radulescu, Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_component_relations_mp:
  expandafter endinput
fi;
_metauml_component_relations_mp:=1;

defaultRelationHeadWidth  := 25;
defaultRelationHeadHeight := 10;
requiredInterfaceHeadWidth    := 5;
requiredInterfaceHeadHeight   := 15;

vardef requiredInterfaceInfo@# =
  LinkInfo@#;

  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = requiredInterfaceHeadWidth;
  @#heightB     = requiredInterfaceHeadHeight;
  @#drawMethodB = "drawSemiCircle";

  @#drawMethod = "drawLine";
enddef;

vardef providedInterfaceInfo@# =
  LinkInfo@#;

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawCircle";

  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#drawMethod = "drawLine";
enddef;

requiredInterfaceInfo.requiredInterface;
providedInterfaceInfo.providedInterface;

vardef drawRelation(text iLink)(expr myPath)=
  link(iLink)(myPath);
enddef;

vardef drawLine(expr my_path) =
  draw my_path;
enddef;

vardef drawNothing(text pA)(text pB)(text base) =
enddef;

