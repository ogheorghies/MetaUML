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

% for f in `find . | grep '.*\.[1-9]'`; do echo $f; done

input metauml;

beginfig(1);
  Begin.b;
  Activity.eat("Eat something good", "from the kitchen");
  Branch.enough;
  Fork.fork("h", 50);
  Activity.read("Read a book");
  Activity.listen("Listen to music", "(and ignore it)");
  Fork.join("h", 50);
  End.e;
  
  eat.n  = b.s + (0,-20);
  enough.n = eat.s + (0,-20);
  fork.n = enough.s + (0, -20);
  
  read.top = listen.top = fork.bottom - 30;
  listen.left - read.right = 10;
  b.midx = .5[listen.left, read.right];

  join.n = (b.midx, listen.bottom - 20);
  e.n = join.s + (0, -20);
  
  drawObjects(b, eat, enough, fork, read, listen, join, e);

  clink(transition)(b, eat);
  clink(transition)(eat, enough);
  link(transition)(pathStepX(enough.w, eat.w, -80));
  clink(transition)(enough, fork);
  clink(transition)(fork, read);
  clink(transition)(fork, listen);
  clink(transition)(read, join);
  clink(transition)(listen, join);
  clink(transition)(join, e);

  item(iGuard)("still hungry")(obj.se = enough.w + (-20, 0));
  item(iGuard)("had enough")(obj.nw = enough.s + (0, -4));
endfig;

end
