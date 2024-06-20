prompt = "Enter the value of n :" ;
n = input(prompt) ; 
prm = "Enter the value of x : " ;
c = input(prm);

sum = ones(n,1);
for i = 1:n 
    for j = 1:i 
        sum(i) = sum(i) + x^j/factorial(j) ;
    end
end

y = zeros(n) ;
for k = 1:n
    y(k) = exp(x) - sum(k);
end

t = 1:n ; 
plot(t,y, "r-", LineWidth = 2)


