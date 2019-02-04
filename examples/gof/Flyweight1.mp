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
    Class.state("State")()();
    Class.intrinsecState("IntrinsecState")()();
    Class.extrinsecState("ExtrinsecState")()();

    state.nw = (0, 0);
    centered_allign_top(intrinsecState, extrinsecState)(10, below(state.s, 50));

    drawObjects(state, intrinsecState, extrinsecState);

    link(aggregationUni)(pathStepY(intrinsecState.n, state.w, 61));
    link(aggregationUni)(pathStepY(extrinsecState.n, state.e, 61));

    link(inheritance)(pathStepY(intrinsecState.n + (15, 0), state.s, 20));
    link(inheritance)(pathStepY(extrinsecState.n - (15, 0), state.s, 20));
endfig;

end
