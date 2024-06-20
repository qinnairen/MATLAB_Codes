%% Part A 
approx = [1 1 1 1] ; %since for j = 0 the value evaluates to 1 in all cases 
x = 0.2 ;
for i = 1:4 
    for j = 1:i+1
        approx(i) = approx(i) +(x^j)* factorial(6) /( factorial(j)*factorial(6-j));
    end
end

disp(approx)
% We know that any function can be expressed as a Taylor Polynomial by
% expressing it as a sum of (x-c)^j * j times differentiated that function
% on c divided by j! and the summation running from j = 0 to infinity 

%Here when we want polynomials of given degree we run summation from 0 to n

%The approx output gives the approximated value of the function for
%different degrees 

%approx(1) gives for n = 2 ; approx(2) gives for n = 3 and so on 

%% Plotting Errors 
error = [0 0 0 0];
exact = (1.2)^6 ; 
for i = 1:4 
    error(i) = error(i) + abs(approx(i)- exact) ;
end

disp(error)

t = [2 3 4 5];
plot(t,error) ;


