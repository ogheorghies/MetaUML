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
   save P,qa;
   
   Class.P("Person")()();
   QualifiedAssociation.qa("accountNumber:int", "foo: id");

   P.nw = (0,0);
   qa.n = P.s;


   P.info.iName.left := 35;
   P.info.iName.right := 35;
   drawObjects(P);

   drawObject(qa);
endfig;

beginfig(2);
  save P,qa;
   
  Class.P("Person")()();
  QualifiedAssociation.qa("accountNumber:int", "foo: id", "foolang");
  
  P.nw = (0,0);
  qa.w = P.e;

  P.info.shade := 0;
  P.info.iMethodStack.top := 20;
  drawObjects(P);
  
  drawObject(qa);
endfig;

end
