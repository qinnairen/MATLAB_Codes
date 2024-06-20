A = [1, 0, 0; 1, 1, 0; 3, 0.5, 1];

b = [1; 2; 1];

n = length(b);
x = zeros(n, 1);

% Forward Substitution
for i = 1:n
    x(i) = b(i);
    for j = 1:i-1
        x(i) = x(i) - A(i,j) * x(j);
    end
    x(i) = x(i) / A(i,i);
end

disp('Solution x:');
disp(x);
