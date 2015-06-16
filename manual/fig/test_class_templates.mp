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
     save P,template;
   
     Class.P("Person")()();
     Template.template("foo", "bar");
    
     drawObjectAt(P)(P.nw=(0,0));

     Template_attachToClass.template(P);
     drawObject(template);
endfig;

beginfig(2);
     save P,template;
   
     Class.P("Person")()();
     Template.template("foo: int");
     Template_attachToClass.template(P);
     
     drawObjectAt(P)(P.nw=(0,0));
     drawObject(template);
endfig;

beginfig(3);
  save CA, TA, CB, TB, CC, TC;
  Class.CA("VeryVeryLongClassName")()();
  ClassTemplate.TA("int foo")(CA);

  Class.CB("Shortie")("abracadabra: long long int")();
  ClassTemplate.TB("T")(CB);

  Class.CC("Shortie")("abracadabra: long long int")();
  ClassTemplate.TC("TrulyAmazingLongTypename")(CC);

  CA.s = CB.n + (0,14);
  CB.s = CC.n + (0,14);

  drawObjects(CA, TA, CB, TB, CC, TC);
endfig;

  

end
