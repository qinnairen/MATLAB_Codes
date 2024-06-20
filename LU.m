mat = [2, -1, -2;
       -4, 6, 3;
       -4, -2, 8];
[lower, upper] = luDecomposition(mat);

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
    
    disp('Lower Triangular');
    disp(lower);
    disp('Upper Triangular');
    disp(upper);
end
















