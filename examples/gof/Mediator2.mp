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
    Class.button("Button")()();

    entry.nw = (0, 0);
    radioA.sw = entry.ne + (30, 30);
    radioB.nw = radioA.se + (20, -20);
    list.nw = radioB.s - (0, 20);
    button.nw = entry.se - (0, 40);

    drawObjects(entry, radioA, radioB, list, button);

    link(association)(entry.n + (10, 0) -- radioA.s - (10, 0));
    link(association)(entry.s + (10, 0) -- button.n - (10, 0));
    link(association)(entry.e + (0, 5) -- radioB.w);
    link(association)(entry.e - (0, 5) -- list.w);
    link(association)(radioB.n - (10, 0) -- radioA.s + (10, 0));
    link(association)(button.n -- radioA.s);
    link(association)(button.n + (5, 0) -- radioB.s - (10, 0));
    link(association)(list.sw + (3, 0) -- button.n + (10, 0));
    link(association)(radioB.s + (5, 0) -- list.n);
endfig;

end
