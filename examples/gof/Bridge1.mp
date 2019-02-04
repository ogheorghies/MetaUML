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
    Class.shape("3DShape")()("+Draw()");
    Class.cube("Cube")()();
    Class.prism("Prism")()();
    Class.pyramid("Pyramid")()();
    Class.cubeDX("CubeDX")()();
    Class.cubeOGL("CubeOGL")()();
    Class.prismDX("PrismDX")()();
    Class.prismOGL("PrismOGL")()();
    Class.pyramidDX("PyramidDX")()();
    Class.pyramidOGL("PyramidOGL")()();
    Class.directX("DirectX")()();
    Class.openGL("OpenGL")()();

    cube.ne = shape.sw - (60, 40);

    prism.top = cube.top;
    prism.midx = shape.midx;

    pyramid.nw = shape.se - (-60, 40);
    cubeDX.n = cube.sw - (25, 40);
    cubeOGL.w = cubeDX.e + (5, 0);
    prismDX.w = cubeOGL.e + (5, 0);
    prismOGL.w = prismDX.e + (5, 0);
    pyramidDX.nw = prismOGL.ne + (5, 0);
    pyramidOGL.nw = pyramidDX.ne + (5, 0);
    directX.n = cubeOGL.se - (0, 60);
    openGL.nw = prismOGL.sw - (-5, 60);

    drawObjects(shape, cube, prism, pyramid, cubeDX, cubeOGL, prismDX, prismOGL, pyramidDX, pyramidOGL, directX, openGL);

    link(inheritance)(pathStepY(cube.n, shape.s, 20));
    link(inheritance)(prism.n -- shape.s);
    link(inheritance)(pathStepY(pyramid.n, shape.s, 20));

    link(inheritance)(pathStepY(cubeDX.n, cube.s, 20));
    link(inheritance)(pathStepY(cubeOGL.n, cube.s, 20));

    link(inheritance)(pathStepY(prismDX.n, prism.s, 20));
    link(inheritance)(pathStepY(prismOGL.n, prism.s, 20));

    link(inheritance)(pathStepY(pyramidDX.n, pyramid.s, 20));
    link(inheritance)(pathStepY(pyramidOGL.n, pyramid.s, 20));

    link(associationUni)(cubeDX.s -- directX.n - (10, 0));
    link(associationUni)(prismDX.s -- directX.n);
    link(associationUni)(pyramidDX.s -- directX.n + (10, 0));
    link(associationUni)(cubeOGL.s -- openGL.n - (10, 0));
    link(associationUni)(prismOGL.s -- openGL.n);
    link(associationUni)(pyramidOGL.s -- openGL.n + (10, 0));
endfig;

end
