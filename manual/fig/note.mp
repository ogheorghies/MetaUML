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
input TEX;

beginfig(1);
    Note.A("This note", "has two lines.");
    drawObject(A);
endfig;

beginfig(2);
    save A, C;
    Note.A("This is a class");
    Class.C("Object")()();
    
    A.sw = C.ne + (20, 20);
    
    drawObjects(A, C);
    
    clink(dashedLink)(A, C);
endfig;
 
beginfig(3);
    save C;
    Note.nA("This is the class name");
    Note.nB("This is a key attribute");
    Note.nC("This is a nice method");
    
    Class.C("Object")("+id:int")
           ("+clone()", "+serialize()");

    topToBottom.left(10)(nA, nB, nC);
    leftToRight(10)(C, nB);
    
    drawObjects(C, nA, nB, nC);
    
    clink(dashedLink)(C.namePict, nA); 
    clink(dashedLink)(C.attributeStack.pict[0], nB); 
    clink(dashedLink)(C.methodStack.pict[1], nC); 
endfig;

beginfig(4);
    save A;
    Note.A("This class implements the formula:", 
           TEX("$\sum_1^n f(x)\cdot dx$"));
    drawObjects(A);
endfig;

beginfig(5);
    save A;
    Note.A("Can you do it?", 
           TEX("$\sum_1^n f(x) \cdot dx " &
               "\over \sum_1^m g(y) \cdot dy$"));
    A.stack.info.spacing := 30;
    A.stack.pict[1].info.ignoreNegativeBase := 0;
    drawObjects(A);
endfig;

end
