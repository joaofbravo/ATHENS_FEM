function fsource = SourceFct(xi)
fsource = 2*sin(pi.*xi) + 4*pi*cos(pi.*xi).*(xi-1)-pi^2*sin(pi.*xi).*(xi-1).^2;