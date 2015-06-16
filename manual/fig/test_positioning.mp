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
spacing := 5;
string strA, strB, strC;
strA := "a";
strB := "...";
strC := "XYZ";

beginfig(1);
    save A, B, C, X, Y, Z;
    
    Picture.A(strA);
    Picture.B(strB);
    Picture.C(strC);
    
    align(top, left, right)(spacing)("+")(A, B, C);
    
    drawObjects(A, B, C);
   
    draw (A.left, A.top) -- (C.right, A.top);
    
    %%%%
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    leftToRight.top(spacing)(X, Y, Z);
    
    X.top = A.bottom - 10;
    
    drawObjects(X, Y, Z);
    
    draw (X.left, X.top) -- (Z.right, X.top);
endfig;

beginfig(2);
    save A, B, C, X, Y, Z;
    
    Picture.A(strA);
    Picture.B(strB);
    Picture.C(strC);
    
    align(midy, left, right)(spacing)("+")(A, B, C);
    
    drawObjects(A, B, C);
   
    draw (A.left, A.midy) -- (C.right, A.midy);
    
    %%%%
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    leftToRight.midy(spacing)(X, Y, Z);
    
    X.top = A.bottom - 10;
    
    drawObjects(X, Y, Z);
    
    draw (X.left, X.midy) -- (Z.right, X.midy);
endfig;

beginfig(3);
    save A, B, C, X, Y, Z;
    
    Picture.A(strA);
    Picture.B(strB);
    Picture.C(strC);
    
    align(bottom, left, right)(spacing)("+")(A, B, C);
    
    drawObjects(A, B, C);
   
    draw (A.left, A.bottom) -- (C.right, A.bottom);
    
    %%%%
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    leftToRight.bottom(spacing)(X, Y, Z);
    
    X.top = A.bottom - 10;
    
    drawObjects(X, Y, Z);
    
    draw (X.left, X.bottom) -- (Z.right, X.bottom);
endfig;

beginfig(4);
    save A, B, C, X, Y, Z;
    
    Picture.A(strA);
    Picture.B(strB);
    Picture.C(strC);
    
    align(left, top, bottom)(spacing)("-")(A, B, C);
    
    drawObjects(A, B, C);
   
    draw (A.left, A.top) -- (A.left, C.bottom);
    
    %%%%
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    topToBottom.left(spacing)(X, Y, Z);
    
    X.top = C.bottom - 10;
    
    drawObjects(X, Y, Z);
    
    draw (X.left, X.top) -- (X.left, Z.bottom);
endfig;

beginfig(5);
    save A, B, C, X, Y, Z;
    
    Picture.A(strA);
    Picture.B(strB);
    Picture.C(strC);
    
    align(midx, top, bottom)(spacing)("-")(A, B, C);
    
    drawObjects(A, B, C);
   
    draw (A.midx, A.top) -- (A.midx, C.bottom);
    
    %%%%
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    topToBottom.midx(spacing)(X, Y, Z);
    
    X.top = C.bottom - 10;
    
    drawObjects(X, Y, Z);
    
    draw (X.midx, X.top) -- (X.midx, Z.bottom);
endfig;

beginfig(6);
    save A, B, C, X, Y, Z;
    
    Picture.A(strA);
    Picture.B(strB);
    Picture.C(strC);
    
    align(right, top, bottom)(spacing)("-")(A, B, C);
    
    drawObjects(A, B, C);
   
    draw (A.right, A.top) -- (A.right, C.bottom);
    
    %%%%
    
    Picture.X(strA);
    Picture.Y(strB);
    Picture.Z(strC);
    
    topToBottom.right(spacing)(X, Y, Z);
    
    X.top = C.bottom - 10;
    
    drawObjects(X, Y, Z);
    
    draw (X.right, X.top) -- (X.right, Z.bottom);
endfig;

end
