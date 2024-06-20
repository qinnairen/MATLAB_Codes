clear all;
clc;
a = input("a: ");
b = input("b: ");
n = input("n: ");

ans = integrate(a , b , n);
disp(ans);

function res = integrate(a , b , n);
    sum = 0;
    h = (b - a) / n;
    for k = 0 : (n - 1) 
        x1 = a + k * h;
        x2 = x1 + h;
        quad = quadratic(x1 , x2);
        sum = sum + q_area(x1 , x2 , quad);
    end
    res = sum;
end

function res1 = f(x)
    res1 = x^3;
end

function res2 = quadratic(a , b)
   x1 = a;
   x2 = (a + b) / 2;
   x3 = b;
   A = [x1^2 x1 1 ; x2^2 x2 1 ; x3^2 x3 1];
   B = [f(x1) ; f(x2) ; f(x3)];
   I = [1 0 0 ; 0 1 0 ; 0 0 1];
   Q = (I/A) * B;
   res2 = Q;
end

function res3 = q_area(x1 , x2 , p) 
    res3 = (p(1) * (((x2 ^ 3) - (x1 ^ 3)) / 3)) + (p(2) * (((x2 ^ 2) - (x1 ^ 2)) / 2)) + (p(3) * (x2 - x1));
end