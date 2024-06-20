% Define symbolic variables
syms a b c

% Given matrix A
A = [
    25, c, 1;
    64, a, 1;
    144, b, 1
];

% Given matrix B after elimination
B = [
    25, 5, 1;
    0, -4.8, -1.56;
    0, 0, 0.7
];

% Find scaling factors
scaling_factors = zeros(1, size(A, 1));
for pivot_row = 1:(size(A, 1) - 1)
    scaling_factors(pivot_row) = A(pivot_row, pivot_row);
    for row = (pivot_row + 1):size(A, 1)
        scaling_factors(row) = A(row, pivot_row) / scaling_factors(pivot_row);
    end
end

% Substitute values from matrix B into matrix A using symbolic variables
a_sub = B(2,2) + scaling_factors(2) * B(2,1);
b_sub = B(3,3) + scaling_factors(3) * B(3,1);
c_sub = B(1,2) / scaling_factors(1); % c is already determined from the elimination process

A_substituted = subs(A, {a, b, c}, {a_sub, b_sub, c_sub});

% Calculate the determinant of A
det_A = det(A_substituted);

% Display matrices A and B
disp('Matrix A:');
disp(A_substituted);
disp('Matrix B:');
disp(B);

% Display determinant of A
disp(['Determinant of A: ', char(det_A)]);
