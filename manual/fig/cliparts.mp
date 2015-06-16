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

%vardef Foo(text southeast)(text width)(text  height)=
% e eroare daca e 'se' pentru ca inlocuieste in
% qqq.se

vardef Foo(expr _se, _width, _height)=
    
  Picture.ppp("foo");
  drawObjectAt(ppp)(ppp.nw = (0,0));
  
  save qqq;
  Lock.qqq("base");
  qqq.se = (0,0);
  drawObject (qqq);
enddef;
 

beginfig(1);
%  drawLockLocked((0,10), (6,0));
%  drawLockUnlocked((50,10), (56,0));
%  drawLockBase((25,10), (31,0));
%  show w;

  numeric a, b;
  path x;
  a= 10;
  b = 20;
  x = (a,a)--(b,b);
  draw x;

  Lock.lock("opened");
  drawObjectAt(lock)(lock.nw =(0,0));

  Lock.lockB("closed");
  drawObjectAt(lockB)(lockB.nw=(20,0));

  Lock.lockC("base");
  drawObjectAt(lockC)(lockC.nw=(40,0));

  ELock.otherLock(iLock)("closed");
  drawObjectAt(otherLock)(otherLock.nw = (60,0));

  LockInfo.iLockMy(30, 30, .55, .15, .55, .4white, .6white, .7white, .3white);
  save foo;
  ELock.foo(iLockMy)("opened");
  foo.se = (100,0);
  drawObject(foo);

  pair q;
  q := (30,30);
  %Foo( q ) (20)( 20);
  Foo( (0,0),1,3);
endfig;
  
end
