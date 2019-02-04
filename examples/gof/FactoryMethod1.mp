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
    iGroup.boxed := 1;
    iGroup.borderColor := black;
    iPict.borderColor := black;

    Class.document("Document")()();
    Class.app("Application")()
             ("+CreateDocument()", "+newDocument()");
    Class.mydocument("MyDocument")()();
    Class.myapp("MyApplication")()
               ("+CreateDocument()");

    Picture.framework("Framework");
    Picture.application("Application");

    Note.noteNewDocument("Document* doc = ", "CreateDocument();", "// add doc to container");
    Note.noteCreateDocument("return new", "MyDocument()");

    Group.gA(document, app, framework);
    Group.gB(application, mydocument, myapp);

    framework.n = (0, 90);
    document.nw = framework.s - (100, 20);
    app.nw = document.ne + (80, 0);

    application.n = framework.s - (0, 110);
    mydocument.n = document.s - (0, 110);
    myapp.top = mydocument.top;
    myapp.midx = app.midx;

    noteNewDocument.w = gA.e + (20, 0);
    noteCreateDocument.w = gB.e + (20, 0);

    drawObjects(gA, gB, noteNewDocument, noteCreateDocument);

    link(aggregationUni)(pathHorizontal(document.e, app.left));
    clink(inheritance)(mydocument, document);
    clink(inheritance)(myapp, app);
    link(associationUni)(rpathHorizontal(mydocument.e, myapp.left));

    link(dashedLink)(app.methodStack.pict[1].e -- noteNewDocument.w);
    link(dashedLink)(myapp.methodStack.pict[0].e -- noteCreateDocument.w);
endfig;

end
