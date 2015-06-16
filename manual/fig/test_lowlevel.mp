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
input util_infrastructure;

beginfig(1);
  show "Lowlevel test";
  %string foo;
  %foo := var_instruction(numeric) x, y;
  %show foo;
  %foo := foo & ";";
  %show foo;
  attributes(foo);
  _n_ := "foo";
  %scantokens foo;
  %string x;
  %x := str(numeric);
  var(numeric) x;

  label.top("nothing shown (intentionally)", (0,0));
endfig;

vardef _foo@#=
  attributes(@#);
  var(string) @#a[];
  @#a[0] := "fpp"; 
  @#a[1] := "gqq";
enddef;

% _foo.b; % not working

vardef _bar@#(text s)=
  attributes(@#);
  var(string) elements;
  @#elements := enumToString(s)("");
enddef;

beginfig(2);
  for f = scantokens "a, b, c":
    show f;
  endfor;
  _bar.xx(a, b, c, d);
  show xx.elements;
  for f = scantokens xx.elements:
    show f;
  endfor;
  label.top("nothing shown (intentionally)", (0,0));
endfig;
 
end

