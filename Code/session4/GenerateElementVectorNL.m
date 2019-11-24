function fei = GenerateElementVectorNL(x1,x2,beta)
fei = [SourceFct(x1,beta); SourceFct(x2,beta)]*(x2-x1)/2;