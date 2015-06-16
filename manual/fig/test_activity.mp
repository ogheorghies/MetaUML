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
  Begin.b;
  End.e;

  e.n = (30,30);
  drawObject(b);
  show "Object b drawn";
  drawObject(e);

  link(associationUni)(pathCut(b,e)(b.c--e.c));
endfig;

beginfig(2);
  EActivity.act(iActivity)("go to school", "while singing");
  drawObject(act);

  Branch.br;
  br.nw = (50,50);
  drawObject(br);

  Fork.fork("h",30);
  fork.nw = (30,70);
  drawObject(fork);
endfig;
 
end

