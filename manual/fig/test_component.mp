input metauml;
input metauml_component;
input metauml_component_relations;

beginfig(1);
    Class.classA("Class A")()();
    Class.classB("Class B")()();

    Component.compA("Component A")();
    Component.compB("Component B")();
    Component.compC("Component C")(compA, compB, classA, classB);

    compB.w  = compA.e + (40, 0);
    classA.w = compB.e + (20, 0);
    classB.w = classA.e + (20, 0);

    drawObjects(compC);

    path open;
    open := compA.e .. compA.e + (20, 0);
    path close;

    close := compB.w .. compA.e + (20, 0);

    link(requiredInterface)(open);

    link(providedInterface)(close);
endfig;

end