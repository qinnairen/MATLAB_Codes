% Example usage
A = [1, 1, 1; 1, 2, 2; 3, 4, 4];
b = [3; 5; 12];

solution = gauss_elimination_partial_pivoting(A, b);
disp('Solution:');
disp(solution);


function x = gauss_elimination_partial_pivoting(A, b)
    % Solve the system of linear equations Ax = b using Gaussian elimination with partial pivoting.

    % Parameters:
    %   A (matrix): Coefficient matrix.
    %   b (vector): Right-hand side vector.

    % Returns:
    %   x (vector): Solution vector.

    n = length(b);

    % Augmented matrix [A|b]
    augmented_matrix = [A, b];

    % Forward Elimination with partial pivoting
    for pivot_row = 1:n
        % Partial pivoting
        [~, max_row] = max(abs(augmented_matrix(pivot_row:end, pivot_row)));
        max_row = max_row + pivot_row - 1;
        augmented_matrix([pivot_row, max_row], :) = augmented_matrix([max_row, pivot_row], :);

        % Elimination
        pivot_element = augmented_matrix(pivot_row, pivot_row);
        for row = (pivot_row + 1):n
            factor = augmented_matrix(row, pivot_row) / pivot_element;
            augmented_matrix(row, pivot_row:end) = augmented_matrix(row, pivot_row:end) - factor * augmented_matrix(pivot_row, pivot_row:end);
        end
    end

    % Back Substitution
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (augmented_matrix(i, end) - dot(augmented_matrix(i, i+1:n), x(i+1:n))) / augmented_matrix(i, i);
    end
end

