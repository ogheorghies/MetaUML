% Copyright 2015 Ovidiu Gheorghies
% Licensed under the Apache License, Version 2.0.

input metauml;

beginfig(1);
    if not metauml_private_isAbstract(abstract "foo"):
        1 = 2;
    fi;

    if metauml_private_isAbstract("@abstracp"):
        1 = 2;
    fi;
endfig;

beginfig(2);
    if not metauml_private_isStatic(static "bar"):
        1 = 2;
    fi;

    if metauml_private_isStatic("@statique"):
        1 = 2;
    fi;
endfig;

beginfig(3);
    Class.A("A")
        ("+a:int+", static "+b:int")
        ("+f+():int", static "+g+():int", abstract "+h():int");
    Class_setDebugMode.A;
    drawObjects(A);
endfig;

beginfig(4);
    save A;
    Class.A("A")
        (static "-instanceCount:int")
        (static "+getInstanceCount():int", abstract "+work()");
    drawObjects(A);
endfig;

beginfig(5);
    save A, B;
    Class.A("A")()();
    Class.B(abstract "B")()();
    Class.C("C")()(abstract "foo()");
    
    leftToRight(5)(A, B, C);

    drawObjects(A, B, C);
endfig;

end
