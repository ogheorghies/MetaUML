% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_class_relations_mp: 
  expandafter endinput 
fi;
_metauml_class_relations_mp:=1;

defaultRelationHeadWidth  := 25;
defaultRelationHeadHeight := 10;

vardef AssociationInfo@# =
  LinkInfo@#;
  
  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = 0;
  @#heightB     = 0;
  @#drawMethodB = "drawNothing";
  
  @#drawMethod = "drawLine";
enddef;

vardef AssociationUniInfo@# =
  LinkInfo@#;
  
  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawArrow";
  
  @#drawMethod = "drawLine";
enddef;

vardef InheritanceInfo@# =
  LinkInfo@#;
  
  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawTriangle";
  
  @#drawMethod = "drawLine";
enddef;

vardef AggregationInfo@# =
  LinkInfo@#;
  
  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawDiamond";
  
  @#drawMethod = "drawLine";
enddef;

vardef AggregationUniInfo@# =
  LinkInfo@#;
  
  @#widthA      = defaultRelationHeadWidth;
  @#heightA     = defaultRelationHeadHeight;
  @#drawMethodA = "drawArrow";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawDiamond";
  
  @#drawMethod = "drawLine";
enddef;

vardef CompositionInfo@# =
  LinkInfo@#;
  
  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawDiamondBlack";
  
  @#drawMethod = "drawLine";
enddef;

vardef CompositionUniInfo@# =
  LinkInfo@#;
  
  @#widthA      = defaultRelationHeadWidth;
  @#heightA     = defaultRelationHeadHeight;
  @#drawMethodA = "drawArrow";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawDiamondBlack";
  
  @#drawMethod = "drawLine";
enddef;

vardef DashedLinkInfo@# =
  LinkInfo@#;
  
  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = 0;
  @#heightB     = 0;
  @#drawMethodB = "drawNothing";
  
  @#drawMethod = "drawLineDashed";
enddef;

vardef DependencyInfo@# =
  LinkInfo@#;
  
  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = defaultRelationHeadWidth;
  @#heightB     = defaultRelationHeadHeight;
  @#drawMethodB = "drawArrow";
   
  @#drawMethod = "drawLineDashed";
enddef;

vardef RealizationInfo@# =
 LinkInfo@#;

 @#widthA      = 0;
 @#heightA     = 0;
 @#drawMethodA = "drawNothing";

 @#widthB      = defaultRelationHeadWidth;
 @#heightB     = defaultRelationHeadHeight;
 @#drawMethodB = "drawTriangle";

 @#drawMethod = "drawLineDashed";
enddef;

AssociationInfo.association;
AssociationUniInfo.associationUni;
InheritanceInfo.inheritance;
AggregationInfo.aggregation;
AggregationUniInfo.aggregationUni;
CompositionInfo.composition;
CompositionUniInfo.compositionUni;
DashedLinkInfo.dashedLink;
DependencyInfo.dependency;
RealizationInfo.realization;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Deprecated, kept to support code using the older API.
% Using the generic formulation involving link, e.g.
% link(association)(A.n--B.s) is preferable.
% link and clink are defined in metauml_links
%
vardef drawRelation(text iLink)(expr myPath)=
  link(iLink)(myPath);
enddef;
