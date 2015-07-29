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

util_log_thresholdlevel := 100;

beginfig(1);
  PictureStackInfoCopy.stackWay(iStack);
  
  EPictureStack.emptyStack(stackWay)()("vcenter");
  emptyStack.nw=(10,10);
  drawObject(emptyStack);
endfig;

beginfig(2);
  PictureStack.myStack("foo")("vcenter");
  myStack.nw = (0,0);
  PictureStack_draw.myStack;
endfig;

beginfig(3);
  PictureStack.myStackB("foo", "bar")("vcenter");
  myStackB.nw = (0,0);
  PictureStack_draw.myStackB;
endfig;

beginfig(4);
  % 1
  PictureStack.stack("item A", "item B long", "C")("vcenter");
  stack.info.boxed := 1;
  stack.info.iPict.boxed := 1; % this does nothing, it's too late
  
  stack.nw = (0,0);
  drawObject(stack);

  % 2
  PictureStack.stackb("item A", "item B long", "C")("vcenter");
  stackb.info.boxed := 1;
  stackb.pict[0].info.boxed := 1;
  stackb.pict[2].info.boxed := 1;
  
  stackb.nw = (100,0);
  drawObject(stackb);

  % 3
  PictureStackInfoCopy.myInfo(iStack);
  myInfo.boxed := 1;
  myInfo.iPict.boxed := 1;
  EPictureStack.stackc(myInfo)("item A", "item B long", "C")("vcenter");

  stackc.nw = (200,0);
  drawObject(stackc);
endfig;

beginfig(5);
    vardef joinCallback= enddef;
    PictureStack.custom("A.A", "B__________B", "C-----C")
        ("joinCallback");
        
    drawObject(custom);
endfig;

beginfig(6);
    save custom;

    pickup pencircle scaled 4pt;
    drawdot origin;

    vardef joinCallbackA=
        setObjectJoin(pa.bottom = pb.top + index*10; pa.left = pb.left);
        setObjectJoinFirst(pa.nw = (30,0));
    enddef;

    PictureStack.customA("go", "further", "and further", "and further still")
        ("joinCallbackA");

    vardef joinCallbackB=
        setObjectJoin(pb.bottom = customA.pict[index].bottom; pb.midx = pa.midx);
        setObjectJoinFirst(pa.bottom = customA.pict[index].bottom);
    enddef;

    PictureStack.customB(".", "..", "...", "....")
        ("joinCallbackB");

    drawObjects(customA, customB);
endfig;

beginfig(7);
    save stackX;
    save stylePA, stylePB;
    save stylePictureStack;

    PictureInfoCopy.stylePA(iPict);
    stylePA.borderColor := green;
    stylePA.boxed := 1;

    PictureInfoCopy.stylePB(iPict);
    stylePB.borderColor := red;
    stylePB.boxed := 1;

    PictureStackInfoCopy.stylePictureStack(iStack);

    def styleSupplier(expr i)= if i mod 2 = 0: stylePA else: stylePB fi enddef;

    stylePictureStack.childStyleSupplier := "styleSupplier";

    EPictureStack.stackX(stylePictureStack)("a","b","c","d","e")("vcenter");

    drawObjects(stackX);
endfig;

end
