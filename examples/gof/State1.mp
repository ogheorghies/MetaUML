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
    Class.TCPConnection("TCPConnection")()
                       ("+Open()", "+Close()", "+Acknowledge()");
    Class.TCPState("TCPState")()
                  ("+Open()", "+Close()", "+Acknowledge()");

    Class.established("TCPEstablished")()();
    Class.listen("TCPListen")()();
    Class.closed("TCPClosed")()();

    Note.noteOpen("state->Open()");

    TCPState.w = TCPConnection.e + (150, 0);
    established.ne = TCPState.s - (35, 50);

    listen.top = established.top;
    listen.midx = TCPState.midx;

    closed.nw = TCPState.s - (-35, 50);

    noteOpen.n = TCPConnection.sw - (0, 50);

    drawObjects(TCPConnection, TCPState, established, listen, closed, noteOpen);

    clink(compositionUni)(TCPState, TCPConnection);
    link(inheritance)(pathStepY(established.n, TCPState.s, 20));
    clink(inheritance)(listen, TCPState);
    link(inheritance)(pathStepY(closed.n, TCPState.s, 20));

    link(dashedLink)(TCPConnection.methodStack.pict[0].w - (9, 0)-- noteOpen.nw + (10, 0));
endfig;

end
