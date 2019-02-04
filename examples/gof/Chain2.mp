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
    Class.handler("Handler")()("+handleRequest()");
    Class.concreteA("ConcreteHandler1")()();
    Class.concreteB("ConcreteHandler2")()("+handleRequest()");

    client.nw = (0, 0);
    handler.nw = client.se + (40, -5);
    centered_allign_top(concreteA, concreteB)(10, below(handler.s, 40));

    drawObjects(client, handler, concreteA, concreteB);

    link(associationUni)(pathStepY(client.s, handler.w, -21));

    path handlerHandler;
    handlerHandler := handler.e -- handler.e + (20, 0) -- handler.e + (20, 40) -- handler.n + (0, 24) -- handler.n;
    link(aggregation)(handlerHandler);

    link(inheritance)(pathStepY(concreteA.n, handler.s, 20));
    link(inheritance)(pathStepY(concreteB.n, handler.s, 20));

    item(iAssoc)("succesor")(obj.w = handler.e + (2, -5));
endfig;

end
