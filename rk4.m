f = @(x,y) y-x;
n = input("Enter n: ");
h = 0.1;
a = 0;
b = 0.5;
for i=1:n
    k1 = h*f(a,b);
    k2 = h*f(a+h/2,b+k1/2);
    k3 = h*f(a+h/2,b+k2/2);
    k4 = h*f(a+h/2,b+k3/2);
    a = a+h;
    b = b + (1./6).*(k1 + 2.*k2 + 2.*k3 + k4);
end
g = @(x) x+1-exp(x)/2;
disp(g(1))
disp(b)