x = linspace(-1,1,50) ; 
y = linspace(-2*pi, 2*pi, 50) ; 
[X,Y] = meshgrid(x,y) ;

z = exp(X+ 1i*Y) ; 
contour(X,Y,real(z))