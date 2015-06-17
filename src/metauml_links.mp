% Copyright 2005 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

% A LinkStructure is used to compute the relevant elements
% of a link, such as what is the main path of the link and
% where the link ends are to be drawn.
%
% For example, for a unidirectional aggregation between points
% A and B one must reserve some space for one diamond to the left and one arrow
% to the right, and draw the continous line on a segment shorter than AB.
%

if known _metauml_links_mp:
  expandafter endinput
fi;
_metauml_links_mp:=1;

vardef LinkStructure@#(expr my_path, widthA, widthB) =
  pair @#pointA, @#pointB, @#pointAc, @#pointBc;
  path @#circleA, @#circleB;
  numeric @#timeA, @#timeB;
  path @#actualPath;

  @#pointA = point 0 of my_path;
  @#pointB = point infinity of my_path;

  @#circleA = fullcircle scaled widthA shifted @#pointA;
  @#circleB = fullcircle scaled widthB shifted @#pointB;

  @#timeA = xpart (my_path intersectiontimes @#circleA);
  @#timeB = xpart (my_path intersectiontimes @#circleB);
  @#pointAc = point @#timeA of my_path;
  @#pointBc = point @#timeB of my_path;

  @#actualPath = subpath (@#timeA, @#timeB) of my_path;
enddef;

% Used for visual debugging purposes
%
vardef describeLinkStructure(text linkStruct)=
  %draw linkStruct.pointA -- linkStruct.pointB withpen pencircle scaled 2 withcolor green;

  draw linkStruct.circleA;
  draw linkStruct.circleB;

  dotlabel.lft("A", linkStruct.pointA);
  dotlabel.rt ("B", linkStruct.pointB);

  dotlabel.urt("A1", linkStruct.pointAc);
  dotlabel.ulft("B1", linkStruct.pointBc);

  draw linkStruct.actualPath withcolor red;
enddef;

% Draws the path using graphical elements specified by iLink
% using the landmark points computed in the LinkStructure
% linkStruct.
%
vardef drawLinkStructure(text linkStruct)(text iLink) =
  scantokens(iLink.drawMethod)(linkStruct.actualPath);

  scantokens(iLink.drawMethodA)(linkStruct.pointAc)(linkStruct.pointA)(iLink.heightA);
  scantokens(iLink.drawMethodB)(linkStruct.pointBc)(linkStruct.pointB)(iLink.heightB);
enddef;

vardef LinkInfo@# =
  numeric @#widthA, @#heightA;
  string @#drawMethodA;

  numeric @#widthB, @#heightB;
  string @#drawMethodB;

  string @#drawMethod;
enddef;

% Draws a link using the given path as support.
%
vardef link(text iLink)(expr myPath)=
   LinkStructure.ls(myPath, iLink.widthA, iLink.widthB);
   drawLinkStructure(ls)(iLink);
enddef;

% Draws a direct link between the center of the objects.
vardef clink(text iLink)(suffix objectA, objectB)=
  link(iLink)(pathCut(objectA, objectB)(objectA.c--objectB.c));
enddef;
