% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_templates_mp:
  expandafter endinput
fi;
_metauml_templates_mp:=1;

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

vardef TemplateInfo@#=
  color @#background;
  color @#borderColor;
  numeric @#borderScale;

  @#background := .9white;
  @#borderColor := black;
  @#borderScale := 1;

  FontInfo.@#iFont(metauml_defaultFont, .9);
  PictureInfo.@#iPict(2, 2, 2, 2)(@#iFont);
  PictureStackInfo.@#iStack(2, 2, 1, 1)(7)(@#iPict);

  @#iStack.iPict.ignoreNegativeBase := 1;
enddef;

vardef TemplateInfoCopy@#(text src)=
  color @#background;
  color @#borderColor;
  numeric @#borderScale;

  @#background := src.background;
  @#borderColor := src.borderColor;
  @#borderScale := src.borderScale;

  FontInfoCopy.@#iFont(src.iFont);
  PictureInfoCopy.@#iPict(src.iPict);
  PictureStackInfoCopy.@#iStack(src.iStack);
enddef;

TemplateInfo.iTemplate;

%
% Template
%
vardef ETemplate@#(text _info)(text templates) =
  ObjectEquations(@#);
  @#className := "Template";

  TemplateInfoCopy.@#info(_info);

  EPictureStack.@#elementsStack(@#info.iStack)(templates)("vleftbase");

  @#nw = @#elementsStack.nw;
  @#se = @#elementsStack.se;
enddef;

vardef Template@#(text templates) =
  ETemplate@#(iTemplate)(templates);
enddef;

vardef EClassTemplate@#(text _info)(text templates)(text theClass)=
  ETemplate.@#(_info)(templates);
  Template_attachToClass.@#(theClass);
enddef;

vardef ClassTemplate@#(text templates)(text theClass)=
  EClassTemplate.@#(iTemplate)(templates)(theClass);
enddef;

vardef Template_layout@#=
  if @#laidout = 1:
    log "Template " & (str @#) & " has already been layed out";
  else:
    @#laidout := 1;
    log "Template layout: " & (str @#);
    PictureStack_layout.@#elementsStack;
  fi;
enddef;

vardef Template_paintSkin@# =
  log "Painting template skin...";

  fill objectBox(@#) withcolor @#info.background;

  draw objectBox(@#) dashed evenly scaled .8
       withpen pencircle scaled @#info.borderScale withcolor @#info.borderColor;
enddef;

vardef Template_draw@# =
  Template_layout.@#;

  Template_paintSkin.@#;
  drawObject(@#elementsStack);
enddef;

vardef Template_attachToClass@#(text theClass)=
  Template_layout.@#;
  Class_layout.theClass;

  log "--- Attaching template " & (str @#) & " to class " & (str theClass);

  save __nItems, __nameToRight;

  __nItems := @#elementsStack.nItems;
  __nameToRight := theClass.right - theClass.namePict.right;

  @#elementsStack.pict[__nItems-1].midy = theClass.top;

  if __nameToRight > @#width/2:
    @#midx = theClass.right;
    log "X";
  else:
    @#midx = theClass.right + (@#width/2 - __nameToRight) + 2;
    log "Y";
  fi;

  %@#elementsStack.pict[__nItems-1].info.boxed:=1;
enddef;
