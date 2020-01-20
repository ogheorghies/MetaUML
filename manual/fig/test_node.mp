input metauml;

beginfig(1);
  save A;

  Node.A("An empty Node")();

  drawObjects(A);
endfig;

beginfig(2);
  save A, B;

  Class.B("B")()();
  Node.A("A Node containing a class")(B);

  drawObjects(A);
endfig;

end
