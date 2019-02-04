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
    Class.container("Container")()("+CreateIterator()", "+Append(i:Item)");
    Class.client("Client")()();
    Class.iterator("Iterator")()("+First()", "+Next()", "+isDone()", "+CurrentItem()");
    Class.list("List")()();
    Class.vector("Vector")()();
    Class.listIterator("ListIterator")()("+First()", "+Next()", "+isDone()", "+CurrentItem()");
    Class.vectorIterator("VectorIterator")()();

    client.w = container.e + (40, 0);
    iterator.w = client.e + (70, 0);
    centered_allign_top(list, vector)(15, below(container.s, 60));
    centered_allign_top(listIterator, vectorIterator)(20, below(iterator.s, 60));

    drawObjects(container, client, iterator, list, vector, listIterator, vectorIterator);

    clink(associationUni)(client, container);
    clink(associationUni)(client, iterator);

    link(inheritance)(pathStepY(list.n, container.s, 30));
    link(inheritance)(pathStepY(vector.n - (7, 0), container.s, 30));

    link(inheritance)(pathStepY(listIterator.n, iterator.s, 30));
    link(inheritance)(pathStepY(vectorIterator.n, iterator.s, 30));

    link(associationUni)(pathStepY(listIterator.s - (10, 0), list.s + (10, 0), -45));
    link(associationUni)(pathStepY(list.s - (10, 0), listIterator.s + (10, 0), -110));

    link(associationUni)(pathStepY(vector.s - (10, 0), vectorIterator.s + (10, 0), -125));
    link(associationUni)(pathStepY(vectorIterator.s - (10, 0), vector.s + (10, 0), -70));
endfig;

end
