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
    Class.abstraction("Abstraction")()("+Operation()");
    Class.implementor("Implementor")()("+OperationImpl()");
    Class.redefined("RedefinedAbstraction")()();
    Class.concreteA("ConcreteImplementorA")()();
    Class.concreteB("ConcreteImplementorB")()();

    client.nw = (0, 0);
    abstraction.w = client.e + (70, 0);
    implementor.w = abstraction.e + (130, 0);

    centered_allign_top(concreteA, concreteB)(10, below(implementor.s, 40));

    redefined.top = concreteA.top;
    redefined.midx = abstraction.midx;

    drawObjects(client, abstraction, implementor, redefined, concreteA, concreteB);

    clink(associationUni)(client, abstraction);
    clink(aggregationUni)(implementor, abstraction);
    clink(inheritance)(redefined, abstraction);

    link(inheritance)(pathStepY(concreteA.n, implementor.s, 20));
    link(inheritance)(pathStepY(concreteB.n, implementor.s, 20));
endfig;

end
