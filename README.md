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

For more information, see the [wiki](https://github.com/ogheorghies/MetaUML/wiki) and the [manual](https://github.com/ogheorghies/MetaUML/releases/download/v0.2.6/metauml-manual-v0.2.6-19d34de3da75cbd9f814f0a9ec03b4e0861b1541.pdf). The documentation for newer features, not yet released, can be viewed after building the manual locally. 

# Development

```
sudo apt install texlive-metapost
mv /usr/share/texlive/texmf-dist/metapost/metauml /tmp/usr-share-texlive-texmf-dist-metapost-metauml

git clone git@github.com:ogheorghies/MetaUML.git

cd MetaUML
export MPINPUTS="${PWD}/src:"
```
