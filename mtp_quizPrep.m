%% Euler Method

%f = @(x,y) y - x ; %this is the derivative function given 
%x_i = 0 ; 
%x_f = 1 ;
%h = 0.05 ; 
%y_i = 0.5 ; 
%actual = @(x) x+1-exp(x)./2;
%answer = solve(f,x_i, x_f, h, y_i) ; 
%disp(answer) 

%function answer = solve(f,x_i, x_f, h, y_i) 
 %     n = (x_f - x_i)/h ;
 %     x = x_i ; 
  %    y = y_i ;
   %   for i = 1:n 
    %      y = y + h*f(x,y) ; 
     %     x = x + h ;
      %end
      %answer = y; 
%end

%% Midpoint Integral 
g = @(x) x.^2 + cos(x);
a = 0 ; 
b = 4; 
n = 100 ; 
h = (b-a)/n  ; 
integral = 0 ; 
for i = 1 :n 
    midpoint = a + (i-0.5)*h ; 
    integral = integral + g(midpoint)*h ; 
end

disp(integral)

%% Trapezoid Integral 
f = @(x) x.^3 ;
a = 1;
b = 2;

n = 8;

h = (b - a) / n;

intger = 0 ; 
for i = 1:n 
    intger = intger+ (h/2)*(f(a+(i-1)*h))  +(h/2)*(f(a + i*h)) ; 
end
disp(intger)

%% Simpson's Method 
a = 1 ; 
b = 2 ; 
f = @(x) x.^3 ; 
n = 8; 
h = (b-a)/n ; 
s_o=0;
s_e=0;
x = a ; 

for k=1:n-1
    x=a+k*h;
    y=f(x);
    if rem(k,2)==1
       s_o=s_o+y;%sum of odd terms
     else
       s_e=s_e+y; %sum of even terms
    end
end
answer=h/3*(f(a)+f(b)+4*s_o+2*s_e); 
disp(answer) 




%% Runge Kutta of 2nd Order 
f = @(x,y) y-x ;
h = 0.1 ; 
x_i = 1 ; 
x_f = 2 ;
y_i = 1 ; 
alpha=1 ; 
beta= 1 ; 
gamma1 = 0.5 ; 
gamma2 = 0.5 ; 
answer = solve(f,h,x_i,x_f,y_i,alpha, beta, gamma1, gamma2) ; 
disp(answer)

actual = @(x) x+1 - exp(x)./2;
true_value = actual(x_f);
disp(true_value)
error = abs(true_value - answer);
disp(error);


%function answer = solve(f,h,x_i,x_f,y_i,alpha, beta, gamma1, gamma2) 
 %       x = x_i ; 
  %      y = y_i ; 
   %     n = (x_f-x_i)/h ;
    %    for i = 1:n 
     %       F = gamma1*f(x,y) + gamma2*f(x+alpha*h*x, y + beta*h*f(x,y)) ;
      %      y = y + h*F ;
       %     x = x + h; 
        %end
        %answer = y ; 
%end

%% Runge Kutta for 4th Order 
f = @(x,y)  y - x ;
h = 0.1;
x_i = 0;
x_f = 1;
y_i = 0.5;
m = (x_f - x_i)/h ;
answer = solveit(f,h,x_i,y_i,x_f);
disp(answer);
actual = @(x) x+1 - exp(x)./2;
true_values = zeros(1,m) ;
for i = 1:m
    true_values = actual(x_i + (i-1)*h);
end
error_values = zeros(1,m) ;
for i = 1:m 
     error_values = abs(true_values(i) - answer(i));
end
disp(error_values)

function answer = solveit(f,h,x_i,y_i,x_f)
    m = abs(x_f - x_i)/h ; 
    x = x_i; 
    y = y_i; 
    y_values = zeros(1,m) ;
    for i = 1:m 
        k1 = h*f(x,y); 
        k2 = h*f(x+h/2, y+ k1/2) ; 
        k3 = h*f(x+h/2, y+ k2/2) ; 
        k4 = h*f(x+h, y+ k3); 
        y_values(i) = y ;
        y = y + (1/6)*(k1 + 2*k2 + 2*k3 +k4) ; 
        x = x + h ;
    end
    answer = y_values ;
end

%% Implicit Euler 
%f = @(x,y) y - x ; %this is the derivative function given 
%x_i = 0 ; 
%x_f = 1 ;
%h = 0.05 ; 
%y_i = 0.5 ; 
%actual = @(x) x+1-exp(x)./2;
%answer = solve(f,x_i, x_f, h, y_i) ; 
%disp(answer) 

%function answer = solve (f,x_i, x_f, h, y_i) 
 %    n = (x_f-x_i)/h ; 
  %   x = x_i ; 
   %  y = y_i ; 
    % for i = 1:n 
     %    y_pred = y + h*f(x,y); 
      %   y = y_pred + h*f(x + h,y_pred) ;
       %  x = x + h;  
    % end
     %answer = y ; 
%end

%% Heun's Method 

%f = @(x,y) y - x ; %this is the derivative function given 
%x_i = 0 ; 
%x_f = 1 ;
%h = 0.05 ; 
%y_i = 0.5 ; 
%actual = @(x) x+1-exp(x)./2;
%answer = solve(f,x_i, x_f, h, y_i) ; 
%disp(answer) 

%function answer = solve (f,x_i, x_f, h, y_i) 
 %    n = (x_f-x_i)/h ; 
  %   x = x_i ; 
   %  y = y_i ; 
    % for i = 1:n 
     %    y_pred = y + h*f(x,y); 
      %   y = y_pred + (1/2)*(h*f(x + h,y_pred) + h*f(x,y)) ;
       %  x = x + h;  
     %end
     %answer = y ; 
%end

%% Gauss Quadrature 
f = @(x) x^3; 
a = 1 ; 
b = 2 ;
answer = gauss(f,a,b) ;
disp(answer)
%function one_point = gauss(f,a,b)
 %     w0 = 2; 
  %    x0 = 0;
   %   sum = 0 ;
    %  factor = (b-a)/2 ;
     % constant = (a+b)/2 ; 
     % sum = sum + w0*f(x0*factor + constant) ; 
     % sum = sum*factor ; 
     % one_point = sum ; 
%end 


function two_point = gauss(f,a,b)  
     w0 = 1 ; 
     w1 = 1; 
     x0 = -1/sqrt(3) ;
     x1 =  1/sqrt(3) ;
     sum = 0 ;
     factor = (b-a)/2 ;
     constant = (a+b)/2 ;
     sum = sum + w0*f(x0*factor + constant) ;
     sum = sum + w1*f(x1*factor + constant) ;
     sum = sum*factor ; 
     two_point = sum ; 
end 




%% Approximated Errors 

%|E| = (((b-a)^2 /n^3)/12)*max(f"(x)) for trapezoidal error 
%|E| = ()

%% Newton Method 
func= @(x)   4*sin(x/2) + x - 2*pi  ; 
func_derivative =@(x) 1 + 2*cos(x/2) ;
initial_guess = 1.5 ; 
tolerance = 0.00001 ; 
max_iterations = 100 ; 
answer = newtonRaphson(func, func_derivative, initial_guess, tolerance, max_iterations) ; 
disp(answer) ;
chord = 2*sin(answer/2);
disp(chord)
function root = newtonRaphson(func, func_derivative, initial_guess, tolerance, max_iterations)
    x0 = initial_guess;
    iteration = 0;
    
    while iteration < max_iterations
        x1 = x0 - func(x0) / func_derivative(x0);
        
       % Check for convergence
       if abs(x1 - x0) < tolerance
            root = x1;
            return;
        end
        
        % Update variables 
        x0 = x1;
        iteration = iteration + 1;
    end
    
   warning('Maximum iterations reached ');
    root = x0;
end

%% Truncation Error for Euler's Method by Taylor Series 


%f = @(x,y) y - x ; %this is the derivative function given 
%x_i = 0 ; 
%x_f = 1 ;
%h = 0.05 ; 
%y_i = 0.5 ; 
%actual = @(x) x+1-exp(x)./2;
answer = solve(f,x_i, x_f, h, y_i) ; 
disp(answer) 

function answer = solve(f,x_i, x_f, h, y_i) 
      n = (x_f - x_i)/h ;
      x = x_i ; 
      y = y_i ;
      truncation_error = zeros(n) ;
      for i = 1:n 
          y = y + h*f(x,y) ; 
          x = x + h ;
         % truncation_error(i) = ___put the error ;
      end
      answer = y; 
end

%%









