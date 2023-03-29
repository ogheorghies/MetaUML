MetaUML is a [MetaPost](https://www.tug.org/metapost.html) library for creating UML diagrams, using a textual notation.

```
# Filename: example.mp
input metauml;
beginfig(1);
    Class.A("Point")("+x: int", "+y: int")();
    drawObject(A);
endfig;
end
```

```
mptopdf example.mp
```

For more information, see the [wiki](https://github.com/ogheorghies/MetaUML/wiki) and the [manual](https://github.com/ogheorghies/MetaUML/releases/download/v0.2.6/metauml-manual-v0.2.6-19d34de3da75cbd9f814f0a9ec03b4e0861b1541.pdf).

Unreleased features are documented in the manual, built locally as shown below.

# Development

Make sure that `make` and `docker` are installed, and that `docker ps` works.
```
git clone git@github.com:ogheorghies/MetaUML.git
cd MetaUML
make
```
