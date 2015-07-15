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
    Class.Client("Client")()();

    Class._Component("Component")()();
                   %("+Operation()", "+Add(Component)", "+Remove(Component)", "+GetChild(int)");
    classStereotype._Component("<<interface>>");

    Class.Leaf("Leaf")()("+Operation()");

    Class.Composite("Composite")()();
                   %("+Operation()", "+Add(Component)", "+Remove(Component)", "+GetChild(int)");

    leftToRight.top(30)(Client, _Component);
    leftToRight.top(20)(Leaf, Composite);
    .5[Leaf.ne, Composite.nw] = below(_Component.s, 45);

    drawObjects(Client, _Component, Leaf, Composite);

    link(associationUni)(pathHorizontal(Client.e, _Component.left));
    link(inheritance)(pathStepY(Leaf.n, _Component.s, 20));
    link(inheritance)(pathStepY(Composite.n, _Component.s, 20));

    link(aggregationUni)(pathStepX(_Component.e, Composite.e, 55));
endfig;

beginfig(2);
  Begin.b;
  Activity.eat("Eat something good", "from the kitchen");
  Branch.enough;
  Fork.fork("h", 50);
  Activity.read("Read a book");
  Activity.listen("Listen to music", "(and ignore it)");
  Fork.join("h", 50);
  End.e;

  leftToRight.top(10)(read, listen);
  Group.readListen(read, listen);

  leftToRight(30)(b, eat);
  topToBottom(20)(eat, enough, fork, readListen, join, e);

  drawObjects(b, eat, enough, fork, readListen, join, e);

  clink(transition)(b, eat);
  clink(transition)(eat, enough);
  link(transition)(pathStepX(enough.e, eat.e, 80));
  clink(transition)(enough, fork);
  clink(transition)(fork, read);
  clink(transition)(fork, listen);
  clink(transition)(read, join);
  clink(transition)(listen, join);
  clink(transition)(join, e);

  item(iGuard)("still hungry")(obj.sw = enough.e + (20, 0));
  item(iGuard)("had enough")(obj.nw = enough.s + (0, -4));
endfig;

beginfig(3);
  Actor.user("User");
  Actor.db("Database");

  Usecase.dbquery("Query database");
  Usecase.auth("Authenticate user");
  Usecase.authA("Authenticate by", "username, password");
  Usecase.authB("Authenticate by", "smartcard");

  leftToRight(30)(user.human, auth, dbquery, db.human);
  leftToRight.top(30)(authA, authB);
  .5[authA.ne, authB.nw] = below(auth.s, 20);

  drawObjects(user, auth, dbquery, db, authA, authB);

  clink(inheritance)(authA, auth);
  clink(inheritance)(authB, auth);
  clink(association)(auth, dbquery);
  clink(association)(user.human, auth);
  clink(association)(dbquery, db.human);
endfig;

beginfig(4);
  save b, e, reading, processing, composite, exit, error, result, theEnd;

  Begin.b;
  State.reading("Reading commands")();
  State.processing("Processing commands")();
  End.e;

  State.composite("Working")(b, reading, processing, e);
  composite.info.left := composite.info.right := 10;
  composite.info.drawNameLine := 1;

  topToBottom(20)(b, reading, processing, e);
  drawObject(composite);

  clink(transition)(b, reading);
  clink(transition)(reading, processing);
  clink(transition)(processing, e);

  ExitPoint.exit;
  exit.c=(composite.right, reading.midy);
  drawObject(exit);
  item(iAssoc)("error")(obj.nw = exit.s);

  clink(transition)(reading, exit);

  State.error("Preparing error report")();
  State.result("Writing result")();
  End.theEnd;

  topToBottom(20)(error, result, theEnd);
  leftToRight(30)(exit, error);

  drawObjects(error, result, theEnd);

  clink(transition)(exit, error);
  clink(transition)(error, result);
  clink(transition)(result, theEnd);

  link(transition)(rpathHorizontal(result.w, composite.right));
endfig; 


beginfig(5);
    save A, B;
    
    Note.A("An important", "UML note");
    Note.B("Another note");
    
    leftToRight(20)(A, B);
    drawObjects(A, B);
    
    clink(dashedLink)(A, B);
endfig;

beginfig(6);
    Class.A("A")()();
    Class.B("B")()();
    
    Package.pA("net.foo")();
    Package.pB("net.foo.bar")(A, B);
    
    leftToRight(20)(A, B);
    leftToRight(50)(pA, pB);
    
    drawObjects(A, B, pA, pB);
    
    clink(nest)(pB, pA);
endfig;

beginfig(7);
    save A;
    
    Class.A("MyClass")
       ("attr1: int", "attr2: int")
       ("method1(): void",
        "method2(): void");

    A.nw = (0, 0); % optional, implied
    drawObject(A);
endfig;

beginfig(8);
    save A, B;
    Class.A("A")()();
    Class.B("B")()();
    
    A.nw = (0,0);
    B.w = A.e + (20, 0);

    drawObjects(A, B);
endfig;

beginfig(9);
  save A, B;
  
  Class.A("A")()();
  Class.B("B")()();
  B.w = A.e + (20, 0);
  drawObjects(A, B);
  link(inheritance)(B.w -- A.e);
endfig;
end

end
