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
    Class.entry("EntryField")()();
    Class.radioA("RadioBox")()();
    Class.radioB("RadioBox")()();
    Class.list("ListBox")()();
    Class.font("FontDialogDirector")()();
    Class.button("Button")()();

    entry.nw = (0, 0);
    radioA.w = entry.ne + (20, 0);
    radioB.w = radioA.ne + (20, -5);
    list.nw = radioB.se + (20, 0);
    font.n = radioA.se - (0, 40);
    button.n = font.s - (5, 40);

    drawObjects(entry, radioA, radioB, list, font, button);

    link(association)(radioA.s -- font.n - (5, 0));
    link(association)(radioB.s -- font.n + (5, 0));
    link(association)(font.s -- button.n);

    link(association)(pathStepY(entry.s, font.w, -40));
    link(association)(pathStepY(list.s, font.e, -35));
endfig;

end
