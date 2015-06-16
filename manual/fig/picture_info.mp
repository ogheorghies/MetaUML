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

input boxes;
input util_commons;
input util_object;
input util_picture;
input util_positioning;

PictureInfoCopy.iBig(iPict);
iBig.left := iBig.right := 20;
iBig.top := 10;
iBig.bottom := 1;
iBig.boxed := 1;
iBig.ignoreNegativeBase := 1;
iBig.iFont.name := defaultfont;
iBig.iFont.scale := 3;

PictureInfoCopy.iSmall(iPict);
iSmall.boxed := 1;
iSmall.borderColor := green;

beginfig(1);
  EPicture.a(iBig)("yummy");
  EPicture.b(iSmall)("cool");
% you can still modify a.info
% and b.info if you wish.

  a.nw = (0,0);
  b.nw = a.sw + (0,-10);
  
  drawObjects(a, b)
endfig;

beginfig(2);
  save a, b, c, myFixed;
  PictureInfoCopy.myFixed(iPict);
  myFixed.ignoreNegativeBase := 1;
  myFixed.fixedWidth  := 15;
  myFixed.fixedHeight := 20;
  myFixed.boxed := 1;
  
  EPicture.a(myFixed)("a");
  EPicture.b(myFixed)(".-.");
  EPicture.c(myFixed)("toolong");
  
  leftToRight.bottom(10)(a, b, c);
  
  drawObjects(a, b, c);
endfig;

beginfig(3);
  save a, b, c, myFixed;  
  PictureInfoCopy.myFixed(iPict);
  myFixed.ignoreNegativeBase := 1;
  myFixed.bottom := 4.5;
  myFixed.valign := "bottom";
  myFixed.halign := "center";
  myFixed.fixedWidth  := 25;
  myFixed.fixedHeight := 15;
  myFixed.boxed := 1;
  
  EPicture.a(myFixed)("a");
  EPicture.b(myFixed)("yum");
  EPicture.c(myFixed)("b");
  
  leftToRight.bottom(10)(a, b, c);
  
  drawObjects(a, b, c);
endfig;

end
