f = @(x,y) y-x;
h = 0.1;
x_i = 0;
x_f = 1;
y_i = 0.5;



function y_values = runge_kutta_4th_order(x_i, y_i, h, f, x_f)
    num_steps = ((x_f - x_i) / h) ;  
    x_values = linspace(x_i, x_f, num_steps);  
    
    y_values = zeros(1, num_steps);  
    y_values(1) = y_i;  
    
    for i = 1:num_steps-1
        x = x_values(i);
        y = y_values(i);
        
        % Compute Runge-Kutta 4th order method
        k1 = f(x, y);
        k2 = f(x + h/2, y + k1*h/2);
        k3 = f(x + h/2, y + k2*h/2);
        k4 = f(x + h, y + k3*h);
        
        slope = (k1 + 2*k2 + 2*k3 + k4) / 6;
        y_values(i+1) = y + slope*h;
    end
    disp(y)
end
