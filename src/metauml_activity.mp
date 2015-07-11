% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_activity_mp:
  expandafter endinput
fi;
_metauml_activity_mp:=1;

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

vardef ActivityInfo@#=
  attributes(@#);
  var(color)   foreColor, borderColor;

  FontInfo.@#iFont(metauml_defaultFont, defaultscale);
  @#iFont.ignoreNegativeBase := 1;

  PictureInfo.@#iText  (2, 2, 2, 2)(@#iFont);
  PictureStackInfo.@#iStack (2, 2, 2, 2)(9)(@#iText);

  @#iStack.iPict.ignoreNegativeBase := 1;

  Margins.@#(2,2,2,2);

  @#fat := 5;

  ShadeInfo.@#iShade;
  @#foreColor := .9white;
  @#borderColor := black;
enddef;

vardef ActivityInfoCopy@#(text src)=
  log "ActivityInfoCopy: Copying activity info";

  attributes(@#);
  var(color)   foreColor, borderColor;

  PictureStackInfoCopy.@#iStack (src.iStack);
  MarginsCopy.@#(src);
  @#fat := src.fat;

  ShadeInfoCopy.@#iShade(src.iShade);

  @#foreColor := src.foreColor;
  @#borderColor := src.borderColor;
enddef;

ActivityInfo.iActivity;

vardef Activity@#(text contents)=
  EActivity.@#(iActivity)(contents);
enddef;

vardef EActivity@#(text _info)(text contents)=
  ObjectEquations(@#);
  @#className := "Activity";

  ActivityInfoCopy.@#info(_info);

  numeric @#nLines; @#nLines := 0;
  string @#lines[];
  for l=contents:
    @#lines[@#nLines] := l;
    @#nLines := @#nLines + 1;
  endfor;

  EPictureStack.@#stack(@#info.iStack)(scantokens listArray(@#lines)(@#nLines))("vcenterbase");
enddef;

vardef Activity_layout@#=
    if @#laidout = 1:
    log "Activity " & (str @#) & " has already been layed out";
  else:
    @#laidout := 1;

    PictureStack_layout.@#stack;

    @#width = @#stack.width + @#info.left + @#info.right + 2 * @#info.fat;
    @#height = @#stack.height + @#info.top + @#info.bottom;

    @#c = @#stack.c;

    pair @#urt, @#lrt, @#ulft, @#llft;

    @#urt := @#ne - (@#info.fat, 0);
    @#lrt := @#se - (@#info.fat, 0);
    @#ulft := @#nw + (@#info.fat, 0);
    @#llft := @#sw + (@#info.fat, 0);
  fi;
enddef;

vardef Activity_draw@#=
  Activity_layout@#;
  objectEnsurePositioning.@#;

  attributes(@#);
  var(path) border;
  @#border := @#ulft -- @#urt .. @#e .. @#lrt -- @#llft .. @#w .. cycle;

  drawObjectShade(@#);
  fill @#border withcolor @#info.foreColor;
  draw @#border withcolor @#info.borderColor;

  drawObject(@#stack);
enddef;

vardef Activity_border@#=
  @#border
enddef;


vardef BranchInfo@#=
  @#width := 10;
  @#height := 10;

  numeric @#shade;
  color @#shadeColor, @#foreColor;
  @#shade := .3;
  @#shadeColor := .6white;
  @#foreColor := white;
enddef;

BranchInfo.iBranch;

vardef Branch@#=
  ObjectEquations(@#);
  @#className := "Branch";

  @#width = iBranch.width;
  @#height = iBranch.height;
enddef;

vardef Branch_layout@#=
    % nothing to do
enddef;

vardef Branch_draw@#=
  objectEnsurePositioning.@#;

  path @#border;
  @#border := @#n -- @#e -- @#s -- @#w -- cycle;

  fill @#border shifted (iBranch.shade, -iBranch.shade) withcolor iBranch.shadeColor;
  fill @#border withcolor iBranch.foreColor;
  draw @#border;
enddef;

vardef Branch_border@#=
  @#border
enddef;

vardef ForkInfo@#=
  @#thickness := 3;

  numeric @#shade;
  color @#shadeColor, @#foreColor;
  @#shade := .3;
  @#shadeColor := .6white;
  @#foreColor := black;
enddef;

ForkInfo.iFork;

vardef Fork@#(expr orientation, length)=
  ObjectEquations(@#);
  @#className := "Fork";

  if (orientation="h") or (orientation="horiz") or (orientation="horizontal"):
    @#width = length;
    @#height = iFork.thickness;
  else:
    @#height = length;
    @#width = iFork.thickness;
  fi;
enddef;

vardef Fork_layout@#=
    % nothing to do
enddef;

vardef Fork_draw@#=
  objectEnsurePositioning.@#;

  path @#border;
  @#border := @#nw -- @#ne -- @#se -- @#sw -- cycle;

  fill @#border shifted (iFork.shade, -iFork.shade) withcolor iFork.shadeColor;
  fill @#border withcolor iFork.foreColor;
enddef;

vardef Fork_border@#=
  @#border
enddef;

defaultTransitionHeadWidth  := 15;
defaultTransitionHeadHeight := 5;

vardef TransitionInfo@# =
  LinkInfo@#;

  @#widthA      = 0;
  @#heightA     = 0;
  @#drawMethodA = "drawNothing";

  @#widthB      = defaultTransitionHeadWidth;
  @#heightB     = defaultTransitionHeadHeight;
  @#drawMethodB = "drawArrow";

  @#drawMethod = "drawLine";
enddef;

TransitionInfo.transition;

FontInfo.guardFont(metauml_defaultFont, .7);
PictureInfo.iGuard(2, 2, 2, 2)(guardFont);
iGuard.ignoreNegativeBase := 1;
