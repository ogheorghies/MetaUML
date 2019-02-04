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
    Class.context("Context")()("+ContextInterface()");
    Class.strategy("Strategy")()("+AlgorithmInterface()");
    Class.concreteA("ConcreteStrategyA")()();
    Class.concreteB("ConcreteStrategyB")()();

    strategy.w = context.e + (100, 0);
    centered_allign_top(concreteA, concreteB)(10, below(strategy.s, 50));

    drawObjects(context, strategy, concreteA, concreteB);

    clink(aggregationUni)(strategy, context);
    link(inheritance)(pathStepY(concreteA.n, strategy.s, 20));
    link(inheritance)(pathStepY(concreteB.n, strategy.s, 20));
endfig;

end
