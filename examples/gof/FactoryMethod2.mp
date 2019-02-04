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
    Class.product("Product")()();
    Class.concreteP("ConcreteProduct")()();
    Class.creator("Creator")()("+FactoryMethod()", "+AnOperation()");
    Class.concreteC("ConcreteCreator")()("+FactoryMethod()");

    Note.noteAnOperation("product = ", "FactoryMethod()");
    Note.noteFactoryMethod("return new", "ConcreteProduct");

    product.nw = (0, 0);
    concreteP.n = product.s - (0, 70);
    creator.w   = product.e + (70, 0);

    concreteC.top  = concreteP.top;
    concreteC.midx = creator.midx;

    noteAnOperation.w   = creator.e + (50, 0);
    noteFactoryMethod.w = concreteC.e + (50, 0);

    drawObjects(product, concreteP, creator, concreteC, noteAnOperation, noteFactoryMethod);

    link(associationUni)(pathHorizontal(concreteC.w, concreteP.right));
    link(inheritance)(concreteC.n -- creator.s);
    link(inheritance)(concreteP.n -- product.s);

    %draw objectBox(creator.methodStack);
    %draw objectBox(creator.methodStack.pict[1]);
    %draw objectBox(concreteC.methodStack);
    %draw objectBox(concreteC.methodStack.pict[0]);

    link(dashedLink)(creator.methodStack.pict[1].e -- noteAnOperation.w);
    link(dashedLink)(concreteC.methodStack.pict[0].e -- noteFactoryMethod.w);
endfig;

end
