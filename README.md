MetaUML is a [MetaPost](https://www.tug.org/metapost.html) library for creating UML diagrams, using a textual notation.

```
# Filename: example.mp
input metauml;
beginfig(1);
    Class.A("Point")("+x: int", "+y:int")();
    drawObject(A);
endfig;
end
```

```
mptopdf example.mp
```

[Try online here](http://metauml.denksoft.com/) by loading one of the available examples.
