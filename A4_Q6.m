A = [10, -7, 0; -3, 2.099, 6; 5, -1, 5];

det_A = determinant_gauss_elimination(A);

disp(['Determinant of A:', num2str(det_A)]);


function det_A = determinant_gauss_elimination(A)
    n = size(A, 1);
    U = A;  
    % Forward Elimination
    for pivot_row = 1:(n - 1)
        for row = (pivot_row + 1):n
            factor = U(row, pivot_row) / U(pivot_row, pivot_row);
            U(row, pivot_row:end) = U(row, pivot_row:end) - factor * U(pivot_row, pivot_row:end);
        end
    end

    det_U = prod(diag(U));

    if det_U == 0
        det_A = 0;
    else
        det_A = det_U * (-1)^(n - size(rref(A), 2));
    end
end

