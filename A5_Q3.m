A = [16, 4, 4, -4; 4, 10, 4, 2; 4, 4, 6, -2; -4, 2, -2, 4];

B = [32; 26; 20; -6];

x = solve_lu_cholesky(A, B);

disp('Solution:');
disp(x);




function x = solve_lu_cholesky(A, B)
    L = chol(A, 'lower');
    U = L';

    y = forward_substitution(L, B);

    x = backward_substitution(U, y);
end

function y = forward_substitution(L, B)
    n = length(B);
    y = zeros(n, 1);

    for i = 1:n
        y(i) = (B(i) - L(i, 1:i-1)*y(1:i-1)) / L(i, i);
    end
end

function x = backward_substitution(U, y)
    n = length(y);
    x = zeros(n, 1);

    for i = n:-1:1
        x(i) = (y(i) - U(i, i+1:n)*x(i+1:n)) / U(i, i);
    end
end

