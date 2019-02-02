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

iPict.boxed := 1;

beginfig(1);
  iClass.shade := 3;
  Class.F("Foo")("a: int","b: int")();
  Class.B("Bar")()();

  B.nw = F.ne + (20,-20);

  drawObjects(B, F);
  
  link(association)(B.nw -- F.ne);

  draw objectBorder(B) withcolor red;
  draw objectBorder(F) withcolor blue;
  
  link(association)(pathCut(B,F)(B.c--F.c));
endfig;

beginfig(2);
  save A, B;
  
  Picture.A("A");
  Picture.B("Blue");
  
  B.sw = A.ne + (20,20);
  
  drawObjects(A, B);

  link(associationUni)(pathManhattanX(A.e, B));
endfig;

beginfig(3);
  save A, B, C, D, O;
  
  Picture.A("Alpha");
  Picture.B("Beta");
  Picture.C("Gamma");
  Picture.D("Delta");
  Picture.O("Omega");
  
  A.c = O.c + (-50,50);
  B.c = O.c + (50,50);
  C.c = O.c + (-50,-50);
  D.c = O.c + (50,-50);
  
  drawObjects(O, A, B, C, D);
	
  link(associationUni)(pathManhattanX(O, A));
  link(associationUni)(pathManhattanX(O, B));
  link(associationUni)(pathManhattanX(O, C));
  link(associationUni)(pathManhattanX(O, D));
endfig;

beginfig(3);
  show "";
  show "";
  show " FIGURE 3";
  
  save A, B, C, D, O;
  
  Picture.A("Alpha");
  Picture.B("Beta");
  Picture.C("Gamma");
  Picture.D("Delta");
  Picture.O("Omega");
  
  A.c = O.c + (-50,50);
  B.c = O.c + (50,50);
  C.c = O.c + (-50,-50);
  D.c = O.c + (50,-50);
  
  drawObjects(O, A, B, C, D);
	
  link(associationUni)(pathManhattanX(O, A));
  link(associationUni)(pathManhattanX(O, B));
  link(associationUni)(pathManhattanX(O, C));
  link(associationUni)(pathManhattanX(O, D));
endfig;

end
