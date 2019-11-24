function fexact = ExactSolu(xi,alpha)
if nargin == 1
    alpha=0;
end
fexact = -(xi-1).^2.*sin(pi.*xi)+alpha.*xi;