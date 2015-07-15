input metauml;

numeric u;
u = 1.3cm;

beginfig(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Class.ElLocSysAcc("ElementLocalSystemAcceptor")
()
("+startElementAssebly()", 
 "+assembleElementLocalMatrix(k: KeyType, mat: LocalMatrixType, a: AssembleAction)",
 "+assembleElementLocalRHS(k: KeyType, rhs: LocalRHSType, a: AssembleAction)", 
 "+endElementAssembly()");

classStereotypes.ElLocSysAcc("<<interface>>");
ClassTemplate.TEl("KeyType: typename")(ElLocSysAcc);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 Class.FaceLocSysAcc("FaceLocalSystemAcceptor")
 ()
 ("+startFaceAssebly()", 
  "+assembleFaceLocalMatrix(k1: KeyType, k2: KeyType, mat: LocalMatrixType, a: AssembleAction)",
  "+assembleFaceLocalRHS(k: KeyType, rhs: LocalRHSType, a: AssembleAction)", 
  "+endFaceAssembly()");

 classStereotypes.FaceLocSysAcc("<<interface>>");
 ClassTemplate.TFa("KeyType: typename")(FaceLocSysAcc);

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 Class.SolProvider("SolutionProvider")
 ()
 ("+startSortBack()", 
  "+getLocalSolution(k: KeyType, sol: LocalSolutionType)",
  "+endSortBack()");

 classStereotypes.SolProvider("<<interface>>");
 ClassTemplate.TSol("KeyType: typename")(SolProvider);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 % now inherit from these for LapackMatrixSorter
 Class.LapackMS("LapackMatrixSorter")
 ("-indMan: IndexManager",
  "-A: LaGenMatDouble&",
  "-x: LaVectorDouble&",
  "-b: LaVectorDouble&"
 )
 ("+startElementAssembly()");

 ClassTemplate.TLap("KeyType: typename", "IndexManager: class")(LapackMS);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% where to draw these:
FaceLocSysAcc.nw = ElLocSysAcc.ne + (1.5u, 0);
SolProvider.nw = FaceLocSysAcc.ne + (1.5u, 0);
LapackMS.n = FaceLocSysAcc.s + (0, -3u);

drawObjects(ElLocSysAcc, TEl, FaceLocSysAcc, TFa, 
  SolProvider, TSol, LapackMS, TLap);

% 50: how much should the path raise upwards before making a horizontal turn.
link(inheritance)(pathStepY(LapackMS.n, FaceLocSysAcc.s, 50));
link(inheritance)(pathStepY(LapackMS.n, SolProvider.s, 50));
link(inheritance)(pathStepY(LapackMS.n, ElLocSysAcc.s, 50));

endfig;

beginfig(2);
  Begin.b;
  Activity.A("Activity A", "on line two");
  Activity.B("Activity B");
  End.e;

  % or other positioning code...
  setObjectJoin(pa.s = pb.n + (0,20));
  joinObjects(b, A, B, e);

  % important: first draw the activities
  drawObjects(b, A, B, e);

  % you can now draw the transitions
  clink(transition)(b, A);
  clink(transition)(A, B);
  link(transition)(pathStepX(B.e, e.e, 30));

  item(iGuard)("guard")(obj.sw = .5[b.s, A.n]);
endfig;

end;
