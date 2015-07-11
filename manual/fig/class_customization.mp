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

end
