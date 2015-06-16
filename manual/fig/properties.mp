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
  Class.Test("Test")("a1","a2","a3")("aLongMethod():void");

  Test.nw = (0,0);
  Class_draw.Test;

  dotlabel.ulft(btex nw etex, Test.nw);
  dotlabel.top(btex n etex, Test.n);
  dotlabel.urt(btex ne etex, Test.ne);
  dotlabel.rt(btex e etex, Test.e);
  dotlabel.lrt(btex se etex, Test.se);
  dotlabel.bot(btex s etex, Test.s);
  dotlabel.llft(btex sw etex, Test.sw);
  dotlabel.lft(btex w etex, Test.w);

  dotlabel.lft(btex c etex, Test.c);

  draw Test.nw - (50,0) -- Test.ne + (10,0);
  label.urt(btex top etex, Test.nw - (50,0));

  draw Test.sw - (50,0) -- Test.se + (10,0);
  label.lrt(btex bottom etex, Test.sw - (50,0));

  draw Test.nw + (0,10) -- Test.sw - (0, 50);
  label.bot(btex left etex, Test.sw - (0,50));

  draw Test.ne + (0,10) -- Test.se - (0, 50);
  label.bot(btex right etex, Test.se - (0,50));

  drawarrow Test.nw - (25,0) -- Test.sw - (25,0);
  label.lft(btex height etex, .5[Test.nw, Test.sw] - (25,0));

  drawarrow Test.sw - (0,25) -- Test.se - (0,25);
  label.bot(btex width etex, .5[Test.sw, Test.se] - (0,25));
endfig;


end
