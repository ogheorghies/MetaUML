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

input metauml_note;
input metauml_base;
input metauml_paths;
input metauml_links;
input metauml_class_relations;

beginfig(1);
  Note.foo("This is the first line", "and this the second one.");
  drawObject(foo);
endfig;

beginfig(2);
  save foo;
  Note.foo("Please disregard this note.");
  Note.bar("Please take the other note", "very seriously.");

  bar.s = foo.n + (10,20);
  drawObjects(foo, bar);
  clink(dashedLink)(foo, bar);
endfig;

end
