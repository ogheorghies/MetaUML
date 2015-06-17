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

For more information, see the [wiki](https://github.com/ogheorghies/MetaUML/wiki) and the [manual](https://github.com/ogheorghies/MetaUML/releases/download/v0.2.5/metauml_manual_0.2.5.pdf).
