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

beginfig(1);
  Class.Count("Count")
    ("#n: int")
    ("+increase(): void",
     "+get(): int");
   
  %Count.nw = (0,0);
  drawObject(Count);
  %Class_draw.Count; 
endfig;

beginfig(2);
  Class.A("Point")
  ("+x: int",
   "+y: int") ();

  Class.B("Circle")
  ("radius: int")
  ("+getRadius(): int",
   "+setRadius(r: int):void");

  A.nw = (0,0);
  B.n = A.s - (0,45);
  Class_draw.A;
  Class_draw.B;

  drawRelation(aggregationUni)(A.s -- B.n);
endfig;

beginfig(3);
  Class.Test("Test")("a1","a2","a3")("aLongMethod():void");

  Test.nw = (0,0);
  Class_draw.Test;

  dotlabel.ulft(btex nw etex, Test.nw);
  dotlabel.top(btex n etex, Test.n);
  dotlabel.urt(btex ne etex, Test.ne);
  dotlabel.rt(btex e etex, Test.e);
  dotlabel.lrt(btex se etex, Test.se);
  dotlabel.bot(btex s etex, Test.s);
  dotlabel.llft(btex sw etex, Test.sw);
  dotlabel.lft(btex w etex, Test.w);

  dotlabel.lft(btex c etex, Test.c);

  draw Test.nw - (50,0) -- Test.ne + (10,0);
  label.urt(btex top etex, Test.nw - (50,0));

  draw Test.sw - (50,0) -- Test.se + (10,0);
  label.lrt(btex bottom etex, Test.sw - (50,0));

  draw Test.nw + (0,10) -- Test.sw - (0, 50);
  label.bot(btex left etex, Test.sw - (0,50));

  draw Test.ne + (0,10) -- Test.se - (0, 50);
  label.bot(btex right etex, Test.se - (0,50));

  drawarrow Test.nw - (25,0) -- Test.sw - (25,0);
  label.lft(btex height etex, .5[Test.nw, Test.sw] - (25,0));

  drawarrow Test.sw - (0,25) -- Test.se - (0,25);
  label.bot(btex width etex, .5[Test.sw, Test.se] - (0,25));
endfig;

%newAssociationDescription.association;
%newAssociationUniDescription.associationUni;
%newInheritanceDescription.inheritance;
%newAggregationDescription.aggregation;
%newAggregationUniDescription.aggregationUni;
%newCompositionDescription.composition;
%newCompositionUniDescription.compositionUni;
%newDashedLinkDescription.dashedLink;
%newDependencyDescription.dependency;

beginfig(4);
  save X, Y;
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(association)(X.e -- Y.w);
endfig;

beginfig(5);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(associationUni)(X.e -- Y.w);
endfig;

beginfig(6);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(inheritance)(X.e -- Y.w);
endfig;

beginfig(7);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(aggregation)(X.e -- Y.w);
endfig;

beginfig(8);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(aggregationUni)(X.e -- Y.w);
endfig;

beginfig(9);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(composition)(X.e -- Y.w);
endfig;

beginfig(10);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(compositionUni)(X.e -- Y.w);
endfig;

beginfig(11);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(dependency)(X.e -- Y.w);
endfig;

beginfig(12);
  save X, Y; 
  Class.X("X")()();
  Class.Y("Y")()();

  X.nw =  (0,0);
  Y.w = X.e + (50,0);
  Class_draw.X;
  Class_draw.Y;

  drawRelation(realization)(X.e -- Y.w);
endfig;

end
