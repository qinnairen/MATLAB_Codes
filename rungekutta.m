f = @(x,y) y-x;
h = 0.1;
x_i = 0;
x_f = 1;
y_i = 0.5;
answer = runge_kutta_4th_order(x_i, y_i, h, f, x_f);
disp(answer)
g=@(x) x+1-exp(x)/2;
true=g(1);
error1=abs(answer-true);
disp(error1);


function value = runge_kutta_4th_order(x_i, y_i, h, f, x_f)
    x = x_i;
    y = y_i;
    while x < x_f
        k1 = f(x, y);
        ym = y + k1*h/2;
        
        k2 = f(x + h/2, ym);
        ym = y + k2*h/2;
        
        k3 = f(x + h/2, ym);
        ye = y + k3*h;
        
        k4 = f(x + h, ye);
        
        slope = (k1 + 2*k2 + 2*k3 + k4)/6;
        y = y + slope*h;
        
        x = x + h;
    end
   value = y ; 
end


