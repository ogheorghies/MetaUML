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
  Begin.b;
  End.e;
  FlowFinal.f;

  leftToRight(20)(b, e, f);

  drawObjects(b, e, f);
endfig;  

beginfig(2);
  Activity.A("Learn MetaUML -",
             "the MetaPost UML library");
  drawObject(A);
endfig;

beginfig(3);
    Fork.forkA("h", 50);
    Fork.forkB("v", 20);
    
    leftToRight(10)(forkA, forkB);
    
    drawObjects(forkA, forkB);
endfig;

beginfig(4);
    Branch.testA;

    drawObject(testA);
endfig;

end
