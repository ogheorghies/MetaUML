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
    Class.target("Target")()("+Request()");
    Class.adaptee("Adaptee")()("+SpecificRequest()");
    Class.adapter("Adapter")()("+Request()");
    Note.noteRequest("adaptee->SpecificRequest()");

    client.nw = (0, 0);
    target.w = client.e + (50, 0);
    adaptee.w = target.e + (65, 0);
    adapter.nw = target.se - (-10, 40);
    noteRequest.nw = adapter.s + (20, -40);

    drawObjects(client, target, adaptee, adapter, noteRequest);

    clink(associationUni)(client, target);
    link(inheritance)(pathStepX(adapter.w, target.s, -38));
    link(inheritance)(pathStepX(adapter.e, adaptee.s, 44));

    link(dashedLink)(adapter.methodStack.pict[0].e -- noteRequest.nw + (15, 0));
endfig;

end
