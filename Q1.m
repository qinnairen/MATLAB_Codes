%% Newton Raphson Method for Q1 
func= @(x)  exp(x) + 2^(-x) + 2*cos(x)-6    ; 
func_derivative =@(x)  exp(x) + 2^(-x)*(-log(2)) - 2*sin(x);
initial_guess = 1.5 ; 
tolerance = 0.0001 ; 
max_iterations = 100 ; 
answer = newtonRaphson(func, func_derivative, initial_guess, tolerance, max_iterations) ; 
disp("The root of the equation is : ")
disp(answer) ;
disp("f(approximated_root) : ")
m = func(answer);
disp(m) ;

%Clearly, the value of the function at this answer is too small , of 10^-16
%order , and therefore is clearly very close to 0 ; we can easily say that
%this is indeed the root of the equation 


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

