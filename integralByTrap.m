f = @(x) sqrt(1+x.^2);

a = 1;
b = 5;

n = 1000;

h = (b - a) / n;
h = h/2 ; 

integral = 0;

for i = 1:n
    
    integral = integral + h*f(a +(i-1)*h*2) + h*f(a+i*h*2);
end

disp(integral)

