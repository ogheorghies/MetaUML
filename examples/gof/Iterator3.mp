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
    Class.aggregate("Aggregate")()("+CreateIterator()");
    Class.client("Client")()();
    Class.iterator("Iterator")()("+First", "+Next()", "+IsDone()", "+CurrentItem()");
    Class.concreteAggregate("ConcreteAggregate")()("+CreateIterator()");
    Class.concreteIterator("ConcreteIterator")()();

    Note.noteCreateIterator("return new", "ConcreteIterator(this)");

    client.sw = aggregate.ne + (50, 10);
    iterator.nw = client.se + (60, 0);
    concreteAggregate.n = aggregate.s - (0, 60);

    concreteIterator.top = concreteAggregate.top;
    concreteIterator.midx = iterator.midx;

    noteCreateIterator.n = concreteAggregate.s - (0, 50);

    drawObjects(aggregate, client, iterator, concreteAggregate, concreteIterator, noteCreateIterator);

    clink(associationUni)(client, aggregate);
    clink(associationUni)(client, iterator);
    clink(inheritance)(concreteAggregate, aggregate);
    clink(inheritance)(concreteIterator, iterator);

    link(associationUni)(pathHorizontal(concreteIterator.nw - (0, 2), concreteAggregate.right));
    link(associationUni)(pathHorizontal(concreteAggregate.e - (0, 4), concreteIterator.left)); 

    link(dashedLink)(concreteAggregate.methodStack.pict[0].sw -- noteCreateIterator.n);
endfig;

end
