% Copyright 2006 2015 Radu-George Radulescu, Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_package_mp:
  expandafter endinput
fi;
_metauml_package_mp:=1;

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

vardef PackageInfo@#=
  attributes(@#);
  var(color)  foreColor, borderColor;
  var(numeric)forceEmptyContent;
  var(numeric)minimumNameContentsDifference;
  var(numeric)emptyNameHeight;

  FontInfo.@#iFont(metauml_defaultFont, defaultscale);
  @#iFont.ignoreNegativeBase := 1;

  PictureInfo.@#iText(2, 2, 2, 2)(@#iFont);
  PictureStackInfo.@#iNameStack(2, 2, 2, 2)(9)(@#iText);
  @#iNameStack.iPict.ignoreNegativeBase := 1;

  Margins.@#(2,2,2,2);

  ShadeInfo.@#iShade;
  @#foreColor := .9white;
  @#borderColor := black;

  @#forceEmptyContent := 0;

  @#minimumNameContentsDifference := 20;
  @#emptyNameHeight := 10;

  GroupInfo.@#iContentsGroup(2, 2, 10, 2);
enddef;

vardef PackageInfoCopy@#(text src)=
  log "PackageInfoCopy: Copying package info";

  attributes(@#);
  var(color)  foreColor, borderColor;
  var(numeric)forceEmptyContent;
  var(numeric)minimumNameContentsDifference;
  var(numeric) emptyNameHeight;

  PictureStackInfoCopy.@#iNameStack(src.iNameStack);
  MarginsCopy.@#(src);

  ShadeInfoCopy.@#iShade(src.iShade);
  @#foreColor := src.foreColor;
  @#borderColor := src.borderColor;

  @#forceEmptyContent := src.forceEmptyContent;

  @#minimumNameContentsDifference := src.minimumNameContentsDifference;
  @#emptyNameHeight := src.emptyNameHeight;

  GroupInfoCopy.@#iContentsGroup(src.iContentsGroup);
enddef;

PackageInfo.iPackage;

vardef Package@#(text contents)(text _subItems)=
  EPackage.@#(iPackage)(contents)(_subItems);
enddef;

vardef EPackage@#(text _info)(text contents)(text _subItems)=
  ObjectEquations(@#);
  @#className := "Package";

  PackageInfoCopy.@#info(_info);

  numeric @#nLines; @#nLines := 0;
  string @#lines[];
  numeric @#nameInCenter; @#nameInCenter := 0;

  for l=contents:
    @#lines[@#nLines] := l;
    @#nLines := @#nLines + 1;
  endfor;

  EGroup.@#subItems(@#info.iContentsGroup)(_subItems);

  EPictureStack.@#nameStack(@#info.iNameStack)(scantokens listArray(@#lines)(@#nLines))("vcenterbase");
enddef;

vardef Package_layout@#=
  if @#laidout = 1:
    log "Package '" & (str @#) & "' has already been layed out";
  else:
    @#laidout := 1;
    log "Package layout: '" & (str @#) & "'";

    log "Package name layout '" & (str @#) & "'...";
    PictureStack_layout.@#nameStack;
    log "SubItems for package layout '" & (str @#) & "'...";
    Group_layout.@#subItems;

    log "All elements in package '" & (str @#) & "' successfully layed out, integrating...";

    if @#subItems.nObjects = 0:
        if @#info.forceEmptyContent = 0:
          @#nameInCenter := 1;
        fi;
    fi;

    if @#subItems.width < @#nameStack.width + @#info.minimumNameContentsDifference:
      @#contentWidth = @#nameStack.width + @#info.minimumNameContentsDifference;
    else:
      @#contentWidth = lmax(@#nameStack.width, @#subItems.width);
    fi;

    if @#nameInCenter = 0:
      @#width = @#contentWidth + @#info.left + @#info.right;
      @#height = @#info.top + @#info.bottom + @#nameStack.height + @#subItems.height;
      @#nameStack.nw = @#nw;
    else:
      @#width = @#info.left + @#info.right + @#nameStack.width;
      @#height = @#info.top + @#info.bottom + @#info.emptyNameHeight + @#nameStack.height;
      @#nameStack.sw = @#sw + (@#info.left, @#info.bottom);
    fi;

    @#subItems.s = @#s + (0, @#info.bottom);

    log "Package layout for " & (str @#) & " ended.";
  fi;
enddef;

vardef Package_draw@#=
  Package_layout.@#;
  objectEnsurePositioning.@#;

  attributes(@#);
  var(path) contentBorder, tagBorder, totalBorder;

  if @#nameInCenter = 0:
    @#contentBorder := @#ne - (0, @#nameStack.height) -- @#nameStack.sw -- @#sw -- @#se -- cycle;
    @#tagBorder := @#nameStack.nw -- @#nameStack.ne -- @#nameStack.se -- @#nameStack.sw -- cycle;
    @#totalBorder := @#nw -- @#nameStack.ne -- @#nameStack.se -- @#ne - (0, @#nameStack.height) -- @#se -- @#sw -- cycle;
  else:
    @#contentBorder := @#nw - (0, @#info.emptyNameHeight) -- @#ne - (0, @#info.emptyNameHeight) -- @#se -- @#sw -- cycle;
    @#tagBorder := @#nw -- @#nw - (0, @#info.emptyNameHeight) -- @#n - (0, @#info.emptyNameHeight) -- @#n -- cycle;
    @#totalBorder := @#nw -- @#n -- @#n - (0, @#info.emptyNameHeight) -- @#ne - (0, @#info.emptyNameHeight) -- @#se -- @#sw -- cycle;
  fi;

  drawObjectShade(@#);

  fill @#contentBorder withcolor @#info.foreColor;
  draw @#contentBorder withcolor @#info.borderColor;

  fill @#tagBorder withcolor @#info.foreColor;
  draw @#tagBorder withcolor @#info.borderColor;

  drawObject(@#nameStack);
  drawObject(@#subItems);
enddef;

vardef Package_border@#=
  @#totalBorder
enddef;
