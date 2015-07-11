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

% util_log_thresholdlevel := 100;

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

beginfig(5)
    save A;
    Class.A("User5")()();
    classStereotypes.A("abc",".");
    Class_setDebugMode.A;

    A.nw=(0,0);
    drawObject(A);
endfig;
end
