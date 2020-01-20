input metauml;

beginfig(1);
  save A;

  Artifact.A("An empty Artifact")();

  drawObjects(A);
endfig;

beginfig(2);
  save A, B;

  Class.B("B")()();
  Artifact.A("An Artifact containing a class")(B);

  drawObjects(A);
endfig;

end
