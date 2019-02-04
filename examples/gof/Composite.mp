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
    Class.client("Client")()();
    Class.component("Component")()
                   ("+Operation()", "+Add(c:Component)", "+Remove(c:Component)", "+GetChild(i:int)");

    Class.leaf("Leaf")()("+Operation()");
    Class.composite("Composite")()("+Operation()");

    Note.noteOperation("for all c:child", "c->Operation()");

    client.nw = (0, 0);
    component.w = client.e + (30, 0);
    centered_allign_top(leaf, composite)(10, below(component.s, 50));
    noteOperation.nw = composite.ne + (50, 0);

    drawObjects(client, component, leaf, composite, noteOperation);

    clink(associationUni)(client, component);
    link(inheritance)(pathStepY(leaf.n, component.s, 25));
    link(inheritance)(pathStepY(composite.n, component.s, 25));
    link(aggregationUni)(pathStepX(component.e, composite.e + (0, 10), 50));
    link(dashedLink)(composite.methodStack.pict[0].e -- noteOperation.w);

    item(iAssoc)("child")(obj.w = component.e + (15, -5));
endfig;

end
