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
    Class.director("Director")()("+Construct()");
    Class.builder("Builder")()("+BuildPart()");
    Class.concreteBuilder("ConcreteBuilder")()("+BuildPart()", "+GetResult()");
    Class.prod("Product")()();

    Note.noteConstruct(
    "for all objects in structure", 
    "    builder->BuildPart()");

    builder.w = director.e + (110, 0);
    concreteBuilder.n = builder.s - (0, 40);
    prod.w = concreteBuilder.e + (50, 0);
    noteConstruct.n = director.s - (0, 40);

    drawObjects(director, builder, concreteBuilder, prod, noteConstruct);

    clink(aggregationUni)(builder, director);
    clink(inheritance)(concreteBuilder, builder);
    clink(associationUni)(concreteBuilder, prod);
    link(dashedLink)(director.methodStack.pict[0].e -- noteConstruct.ne - (20, 0));
endfig;

end
