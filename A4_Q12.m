A = [2, 1, -1; -3, -1, 2; -2, 1, 2];
b = [8; -11; -3];

solution = gauss_jordan(A, b);
disp('Solution:');
disp(solution);


function x = gauss_jordan(A, b)
    n = length(b);

    augmented_matrix = [A, b];

    for pivot_row = 1:n
        [~, max_row] = max(abs(augmented_matrix(pivot_row:end, pivot_row)));
        max_row = max_row + pivot_row - 1;
        augmented_matrix([pivot_row, max_row], :) = augmented_matrix([max_row, pivot_row], :);

        augmented_matrix(pivot_row, :) = augmented_matrix(pivot_row, :) / augmented_matrix(pivot_row, pivot_row);

        for row = 1:n
            if row ~= pivot_row
                factor = augmented_matrix(row, pivot_row);
                augmented_matrix(row, :) = augmented_matrix(row, :) - factor * augmented_matrix(pivot_row, :);
            end
        end
    end

    x = augmented_matrix(:, end);
end

