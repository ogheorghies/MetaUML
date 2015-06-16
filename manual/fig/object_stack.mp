% Part of the MetaUML manual.
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

input boxes;
input util_commons;
input util_object;
input util_picture;


beginfig(1);
  iPict.ignoreNegativeBase := 1;
  iPict.boxed := 1;
  Picture.a0("yummy");
  Picture.a1("cool");
  Picture.a2("fool");
  
  a0.nw = (0,0);
  setObjectJoin(pa.sw = pb.nw);

  joinObjects(scantokens listArray(a)(3));  
  drawObjects(scantokens listArray(a)(3));
  
endfig;

beginfig(2);
endfig;

beginfig(3);
endfig;


end
