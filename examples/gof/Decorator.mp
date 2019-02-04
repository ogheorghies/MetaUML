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
    Class.component("Component")()("+Operation()");
    Class.concreteComp("ConcreteComponent")()();
    Class.decorator("Decorator")()("+Operation()");
    Class.concreteA("ConcreteDecoratorA")("-addedState")("+Operation()");
    Class.concreteB("ConcreteDecoratorB")()("+Operation()", "+AddedBehaviour()");

    Note.noteDecorator("component->Operation()");
    Note.noteConcreteB("Decorator::Operation()", "AddedBehaviour()");

    centered_allign_top(concreteComp, decorator)(20, below(component.s, 50));
    centered_allign_top(concreteA, concreteB)(20, below(decorator.s, 50));
    noteDecorator.nw = decorator.ne + (80, -5);
    noteConcreteB.w = concreteB.e + (50, -3);

    drawObjects(component, concreteComp, decorator, concreteA, concreteB, noteDecorator, noteConcreteB);

    link(inheritance)(pathStepY(concreteComp.n + (15, 0), component.s, 20));
    link(inheritance)(pathStepY(decorator.n, component.s, 20));

    link(aggregationUni)(pathStepX(component.e, decorator.e + (0, 10), 90));

    link(inheritance)(pathStepY(concreteA.n, decorator.s, 20));
    link(inheritance)(pathStepY(concreteB.n, decorator.s, 20));

    link(dashedLink)(decorator.methodStack.pict[0].e -- noteDecorator.w);
    link(dashedLink)(concreteB.methodStack.pict[0].e -- noteConcreteB.w);
endfig;

end
