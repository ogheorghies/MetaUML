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
    Class.subject("Subject")()
                 ("+Attach(o:Observer)", "+Detach(o:Observer)", "+Notify()");

    Class.observer("Observer")()("+Update()");
    classStereotypes.observer("<<interface>>");

    Class.concreteSubject("ConcreteSubject")("-subjectState")("+GetState()", "+SetState()");
    Class.concreteObserver("ConcreteObserver")("-observerState")("+Update()");

    Note.noteNotify("forall o in observer", "o->Update()");
    Note.noteGetState("return subjectState");
    Note.noteUpdate("observerState = ", "subject->GetState()");

    observer.w = subject.e + (90, 0);
    concreteSubject.n = subject.s - (0, 80);

    concreteObserver.top = concreteSubject.top;
    concreteObserver.midx = observer.midx;

    noteNotify.n = subject.se - (-20, 10);
    noteGetState.nw = concreteSubject.se - (0, 20);
    noteUpdate.nw = concreteObserver.e + (20, 1);

    drawObjects(subject, observer, concreteSubject, concreteObserver, noteNotify, noteGetState, noteUpdate);

    clink(associationUni)(subject, observer);
    link(associationUni)(pathHorizontal(concreteObserver.w, concreteSubject.right));

    clink(inheritance)(concreteSubject, subject);
    clink(inheritance)(concreteObserver, observer);

    link(dashedLink)(subject.methodStack.pict[2].e -- noteNotify.nw + (10, 0));
    link(dashedLink)(concreteSubject.methodStack.pict[0].e -- noteGetState.n - (10, 0));
    link(dashedLink)(pathHorizontal(concreteObserver.methodStack.pict[0].e, noteUpdate.left));

    item(iAssoc)("subject#1")(obj.w = concreteSubject.e + (15, 11));
endfig;

end
