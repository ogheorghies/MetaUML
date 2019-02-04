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
    Class.originator("Originator")
                    ("SetMementor(Memento m)", "CreateMemento()")
                    ("state");

    Class.memento("Memento")("GetState()", "SetState()")("state");
    Class.care("CareTaker")()();

    Note.noteCreateMemento("return new Memento(state)");
    Note.noteSetMementor("state = m->GetState()");

    memento.nw = originator.ne + (60, 0);
    care.nw = memento.ne + (60, 0);

    noteCreateMemento.n = originator.s - (5, 10);
    noteSetMementor.nw = originator.se - (0, 10);

    drawObjects(originator, memento, care, noteCreateMemento, noteSetMementor);

    link(dependency)(pathHorizontal(originator.ne - (0, 7), memento.left));
    link(aggregationUni)(pathHorizontal(memento.ne - (0, 7), care.left));

    link(dashedLink)(originator.attributeStack.pict[1].e -- noteCreateMemento.ne - (20, 0));
    link(dashedLink)(originator.attributeStack.pict[0].e -- noteSetMementor.nw + (20, 0));
endfig;

end
