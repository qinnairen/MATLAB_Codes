f = @(x) x.^3 ;
a = 1;
b = 2;

n = 8;

h = (b - a) / n;
h = h/2 ; 

integral = 0;

for i = 1:n
    
    integral = integral + h*f(a +(i-1)*h*2) + h*f(a+i*h*2);
end

disp(integral)

