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

string theFont;

beginfig(1);
  theFont := "pcrr";

  boxjoin(a.sw=b.nw);

  boxit.ff(("Font name: ( ) " & theFont) infont theFont);
  boxit.s0("<<stereotype>> text with guillemets. ><>><<" infont theFont );
  boxit.s1("<<a>>, <<b>>, <<c>>" infont theFont);
  boxit.s2("[g uard] text with square brackets []]." infont theFont);
  boxit.s3("{c onstraint} text with curly brackets {}}." infont theFont);

  drawboxed(ff, s0, s1, s2, s3);
endfig;

beginfig(2);
  save ff,s,g,c;
  theFont := "tyxbtt";

  boxjoin(a.sw=b.nw);

  boxit.ff(("Font name: ( ) " & theFont) infont theFont);
  boxit.s0("<<stereotype>> text with guillemets. ><>><<" infont theFont );
  boxit.s1("<<a>>, <<b>>, <<c>>" infont theFont);
  boxit.s2("[g uard] text with square brackets []]." infont theFont);
  boxit.s3("{c onstraint} text with curly brackets {}}." infont theFont);

  drawboxed(ff, s0, s1, s2, s3);endfig;

beginfig(3);
  picture pA, pB, pC;
  string sA, sB, sC;
  sA := "assembleElementLocalMatrix(k: KeyType, mat: LocalMatrixType, a: AssembleAction)";
  sB := "assembleElementLocalMatri(k: KeyType, mat: LocalMatrixType, a: AssembleAction)";
  sC := "assembleElntLocalMatri(k: KeyType, mat: LocalMatrixType, a: AssembleAction)";

  pA := sA infont "tyxbtt";
  pB := sB infont "tyxbtt";
  pC := sC infont "tyxbtt";

  draw pA;
  draw pB shifted (0,-20);
  draw pC shifted (0,-40);
endfig;

beginfig(4);
  save ff,s,g,c;
  theFont := "ptmr8r";

  boxjoin(a.sw=b.nw);
  boxit.ff(("Font name: ( ) " & theFont) infont theFont);

  boxit.s0("<<stereotype>> text with guillemets. ><>><<" infont theFont );
  boxit.s1("<<a>>, <<b>>, <<c>>" infont theFont);
  boxit.s2("[g uard] text with square brackets []]." infont theFont);
  boxit.s3("{c onstraint} text with curly brackets {}}." infont theFont);

  drawboxed(ff, s0, s1, s2, s3);
endfig;

end
