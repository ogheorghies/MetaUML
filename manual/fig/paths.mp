% Part of the MetaUML manual.
% Copyright (C) 2005 Ovidiu Gheorghies
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

input metauml;

beginfig(1);
  pair za, zb;
  za = (10,10);
  zb = (10,-5);
  path cool;
  cool := za .. za+(20,10) ..
          zb+(20,-20) ..
          zb+(-10,-30) -- zb;
  link(aggregationUni)(cool);
endfig;

beginfig(2);
  save A, B;
  Class.A("A")()();
  Class.B("B")()();

  B.sw = A.ne + (10,10);

  drawObjects(A, B);

  link(aggregationUni)
    (rpathManhattanX(A.e, B.s));
  link(inheritance)
    (pathManhattanY(A.n, B.w));
endfig;

beginfig(3);
  save A, B;
  Class.A("A")()();
  Class.B("B")()();

  B.sw = A.ne + (10,10);

  drawObjects(A, B);

  stepX:=60;
  link(aggregationUni)
  (pathStepX(A.e, B.e, stepX));

  stepY:=20;
  link(inheritance)
  (pathStepY(B.n, A.n, stepY));

  pair X,Y;
  X := A.se + (0,-30);
  Y := X + (stepX, 0);
  draw A.se -- X dashed evenly;
  draw (xpart Y, ypart A.e) -- Y dashed evenly;
  drawdblarrow X + (0,15) -- Y + (0,15);
  label.top(btex stepX etex, .5[X,Y]);

  pair X,Y;
  X := B.n + (-70,-0);
  Y := X + (0, stepY);

  draw B.n -- X dashed evenly;
  draw B.n + (0,stepY) -- Y dashed evenly;
  drawdblarrow X + (15,0) -- Y + (15,0);
  label.lft(btex stepY etex, .5[X,Y]);
endfig;

% horizontal, vertical
beginfig(4);
  save A, B;
  Class.A("A")()();
  Class.B("B")("b")();
  Class.C("C")("foo: int")();

  B.sw = A.se + (30,5);
  C.sw = A.nw + (0, 30);

  drawObjects(A, B, C);

  untilX := B.left;
  drawRelation(association)
    (pathHorizontal(A.e, untilX));

  draw B.nw -- B.sw + (0,-10) dashed evenly;
  label.bot(btex untilX etex, B.sw + (0,-10));

  untilY:= C.bottom;
  drawRelation(association)(pathVertical(A.n, untilY));

  draw C.sw -- C.sw + (-20,0) dashed evenly;
  label.lft(btex untilY etex, C.sw + (-20,-0));

endfig;

beginfig(5);
  save A,B;
  Activity.A("A");
  Activity.B("B");

  B.nw = A.ne + (40,30);
  drawObjects(A,B);

  z = A.se + (30, -10);
  link(transition)(pathCut(A, B)
      (A.c -- z -- B.c));
endfig;

beginfig(6);
  save A,B;
  Class.A("A")()();
  Class.B("B")()();

  B.nw = A.ne + (20,30);
  drawObjects(A,B);

  clink(inheritance)(A, B);
endfig;

end
