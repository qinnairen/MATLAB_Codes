f = @(x,y) y-x;
n = input("Enter n: ");
h = 0.1;
a = 0;
b = 0.5;
for i=1:n
    k1 = h*f(a,b);
    k2 = h*f(a+h,b+k1);
    a = a+h;
    b = b + 0.5.*(k1+k2);
end
g = @(x) x+1-exp(x)/2;
disp(g(1))
disp(b)