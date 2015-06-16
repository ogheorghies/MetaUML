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
  Class.P("AAA")("- noo:int", "+bar:double","c:Integer","f: int")("foo()", "bar()");
  Class_setDebugMode.P;

  P.nw=(0,0);
  Class_draw.P;

  Class.Q("AAA")("-noo:int", "+bar:double","c:Integer","f: int")("-noo()", "bar()");
  Q.nw=P.ne + (20,0);
  Class_draw.Q;
endfig;

beginfig(2);
  save P, Q;

  Class.P("AAA")("+ foo:int", "+bar:double","c:Integer","f: int")();
  Class_setDebugMode.P;
  P.nw=(0,0);
  Class_draw.P;

  Class.Q("AAA")("+ foo:int", "+bar:double","c:Integer","f: int")();
  Q.nw=P.ne + (20,0);
  Class_draw.Q;
endfig;

beginfig(3);
  save P, Q;

  Class.P("AAA")()();
  Class_setDebugMode.P;
  P.nw=(0,0);
  Class_draw.P;

  Class.Q("AAA")()();
  Q.nw=P.ne + (20,0);
  Class_draw.Q;
endfig;

beginfig(4);
  save P, Q;

  Class.P("AAA")()();
  classStereotypes.P("<<ooo>>","<<home>>", "<<intergace>>");
  Class_setDebugMode.P;
  P.nw=(0,0);
  Class_draw.P;


  Class.Q("AAA")()();
  classStereotypes.Q("<<ooo>>","<<home>>", "<<intergace>>");
  Q.nw=P.ne + (20,0);
  Class_draw.Q;
endfig;

beginfig(5)
    Class.A("User")()();
    classStereotypes.A("<<interface>>","<<home>>");
    A.nw=(0,0);
    drawObject(A);
endfig;

beginfig(6)
    save A;
    Class.A("User")()();
    A.info.iMethodStack.left := A.info.iMethodStack.right  := 50;
    A.info.iMethodStack.top  := A.info.iMethodStack.bottom := 20;

    drawObject(A);
endfig;

beginfig(7)
	save inter;
	EClass.inter(iInterface)("Observer")()("+update(src: Object)");
	drawObjects(inter);
endfig;

beginfig(8)
    save inter;
    EInterface.inter(iInterface)("Observer")("+update(src: Object)");
    drawObjects(inter);
endfig;

beginfig(9)
    save inter;
    Interface.inter("Observer")("+update(src: Object)");
    drawObjects(inter);
endfig;

beginfig(10)
    save A;
    EClass.A(iAbstractClass)("AbstractClass")("[]{}")("+update(src: Object)");
    drawObjects(A);
endfig;

beginfig(11)
    save A;
    AbstractClass.A("AbstractClass")("[]{}")("+update(src: Object)");
    drawObjects(A);
endfig;

beginfig(12)
	save A;
	EClass.A(iClassNameOnly)("AClassWithNoCompartments")()();
	drawObjects(A);	
endfig;

beginfig(13)
	save A;
	ClassName.A("AnotherClass");
	drawObjects(A);
endfig;

beginfig(14)
	save A;
	ClassName.A("AnotherClass");
	classStereotypes.A("<<interface>>","<<remote>>");
	
	drawObjects(A);
endfig;

end
