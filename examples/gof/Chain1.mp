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
    Class.help("HelpHandler")()("+handleHelp()");
    Class.application("Application")()();
    Class.widget("Widget")()();
    Class.dialog("Dialog")()();
    Class.button("Button")()("+handleHelp()", "+showHelp()");

    Note.noteHandler("handler->handleHelp()");
    Note.noteButton(
    "if(can handle) { ",
    "        showHelp();",
    "}else{",
    "        handler->handleHelp();",
    "}");

    centered_allign_top(application, widget)(40, below(help.s, 40));
    centered_allign_top(dialog, button)(10, below(widget.s, 40));
    noteButton.w = button.ne + (40, 0);
    noteHandler.w = help.e + (50, -10);

    drawObjects(help, noteHandler, application, widget, dialog, button, noteButton);

    path helpHelp;
    helpHelp := help.e -- help.e + (20, 0) -- help.e + (20, 40) -- help.n + (0, 24) -- help.n;
    link(aggregation)(helpHelp);

    link(inheritance)(pathStepY(application.n + (5, 0), help.s, 20));
    link(inheritance)(pathStepY(widget.n, help.s, 20));

    link(inheritance)(pathStepY(dialog.n, widget.s, 20));
    link(inheritance)(pathStepY(button.n - (15, 0), widget.s, 20));

    link(dashedLink)(help.methodStack.pict[0].e -- noteHandler.w + (0, 1));
    link(dashedLink)(pathStepY(button.ne - (2, 0), noteButton.w + (0, 10), 10));

    item(iAssoc)("handler")(obj.w = help.e + (7, 5));
endfig;

end
