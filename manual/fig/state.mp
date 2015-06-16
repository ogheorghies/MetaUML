% Sample MetaUML figures.
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
  State.s("Take order")();
  drawObject(s);
endfig;  

beginfig(2);
  Begin.b;
  End.e;
  State.c("Component")();
  State.composite("Composite")(b, e, c);
  
  b.midx = e.midx = c.midx;
  c.top = b.bottom - 20;
  e.top = c.bottom - 20;

  composite.info.drawNameLine := 1;
  drawObject(composite);

  link(transition)(b.s -- c.n);
  link(transition)(c.s -- e.n);
endfig;

beginfig(3);
  save s;
  State.s("An interesting state",
          "which is worth mentioning")();
  stateTransitions.s(
    "OnEntry / Open eyes",
    "OnExit  / Sleep well");
  s.info.drawNameLine := 1;
  
  drawObject(s);
endfig;

end
