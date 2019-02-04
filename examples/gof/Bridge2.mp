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
    Class.shape("3DShape")()("+Draw()", "+DrawLine()");
    Class.cube("Cube")()();
    Class.prism("Prism")()();
    Class.pyramid("Pyramid")()();
    Class.implementation("3DImplementation")()();
    Class.DXI("DXImplementation")()();
    Class.OGLI("OGLImplementation")()();
    Class.directX("DirectX")()();
    Class.openGL("OpenGL")()();

    cube.ne = shape.sw - (0, 40);

    prism.top = cube.top;
    prism.midx = shape.midx;

    pyramid.nw = shape.se - (-0, 40);
    implementation.w = shape.e + (150, 0);
    centered_allign_top(DXI, OGLI)(20, below(implementation.s, 50));
    directX.n = DXI.s - (0, 40);

    openGL.top = directX.top;
    openGL.midx = OGLI.midx;

    drawObjects(shape, cube, prism, pyramid, implementation, DXI, OGLI, directX, openGL);

    link(inheritance)(pathStepY(cube.n, shape.s, 20));
    link(inheritance)(prism.n -- shape.s);
    link(inheritance)(pathStepY(pyramid.n, shape.s, 20));

    clink(aggregationUni)(implementation, shape);

    link(inheritance)(pathStepY(DXI.n, implementation.s, 20));
    link(inheritance)(pathStepY(OGLI.n, implementation.s, 20));

    clink(associationUni)(DXI, directX);
    clink(associationUni)(OGLI, openGL);
endfig;

end
