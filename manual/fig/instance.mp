input metauml;

beginfig(1);
    Instance.order("o: Order")
        ("name='book'", "{placed}", "{payed}");
    drawObject(order);
endfig;

end