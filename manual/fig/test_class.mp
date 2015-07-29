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

beginfig(0);
  show "Copying class info...";
  ClassInfoCopy.foo(iClass);
endfig;

beginfig(1);
  Class.A("A")()();
  Class_setDebugMode.A;

  A.nw=(0,0);
  Class_draw.A;
endfig;

beginfig(2);
  save B;
  Class.B("B")("+ a:int")();
  Class_setDebugMode.B;

  B.nw=(0,0);
  Class_draw.B;
endfig;

beginfig(3);
  save C;
  Class.C("C")("+ a-#~+:int", "- b-#~+:int", "- g-#~+:int", "~ c-#~+:int", "# g-#~+:double")();
  Class_setDebugMode.C;

  C.nw=(0,0);
  Class_draw.C;
endfig;

beginfig(4);
  save D;
  Class.D("D")
     ("+ a-#~+:int", "- b-#~+:int", "- g-#~+:int", "~ c-#~+:int", "# g-#~+:double")
     ("+ a()-#~+:int", "- b()-#~+:int", "- g()-#~+:int", "~ c()-#~+:int", "# g()-#~+:double");
  Class_setDebugMode.D;

  D.nw=(0,0);
  Class_draw.D;
endfig;

beginfig(5);
  save P, Q;

  Class.P("AAA")()();
  Class_stereotypes.P("ooo", "home", "interface");
  Class_setDebugMode.P;
  P.nw=(0,0);
  Class_draw.P;

  Class.Q("AAA")()();
  Class_stereotypes.Q("ooo", "home", "interface");
  Q.nw=P.ne + (20,0);
  Class_draw.Q;
endfig;

beginfig(6);
    save A;

    Class.A("User6")()();
    Class_stereotypes.A("<<interface>>","<<home>>");
    A.nw=(0,0);
    drawObject(A);
endfig;

beginfig(7)
    save A;
    Class.A("User7")()();
    A.info.iMethodStack.left := A.info.iMethodStack.right  := 50;
    A.info.iMethodStack.top  := A.info.iMethodStack.bottom := 20;

    drawObject(A);
endfig;

beginfig(8)
  save inter;
  EClass.inter(iInterface)("Observer")()("+update(src: Object)");
  drawObjects(inter);
endfig;

beginfig(9)
    save inter;
    EInterface.inter(iInterface)("Observer")("+update(src: Object)");
    drawObjects(inter);
endfig;

beginfig(10)
    save inter;
    Interface.inter("Observer")("+update(src: Object)");
    drawObjects(inter);
endfig;

beginfig(11)
    save A;
    EClass.A(iAbstractClass)("AbstractClass")("[]{}")("+update(src: Object)");
    drawObjects(A);
endfig;

beginfig(12)
    save A;
    AbstractClass.A("AbstractClass")("[]{}")("+update(src: Object)");
    drawObjects(A);
endfig;

beginfig(13)
  save A;
  EClass.A(iClassNameOnly)("AClassWithNoCompartments")()();
  drawObjects(A);  
endfig;

beginfig(14)
  save A;
  ClassName.A("AnotherClass");
  drawObjects(A);
endfig;

beginfig(15)
  save A;
  ClassName.A("AnotherClass");
  classStereotypes.A("<<interface>>","<<remote>>");

  drawObjects(A);
endfig;

beginfig(16);
  save A, B, C;

  Class.A("Foo")
    ("+a: int", "-b: int", "#c: int", "d: int")
    ("+x()", "-y()", "#z()", "t()");
    Class_noVisibilityMarkers.A;

  drawObjects(A);
endfig;

end
