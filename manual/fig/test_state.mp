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
  EntryPoint.entry;
  ExitPoint.exit;

  entry.nw = (0,0);
  exit.nw = (50,50);

  drawObjects(entry, exit);
  clink(transition)(entry, exit);
endfig;

beginfig(2);
   EState.myState(iState)("The light is", "visibly on")();
   drawObject(myState);

   State.anotherState("Another nice state")();
   anotherState.info.drawNameLine := 1;
   drawObjectAt(anotherState)(anotherState.nw = (0,50));
endfig;

beginfig(3);
  State.interesting("Interesting state")();
  State_internalTransitions.interesting("OnEntry / doVeryHappy", "OnExit / doSomewhatSad");
  interesting.info.drawNameLine := 1;
   
  drawObject(interesting);
endfig;

beginfig(4);
  Begin.b;
  End.e;
  State.sa("A state")();
  State.sb("Another state")();
  setObjectJoin(pb.w = pa.e + (40, 0));
  joinObjects(b, sa, sb, e);
  
  State.composite("Composite state")(b, e, sa, sb);
  drawObject(composite);

  clink(transition)(b, sa);
  clink(transition)(sa, sb);
  clink(transition)(sb, e);
endfig;

beginfig(5);
endfig; 

beginfig(6);
endfig;

beginfig(7);
endfig;

end
