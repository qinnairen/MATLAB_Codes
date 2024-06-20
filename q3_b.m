%% Plotting Error
approx = [1 1 1 1] ; 
x = 0.2 ;
for i = 1:4 
    for j = 1:i+1
        approx(i) = approx(i) +(x^j)* factorial(6) /( factorial(j)*factorial(6-j));
    end
end

disp(approx)




