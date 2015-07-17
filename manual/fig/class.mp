% Sample MetaUML figures.
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
  Class.A("Point")
    ("#x:int", 
     "#y:int")
    ("+set(x:int, y:int)",
     "+getX():int",
     "+getY():int",
     "-debug():void",
     "test():void");
  drawObject(A);
endfig;

beginfig(2);
  save A, T;
  
  Class.A("User")()();
  Class_stereotypes.A("<<interface>>", "<<home>>");

  drawObject(A);
endfig;

beginfig(3);
  save A, T;
  
  Class.A("Vector")()();
  ClassTemplate.T("T", "size: int")(A);

  drawObjects(A, T);
endfig;
  
beginfig(4);
  link(association)( (0,0) -- (50,0) );
endfig;

beginfig(5);
  link(associationUni)( (0,0) -- (50,0) );
endfig;

beginfig(6);
  link(inheritance)( (0,0) -- (50,0) );
endfig;

beginfig(7);
  link(aggregation)( (0,0) -- (50,0) );
endfig;

beginfig(8);
  link(aggregationUni)( (0,0) -- (50,0) );
endfig;

beginfig(9);
  link(composition)( (0,0) -- (50,0) );
endfig;

beginfig(10);
  link(compositionUni)( (0,0) -- (50,0) );
endfig;

beginfig(11);
    save A;
    Interface.A("Observer")
        ("+update(src:Object)");

    drawObject(A);
endfig;

beginfig(12);
    save A;
    EClass.A(iAbstractClass)("Observable")
        ("observers: Observer[0..*]")
        ("+addObserver(o: Observer)",
         "+notify()");

    drawObject(A);
endfig;

beginfig(13)
  save A;

  Class.A("MyModel")()();
  A.info.iName.top    := 10;
  A.info.iName.bottom := 10;
  A.info.iAttributeStack.top := 0;
  A.info.iAttributeStack.bottom := 0;
  A.info.iMethodStack.top := 0;
  A.info.iMethodStack.bottom := 0;

  drawObject(A);
endfig;

beginfig(14)
  save A, B;

  EClass.A(iClassNameOnly)("MyModel")()();
  ClassName.B("AnotherModel");
  classStereotypes.B("<<smart>>");

  topToBottom(20)(A, B);

  drawObjects(A, B);
endfig;

beginfig(15);
  save A;

  Class.A("Point")
    ("#x:int", "#y:int")
    ("+toString():String");
  Class_noVisibilityMarkers.A;

  drawObject(A);
endfig;

end
