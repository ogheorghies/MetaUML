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
    Class.context("Context")()("+Request()");
    Class.state("State")()("+Handle()");
    Class.concreteSA("ConcreteStateA")()();
    Class.concreteSB("ConcreteStateB")()();

    Note.noteRequest("state->Handle()");

    state.w = context.e + (100, 0);
    centered_allign_top(concreteSA, concreteSB)(10, below(state.s, 50));

    noteRequest.n = context.sw - (0, 40);

    drawObjects(context, state, concreteSA, concreteSB, noteRequest);

    clink(compositionUni)(state, context);
    link(inheritance)(pathStepY(concreteSA.n, state.s, 20));
    link(inheritance)(pathStepY(concreteSB.n, state.s, 20));
    link(dashedLink)(context.methodStack.pict[0].w -- noteRequest.n - (10, 0));
endfig;

end
