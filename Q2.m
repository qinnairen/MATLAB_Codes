f = @(x) (x^3)*exp(-x^2) ; 
a = 0 ; 
b = 2 ;
h = 0.25 ; 
n = (b-a)/ h ; 
% since n = 2/0.25 = 8 which is an even number , hence this is valid to do 
integral =(h/3)*(f(a) + f(b)) ; 
for i = 1 : n-1 
    if rem(i,2) == 1
        integral = integral + (4*h/3)*f(a+h*i) ; 
    else 
        integral = integral + (2*h/3)*f(a+h*i) ; 
    end
end
disp("The value of integral is : ")
disp(integral)

%The Simpson's Rule breaks down integrals into even segments and does their
%integral on a small scale and adds them up to get an approximated final
%answer ; if x_i has an odd i then it gets multiplied by 4, and if i is
%even then it gets multiplied by 2; finally we add the values obtained at
%the boundary and multiply the whole sum by h/3 to get the final integral 
