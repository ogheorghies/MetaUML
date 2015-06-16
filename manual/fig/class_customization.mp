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
  iClass.foreColor := (.9, .9, 0);

  Class.A("A")()();
  Class.B("B")()();
  Class.C("C")()();

  B.w = A.e + (20,0);
  C.n = .5[A.se, B.sw] + (0, -10);

  drawObjects(A, B, C);
endfig;

beginfig(2);
  save A, B, C;
  iClass.foreColor := (.9, .9, 0);

  Class.A("A")()();
  Class.B("B")()();
  Class.C("C")()();
  C.info.foreColor := (.7, .7, .9);
  C.info.borderColor := blue;
  C.info.iName.iFont.scale := 2;

  B.w = A.e + (20,0);
  C.n = .5[A.se, B.sw] + (0, -10);

  drawObjects(A, B, C);
endfig;

beginfig(3);
  ClassInfoCopy.iHome(iClass);
  iHome.foreColor := (0, .9, .9);

  ClassInfo.iRemote;
  iRemote.foreColor := (.9, .9, 0);
  iRemote.borderColor := (0, 0, .9);

  save A, B, C, D;

  EClass.A(iHome)("UserHome")()();
  EClass.B(iRemote)("UserRemote")()();
  EClass.C(iHome)("CartHome")()();
  EClass.D(iRemote)("CartRemote")()();


  B.nw = A.ne + (20,0);
  D.nw = C.ne + (20,0);
  A.bottom - C.top = 10;
  A.left = C.left;

  drawObjects(A, B, C, D);
endfig;

beginfig(4);
  iClass.foreColor := .9white;
  save A;

  Class.A("Foo")
    ("a: int", "b: int")
    ("foo()", "bar()", "gar()");
  A.info.iName.iFont.name := metauml_defaultFontBold;
  A.info.iName.iFont.scale := 1.2;

  A.info.iAttributeStack.iPict.iFont.scale := 0.8;
  A.info.iAttributeStack.top := 10;
  A.info.iAttributeStack.spacing := 11;

  A.info.iMethodStack.iPict.iFont.scale := 2;
  A.info.iMethodStack.spacing    := 17;
  A.info.iMethodStack.bottom := 10;
  drawObject(A);
endfig;

%beginfig(1);
%   save Test;
%   Class.Test("Test")("n:int","a2", "a3")("aLongMethod():void");
%   %, "anotherLongMethod():void",  "yetAnotherLongMethod()");

%   Test.sw = (0,0);
%   Class_draw.Test;

%    dotlabel.ulft(btex nw etex, Test.nw);
%    dotlabel.top(btex n etex, Test.n);
%    dotlabel.urt(btex ne etex, Test.ne);
%    dotlabel.urt(btex e etex, Test.e);
%    dotlabel.lrt(btex se etex, Test.se);
%    dotlabel.llft(btex s etex, Test.s);
%    dotlabel.llft(btex sw etex, Test.sw);
%    dotlabel.lft(btex w etex, Test.w);

%    dotlabel.ulft(btex c etex, Test.c);

%    draw Test.nw - (50,0) -- Test.ne + (30,0)  dashed evenly;
%    label.urt(btex top etex, Test.nw - (50,0));

%    draw Test.sw - (50,0) -- Test.se + (30,0) dashed evenly;
%    label.lrt(btex bottom etex, Test.sw - (50,0));

%    draw Test.nw + (0,25) -- Test.sw - (0, 50) dashed evenly;
%    label.bot(btex left etex, Test.sw - (0,50));

%    draw Test.ne + (0,25) -- Test.se - (0, 50) dashed evenly;
%    label.bot(btex right etex, Test.se - (0,50));

%    drawdblarrow Test.nw - (40,0) -- Test.sw - (40,0);
%    label.lft(btex height etex, .5[Test.nw, Test.sw] - (40,0));

%    drawdblarrow Test.sw - (0,40) -- Test.se - (0,40);
%    label.bot(btex width etex, .5[Test.sw, Test.se] - (0,40));

%    draw Test.n -- Test.s + (0, -20) dashed evenly;
%    label.bot(btex midx etex, Test.s + (0,-20));

%    draw Test.w -- Test.e + (20,0) dashed evenly;
%    label.rt(btex midy etex, Test.e + (20,0));

%    draw Test.sw + (classLeftMargin,0) -- Test.nw + (classLeftMargin, 25) dashed evenly;
%    draw Test.se + (-classRightMargin,0) -- Test.ne + (-classRightMargin, 25) dashed evenly;

%    drawdblarrow Test.nw + (0,20) -- Test.nw + (classLeftMargin, 20);
%    label.top(btex classLeftMargin etex, Test.nw + (classLeftMargin/2, 25));

%    drawdblarrow Test.ne + (0,20) -- Test.ne + (-classRightMargin, 20);
%    label.top(btex classRightMargin etex, Test.ne + (-classLeftMargin/2, 25));

%    pair A,B;
%    A := ((xpart Test.ne) + 30, ypart Test.ne);
%    B := ((xpart Test.ne) + 30, ypart Test.namePict.nw);
%    draw Test.namePict.nw -- B dashed evenly;
%    drawdblarrow A-(10,0) -- B-(10,0);
%    label.rt(btex classNameBefore etex, .5[A,B]);

%    A := (xpart A, ypart Test.namePict.se);
%    B := (xpart A, Test.nameEndsAtY - classNameAfter);
%    draw Test.namePict.se -- A dashed evenly;
%    draw (xpart Test.namePict se, ypart B) -- B dashed evenly;
%    drawdblarrow A-(10,0) -- B-(10,0);
%    label.rt(btex classNameAfter etex, .5[A,B]);

%    A := B;
%    B := (xpart A, ypart Test.attributePict[0].ne);
%    draw Test.attributePict[0].ne -- B dashed evenly;
%    drawdblarrow A-(10,0) -- B-(10,0);
%    label.rt(btex classAttributesBefore etex, .5[A,B]);

%    A := (xpart A, ypart Test.attributePict[2].se);
%    B := A + (0, -classAttributesAfter);
%    draw Test.attributePict[2].se -- A dashed evenly;
%    draw (Test.attributePict[2].se + (0, -classAttributesAfter)) -- B dashed evenly;
%    drawdblarrow A-(10,0) -- B-(10,0);
%    label.rt(btex classAttributesAfter etex, .5[A,B]);

%    A := B;
%    B := (xpart A, ypart Test.methodPict[0].ne);
%    draw Test.methodPict[0].ne -- B dashed evenly;
%    drawdblarrow A-(10,0) -- B-(10,0);
%    label.rt(btex classMethodsBefore etex, .5[A,B]);

%    A := (xpart A, ypart Test.methodPict[0].se);
%    B := A + (0, -classMethodsAfter);
%    draw Test.methodPict[0].se -- A dashed evenly;
%    draw (Test.methodPict[0].se + (0, -classMethodsAfter)) -- B dashed evenly;
%    drawdblarrow A-(10,0) -- B-(10,0);
%    label.rt(btex classMethodsAfter etex, .5[A,B]);
% endfig;


end
