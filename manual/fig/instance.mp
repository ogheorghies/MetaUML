input metauml;

beginfig(1);
    Instance.order("o: Order")
        ("name='book'", "{placed}", "{paid}");
    drawObject(order);
endfig;

end
