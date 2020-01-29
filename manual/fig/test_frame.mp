input metauml;

beginfig(1);
  save A;

  Frame.A("An empty component Frame")("cmp")();

  drawObjects(A);
endfig;

beginfig(2);
  save A, B;

  Class.B("B")()();
  Frame.A("A class Frame containing a class")("class")(B);

  drawObjects(A);
endfig;

end
