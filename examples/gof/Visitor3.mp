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
    Class.program("Program")()();
    Class.node("Node")()
              ("+AcceptVisitor(v:Visitor)");
    Class.assignementNode("AssignementNode")()
                    ("+AcceptVisitor(v:Visitor)");
    Class.referenceNode("VariableReferenceNode")()
                  ("+AcceptVisitor(v:Visitor)");

    Note.noteAcceptVisitorA("v->VisitAssignementNode(this)");
    Note.noteAcceptVisitorB("v->VisitReferenceNode(this)");

    node.w = program.e + (70, 0);
    centered_allign_top(assignementNode, referenceNode)(10, below(node.s, 50));

    noteAcceptVisitorA.n = assignementNode.sw - (0, 40);
    noteAcceptVisitorB.n = referenceNode.s - (0, 40);

    drawObjects(program, node, assignementNode, referenceNode, noteAcceptVisitorA, noteAcceptVisitorB);

    link(aggregationUni)(node.w -- program.e);
    link(inheritance)(pathStepY(assignementNode.n, node.s, 20));
    link(inheritance)(pathStepY(referenceNode.n, node.s, 20));
    link(dashedLink)(assignementNode.methodStack.pict[0].w -- noteAcceptVisitorA.n);
    link(dashedLink)(referenceNode.methodStack.pict[0].w -- noteAcceptVisitorB.nw + (10, 0));
endfig;

end
