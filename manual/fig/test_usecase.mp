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

HumanInfoCopy.iDwarf(iHuman);
iDwarf.width := 60;
iDwarf.height :=  20;
iDwarf.foreColor := blue;
iDwarf.shadeColor := .8blue;

beginfig(1);
  Human.h;
  drawObject(h);
  draw objectBox(h);

  Human.h1;
  h1.n =  (35, 0);
  h1.info.foreColor := red;
  drawObject(h1);

  Human.h2;
  h2.info.height := 90;
  h2.nw = (50,0);
  drawObject(h2);
  draw objectBox(h2);

  EHuman.d(iDwarf);
  drawObjectAt(d)(d.s = (10,-50));

  EHuman.d2(iDwarf);
  d2.info.shadeColor := red;
  drawObjectAt(d2)(d2.s = (10,-80));
endfig;

beginfig(2);
  save a,b;

  Actor.a("foo");
  drawObject(a);

  Actor.b("Actor line one", "and line two");
  Actor_setDebugMode.b;
  b.n = (70,0);
  drawObject(b);
endfig;

beginfig(3);
  Usecase.u("foo");
  drawObject(u);

  draw objectBox(u) withpen pencircle scaled .1;

  draw u.n withpen pencircle scaled 2 withcolor red;
  draw u.s withpen pencircle scaled 2 withcolor red;
  draw u.e withpen pencircle scaled 2 withcolor red;
  draw u.w withpen pencircle scaled 2 withcolor red;

  draw u.ulft withpen pencircle scaled 2 withcolor blue;
  draw u.urt withpen pencircle scaled 2 withcolor blue;
  draw u.llft withpen pencircle scaled 2 withcolor blue;
  draw u.lrt withpen pencircle scaled 2 withcolor blue;

  Usecase.login("Log in for an eagerly", "awaiting user", "which spans well into a very long 3rd line.");
  login.s = (0, 5);
  drawObject(login);

  Usecase.t("Line 1 goo bar", "Line 2");
  t.s = login.n + (0,10);
  drawObject(t);

  Usecase.q("Line 1 abcdefg hij", "abcde", "Line 3 abc def ghe jkl", "Line 4 x");
  q.s = t.n + (0,10);
  drawObject(q);

endfig;

beginfig(4);
    Actor.userA("User A2", "line 2", "line 3 long long long");
    % Any Actor object is made of two sub-objects: nameStack and human.
    % Each individual picture in the nameStack can be configured individually.
    %
    % However, it is not possible to configure all the lines in the nameStack at
    % once now, saying something like:
    %
    % userA.nameStack.info.iPict.iFont.scale := 3;
    %
    % This happens because the information above is copied into the Picture objects
    % in the Actor constructor (and it is useless to modify it afterwards).
    %
    % If you do want to make such global modifications of the settings, see the
    % next two examples.

    userA.nameStack.pict[0].info.iFont.scale := 1.2;
    userA.nameStack.pict[1].info.iFont.scale := .7;
    userA.nameStack.info.borderColor := blue;
    userA.nameStack.info.boxed := 1;
    userA.nameStack.group.info.left := 30;
    userA.nameStack.group.info.right := 5;
    userA.human.info.foreColor := red;

    drawObject(userA);
    %draw objectBox(userA.nameStack);
    %draw objectBox(userA.human);
endfig;

beginfig(5);
    save userA;
    % If you want to have preset a info for specific objects

    ActorInfoCopy.iBig(iActor);

    % ActorInfo contains info-s for two objects
    % iNameStack: for the stack representing the actor's name
    % iHuman:     for the little human

    iBig.iNameStack.iPict.iFont.scale := 3;
    iBig.iNameStack.spacing := 25;
    iBig.iHuman.height := 25;

    EActor.userA(iBig)("User A", "Specifically configured");
    drawObject(userA);
endfig;

beginfig(6);
    save userA;

    iActor.iNameStack.iPict.iFont.scale := 2;
    iActor.iNameStack.spacing := 18;

    Actor.userA("User A", "Globally configured");
    drawObject(userA);
endfig;

beginfig(7);
  save usecaseA;
  Usecase.usecaseA("A highly customizable", "usecase. Foo bar!");
  usecaseA.info.iNameStack.iPict.iFont.scale := .5;
  drawObject(usecaseA);
endfig;

beginfig(8);
  save usecaseA;
  Usecase.usecaseA("A highly customizable", "usecase. Foo bar 2!");
  usecaseA.info.iNameStack.iPict.iFont.scale := 1.1;
  usecaseA.info.foreColor := red;
  usecaseA.info.borderColor := blue;
  usecaseA.info.iShade.background := green;
  usecaseA.info.iShade.shift := 4;
  drawObject(usecaseA);
endfig;

beginfig(9);
  save usecaseA;
  UsecaseInfoCopy.iMyUsecase(iUsecase);
  iMyUsecase.iNameStack.iPict.iFont.scale := .6;
  iMyUsecase.iNameStack.spacing := 5;
  iMyUsecase.foreColor := green;
  iMyUsecase.iShade.background := red;

  EUsecase.usecaseA(iMyUsecase)("A highly ", " customizable usecase.");
  EUsecase.usecaseB(iMyUsecase)("Another very ", " customizable usecase.");

  usecaseB.info.iShade.background := green;

  leftToRight(20)(usecaseA, usecaseB);
  drawObjects(usecaseA, usecaseB);
endfig;

end

