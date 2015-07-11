% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_class_mp:
  expandafter endinput
fi;
_metauml_class_mp:=1;

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
inputonce util_log;

inputonce util_picture;
inputonce util_picture_stack;
inputonce util_shade;

string visibilityPublic, visibilityProtected, visibilityPrivate, visibilityPackage;
visibilityPublic:="+";
visibilityProtected:="#";
visibilityPrivate:="-";
visibilityPackage:="~";

vardef ClassInfo@#=
  attributes(@#);
  var(numeric) featureVisibilitySpacing, visibilityWidth, visibilityHeight;
  var(color)   foreColor, borderColor;
  var(string)  featureVisibilityMode;

  FontInfo.@#nameFont(metauml_defaultFont, defaultscale);

  FontInfo.@#attributeFont (metauml_defaultFont, defaultscale);
  FontInfo.@#methodFont    (metauml_defaultFont, defaultscale);
  FontInfo.@#stereotypeFont(metauml_defaultFont, .7);

  ShadeInfo.@#iShade;

  @#featureVisibilitySpacing := 2;
  @#featureVisibilityMode := "individual"; % "none", "grouped"
  @#visibilityWidth := 7;
  @#visibilityHeight := 6.75;

  @#foreColor := .9white;
  @#borderColor := black;

  PictureInfo.@#iName      (2, 2, 1, 3)(@#nameFont);

  PictureInfo.@#iStereotype(2, 2, 2, 2)(@#stereotypeFont);
  PictureInfo.@#iAttribute (2, 2, 1.25, 0)(@#attributeFont);
  PictureInfo.@#iMethod    (2, 2, 1.25, 0)(@#methodFont);

  PictureStackInfo.@#iStereotypeStack(2, 2, 1, 1)(5.5)(@#iStereotype);
  PictureStackInfo.@#iAttributeStack (2, 2, 2.5, 2)(10.5)(@#iAttribute);
  PictureStackInfo.@#iMethodStack    (2, 2, 2.5, 2)(10.5)(@#iMethod);
    
  @#iAttributeStack.iPict.bottom := 2;
  @#iMethodStack.iPict.bottom := 2;

  @#iName.ignoreNegativeBase := 1;
  @#iAttributeStack.iPict.ignoreNegativeBase := 1;
  @#iMethodStack.iPict.ignoreNegativeBase := 1;
  @#iStereotypeStack.iPict.ignoreNegativeBase := 1;
  
  PictureStackInfoCopy.@#iAttributeVisibilityStack (@#iAttributeStack);
  PictureStackInfoCopy.@#iMethodVisibilityStack (@#iMethodStack);
  
  @#iAttributeVisibilityStack.right := 0;
  @#iMethodVisibilityStack.right := 0;
enddef;

vardef ClassInfoCopy@#(text src)=
  log "ClassInfoCopy: Copying class";

  attributes(@#);
  var(numeric) featureVisibilitySpacing, visibilityWidth, visibilityHeight;
  var(color)   foreColor, borderColor;
  var(string)  featureVisibilityMode;

  FontInfoCopy.@#nameFont(src.nameFont);

  FontInfoCopy.@#attributeFont(src.attributeFont);
  FontInfoCopy.@#methodFont(src.methodFont);
  FontInfoCopy.@#stereotypeFont(src.stereotypeFont);

  ShadeInfoCopy.@#iShade(src.iShade);

  @#featureVisibilitySpacing := src.featureVisibilitySpacing;
  @#visibilityWidth := src.visibilityWidth;
  @#visibilityHeight := src.visibilityHeight;

  @#foreColor := src.foreColor;
  @#borderColor := src.borderColor;

  PictureInfoCopy.@#iName      (src.iName);

  PictureInfoCopy.@#iStereotype(src.iStereotype);
  PictureInfoCopy.@#iAttribute (src.iAttribute);
  PictureInfoCopy.@#iMethod    (src.iMethod);

  PictureStackInfoCopy.@#iStereotypeStack(src.iStereotypeStack);
  PictureStackInfoCopy.@#iAttributeStack (src.iAttributeStack);
  PictureStackInfoCopy.@#iMethodStack    (src.iMethodStack);
  PictureStackInfoCopy.@#iAttributeVisibilityStack (src.iAttributeVisibilityStack);
  PictureStackInfoCopy.@#iMethodVisibilityStack    (src.iMethodVisibilityStack);

  @#featureVisibilityMode := src.featureVisibilityMode;
enddef;

ClassInfo.iClass;

ClassInfoCopy.iClassNameOnly(iClass);
iClassNameOnly.iName.top    := 10;
iClassNameOnly.iName.bottom := 10;
iClassNameOnly.iAttributeStack.top := 0;
iClassNameOnly.iAttributeStack.bottom := 0;
iClassNameOnly.iMethodStack.top := 0;
iClassNameOnly.iMethodStack.bottom := 0;

ClassInfoCopy.iInterface(iClass);
iInterface.iAttributeStack.top := 0;
iInterface.iAttributeStack.bottom := 0;
iInterface.iName.iFont.name := metauml_defaultFontOblique;

ClassInfoCopy.iAbstractClass(iInterface);

%
% CLASS
%
vardef defClass@#(expr pname) =
  ObjectEquations(@#);
  @#className := "Class";

  string @#name;
  @#name = pname;

  numeric @#nStereotypes;
  string @#stereotypes[];

  string @#attributes[];
  string @#attributesVisibility[];

  string @#methods[];
  string @#methodsVisibility[];

  numeric @#nAttrs;
  numeric @#nMethods;

  @#nStereotypes := 0;
  @#nAttrs   := 0;
  @#nMethods := 0;
enddef;

vardef addAttribute@#(expr pcontent) =
  string visibility;
  visibility := substring(0,1) of pcontent;
  if (not (visibility = visibilityPublic))  and
     (not (visibility = visibilityPrivate)) and
     (not (visibility = visibilityProtected)) and
     (not (visibility = visibilityPackage)):

    @#.attributes[@#.nAttrs] := pcontent;
    @#.attributesVisibility[@#.nAttrs] := visibilityProtected;
  else:
    save from;
    from := 1;
    if (substring(1,2) of pcontent) = " ": from := 2; fi;

    @#.attributes[@#.nAttrs] := substring(from, infinity) of pcontent;
    @#.attributesVisibility[@#.nAttrs] := visibility;
  fi;

  @#.nAttrs := @#.nAttrs + 1;
enddef;

vardef addMethod@#(expr pcontent) =
  string visibility;
  visibility := substring(0,1) of pcontent;
  if (not (visibility = visibilityPublic))  and
     (not (visibility = visibilityPrivate)) and
     (not (visibility = visibilityProtected)) and
     (not (visibility = visibilityPackage)):

    @#.methods[@#.nMethods] := pcontent;
    @#.methodsVisibility[@#.nMethods] := visibilityProtected;
  else:
    save from;
    from := 1;
    if (substring(1,2) of pcontent) = " ": from := 2; fi;

    @#.methods[@#.nMethods] := substring(from, infinity) of pcontent;
    @#.methodsVisibility[@#.nMethods] := visibility;
  fi;

  @#.nMethods := @#.nMethods + 1;
enddef;

vardef classStereotype@#(expr pcontent) =
  @#stereotypes[@#nStereotypes] := pcontent;
  @#nStereotypes := @#nStereotypes + 1;
enddef;

vardef classStereotypes@#(text stereotypes)=
  for stereotype = stereotypes:
    classStereotype@#(stereotype);
  endfor;
enddef;

vardef EClass@#(text _info)(expr name)(text attributes)(text methods)=
  log "EClass begin: " & str @#;
  defClass@#(name);

  log "Copying class info";
  ClassInfoCopy.@#info(_info);

  for a=attributes:
    log "Adding attribute ", a;
    addAttribute@#(a);
  endfor;
  for m=methods:
    log "Adding method ", m;
    addMethod@#(m);
  endfor;
enddef;

vardef Class@#(expr name)(text attributes)(text methods)=
  EClass@#(iClass)(name)(attributes)(methods);
enddef;

vardef Interface@#(expr name)(text methods)=
  EClass@#(iInterface)(name)()(methods);
enddef;

vardef EInterface@#(text _info)(expr name)(text methods)=
  EClass@#(_info)(name)()(methods);
enddef;

vardef ClassName@#(expr name)=
  EClass@#(iClassNameOnly)(name)()();
enddef;

vardef EClassName@#(text _info)(expr name)=
  EClass@#(_info)(name)()();
enddef;

vardef AbstractClass@#(expr name)(text attributes)(text methods)=
  EClass@#(iAbstractClass)(name)(attributes)(methods);
enddef;

vardef EAbstractClass@#(text _info)(expr name)(text methods)=
  EClass@#(_info)(name)()(methods);
enddef;

vardef Class_border@#=
  objectBox(@#)
enddef;

vardef Class_layout@# =
  if @#laidout = 1:
    log "Class " & (str @#) & " has already been layed out";
  else:
    @#laidout := 1;
    log "Class layout: " & (str @#);

    EPictureStack.@#stereotypeStack(@#info.iStereotypeStack)
       (scantokens listArray(@#stereotypes)(@#nStereotypes))("vcenterbase");

    EPicture.@#namePict(@#info.iName)(@#name);
    
    layoutObjects(@#stereotypeStack, @#namePict);

    % Define attributes

    EPictureStack.@#attributeStack(@#info.iAttributeStack)
       (scantokens listArray(@#attributes)(@#nAttrs))("vleftbase");

    vardef joinCallbackAttributesVisibility@#=
        setObjectJoin(pb.bottom = @#.attributeStack.pict[index].bottom; pb.midx = pa.midx);
        setObjectJoinFirst(pa.bottom = @#.attributeStack.pict[index].bottom);
    enddef;

    EPictureStack.@#attributeVisibilityStack(@#info.iAttributeVisibilityStack)
       (scantokens listArray(@#attributesVisibility)(@#nAttrs))
       ("joinCallbackAttributesVisibility." & (str @#));

    % Define methods

    EPictureStack.@#methodStack(@#info.iMethodStack)
       (scantokens listArray(@#methods)(@#nMethods))("vleftbase");

    vardef joinCallbackMethodsVisibility@#=
        setObjectJoin(pb.bottom = @#.methodStack.pict[index].bottom; pb.midx = pa.midx);
        setObjectJoinFirst(pa.bottom = @#.methodStack.pict[index].bottom);
    enddef;

    EPictureStack.@#methodVisibilityStack(@#info.iMethodVisibilityStack)
       (scantokens listArray(@#methodsVisibility)(@#nMethods))
       ("joinCallbackMethodsVisibility." & (str @#));

    % Integrate components

    layoutObjects(@#attributeStack, @#methodStack);

    @#attributeStack.left = @#methodStack.left;
    @#methodStack.top = @#attributeStack.bottom;

    layoutObjects(@#attributeVisibilityStack, @#methodVisibilityStack);

    @#attributeVisibilityStack.midx = @#methodVisibilityStack.midx;

    if @#.nMethods = 0:
       @#methodVisibilityStack.top = @#methodStack.top;
    fi;
    if @#.nAttrs = 0:
       @#attributeVisibilityStack.top = @#attributeStack.top;
    fi;

    EGroup.@#visibilityStacks(iGroupNoMargins)(@#attributeVisibilityStack, @#methodVisibilityStack);
    
    EGroup.@#featureStacks(iGroupNoMargins)(@#attributeStack, @#methodStack);

    layoutObjects(@#visibilityStacks, @#featureStacks);

    @#visibilityStacks.right = @#featureStacks.left;

    EGroup.@#featureGroup(iGroupNoMargins)(@#visibilityStacks, @#featureStacks);

    topToBottom(0)(@#stereotypeStack, @#namePict, @#featureGroup);

    EGroup.@#all(iGroupNoMargins)(@#stereotypeStack, @#namePict, @#featureGroup);

    layoutObjects(@#all);

    @#.nw = @#all.nw;
    @#.se = @#all.se;

    log "Class layout for " & (str @#) & " done...";
  fi;
enddef;

vardef Class_paintSkin@# =
  log "Painting class skin...";
  nameAttributeY := @#attributeStack.top;
  attributeMethodY := @#methodStack.top;

  drawObjectShade(@#);

  fill Class_border.@# withcolor @#info.foreColor;
  draw Class_border.@# withcolor @#info.borderColor;

  draw (xpart @#nw, nameAttributeY)--(xpart @#se, nameAttributeY) withcolor @#info.borderColor;
  draw (xpart @#nw, attributeMethodY)--(xpart @#se, attributeMethodY) withcolor @#info.borderColor;
enddef;

vardef Class_draw@#=
  log "draw class begin...";
  Class_layout.@#;
  objectEnsurePositioning.@#;
  Class_paintSkin.@#;

  drawObjects(@#all);
enddef;

vardef Class_setDebugMode@#=
  @#.info.iName.boxed := 1;
  @#.info.iStereotypeStack.boxed := 1;
  @#.info.iStereotypeStack.iPict.boxed := 1;
  @#.info.iAttributeStack.boxed := 1;
  @#.info.iAttributeStack.iPict.boxed := 1;
  @#.info.iMethodStack.boxed := 1;
  @#.info.iMethodStack.iPict.boxed := 1;
  
  @#.info.iAttributeVisibilityStack.boxed := 1;
  @#.info.iAttributeVisibilityStack.iPict.boxed := 1;
  @#.info.iMethodVisibilityStack.boxed := 1;
  @#.info.iMethodVisibilityStack.iPict.boxed := 1;
enddef;
