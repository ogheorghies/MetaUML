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
  boxit.a ("yummy");
  boxit.b ("cool");
 
  a.nw = (0,0);
  b.sw = a.se + (10,0);

  drawboxed (a, b);
  draw a.sw -- b.se dashed evenly withpen pencircle scaled 1.1;

  boxit.c ("yummy");
  boxit.d ("cool");

  c.nw = (0,-20);
  d.sw = c.se + (10,0);

  drawunboxed (c, d);
  draw c.sw -- d.se dashed evenly withpen pencircle scaled 1.1;  
endfig;

beginfig(2);
  save a, b, c, d;
  
  Picture.a("yummy");
  Picture.b("cool");
  a.info.boxed := b.info.boxed := 1;
  
  a.nw = (0,0);
  b.sw = a.se + (10,0);

  drawObjects(a, b);
  draw a.sw -- b.se dashed evenly withpen pencircle scaled 1.1;
  
  Picture.c("yummy");
  Picture.d("cool");
  
  c.nw = (0,-20);
  d.sw = c.se + (10,0);

  drawObjects(c, d);
  draw c.sw -- d.se dashed evenly withpen pencircle scaled 1.1;
endfig;

beginfig(3);
  save a, b, c, d;

  iPict.ignoreNegativeBase := 1;
  
  Picture.a("yummy");
  Picture.b("cool");
  a.info.boxed := b.info.boxed := 1;
  
  a.nw = (0,0);
  b.sw = a.se + (10,0);

  drawObjects(a, b);
  draw a.sw -- b.se dashed evenly withpen pencircle scaled 1.1;
  
  Picture.c("yummy");
  Picture.d("cool");
  
  c.nw = (0,-20);
  d.sw = c.se + (10,0);

  drawObjects(c, d);
  draw c.sw -- d.se dashed evenly withpen pencircle scaled 1.1;  
endfig;


end
