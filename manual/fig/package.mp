input metauml;
input metauml_package;
input metauml_package_relations;

beginfig(1);
    Package.P("java.lang")();
    drawObject(P);
endfig;

beginfig(2);
    save P;
    Package.P("An important", "package")();
    drawObject(P);
endfig;

beginfig(3);
    save P;
    Package.P("java.lang")();
    P.info.forceEmptyContent := 1;
    drawObject(P);
endfig;

beginfig(4);
    save P, A, B;
    Class.A("A")()();
    Class.B("B")()();
    Package.P("net.metauml")(A, B);
    
    leftToRight(10)(A, B);
    
    drawObject(P);
endfig;

beginfig(5);
  Package.X("X")();
  Package.Y("Y")();

  leftToRight(50)(X, Y);
  drawObjects(X, Y);
  
  link(nest)(X.e -- Y.w);
endfig;

beginfig(8);
    Package.emptyPackage("")();

    Package.nameOnlyPackage("java.sun.com")();

    Class.oneClass("A class")()();
    Package.oneClassPackage("One class package")(oneClass);

    Instance.oneInstance("An instance")();
    State.oneState("A state")();
    Activity.oneActivity("An activity");
    Package.multiPackage("Multipackage")(oneInstance, oneState, oneActivity);

    Package.allPackage("This package contains them all")(emptyPackage, nameOnlyPackage,
                        oneClassPackage, multiPackage);

    nameOnlyPackage.nw = emptyPackage.ne + (30, 0);
    oneClassPackage.ne = emptyPackage.s - (0, 50);

    multiPackage.top  = oneClassPackage.top;
    multiPackage.left = oneClassPackage.right + 20;

    centered_align_top(oneState, oneActivity)(10, below(oneInstance.s, 20));

    drawObjects(allPackage);
endfig;

beginfig(8);
    Package.nameOnlyOnTopPackage("Name on top")();
    nameOnlyOnTopPackage.info.forceEmptyContent := 1;
    Package.nameOnlyInMiddlePackage("By default name", "is in the middle")();

    Class.cl("A class")("Attribute")("Method");
    Package.notEmptyPackage("Contains class")(cl);

    nameOnlyInMiddlePackage.n = nameOnlyOnTopPackage.s - (0, 40);
    notEmptyPackage.w = nameOnlyInMiddlePackage.e + (80, 0);
    drawObjects(nameOnlyOnTopPackage, nameOnlyInMiddlePackage, notEmptyPackage);

    %link(import)(pathStepX(notEmptyPackage.w, nameOnlyOnTopPackage.e, -30));
    %link(import)(pathVertical(nameOnlyInMiddlePackage.ne - (10, 0), nameOnlyOnTopPackage.bottom));
    %link(import)(notEmptyPackage.sw -- nameOnlyInMiddlePackage.ne);
endfig;

beginfig(8);
    link(nest)((10,10)--(30,30));
endfig;


end