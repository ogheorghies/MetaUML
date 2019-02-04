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
    Class.mediator("Mediator")()();
    Class.colleague("Colleague")()();
    Class.concreteM("ConcreteMediator")()();
    Class.concreteCA("ConcreteColleague1")()();
    Class.concreteCB("ConcreteColleague2")()();

    mediator.nw = (0, 0);
    colleague.w = mediator.e + (150, 0);
    concreteM.n = mediator.s - (0, 50);
    centered_allign_top(concreteCA, concreteCB)(10, below(colleague.s, 50));

    drawObjects(mediator, concreteM, colleague,  concreteCA, concreteCB);

    clink(inheritance)(concreteM, mediator);
    clink(associationUni)(colleague, mediator);
    link(inheritance)(pathStepY(concreteCA.n, colleague.s, 25));
    link(inheritance)(pathStepY(concreteCB.n, colleague.s, 25));

    link(associationUni)(pathStepY(concreteM.s, concreteCA.s, -20));
    link(associationUni)(pathStepY(concreteM.s - (10, 0), concreteCB.s, -40));
endfig;

end
