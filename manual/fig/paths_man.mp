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
  save A, B;
  Class.A("A")("foo:int")("bar()");
  Class.B("B")()();
  
  A.nw = (0,0);
  B.s = A.ne + (30,30);
  
  Class_draw.A;
  Class_draw.B;

  drawRelation(aggregationUni)
              (A.n ..(30,30)..B.w);
  path cool;
  cool := A.e .. A.e+(20,10) ..
          B.s+(20,-40) .. B.s+(-10,-30)
          -- B.s;
  drawRelation(inheritance)(cool);
endfig;

beginfig(2);
  save A, B;
  Class.A("A")()();
  Class.B("B")()();
  
  A.nw = (0,0);
  B.sw = A.ne + (10,10);
  
  Class_draw.A;
  Class_draw.B;

  drawRelation(aggregationUni)
    (pathManhattanX(A.e, B.s));
  drawRelation(inheritance)
    (pathManhattanY(A.n, B.w));  
endfig;

beginfig(3);
  save A, B;
  Class.A("A")()();
  Class.B("B")()();
  
  A.nw = (0,0);
  B.sw = A.ne + (10,10);
  
  Class_draw.A;
  Class_draw.B;

  stepX:=60;
  drawRelation(aggregationUni)
  (pathStepX(A.e, B.e, stepX));

  stepY:=20;
  drawRelation(inheritance)
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

beginfig(4);
  save A, B;
  Class.A("A")()();
  Class.B("B")("a")();
  
  A.nw = (0,0);
  B.sw = A.se + (30,5);

  Class_draw.A;
  Class_draw.B;
  
  untilX := B.left;
  drawRelation(association)
    (pathHorizontal(A.e, untilX));

  draw B.nw -- B.sw + (0,-10) dashed evenly;
  label.bot(btex untilX etex, B.sw + (0,-10));
endfig;

beginfig(5);
  save A, B;
  Class.A("A")()();
  Class.B("B")("a")("foo()");
  
  A.nw = (0,0);
  B.sw = A.ne + (-20,20);

  Class_draw.A;
  Class_draw.B;
  
  untilY:= B.bottom;
  drawRelation(association)
    (pathVertical(A.n, untilY));

  draw B.sw -- B.sw + (-20,0) dashed evenly;
  label.lft(btex untilY etex, B.sw + (-20,-0));
endfig;

beginfig(6);
  save A,B;
  Class.A("A")()();
  Class.B("B")()();

  B.nw = A.ne + (40,30);
  drawObjects(A,B);
  
  link(inheritance)(pathCut(A,B)(A.c -- B.c));
endfig;

end
