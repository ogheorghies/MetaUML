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
    Class.invoker("Invoker")()();
    Class.command("Command")()("+Execute()");
    Class.receiver("Receiver")()();
    Class.concreteC("ConcreteCommand")("+state")("+Execute()");

    Note.noteConcreteC("Execute()", "{receiver.Action();}");

    client.nw = (0, 0);
    invoker.w = client.e + (40, 0);
    command.w = invoker.e + (100, 0);
    receiver.nw = client.se - (-10, 70);
    concreteC.n = command.s - (0, 60);

    noteConcreteC.n = receiver.s + (20, -40);

    drawObjects(client, invoker, command, concreteC, receiver, noteConcreteC);

    clink(aggregationUni)(command, invoker);
    clink(inheritance)(concreteC, command);
    link(dependency)(pathStepY(client.s + (5, 0), concreteC.n - (25, 0), -30));
    link(associationUni)(pathStepY(client.s - (5, 0), receiver.w, -81));
    link(associationUni)(pathHorizontal(concreteC.w, receiver.right));
    link(dashedLink)(pathStepX(concreteC.sw + (0, 1), noteConcreteC.n, -112));

    item(iAssoc)("<<instantiates>>")(obj.w = client.se + (30, -25));
    item(iAssoc)("receiver")(obj.w = receiver.e + (25, 0));
endfig;

end
