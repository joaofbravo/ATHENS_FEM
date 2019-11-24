function Tei = GenerateElementTensorNL(x1,x2)
Tei=ones(4,2);
Tei(1,1) = 3;
Tei(4,2) = 3;
Tei=Tei/(12*(x2-x1));