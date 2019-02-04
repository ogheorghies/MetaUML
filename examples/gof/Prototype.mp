% Part of the MetaUML Gallery of Patterns
% Copyright (C) 2005 Radu-George Radulescu
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
    Class.client("Client")()("+Operation()");
    Class.prototype("Prototype")()("+Clone()");
    Class.concretePA("ConcretePrototype1")()("+Clone()");
    Class.concretePB("ConcretePrototype2")()("+Clone()");

    Note.noteOperation("p = ", "prototype->Clone()");

    prototype.w = client.e + (110, 0);
    centered_allign_top(concretePA, concretePB)(10, below(prototype.s, 50));

    noteOperation.n = client.n - (0, 100);

    drawObjects(client, prototype, concretePA, concretePB, noteOperation);

    clink(associationUni)(client, prototype);

    link(inheritance)(pathStepY(concretePA.n, prototype.s, 20));
    link(inheritance)(pathStepY(concretePB.n, prototype.s, 20));

    link(dashedLink)(client.methodStack.pict[0].e -- noteOperation.ne - (20, 0));
endfig;

end
