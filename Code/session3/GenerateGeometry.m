function domainPlot = GenerateGeometry(xMin,xMax,yMin,yMax)
% Can be given only 1 string arg with geometry (ex: 'squareg')
if nargin == 1
    domain = xMin;
elseif nargin == 4
    domain = decsg([3;4;xMin;xMax;xMax;xMin;yMin;yMin;yMax;yMax]);
else
    error('Wrong number of args in GenerateGeometry!');
end

domainPlot = pdegplot(domain);