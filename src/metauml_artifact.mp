% Copyright 2006 2015 Radu-George Radulescu, Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _metauml_artifact_mp:
  expandafter endinput
fi;
_metauml_artifact_mp:=1;

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

vardef ArtifactInfo@#=
  attributes(@#);
  var(color)   foreColor, borderColor;
  var(numeric) minimumNameContentsDifference;

  FontInfo.@#iFont(metauml_defaultFont, defaultscale);
  @#iFont.ignoreNegativeBase := 1;

  PictureInfo.@#iText  (2, 2, 2, 2)(@#iFont);
  PictureStackInfo.@#iNameStack (2, 2, 2, 2)(9)(@#iText);
  @#iNameStack.iPict.ignoreNegativeBase := 1;

  Margins.@#(2,2,2,2);

  ShadeInfo.@#iShade;
  @#foreColor := .9white;
  @#borderColor := black;

  @#minimumNameContentsDifference := 20;

  GroupInfo.@#iContentsGroup(2, 2, 10, 2);
enddef;

vardef ArtifactInfoCopy@#(text src)=
  log "ArtifactInfoCopy: Copying artifact info";

  attributes(@#);
  var(color)   foreColor, borderColor;
  var(numeric) minimumNameContentsDifference;

  PictureStackInfoCopy.@#iNameStack (src.iNameStack);
  MarginsCopy.@#(src);

  ShadeInfoCopy.@#iShade(src.iShade);
  @#foreColor := src.foreColor;
  @#borderColor := src.borderColor;

  @#minimumNameContentsDifference := src.minimumNameContentsDifference;

  GroupInfoCopy.@#iContentsGroup(src.iContentsGroup);
enddef;

ArtifactInfo.iArtifact;

vardef Artifact@#(text contents)(text _subItems)=
  EArtifact.@#(iArtifact)(contents)(_subItems);
enddef;

vardef EArtifact@#(text _info)(text contents)(text _subItems)=
  ObjectEquations(@#);
  @#className := "Artifact";

  ArtifactInfoCopy.@#info(_info);

  numeric @#nLines; @#nLines := 0;
  string @#lines[];
  numeric @#nSubItems; @#nSubItems := 0;

  for l=contents:
    @#lines[@#nLines] := l;
    @#nLines := @#nLines + 1;
  endfor;

  for s=_subItems:
    @#nSubItems := @#nSubItems + 1;
  endfor;

  EGroup.@#subItems(@#info.iContentsGroup)(_subItems);

  EPictureStack.@#nameStack(@#info.iNameStack)(scantokens listArray(@#lines)(@#nLines))("vcenterbase");
enddef;

vardef Artifact_layout@#=
  if @#laidout = 1:
    log "Artifact '" & (str @#) & "' has already been laid out";
  else:
    @#laidout := 1;
    log "Artifact layout: '" & (str @#) & "'";

    log "Artifact name layout '" & (str @#) & "'...";
    PictureStack_layout.@#nameStack;
    log "SubItems for artifact layout '" & (str @#) & "'...";
    Group_layout.@#subItems;

    log "All elements in artifact '" & (str @#) & "' successfully laid out, integrating...";


    if @#subItems.width < @#nameStack.width + @#info.minimumNameContentsDifference:
      @#contentWidth = @#nameStack.width + @#info.minimumNameContentsDifference;
    else:
      @#contentWidth = lmax(@#nameStack.width, @#subItems.width);
    fi;

    @#width = @#contentWidth + @#info.left + @#info.right + 15;

    if @#nSubItems = 0:
       @#height = @#info.top + @#info.bottom + @#nameStack.height + @#subItems.height;
       @#nameStack.n = @#n - (0, 7);
    else:
       @#height = @#info.top + @#info.bottom + @#nameStack.height + @#subItems.height + 15;
       @#nameStack.n = @#n + (0, @#info.top) - (0, 5);
    fi;

    @#subItems.s = @#s + (0, @#info.bottom);

    log "Artifact layout for " & (str @#) & " ended.";
  fi;
enddef;

vardef Artifact_draw@#=
  Artifact_layout.@#;
  objectEnsurePositioning.@#;

  attributes(@#);
  var(path) border;

  @#border := @#ne -- @#nw -- @#sw -- @#se -- cycle;

  drawObjectShade(@#);

  fill @#border withcolor @#info.foreColor;
  draw @#border withcolor @#info.borderColor;

  drawArtifactVisualStereotype(@#ne);

  drawObject(@#nameStack);
  drawObject(@#subItems);
enddef;

vardef drawArtifactVisualStereotype(text ne)=
  pair anchor;
  numeric w, h, dogear, margin;
  anchor = ne - (6, 4);
  w = 10;
  h = 13;
  dogear = 3;
  margin = 1;

  draw anchor - (dogear, 0) -- anchor - (0, dogear) -- anchor - (0, h) -- anchor - (w, h) -- anchor - (w, 0) -- cycle;
  draw anchor - (dogear, 0) -- anchor - (dogear, dogear) -- anchor - (0, dogear);
  for s = 1.3 step 1.3 until 8:
    draw anchor - (w - margin, s) -- anchor - (margin + if s > dogear: 0 else: dogear fi, s);
  endfor;
enddef;

vardef Artifact_border@#=
  @#border
enddef;
