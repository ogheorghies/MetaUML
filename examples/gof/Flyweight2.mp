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
    Class.factory("FlyweightFactory")()("+getFlyweight(key)");
    Class.flyweight("Flyweight")()("+Operation(es:ExtrinsecState)");
    Class.client("Client")()();
    Class.concreteF("ConcreteFlyweight")("-is:intrinsecState")();
    Class.concreteUF("ConcreteUnsharedFlyweight")("-as:allState")();

    Note.noteGetFlyweight(
    "if(flyweight[key] exists) { ",
    "     return existing flyweight",
    "}",
    "else{",
    "     create new flyweight",
    "     add it to pool",
    "     return the new flyweight",
    "}");

    flyweight.w = factory.e + (70, 0);
    client.n = factory.s - (0, 110);
    centered_allign_top(concreteF, concreteUF)(10, below(flyweight.s, 100));

    noteGetFlyweight.ne = factory.sw - (0, 40);

    drawObjects(factory, flyweight, client, concreteF, concreteUF, noteGetFlyweight);

    clink(aggregationUni)(flyweight, factory);
    clink(associationUni)(client, factory);

    link(inheritance)(pathStepY(concreteF.n, flyweight.s, 50));
    link(inheritance)(pathStepY(concreteUF.n - (20, 0), flyweight.s, 50));

    link(associationUni)(pathStepY(client.se - (5, 0), concreteF.s, -30));
    link(associationUni)(pathStepY(client.s, concreteUF.s, -50));

    link(dashedLink)(factory.methodStack.pict[0].sw -- noteGetFlyweight.n + (30, 0));
endfig;

end
