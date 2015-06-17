% Part of the MetaUML Gallery of Patterns
% Copyright (C) 2005 Ovidiu Gheorghies
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
    Class.factory("AbstractFactory")()
                 ("+CreateProductA()", "+CreateProductB()");
    classStereotypes.factory("<<interface>>");

    Class.concreteA("ConcreteFactory1")()
                   ("+CreateProductA()", "+CreateProductB()");
    Class.concreteB("ConcreteFactory2")()
                   ("+CreateProductA()", "+CreateProductB()");

    Class.client("Client")()();
    Class.abstractA("AbstractProductA")()();
    Class.productAa("ProductA1")()();
    Class.productAb("ProductA2")()();
    Class.abstractB("AbstractProductB")()();
    Class.productBa("ProductB1")()();
    Class.productBb("ProductB2")()();

    abstractA.info.foreColor := productAa.info.foreColor := productAb.info.foreColor := yellow;
    abstractB.info.foreColor := productBa.info.foreColor := productBb.info.foreColor := (.0, .9, .9);

    client.w = factory.e + (200,0);
    centered_allign_top(concreteA, concreteB)(30, below(factory.s, 50));
    centered_allign_top(abstractA, abstractB)(40, below(client.s, 40));
    centered_allign_top(productAa, productAb)(5,  below(abstractA.s, 30));
    centered_allign_top(productBa, productBb)(5,  below(abstractB.s, 30));

    drawObjects(factory, concreteA, concreteB, client, abstractA, abstractB, productAa, productAb, productBa, productBb);

    clink(associationUni)(client, factory);
    link(inheritance)(pathStepY(concreteA.n, factory.s, 20));
    link(inheritance)(pathStepY(concreteB.n, factory.s, 20));
    clink(associationUni)(client, abstractA);
    clink(associationUni)(client, abstractB);
    link(inheritance)(pathStepY(productAa.n, abstractA.s, 10));
    link(inheritance)(pathStepY(productAb.n, abstractA.s, 10));
    link(inheritance)(pathStepY(productBa.n, abstractB.s, 10));
    link(inheritance)(pathStepY(productBb.n, abstractB.s, 10));

    link(associationUni)(pathStepY(concreteA.s - (5,0), productAa.s, -60));
    link(associationUni)(pathStepY(concreteA.s + (5,0), productBa.s, -70));

    link(associationUni)(pathStepY(concreteB.s - (5,0), productAb.s, -30));
    link(associationUni)(pathStepY(concreteB.s + (5,0), productBb.s, -40));endfig;

end
