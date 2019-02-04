input metauml;

beginfig(1);
    Component.C("Business Logic")();
    drawObject(C);
endfig;

beginfig(2);
  save A, B, C, BigC;
  
  Class.A("A")()();
  Package.B("B")();
  Component.C("C")();
  
  Component.BigC("Big Component")(A, B, C);
  
  leftToRight(10)(A, B);
  topToBottom(10)(A, C);
  
  drawObject(BigC);
endfig;

beginfig(3);
  save A, B;
  Component.A("A")();
  Component.B("B")();
  
  leftToRight(80)(A, B);
  
  drawObjects(A, B);
  
  link(providedInterface)( A.e -- .5[A.e, B.w] );
endfig;

beginfig(4);
  save A, B;
  Component.A("A")();
  Component.B("B")();
  
  leftToRight(80)(A, B);
  
  drawObjects(A, B);
  
  link(requiredInterface)( B.w -- .5[A.e, B.w]);
endfig;

beginfig(5);
  save A, B;
  Component.A("A")();
  Component.B("B")();
  
  leftToRight(80)(A, B);
  
  drawObjects(A, B);
  
  link(providedInterface)( A.e -- .5[A.e, B.w] );
  link(requiredInterface)( B.w -- .5[A.e, B.w] );
endfig;


end
