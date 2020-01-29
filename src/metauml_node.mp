% Copyright 2006 2015 Radu-George Radulescu, Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_node_mp:
  expandafter endinput
fi;
_metauml_node_mp:=1;

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

vardef NodeInfo@#=
  attributes(@#);
  var(color)  foreColor, borderColor, depthColor;
  var(numeric)minimumNameContentsDifference, depth, depthColorScale;

  FontInfo.@#iFont(metauml_defaultFont, defaultscale);
  @#iFont.ignoreNegativeBase := 1;

  PictureInfo.@#iText(2, 2, 2, 2)(@#iFont);
  PictureStackInfo.@#iNameStack(2, 2, 2, 2)(9)(@#iText);
  @#iNameStack.iPict.ignoreNegativeBase := 1;

  Margins.@#(2,2,2,2);

  ShadeInfo.@#iShade;
  @#foreColor := .9white;
  @#borderColor := black;
  @#depthColorScale := .75;
  @#depthColor := @#depthColorScale * @#foreColor;

  @#minimumNameContentsDifference := 20;
  @#depth := 4;

  GroupInfo.@#iContentsGroup(2, 2, 5, 2);
enddef;

vardef NodeInfoCopy@#(text src)=
  log "NodeInfoCopy: Copying node info";

  attributes(@#);
  var(color)   foreColor, borderColor, depthColor;
  var(numeric) minimumNameContentsDifference, depth;

  PictureStackInfoCopy.@#iNameStack(src.iNameStack);
  MarginsCopy.@#(src);

  ShadeInfoCopy.@#iShade(src.iShade);
  @#foreColor := src.foreColor;
  @#borderColor := src.borderColor;
  @#depthColorScale := src.depthColorScale;
  @#depthColor := src.depthColor;

  @#minimumNameContentsDifference := src.minimumNameContentsDifference;
  @#depth := src.depth;

  GroupInfoCopy.@#iContentsGroup(src.iContentsGroup);
enddef;

NodeInfo.iNode;

vardef Node@#(text contents)(text _subItems)=
  ENode.@#(iNode)(contents)(_subItems);
enddef;

vardef ENode@#(text _info)(text contents)(text _subItems)=
  ObjectEquations(@#);
  @#className := "Node";

  NodeInfoCopy.@#info(_info);

  numeric @#nLines; @#nLines := 0;
  string @#lines[];

  for l=contents:
    @#lines[@#nLines] := l;
    @#nLines := @#nLines + 1;
  endfor;

  EGroup.@#subItems(@#info.iContentsGroup)(_subItems);

  EPictureStack.@#nameStack(@#info.iNameStack)(scantokens listArray(@#lines)(@#nLines))("vcenterbase");
enddef;

vardef Node_layout@#=
  if @#laidout = 1:
    log "Node '" & (str @#) & "' has already been laid out";
  else:
    @#laidout := 1;
    log "Node layout: '" & (str @#) & "'";

    log "Node name layout '" & (str @#) & "'...";
    PictureStack_layout.@#nameStack;
    log "SubItems for node layout '" & (str @#) & "'...";
    Group_layout.@#subItems;

    log "All elements in node '" & (str @#) & "' successfully laid out, integrating...";

    if @#subItems.width < @#nameStack.width + @#info.minimumNameContentsDifference:
      @#contentWidth = @#nameStack.width + @#info.minimumNameContentsDifference;
    else:
      @#contentWidth = lmax(@#nameStack.width, @#subItems.width);
    fi;

    @#nameStack.n = @#n - (@#info.depth, @#info.depth);
    @#width = @#contentWidth + @#info.left + @#info.right + @#info.depth;
    @#height = @#info.top + @#info.bottom + @#nameStack.height + @#subItems.height + @#info.depth;

    @#subItems.s = @#s + (-@#info.depth/2, @#info.bottom);

    log "Node layout for " & (str @#) & " ended.";
  fi;
enddef;

vardef Node_draw@#=
  Node_layout.@#;
  objectEnsurePositioning.@#;

  attributes(@#);
  var(path) contentBorder, topDepthBorder, sideDepthBorder, totalBorder;

  @#contentBorder = @#nw - (0, @#info.depth) -- @#ne - (@#info.depth, @#info.depth) -- @#se - (@#info.depth, 0) -- @#sw -- cycle;
  @#topDepthBorder = @#nw - (0, @#info.depth) -- @#nw + (@#info.depth, 0) -- @#ne -- @#ne - (@#info.depth, @#info.depth) -- cycle;
  @#sideDepthBorder = @#ne - (@#info.depth, @#info.depth) -- @#ne -- @#se + (0, @#info.depth) -- @#se - (@#info.depth, 0) -- cycle;
  @#totalBorder = @#nw - (0, @#info.depth) -- @#nw + (@#info.depth, 0) -- @#ne -- @#se + (0, @#info.depth) -- @#se - (@#info.depth, 0) -- @#sw -- cycle;

  drawObjectShade(@#);

  if @#info.depthColorScale > 0:
    @#info.depthColor := @#info.depthColorScale * @#info.foreColor;
  fi;

  fill @#contentBorder withcolor @#info.foreColor;
  draw @#contentBorder withcolor @#info.borderColor;

  fill @#topDepthBorder withcolor @#info.depthColor;
  draw @#topDepthBorder withcolor @#info.borderColor;

  fill @#sideDepthBorder withcolor @#info.depthColor;
  draw @#sideDepthBorder withcolor @#info.borderColor;

  drawObject(@#nameStack);
  drawObject(@#subItems);
enddef;

vardef Node_border@#=
  @#totalBorder
enddef;
