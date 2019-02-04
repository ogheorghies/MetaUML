
input metauml;


beginfig(1);

    Class.rtf("RTFReader")()("+Parse()");
    Class.documentC("DocumentConverter")()
                   ("+ConvertParagraph( :char)", "+ConvertFont( :Font)", "+ConvertParagraph()");

    Class.asciiC("AsciiConverter")()();
    Class.asciiD("AsciiDocument")()();
    Class.texC("TexConverter")()();
    Class.texD("TexDocument")()();
    Class.htmlC("HtmlConverter")()();
    Class.htmlD("HtmlDocument")()();

    Note.noteParse(
    "while (t = get_next_token()) { ",
    "switch(t.Type)",
    "case CHAR:",
    "     builder->ConvertCharacter(t.asChar) break ",
    "case FONT:",
    "     builder->ConvertFontChange(t.asFont) break ",
    "case PARAGRAPH:",
    "     builder->ConvertParagraph()",
    "}");


    noteParse.n = rtf.s - (-70, 60);

    documentC.w = rtf.e + (300, 0);

    asciiC.n = documentC.sw - (15, 60);


    texC.top = asciiC.top;

    texC.midx = documentC.midx;


    htmlC.n = documentC.se - (-15, 60);

    asciiD.n = asciiC.s - (0, 50);


    texD.top = asciiD.top;

    texD.midx = texC.midx;


    htmlD.top = texD.top;

    htmlD.midx = htmlC.midx;


    drawObjects(rtf, noteParse, documentC, asciiC, asciiD, texC, texD, htmlC, htmlD);


    clink(aggregationUni)(documentC, rtf);


    link(inheritance)(pathStepY(asciiC.n, documentC.s, 20));

    clink(inheritance)(texC, documentC);

    link(inheritance)(pathStepY(htmlC.n, documentC.s, 20));


    clink(associationUni)(asciiC, asciiD);

    clink(associationUni)(texC, texD);

    clink(associationUni)(htmlC, htmlD);


    link(dashedLink)(noteParse.n - (20, 0) -- rtf.methodStack.pict[0].e);

endfig;


end

end
