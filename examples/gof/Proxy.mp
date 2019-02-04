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
    Class.subject("Subject")()("+Request()");
    Class.realSubject("RealSubject")()("+Request()");
    Class.proxy("Proxy")()("+Request()");

    Note.noteRequest("realSubject->Request");

    subject.w = client.e + (40, 0);
    centered_allign_top(realSubject, proxy)(40, below(subject.s, 50));

    noteRequest.sw = proxy.se + (30, 0);

    drawObjects(client, subject, realSubject, proxy, noteRequest);

    clink(associationUni)(client, subject);
    clink(associationUni)(proxy, realSubject);

    link(inheritance)(pathStepY(realSubject.n, subject.s, 20));
    link(inheritance)(pathStepY(proxy.n, subject.s, 20));

    link(dashedLink)(proxy.methodStack.pict[0].e -- noteRequest.w);
endfig;

end
