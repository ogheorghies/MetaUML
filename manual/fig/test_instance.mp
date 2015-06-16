% Part of the MetaUML manual.
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
    Instance.A(":Foo")("int: val1", "bool: val2");
    Instance.B(":Bar")("very long text for testing purposes");
    Instance.C("s: Student")("line1", "line2", "line3", "line4", "line5");
    Instance.D("Example")("small");
    Instance.E("g: Yummy")("{placed}", "{color=red}");
    
    B.w = A.e + (20, 0);
    C.n = A.s - (0, 20);
    D.w = C.e + (20, 0);
    E.w = D.e + (20, 0);
    
    drawObjects(A, B, C, D, E);
endfig;

end
