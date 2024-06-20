A = [1, -1, 3; 0, 2, -3; 0, 0, -6.5];

b = [1; 7; 6.5];

n = length(b);
x = zeros(n, 1);

x(n) = b(n) / A(n, n);
for i = n-1:-1:1
    sum_val = b(i);
    for j = i+1:n
        sum_val = sum_val - A(i,j) * x(j);
    end
    x(i) = sum_val / A(i, i);
end

disp('Solution x:');
disp(x);
