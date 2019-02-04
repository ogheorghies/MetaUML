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
    iPict.boxed := 1;
    iPict.borderColor := (.0, .9, .9);

    Class.node("Node")()("+TypeCheck()", "+GenerateCode()", "+Write()");
    Class.referenceNode("VariableReferenceNode")()();
    Class.assignementNode("AssignementNode")()();
    Class.operationNode("OperationNode")()();

    %Picture.noteMixedCode("MIXED CODE");

    referenceNode.ne = node.sw - (10, 50);

    assignementNode.top = referenceNode.top;
    assignementNode.midx = node.midx;

    operationNode.nw = node.se - (-10, 50);
    %noteMixedCode.w = node.se;

    drawObjects(node, referenceNode, assignementNode, operationNode);

    link(inheritance)(pathStepY(referenceNode.n, node.s, 20));
    clink(inheritance)(assignementNode, node);
    link(inheritance)(pathStepY(operationNode.n, node.s, 20));
endfig;

end
