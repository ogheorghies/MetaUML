% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

if known _util_group_mp:
  expandafter endinput
fi;
_util_group_mp:=1;

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

inputonce util_object;
inputonce util_commons;
inputonce util_margins;
inputonce util_log;

vardef GroupInfo@#(expr pleft, pright, ptop, pbottom)=
  attributes(@#);
  var(color)   borderColor;
  var(numeric) boxed;

  @#boxed := 0;
  @#borderColor := red;

  Margins.@#(pleft, pright, ptop, pbottom);
enddef;

vardef GroupInfoCopy@#(text src)=
  GroupInfo@#(src.left, src.right, src.top, src.bottom);

  @#boxed := src.boxed;
  @#borderColor := src.borderColor;

enddef;

GroupInfo.iGroup(2, 2, 2, 2);
GroupInfo.iGroupNoMargins(0, 0, 0, 0);

GroupInfoCopy.iGroupBoxed(iGroup);
iGroupBoxed.boxed := 1;

vardef EGroup@#(text groupInfo)(text objects)=
  ObjectEquations(@#);
  @#className := "Group";

  var(numeric) minx, maxx, miny, maxy;
  var(numeric) nObjects;
  var(string)  objectsAsString;

  GroupInfoCopy.@#info(groupInfo);

  @#objectsAsString := enumToString(objects)("");
  log @#objectsAsString;

  @#nObjects := 0;
  if @#objectsAsString <> "":
    forsuffixes obj = scantokens @#objectsAsString:
        @#nObjects := @#nObjects + 1;
    endfor;
  fi;

enddef;

vardef Group@#(text objects)=
  EGroup@#(iGroup)(objects);
enddef;

vardef Group_layout@#=
  if @#laidout = 0:
    log "Needing layout for group " & (str @#);
    @#laidout := 1;

    log "Calling layout for objects in group '" & (str @#) & "' .";
    log "  Objects are: '" & @#objectsAsString & "'.";

    if (@#objectsAsString = ""):
      log "Empty layout begin";
      @#width = @#info.left + @#info.right;
      @#height = @#info.top + @#info.bottom;
      log "Empty layout end";
    else:
      log "Layout with content";
      layoutObjects(scantokens @#objectsAsString);
      log "All objects in group '" & (str @#) & "' are now laid out.";

      % As already tested, @#objectsAsString must be <> "".
      % See page 53, User's manual for MetaPost
      % "if some of the suffixes are empty, the loop gets
      % executed, with the loop index parameter set to
      % the empty suffix" (!)

      log "Group_layout: finding min/max x/y of objects:" & @#objectsAsString;

      __objectIndex := 0;
      forsuffixes obj__ = scantokens @#objectsAsString:
        if __objectIndex = 0:
            log "Group_layout: first object " & str obj__ & ", initial minx, maxx, miny, maxy follow.";
            @#minx := obj__.left;
            @#maxx := obj__.right;
            @#miny := obj__.bottom;
            @#maxy := obj__.top;

            log @#minx;
            log @#maxx;
            log @#miny;
            log @#maxy;
            __objectIndex := __objectIndex + 1;
        else:
            log "Group_layout: current object " & str obj__;

            log "comparing minx";
            log @#minx;
            log obj__.left;
            @#minx := min(@#minx, obj__.left);

            log "comparing maxx";
            log @#maxx;
            log obj__.right;
            @#maxx := max(@#maxx, obj__.right);

            log "comparing miny";
            log @#miny;
            log obj__.bottom;
            @#miny := min(@#miny, obj__.bottom);

            log "comparing maxy";
            log @#maxy;
            log obj__.top;
            @#maxy := max(@#maxy, obj__.top);

            __objectIndex := __objectIndex + 1;
        fi;
      endfor;
      log "Group_layout: finding min/max x/y: done.";
      log @#minx;
      log @#maxx;
      log @#miny;
      log @#maxy;

      log "Group_layout: about to set nw, se";
      log @#nw;
      log @#se;

      @#nw = (@#minx - @#info.left, @#maxy + @#info.top);
      @#se = (@#maxx + @#info.right, @#miny - @#info.bottom);

      log "Done performing actual layout for group " & str @#;
    fi;
  else:
    log "NOT needing layout for group " & (str @#);
  fi;
enddef;

vardef Group_draw@#=
  log "Drawing group....";
  Group_layout@#;
  objectEnsurePositioning.@#;

  if @#objectsAsString <> "":
    drawObjects(scantokens @#objectsAsString);
  fi;

  if (@#info.boxed = 1):
    draw objectBox(@#) withcolor @#info.borderColor;
  fi;
enddef;

vardef Group_border@#=
    objectBox(@#)
enddef;


