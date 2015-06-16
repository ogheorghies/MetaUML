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
  Usecase.U("Authenticate user",
            "by name, password");
  drawObject(U);
endfig;

beginfig(2);
  Actor.A("User");
  drawObject(A);
endfig;

beginfig(3);
  save A;
  
  Actor.A("Administrator");
  drawObject(A);
  draw A.nw -- A.ne -- A.se -- A.sw -- cycle;
  draw A.human.nw -- A.human.ne -- A.human.se -- A.human.sw -- cycle;
  
endfig;
  

end
