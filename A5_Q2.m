
mat = [1, 1, -1;
       1, 2, -2;
       -2, 1, 1];

[lower, upper] = luDecomposition(mat);

disp('Lower Triangular:');
disp(lower);
disp('Upper Triangular:');
disp(upper);

b = [1; 1; 1];

x = solveLU(lower, upper, b);

disp('Solution for Ax = b:');
disp(x);


function [lower, upper] = luDecomposition(mat)
    n = size(mat, 1);
    lower = zeros(n);
    upper = zeros(n);

    for i = 1:n
        for k = i:n
            sum = 0;
            for j = 1:i-1
                sum = sum + lower(i, j) * upper(j, k);
            end
            upper(i, k) = mat(i, k) - sum;
        end

        for k = i:n
            if i == k
                lower(i, i) = 1; 
            else
                sum = 0;
                for j = 1:i-1
                    sum = sum + lower(k, j) * upper(j, i);
                end
                lower(k, i) = (mat(k, i) - sum) / upper(i, i);
            end
        end
    end
end

function x = solveLU(lower, upper, b)
    n = length(b);
    y = zeros(n, 1);
    for i = 1:n
        y(i) = (b(i) - lower(i,1:i-1)*y(1:i-1)) / lower(i,i);
    end

    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - upper(i,i+1:n)*x(i+1:n)) / upper(i,i);
    end
end

