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
    Class.A("A")()();
    Class.B("B")()();
    Class.C("C")()();
    Class.Base("Base")()();
    
    
    A.ne = B.nw - (20,0);
    B.ne = C.nw - (20,0);
    Base.s = B.n + (0,20);

    drawObjects(Base, A, B, C);
endfig;

beginfig(2);
    save A, B, C, Base;
    
    Class.A("A")()();
    Class.B("B")()();
    Class.C("C")()();
    Class.Base("Base")()();
    
    leftToRight(20)(A, B, C);
    topToBottom(20)(Base, B);

    drawObjects(Base, A, B, C);
endfig;

iPict.boxed := 1;
spacing := 5;
string strA, strB, strC;
strA := "a";
strB := "...";
strC := "Cyan";

beginfig(3);
    save A, B, C, X, Y, Z;
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    leftToRight.top(spacing)(X, Y, Z);
    
    drawObjects(X, Y, Z);
    
    draw (X.left, X.top) -- (Z.right, X.top) dashed evenly withpen pencircle withcolor red;
endfig;

beginfig(4);
    save A, B, C, X, Y, Z;
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    leftToRight.midy(spacing)(X, Y, Z);

    drawObjects(X, Y, Z);
    
    draw (X.left, X.midy) -- (Z.right, X.midy) dashed evenly withpen pencircle withcolor red;;
endfig;

beginfig(5);
    save A, B, C, X, Y, Z;
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    leftToRight.bottom(spacing)(X, Y, Z);
    
    drawObjects(X, Y, Z);
    
    draw (X.left, X.bottom) -- (Z.right, X.bottom) dashed evenly withpen pencircle withcolor red;;
endfig;

beginfig(6);
    save A, B, C, X, Y, Z;
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    topToBottom.left(spacing)(X, Y, Z);
    
    drawObjects(X, Y, Z);
    
    draw (X.left, X.top) -- (X.left, Z.bottom) dashed evenly withpen pencircle withcolor red;;
endfig;

beginfig(7);
    save A, B, C, X, Y, Z;

    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    topToBottom.midx(spacing)(X, Y, Z);
    
    drawObjects(X, Y, Z);
    
    draw (X.midx, X.top) -- (X.midx, Z.bottom) dashed evenly withpen pencircle withcolor red;;
endfig;

beginfig(8);
    save A, B, C, X, Y, Z;
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    topToBottom.right(spacing)(X, Y, Z);
    
    drawObjects(X, Y, Z);
    
    draw (X.right, X.top) -- (X.right, Z.bottom) dashed evenly withpen pencircle withcolor red;;
endfig;

end
