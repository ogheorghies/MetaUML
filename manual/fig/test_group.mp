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

input metauml;

beginfig(1);
   save p,q,r,t,g;

   EPicture.p(iPictBoxed)("p0");
   EPicture.q(iPictBoxed)("p1");
   p.se = q.nw;

   string f;
   f= enumToString(p,q)("");
   show "f=" & f;
   
   EGroup.g(iGroup)(p,q);
   g.nw = (0,0);

   drawObject(g);  
endfig;

beginfig(2);
  save g,h,p,gg;
  
  Group.g();
  g.info.boxed := 1;
  g.nw = (30,30);
  drawObject(g);

  Picture.p("Test picture in group");
  p.info.boxed := 1;
  Group.h(p);
  h.info.boxed := 1;
  h.nw = (0,0);
  drawObject(h);

  Picture.v0("s"); v0.info.boxed := 1;
  Picture.v1("s"); v1.info.boxed := 1;
  v1.nw = v0.se + (10,10);
  Group.gg(v0, v1); gg.info.boxed := 1;
  gg.nw = (70,70);
  drawObject(gg);
endfig;

end
