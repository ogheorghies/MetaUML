% Part of the MetaUML Gallery of Patterns
% Copyright (C) 2005 Radu-George Radulescu
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
    Class.command("Command")()("+execute()");
    Class.macro("MacroCommand")()("+execute()");

    Note.noteMacro(
    "execute()",
    "{",
    "     for all c in commands",
    "            c->execute();",
    "}");

    macro.n = command.s - (0, 40);
    noteMacro.n = macro.s - (0, 40);

    drawObjects(command, macro, noteMacro);

    clink(inheritance)(macro, command);
    link(aggregation)(pathStepX(command.e, macro.e, 30));
    clink(dashedLink)(macro, noteMacro);

    item(iAssoc)("commands")(obj.w = command.e + (3, 3));
endfig;

end
