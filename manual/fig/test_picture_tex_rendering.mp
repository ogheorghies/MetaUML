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

input TEX;

beginfig(1);
   PictureInfoCopy.myP(iPict);
   myP.boxed := 1;
   myP.ignoreNegativeBase := 1;
   
   EPicture.p(myP)( TEX("Hello, world $x=7$") );
   
   PictureStackInfoCopy.myPS(iStack);
   myPS.boxed := 1;
   myPS.iPict.boxed := 1;
   myPS.iPict.ignoreNegativeBase := 1;
   
   EPictureStack.ps(myPS)("Hello, world!", 
                           TEX("This is cool: $x=y$."),
                           TEX("But this is insane: $\sum_1^3 f(x) \over x$!") ) ("vleft");
   
   leftToRight(20)(p, ps);
   
   drawObjects(p, ps);
endfig;

end
