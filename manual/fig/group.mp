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
input util_margins;
input util_group;

beginfig(1);
  iGroup.left:=20;
  iGroup.right:=15;
  iGroup.boxed:=1;
  iPict.boxed:=1;
  
  Picture.a("yummy");
  Picture.b("cool");
  Picture.c("fool");
  
  a.nw = (0,0);
  b.nw = (20,20);
  c.nw = (15, 40);
  
  Group.g(a, b, c);

  drawObjects(g);
endfig;

beginfig(2);
endfig;

beginfig(3);
endfig;


end
