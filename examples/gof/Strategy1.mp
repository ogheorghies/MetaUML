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
    Class.sorter("Sorter")()("+MethodWithSort()");
    Class.sort("Sort")()("+Sort()");
    Class.quick("QuickSort")()();
    Class.heap("HeapSort")()();
    Class.naive("NaiveSort")()();

    Note.noteMethodWithSort("sort->Sort()");

    sort.w = sorter.e + (100, 0);
    quick.ne = sort.s - (35, 50);

    heap.top = quick.top;
    heap.midx = sort.midx;

    naive.nw = sort.s - (-35, 50);
    noteMethodWithSort.n = sorter.sw - (10, 20);

    drawObjects(sorter, sort, quick, heap, naive, noteMethodWithSort);

    clink(aggregationUni)(sort, sorter);
    link(inheritance)(pathStepY(quick.n, sort.s, 20));
    clink(inheritance)(heap, sort);
    link(inheritance)(pathStepY(naive.n, sort.s, 20));
    link(dashedLink)(sorter.methodStack.pict[0].w -- noteMethodWithSort.n);
endfig;

end
