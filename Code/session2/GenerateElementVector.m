function fei = GenerateElementVector(x1,x2)
fei = [SourceFct(x1); SourceFct(x2)]*(x2-x1)/2;