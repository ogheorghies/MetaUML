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
   save P,B;

   Class.P("Person")()();
   Class.B("Bank")()();

   P.nw = (0,0);
   B.w = P.e + (50,0);

   drawObjects(P, B);

   drawRelation(association)(P.e -- B.w);

   item.assocName(iAssoc)("works for")(assocName.s = .5[P.e,B.w]);

   draw assocName.n -- (assocName.n + (20,20));
   label.urt("association name" infont "tyxtt", assocName.n + (20,20));
endfig;

beginfig(2);
    save P,C;

    Class.P("Person")()();
    Class.C("Company")()();

    C.n = P.s + (0, -70);
    drawObjects(P, C);

    link(association)(P.s -- C.n);

    item(iAssoc)("employee")(obj.nw = P.s);
    item(iAssoc)("1..*")(obj.ne = P.s);

    item(iAssoc)("employer")(obj.sw = C.n);
    item(iAssoc)("0..*")(obj.se = C.n);

    item(iAssoc)("works for")(obj.w = .5[P.s,C.n]);
endfig;

beginfig(3);
    save F, O;

    Class.F("Factory")()();
    Class.O("Object")()();

    O.n = F.s - (0, 50);
    drawObjects(F, O);

    clink(dependency)(F, O);
    item(iStereo)("<<creates>>")(obj.w = .5[F.s,O.n])
endfig;

end
