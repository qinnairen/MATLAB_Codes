f = @(x,y) y-x^2 +1 ; 
x_i = 0 ; 
x_f = 2 ; 
y_i = 0.5 ; 
h = 0.2 ; 
answer  = solve(f,x_i,x_f,y_i,h) ;
disp("Approximated Value of y(2) = ")
disp(answer) 
%% Heun's Method or RK Method of Order 2 
function heun = solve(f,x_i,x_f,y_i,h)
    x = x_i ; 
    y = y_i ;
    n = (x_f - x_i)/h ; 
    for i=1:n

    k1 = h*f(x,y);
    k2 = h*f(x+h,y+k1);  %These 'k's are recursively formed ; k_i depends on 
                         % k_i-1 and we kind of take a convex combination
                         % of these two so that our error further reduces 
                         % This is more efficient than the Euler's Method
    x = x+h;
    y = y + 0.5*(k1+k2);
    end
   heun = y ;
end


