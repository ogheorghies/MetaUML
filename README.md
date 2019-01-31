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

For more information, see the [wiki](https://github.com/ogheorghies/MetaUML/wiki) and the [manual](https://github.com/ogheorghies/MetaUML/releases/download/v0.2.5/metauml_manual_0.2.5.pdf).

# Development

```
sudo apt install texlive-metapost
git clone git@github.com:ogheorghies/MetaUML.git
sudo mv /usr/share/texlive/texmf-dist/metapost/metauml /tmp/metauml-old
sudo ln -svf ${PWD}/MetaUML/src /usr/share/texlive/texmf-dist/metapost/metauml
```
