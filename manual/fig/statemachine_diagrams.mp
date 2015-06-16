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

% for f in `find . | grep '.*\.[1-9]'`; do echo $f; done

input metauml;

beginfig(1);
  Begin.b;
  State.on("On")();
  State.off("Off")();
  End.e;

  setObjectJoin(pb.w = pa.e + (20,0));
  joinObjects(b, on, off, e);
  drawObjects(b, on, off, e);

  clink(transition)(b, on);
  clink(transition)(on, off);
  clink(transition)(off, e);
endfig;

beginfig(2);
  save b, reading, processing, e, exit;
  
  Begin.b;
  State.reading("Commands read")();
  State.processing("Processing commands")();
  End.e;
  setObjectJoin(pb.n = pa.s + (0, -20));
  joinObjects(b, reading, processing, e);

  State.composite("Work")(b, reading, processing, e);
  drawObject(composite);

  clink(transition)(b, reading);
  clink(transition)(reading, processing);
  clink(transition)(processing, e);
  
  ExitPoint.exit;
  exit.c=(composite.right, reading.midy);
  drawObject(exit);
  item(iAssoc)("error")(obj.nw = exit.s);
    
  clink(transition)(reading, exit);
  
  State.error("Prepare error report")();
  State.result("Display result")();
  End.theEnd;
  
  error.midx = result.midx = theEnd.midx = composite.right + 90;
  error.midy = exit.midy;
  result.midy = processing.midy;
  theEnd.midy = e.midy;
  drawObjects(error, result, theEnd);

  clink(transition)(exit, error);
  clink(transition)(error, result);
  clink(transition)(result, theEnd);

  link(transition)(rpathHorizontal(result.w, composite.right));
endfig; 

end
