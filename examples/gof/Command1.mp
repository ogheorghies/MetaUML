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
    Class.application("Application")()("+add(d:Document)");
    Class.menu("Menu")()("+add(mi:MenuItem)");
    Class.menuItem("MenuItem")()("+onClick()");
    Class.command("Command")()("+execute()");
    Class.document("Document")()("+open()", "+close()", "+cut()", "+copy()");
    Class.paste("pasteCommand")()("+execute()");
    Class.open("OpenCommand")()("+execute()");

    Note.noteClick("onClick()", "{ command->execute(); }");
    Note.notePaste("execute()", "{ document->paste(); }");
    Note.noteOpen(
    "execute()",
    "{",
    "  name = askUser()",
    "  doc = new Document(name);",
    "  application->add(doc);",
    "  doc->open();",
    "}");

    menu.w = application.e + (50, 0);
    menuItem.w = menu.e + (50, 0);
    command.w = menuItem.e + (100, 0);
    document.nw = menu.sw - (0, 60);

    centered_allign_top(paste, open)(20, below(command.s, 70));

    noteClick.n = menuItem.s - (0, 20);
    notePaste.n = paste.sw - (0, 30);
    noteOpen.nw = notePaste.sw - (10, 30);

    drawObjects(application, menu, menuItem, command, document, paste, open, noteClick, notePaste, noteOpen);

    clink(aggregation)(menu, application);
    clink(aggregation)(menuItem, menu);
    clink(aggregation)(command, menuItem);
    link(aggregation)(pathStepX(document.w, application.s + (10, 0), -84));
    link(associationUni)(pathHorizontal(paste.w, document.right));

    link(inheritance)(pathStepY(paste.n, command.s, 30));
    link(inheritance)(pathStepY(open.n, command.s, 30));

    link(associationUni)(pathStepY(open.s - (5, 0), application.s - (10, 0), -65));

    clink(dashedLink)(noteClick, menuItem);
    clink(dashedLink)(notePaste, paste);
    link(dashedLink)(pathStepY(open.s + (10, 0), noteOpen.e, -100));
endfig;

end
