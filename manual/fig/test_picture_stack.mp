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

string theFont;
theFont := "tyxtt";

beginfig(1);
  PictureStackInfoCopy.stackWay(iStack);
  
  EPictureStack.emptyStack(stackWay)()("vcenter");
  emptyStack.nw=(10,10);
  drawObject(emptyStack);
endfig;

beginfig(2);
  PictureStack.myStack("foo", "bar: int" infont theFont, "cool man" infont defaultfont, "nice")("vcenter");
  myStack.nw = (0,0);
  PictureStack_draw.myStack;
endfig;

beginfig(3);
  % 1
  PictureStack.stack("fooornika", "gar nichts", "nicelina")("vcenter");
  stack.info.boxed := 1;
  stack.info.iPict.boxed := 1; % this does nothing, it's too late
  
  stack.nw = (0,0);
  drawObject(stack);

  % 2
  PictureStack.stackb("fooornika", "gar nichts", "nicelina")("vcenter");
  stackb.info.boxed := 1;
  stackb.pict[0].info.boxed := 1;
  stackb.pict[2].info.boxed := 1;
  
  stackb.nw = (50,0);
  drawObject(stackb);

  % 3
  PictureStackInfoCopy.myInfo(iStack);
  myInfo.boxed := 1;
  myInfo.iPict.boxed := 1;
  EPictureStack.stackc(myInfo)("fooornika", "gar nichts", "nicelina")("vcenter");
  
  stackc.nw = (100,0);
  drawObject(stackc);
endfig;

beginfig(4);
    %
    
endfig;

end
