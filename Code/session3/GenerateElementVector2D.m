function fek = GenerateElementVector2D(x1,x2,x3)
Aek = polyarea([x1(1) x2(1) x3(1)],[x1(2) x2(2) x3(2)]);

fek = [SourceFct(x1(1),x1(2)) SourceFct(x2(1),x2(2)) SourceFct(x3(1),x3(2))]'*Aek/3;