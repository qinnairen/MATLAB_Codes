f = @(x,y) y-x^2 +1 ; 
x_i = 0 ; 
x_f = 2 ; 
y_i = 0.5 ; 
h = 0.2 ; 
n = 10 ; 
y = y_i ; 
x = x_i ;
for i = 1:n 
     y = y + h*f(x,y);
     x = x + h ;  
end
disp(y)