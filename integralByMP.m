f = @(x) x.^2 + cos(x);

a = 0;
b = 4;

n = 100;

h = (b - a) / n;

integral = 0;

for i = 1:n
    midpoint = a + (i - 0.5) * h;
    
    integral = integral + f(midpoint) * h;
end

disp(integral)

