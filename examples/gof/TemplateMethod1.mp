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
    Class.document("Document")()("+Read()");
    Class.myDocument("MyDocument")()("+Read()");

    Class.application("Application")()
                     ("+CreateDocument()", "+CanOpenDocument()", 
                      "+InitializeOpenDocument()", "+OpenDocument()");

    Class.myApplication("MyApplication")()
                       ("+CanOpenDocument()", "+InitializeOpenDocument()", "+CreateDocument()");

    application.w = document.e + (100, 0);
    myDocument.n = document.s - (0, 70);
    
    myApplication.top = myDocument.top;
    myApplication.midx = application.midx;

    drawObjects(document, application, myDocument, myApplication);

    clink(inheritance)(myDocument, document);
    clink(aggregationUni)(document, application);
    clink(inheritance)(myApplication, application);
endfig;

end
