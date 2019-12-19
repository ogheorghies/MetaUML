% Copyright 2006 2015 Radu-George Radulescu, Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_frame_mp:
  expandafter endinput
fi;
_metauml_frame_mp:=1;

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

vardef FrameInfo@#=
  attributes(@#);
  var(color)  foreColor, borderColor;
  var(numeric)minimumNameContentsDifference;

  FontInfo.@#nameFont(metauml_defaultFont, defaultscale);
  FontInfo.@#kindFont(metauml_defaultFontBold, defaultscale);

  PictureInfo.@#iName(2, 2, 2, 2)(@#nameFont);
  PictureInfo.@#iKind(2, 2, 2, 2)(@#kindFont);

  PictureStackInfo.@#iNameStack(2, 2, 2, 2)(9)(@#iName);
  PictureStackInfo.@#iKindStack(2, 2, 2, 2)(9)(@#iKind);

  @#iNameStack.iPict.ignoreNegativeBase := 1;
  @#iKindStack.iPict.ignoreNegativeBase := 1;

  Margins.@#(2,2,2,2);

  ShadeInfo.@#iShade;
  @#foreColor := .9white;
  @#borderColor := black;

  @#minimumNameContentsDifference := 20;

  GroupInfo.@#iContentsGroup(2, 2, 10, 2);
enddef;

vardef FrameInfoCopy@#(text src)=
  log "FrameInfoCopy: Copying frame info";

  attributes(@#);
  var(color)  foreColor, borderColor;
  var(numeric)minimumNameContentsDifference;

  PictureStackInfoCopy.@#iNameStack(src.iNameStack);
  PictureStackInfoCopy.@#iKindStack(src.iKindStack);
  MarginsCopy.@#(src);

  ShadeInfoCopy.@#iShade(src.iShade);
  @#foreColor := src.foreColor;
  @#borderColor := src.borderColor;

  @#minimumNameContentsDifference := src.minimumNameContentsDifference;

  GroupInfoCopy.@#iContentsGroup(src.iContentsGroup);
enddef;

FrameInfo.iFrame;

vardef Frame@#(text contents)(text kind)(text _subItems)=
  EFrame.@#(iFrame)(contents)(kind)(_subItems);
enddef;

vardef EFrame@#(text _info)(text contents)(text kind)(text _subItems)=
  ObjectEquations(@#);
  @#className := "Frame";

  FrameInfoCopy.@#info(_info);

  numeric @#nLines; @#nLines := 0;
  string @#lines[];

  for l=contents:
    @#lines[@#nLines] := l;
    @#nLines := @#nLines + 1;
  endfor;

  EGroup.@#subItems(@#info.iContentsGroup)(_subItems);

  EPictureStack.@#nameStack(@#info.iNameStack)(scantokens listArray(@#lines)(@#nLines))("vcenterbase");
  EPictureStack.@#kindStack(@#info.iKindStack)(kind)("vcenterbase");
enddef;

vardef Frame_layout@#=
  if @#laidout = 1:
    log "Frame '" & (str @#) & "' has already been laid out";
  else:
    @#laidout := 1;
    log "Frame layout: '" & (str @#) & "'";

    log "Frame name layout '" & (str @#) & "'...";
    PictureStack_layout.@#nameStack;
    log "Frame kind layout '" & (str @#) & "'...";
    PictureStack_layout.@#kindStack;
    log "SubItems for frame layout '" & (str @#) & "'...";
    Group_layout.@#subItems;

    log "All elements in frame '" & (str @#) & "' successfully laid out, integrating...";

    if @#subItems.width < @#nameStack.width + @#kindStack.width + @#info.minimumNameContentsDifference:
      @#contentWidth = @#nameStack.width + @#kindStack.width + @#info.minimumNameContentsDifference;
    else:
      @#contentWidth = lmax(@#nameStack.width + @#kindStack.width, @#subItems.width);
    fi;

    @#titleHeight = lmax(@#nameStack.height, @#kindStack.height);
    @#width = @#contentWidth + @#info.left + @#info.right;
    @#height = @#info.top + @#info.bottom + @#titleHeight + @#subItems.height;
    @#kindStack.left = @#left;
    @#nameStack.left = @#kindStack.right;
    @#nameStack.pict[0].bottom = @#kindStack.pict[0].bottom;
    lmax(@#nameStack.top, @#kindStack.top) = @#top;

    @#subItems.s = @#s + (0, @#info.bottom);

    log "Frame layout for " & (str @#) & " ended.";
  fi;
enddef;

vardef Frame_draw@#=
  Frame_layout.@#;
  objectEnsurePositioning.@#;

  attributes(@#);
  var(path) border, nameStackBorder;

  @#titleCornerSize = @#titleHeight / 2;

  @#border := @#nw -- @#ne -- @#se -- @#sw -- cycle;
  @#nameStackBorder := @#nw -- (@#nameStack.right + @#titleCornerSize, @#top) -- (@#nameStack.right + @#titleCornerSize, @#top - @#titleHeight + @#titleCornerSize) -- (@#nameStack.right, @#top - @#titleHeight) -- (@#left, @#top - @#titleHeight) -- cycle;

  drawObjectShade(@#);

  fill @#border withcolor @#info.foreColor;
  draw @#border withcolor @#info.borderColor;

  fill @#nameStackBorder withcolor @#info.foreColor;
  draw @#nameStackBorder withcolor @#info.borderColor;

  drawObject(@#kindStack);
  drawObject(@#nameStack);
  drawObject(@#subItems);
enddef;

vardef Frame_border@#=
  @#border
enddef;
