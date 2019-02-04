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
    Class.visitor("Visitor")()();
    Class.type("TypeCheckingVisitor")()();
    Class.writing("WritingVisitor")()();
    Class.code("CodeGeneratingVisitor")()
              ("+VisitAssignmentNode(n:AssignmentNode)",
               "+VisitVariableReferenceNode(n:VariableReferenceNode)",
               "+VisitOperationNode(n:OperationNode)");

    centered_allign_top(type, writing)(20, below(visitor.s, 50));
    code.n = visitor.s - (0, 120);

    drawObjects(visitor, type, writing, code);

    link(inheritance)(pathStepY(type.n + (10, 0), visitor.s, 20));
    link(inheritance)(pathStepY(writing.n, visitor.s, 20));
    clink(inheritance)(code, visitor);
endfig;

end
