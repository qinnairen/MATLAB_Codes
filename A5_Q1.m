A = [1,1,1; 1,2,-2; -2,1,1] ;
[L, U] = lu_decomposition(A);
disp('Matrix L:');
disp(L);
disp('Matrix U:');
disp(U);

function [L, U] = lu_decomposition(A)
    L = eye(3);
    U = zeros(3);
    
    % Perform LU decomposition
    for k = 1:3
        % Compute U matrix
        for j = k:3
            U(k,j) = A(k,j) - L(k,1:k-1)*U(1:k-1,j);
        end
        % Compute L matrix
        for i = k+1:3
            L(i,k) = (A(i,k) - L(i,1:k-1)*U(1:k-1,k)) / U(k,k);
        end
    end
end

