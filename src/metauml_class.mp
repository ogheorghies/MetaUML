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

string metauml_private_abstractMarker, metauml_private_staticMarker;
metauml_private_abstractMarker := "@abstract";
metauml_private_staticMarker := "@static";

def abstract expr methodName= metauml_private_abstractMarker&methodName enddef;
def static expr featureName= metauml_private_staticMarker&featureName enddef;

def metauml_private_isAbstract(expr name) = (substring (0, 9) of name = metauml_private_abstractMarker) enddef;
def metauml_private_isStatic(expr name) = (substring (0, 7) of name = metauml_private_staticMarker) enddef;
def metauml_private_stripStatic(expr name) = substring (7,infinity) of name enddef;
def metauml_private_stripAbstract(expr name) = substring (9,infinity) of name enddef;

vardef ClassInfo@#=
  attributes(@#);
  var(color)   foreColor, borderColor;
  var(string)  featureVisibilityMode;

  FontInfo.@#nameFont(metauml_defaultFont, defaultscale);
  FontInfo.@#featureFont (metauml_defaultFont, defaultscale);
  FontInfo.@#stereotypeFont(metauml_defaultFont, .7);

  ShadeInfo.@#iShade;

  @#featureVisibilityMode := "individual"; % "none", "grouped"

  @#foreColor := .9white;
  @#borderColor := black;

  PictureInfo.@#iName      (2, 2, 1, 3)(@#nameFont);
  @#iName.ignoreNegativeBase := 1;

  PictureInfoCopy.@#iNameAbstract(@#iName);
  @#iNameAbstract.iFont.name := metauml_defaultFontOblique;

  PictureInfo.@#iStereotype(2, 2, 2, 2)(@#stereotypeFont);
  @#iStereotypeStack.iPict.ignoreNegativeBase := 1;

  PictureStackInfo.@#iStereotypeStack(2, 2, 1, 1)(5.5)(@#iStereotype);

  PictureInfo.@#iFeature         (2, 2, 1.25, 0)(@#featureFont);

  PictureInfoCopy.@#iFeatureAbstract (@#iFeature);
  @#iFeatureAbstract.iFont.name := metauml_defaultFontOblique;

  PictureInfoCopy.@#iFeatureStatic (@#iFeature);
  @#iFeatureStatic.textDecoration := "underline";

  PictureStackInfo.@#iFeatureStack   (2, 2, 2.5, 2)(10.5)(@#iFeature);
  PictureStackInfoCopy.@#iAttributeStack(@#iFeatureStack);
  PictureStackInfoCopy.@#iMethodStack(@#iFeatureStack);

  @#iFeatureStack.iPict.bottom := 2;
  @#iFeatureStack.iPict.ignoreNegativeBase := 1;

  PictureStackInfoCopy.@#iAttributeVisibilityStack (@#iFeatureStack);
  PictureStackInfoCopy.@#iMethodVisibilityStack (@#iFeatureStack);

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
  FontInfoCopy.@#featureFont(src.featureFont);
  FontInfoCopy.@#stereotypeFont(src.stereotypeFont);

  ShadeInfoCopy.@#iShade(src.iShade);

  @#foreColor := src.foreColor;
  @#borderColor := src.borderColor;

  PictureInfoCopy.@#iName         (src.iName);
  PictureInfoCopy.@#iNameAbstract (src.iNameAbstract);

  PictureInfoCopy.@#iStereotype(src.iStereotype);
  PictureInfoCopy.@#iFeature (src.iFeature);
  PictureInfoCopy.@#iFeatureAbstract (src.iFeatureAbstract);
  PictureInfoCopy.@#iFeatureStatic   (src.iFeatureStatic);

  PictureStackInfoCopy.@#iStereotypeStack(src.iStereotypeStack);
  PictureStackInfoCopy.@#iFeatureStack   (src.iFeatureStack);
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

ClassInfoCopy.iAbstractClass(iClass);
iAbstractClass.iName.iFont.name := metauml_defaultFontOblique;

%
% CLASS
%
vardef defClass@#(expr pname) =
  ObjectEquations(@#);
  @#className := "Class";

  string @#name;
  boolean @#isAbstract;

  @#isAbstract := metauml_private_isAbstract(pname);
  if @#isAbstract:
    @#name = metauml_private_stripAbstract(pname);
  else:
    @#name = pname;
  fi

  numeric @#nStereotypes;
  string @#stereotypes[];

  string @#attributes[];
  string @#attributesVisibility[];
  boolean @#attributesIsStatic[];

  string @#methods[];
  string @#methodsVisibility[];
  boolean @#methodsIsStatic[];
  boolean @#methodsIsAbstract[];

  numeric @#nAttrs;
  numeric @#nMethods;
  numeric @#nStereotypes;

  @#nStereotypes := 0;
  @#nAttrs   := 0;
  @#nMethods := 0;
enddef;

vardef addAttribute@#(expr pcontent) =
  string visibility;
  string attribute;

  attribute := pcontent;

  @#attributesIsStatic[@#nAttrs] := metauml_private_isStatic(attribute);
  if @#attributesIsStatic[@#nAttrs]:
    attribute := metauml_private_stripStatic(attribute);
  fi

  visibility := substring(0,1) of attribute;
  if (not (visibility = visibilityPublic))  and
     (not (visibility = visibilityPrivate)) and
     (not (visibility = visibilityProtected)) and
     (not (visibility = visibilityPackage)):

    @#.attributes[@#.nAttrs] := attribute;
    @#.attributesVisibility[@#.nAttrs] := visibilityPackage;
  else:
    save from;
    from := 1;
    if (substring(1,2) of attribute) = " ": from := 2; fi;

    @#.attributes[@#.nAttrs] := substring(from, infinity) of attribute;
    @#.attributesVisibility[@#.nAttrs] := visibility;
  fi;

  @#.nAttrs := @#.nAttrs + 1;
enddef;

vardef addMethod@#(expr pcontent) =
  string visibility;
  string method;

  method := pcontent;

  @#methodsIsStatic[@#nMethods] := metauml_private_isStatic(method);
  if @#methodsIsStatic[@#nMethods]:
    method := metauml_private_stripStatic(method);
  fi

  @#methodsIsAbstract[@#nMethods] := metauml_private_isAbstract(method);
  if @#methodsIsAbstract[@#nMethods]:
    method := metauml_private_stripAbstract(method);
    @#isAbstract := true;
  fi

  visibility := substring(0,1) of method;
  if (not (visibility = visibilityPublic))  and
     (not (visibility = visibilityPrivate)) and
     (not (visibility = visibilityProtected)) and
     (not (visibility = visibilityPackage)):

    @#.methods[@#.nMethods] := method;
    @#.methodsVisibility[@#.nMethods] := visibilityPackage;
  else:
    save from;
    from := 1;
    if (substring(1,2) of method) = " ": from := 2; fi;

    @#.methods[@#.nMethods] := substring(from, infinity) of method;
    @#.methodsVisibility[@#.nMethods] := visibility;
  fi;

  @#.nMethods := @#.nMethods + 1;
enddef;

vardef classStereotype@#(expr pcontent) =
    show "Macro classStereotype is deprecated, use Class_stereotypes instead.";
    Class_stereotypes.@#(pcontent);
enddef;

vardef classStereotypes@#(text stereotypes)=
  show "Macro classStereotypes is deprecated, use Class_stereotypes instead.";
  Class_stereotypes.@#(stereotypes);
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

vardef Class_noVisibilityMarkers@#=
  @#info.featureVisibilityMode := "none";
enddef;

vardef Class_layout@# =
  if @#laidout = 1:
    log "Class " & (str @#) & " has already been layed out";
  else:
    @#laidout := 1;
    log "Class layout: " & (str @#);

    EPictureStack.@#stereotypeStack(@#info.iStereotypeStack)
       (scantokens listArray(@#stereotypes)(@#nStereotypes))("vcenterbase");

    if (@#isAbstract):
        EPicture.@#namePict(@#info.iNameAbstract)(@#name);
    else:
        EPicture.@#namePict(@#info.iName)(@#name);
    fi;

    layoutObjects(@#stereotypeStack, @#namePict);

    % Define attributes

    def metauml_private_attributeStyleSupplier(expr i)= 
        if @#attributesIsStatic[i]: @#info.iFeatureStatic
        else: @#info.iFeature
        fi
    enddef;

    @#info.iAttributeStack.childStyleSupplier := "metauml_private_attributeStyleSupplier";

    EPictureStack.@#attributeStack(@#info.iAttributeStack)
       (scantokens listArray(@#attributes)(@#nAttrs))("vleftbase");

    if @#info.featureVisibilityMode = "individual":
        vardef joinCallbackAttributesVisibility@#=
            setObjectJoin(pb.bottom = @#.attributeStack.pict[index].bottom; pb.midx = pa.midx);
            setObjectJoinFirst(pa.bottom = @#.attributeStack.pict[index].bottom);
        enddef;
    
        EPictureStack.@#attributeVisibilityStack(@#info.iAttributeVisibilityStack)
           (scantokens listArray(@#attributesVisibility)(@#nAttrs))
           ("joinCallbackAttributesVisibility." & (str @#));
    elseif @#info.featureVisibilityMode = "none":
        EPicture.@#attributeVisibilityStack(iPictNoMargins)("");
    else:
        show "Unknown feature visibility mode", @#featureVisibilityMode;
        1=2;
    fi;

    % Define methods

    def metauml_private_methodStyleSupplier(expr i)= 
        if @#methodsIsStatic[i]: @#info.iFeatureStatic
        elseif @#methodsIsAbstract[i]: @#info.iFeatureAbstract
        else: @#info.iFeature
        fi 
    enddef;

    @#info.iMethodStack.childStyleSupplier := "metauml_private_methodStyleSupplier";

    EPictureStack.@#methodStack(@#info.iMethodStack)
       (scantokens listArray(@#methods)(@#nMethods))("vleftbase");

    if @#info.featureVisibilityMode = "individual":
      vardef joinCallbackMethodsVisibility@#=
          setObjectJoin(pb.bottom = @#.methodStack.pict[index].bottom; pb.midx = pa.midx);
          setObjectJoinFirst(pa.bottom = @#.methodStack.pict[index].bottom);
      enddef;

      EPictureStack.@#methodVisibilityStack(@#info.iMethodVisibilityStack)
         (scantokens listArray(@#methodsVisibility)(@#nMethods))
         ("joinCallbackMethodsVisibility." & (str @#));
    elseif @#info.featureVisibilityMode = "none":
        EPicture.@#methodVisibilityStack(iPictNoMargins)("");
    else:
        show "Unknown feature visibility mode", @#featureVisibilityMode;
        1=2;
    fi;

    % Integrate components
    show layoutObjects(@#attributeStack, @#methodStack);
    layoutObjects(@#attributeStack, @#methodStack);

    @#attributeStack.left = @#methodStack.left;
    @#methodStack.top = @#attributeStack.bottom;

    layoutObjects(@#attributeVisibilityStack, @#methodVisibilityStack);

    @#attributeVisibilityStack.midx = @#methodVisibilityStack.midx;

    if (@#.nMethods = 0) or (@#info.featureVisibilityMode="none"):
       @#methodVisibilityStack.top = @#methodStack.top;
    fi;
    if (@#.nAttrs = 0) or (@#info.featureVisibilityMode="none"):
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
  log "Class_draw begin " & @#;
  Class_layout.@#;
  objectEnsurePositioning.@#;
  Class_paintSkin.@#;

  drawObjects(@#all);
  log "Class_draw end " & @#;
enddef;

vardef Class_setDebugMode@#=
  @#.info.iName.boxed := 1;
  
  @#.info.iFeature.boxed := 1;
  @#.info.iFeatureStatic.boxed := 1;
  @#.info.iFeatureAbstract.boxed := 1;
  
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

vardef Class_stereotypes@#(text _stereotypes)=
  for stereotype = _stereotypes:
      @#stereotypes[@#nStereotypes] := stereotype;
      @#nStereotypes := @#nStereotypes + 1;
  endfor;
enddef;
