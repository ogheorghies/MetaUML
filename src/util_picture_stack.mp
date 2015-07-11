% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _util_picture_stack_mp:
  expandafter endinput
fi;
_util_picture_stack_mp:=1;

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

inputonce util_picture;
inputonce util_commons;
inputonce util_group;

inputonce util_log;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                 %
%                         PICTURE STACK                           %
%                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef PictureStackInfo@#(expr pleft, pright, ptop, pbottom)(text pspacing)(text ppictInfo)=
  attributes(@#);
  var(numeric) boxed;
  var(color) borderColor;

  var(numeric) left, right, top, bottom;
  var(numeric) spacing;

  Margins@#(pleft, pright, ptop, pbottom);

  @#spacing := pspacing;

  @#boxed := 0;
  @#borderColor := green;

  PictureInfoCopy.@#iPict(ppictInfo);
enddef;

vardef PictureStackInfoCopy@#(text src)=
  PictureStackInfo@#(src.left, src.right, src.top, src.bottom)(src.spacing)(src.iPict);

  @#boxed := src.boxed;
  @#borderColor := src.borderColor;
enddef;

log "*** Creating iStack...";
PictureStackInfo.iStack(2, 2, 2, 2)(2)(iPict);

vardef EPictureStack@#(text pictStackInfo)(text thePictures)(text how)=
  ObjectEquations(@#);
  @#className := "PictureStack";

  PictureStackInfoCopy.@#info(pictStackInfo);

  attributes(@#);
  var(numeric) nItems;
  var(numeric) minx, miny, maxx, maxy;
  var(string)  picturesAsString;
  %var(text)   joinMethod;

  string @#joinMethod;
  
  %@#joinMethod := str how;
  for l=how:
    @#joinMethod := l;
  endfor;

  @#nItems := 0;
  for p=thePictures:
    EPicture.@#pict[@#nItems](@#info.iPict)(p);
    @#nItems := @#nItems + 1;
  endfor;

  @#picturesAsString := listArray(@#pict)(@#nItems);

  EGroup.@#group(@#info)(scantokens @#picturesAsString);

  @#nw = @#group.nw;
  @#se = @#group.se;
enddef;

vardef PictureStack@#(text thePictures)(text how)=
  EPictureStack@#(iStack)(thePictures)(how);
enddef;

vardef PictureStack_layout@#=
  if @#laidout = 1:
    log "PictureStack " & (str @#) & " has already been layed out";
  else:
    @#laidout := 1;

    layoutObjects(scantokens @#picturesAsString);

    if @#joinMethod = "vleft":
      setObjectJoin(pa.left=pb.left; pa.bottom = pb.top + @#info.spacing);
    elseif @#joinMethod = "vcenter":
      setObjectJoin(pa.midx=pb.midx; pa.bottom = pb.top + @#info.spacing);
    elseif @#joinMethod = "vright":
      setObjectJoin(pa.right=pb.right; pa.bottom = pb.top + @#info.spacing);
    elseif @#joinMethod = "vleftbase":
      setObjectJoin(pa.left=pb.left; pa.bottom = pb.bottom + @#info.spacing);
    elseif @#joinMethod = "vcenterbase":
      setObjectJoin(pa.midx=pb.midx; pa.bottom = pb.bottom + @#info.spacing);
    elseif @#joinMethod = "vrightbase":
      setObjectJoin(pa.right=pb.right; pa.bottom = pb.bottom + @#info.spacing);
    else:
      setObjectJoin(pa.c = pb.c); % By default, stack objects on top of each other.
      scantokens @#joinMethod;
    fi;

    joinObjects(scantokens @#picturesAsString);

    Group_layout.@#group;
  fi;
enddef;

vardef PictureStack_draw@#=
  PictureStack_layout.@#;
  objectEnsurePositioning.@#;

  for i=0 upto @#nItems-1:
    Picture_draw.@#pict[i];
  endfor;

  if (@#info.boxed = 1):
    draw objectBox(@#) withcolor @#info.borderColor;
  fi;
enddef;

vardef PictureStack_border@#=
    objectBox(@#)
enddef;

