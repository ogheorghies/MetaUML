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
    Class.visitor("Visitor")()
                 ("+VisitConcreteElementA(c:ConcreteElementA)",
                  "+VisitConcreteElementB(c:ConcreteElementB)");
    Class.concreteVisitorA("ConcreteVisitor1")()();
    Class.concreteVisitorB("ConcreteVisitor2")()();
    Class.objectS("ObjectStructure")()();
    Class.element("Element")()("+AcceptVisitor(v:Visitor)");
    Class.concreteElementA("ConcreteElementA")()("+AcceptVisitor(v:Visitor)");
    Class.concreteElementB("ConcreteElementB")()("+AcceptVisitor(v:Visitor)");

    Note.noteAcceptVisitorA("v->VisitConcreteElementA(this)");
    Note.noteAcceptVisitorB("v->VisitConcreteElementB(this)");

    visitor.w = client.e + (150, 0);
    objectS.n = client.s - (0, 120);
    centered_allign_top(concreteVisitorA, concreteVisitorB)(20, below(visitor.s, 50));
    
    element.top = objectS.top;
    element.midx = visitor.midx;

    centered_allign_top(concreteElementA, concreteElementB)(20, below(element.s, 50));

    noteAcceptVisitorA.n = concreteElementA.sw - (0, 40);
    noteAcceptVisitorB.n = concreteElementB.s - (0, 40);

    drawObjects(client, visitor, concreteVisitorA, concreteVisitorB, objectS, element, concreteElementA, 
                concreteElementB, noteAcceptVisitorA, noteAcceptVisitorB);

    clink(associationUni)(client, visitor);
    clink(associationUni)(client, objectS);

    link(inheritance)(pathStepY(concreteVisitorA.n, visitor.s, 20));
    link(inheritance)(pathStepY(concreteVisitorB.n, visitor.s, 20));

    link(aggregationUni)(pathHorizontal(element.w + (0, 5), objectS.right));

    link(inheritance)(pathStepY(concreteElementA.n, element.s, 20));
    link(inheritance)(pathStepY(concreteElementB.n, element.s, 20));

    link(dashedLink)(concreteElementA.methodStack.pict[0].w -- noteAcceptVisitorA.n - (20, 0));
    link(dashedLink)(concreteElementB.methodStack.pict[0].w -- noteAcceptVisitorB.nw + (10, 0));
endfig;

end
