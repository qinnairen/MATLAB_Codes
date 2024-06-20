A = [4, 1, -1; 5, 1, 2; 6, 1, 1];
b = [-2; 4; 6];

solution = gauss_elimination(A, b);
disp('Solution:');
disp(solution);


function x = gauss_elimination(A, b)

    n = length(b);

    augmented_matrix = [A, b];

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

