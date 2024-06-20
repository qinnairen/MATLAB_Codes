 %Example usage:
 A = [4, -1, 0; -1, 4, -1; 0, -1, 4];
 b = [5; 10; 15];
 max_iterations = 1000;
 tol = 1e-6;
 
 x = gaussJacobi(A, b, max_iterations, tol);
 disp('Solution:');
 disp(x);
 
 function x = gaussJacobi(A, b, max_iterations, tol)
     
     n = length(b);
     x = zeros(n, 1); % Initial guess
 
     for k = 1:max_iterations
         x_new = zeros(n, 1);
         for i = 1:n
             sum_ = 0;
             for j = 1:n
                 if j ~= i
                     sum_ = sum_ + A(i, j) * x(j);
                 end
             end
             x_new(i) = (b(i) - sum_) / A(i, i);
         end
 
         % Check for convergence
         if norm(x_new - x) < tol
             disp(['Converged at iteration ', num2str(k)]);
             break;
         end
 
         x = x_new;
     end
 
     if k == max_iterations
         disp('Maximum iterations reached without convergence');
     end
 end

% Given matrix A and vector b
% A = [10, 1; 1, 10];
% b = [11; 11];
% 
% % Parameters
% max_iterations = 1000;
% tol = 1e-4;
% 
% % Solve using Gauss-Jacobi method
% x = gaussJacobi(A, b, max_iterations, tol);
% disp('Solution:');
% disp(x);
% 
% function x = gaussJacobi(A, b, max_iterations, tol)
%     % Gauss-Jacobi method to solve Ax = b
%     % A: coefficient matrix
%     % b: right-hand side vector
%     % max_iterations: maximum number of iterations
%     % tol: tolerance for convergence
% 
%     n = length(b);
%     x = ones(n, 1) / 2; % Initial guess
% 
%     for k = 1:max_iterations
%         x_new = zeros(n, 1);
%         for i = 1:n
%             sum_ = 0;
%             for j = 1:n
%                 if j ~= i
%                     sum_ = sum_ + A(i, j) * x(j);
%                 end
%             end
%             x_new(i) = (b(i) - sum_) / A(i, i);
%         end
% 
%         % Check for convergence
%         if norm(x_new - x, Inf) < tol
%             disp(['Converged at iteration ', num2str(k)]);
%             break;
%         end
% 
%         x = x_new;
%     end
% 
%     if k == max_iterations
%         disp('Maximum iterations reached without convergence');
%     end
% end

% Given matrix A and vector b
% A = [4, 1, -1; 2, 7, 1; 1, -3, 12];
% b = [3; 19; 31];
% 
% % Parameters
% max_iterations = 1000;
% tol = 1e-6;
% 
% % Solve using Gauss-Jacobi method
% x = gaussJacobi(A, b, max_iterations, tol);
% disp('Solution:');
% disp(x);
% 
% 
% function x = gaussJacobi(A, b, max_iterations, tol)
%     % Gauss-Jacobi method to solve Ax = b
%     % A: coefficient matrix
%     % b: right-hand side vector
%     % max_iterations: maximum number of iterations
%     % tol: tolerance for convergence
% 
%     n = length(b);
%     x = zeros(n, 1); % Initial guess
% 
%     for k = 1:max_iterations
%         x_new = zeros(n, 1);
%         for i = 1:n
%             sum_ = 0;
%             for j = 1:n
%                 if j ~= i
%                     sum_ = sum_ + A(i, j) * x(j);
%                 end
%             end
%             x_new(i) = (b(i) - sum_) / A(i, i);
%         end
% 
%         % Check for convergence
%         if norm(x_new - x, Inf) < tol
%             disp(['Converged at iteration ', num2str(k)]);
%             break;
%         end
% 
%         x = x_new;
%     end
% 
%     if k == max_iterations
%         disp('Maximum iterations reached without convergence');
%     end
% end
% Given matrix A and vector b
% A = [5, -2, 3, 0, 6;
%     -3, 9, 1, -2, 7.4;
%     2, -1, -7, 1, 6.7;
%     4, 3, -5, 7, 9;
%     2, 3.5, 6.1, -4, -8.1];
% b = [-1; 2; 3; 0.5; 3.1];
% 
% % Parameters
% max_iterations = 100;
% tol = 1e-6;
% 
% % Solve using Gauss-Jacobi method
% x = gaussJacobi(A, b, max_iterations, tol);
% disp('Solution:');
% disp(x);
% 
% function x = gaussJacobi(A, b, max_iterations, tol)
%     % Gauss-Jacobi method to solve Ax = b
%     % A: coefficient matrix
%     % b: right-hand side vector
%     % max_iterations: maximum number of iterations
%     % tol: tolerance for convergence
% 
%     n = length(b);
%     x = rand(n, 1); % Initial guess (random values between 0 and 1)
% 
%     for k = 1:max_iterations
%         x_new = zeros(n, 1);
%         for i = 1:n
%             sum_ = 0;
%             for j = 1:n
%                 if j ~= i
%                     sum_ = sum_ + A(i, j) * x(j);
%                 end
%             end
%             x_new(i) = (b(i) - sum_) / A(i, i);
%         end
% 
%         % Check for convergence
%         if norm(x_new - x, Inf) < tol
%             disp(['Converged at iteration ', num2str(k)]);
%             break;
%         end
% 
%         x = x_new;
%     end
% 
%     if k == max_iterations
%         disp('Maximum iterations reached without convergence');
%     end
% end
% Example usage:
% A = [4, -1, 0; -1, 4, -1; 0, -1, 4];
% b = [5; 10; 15];
% max_iterations = 1000;
% tol = 1e-6;
% 
% x = gaussSeidel(A, b, max_iterations, tol);
% disp('Solution:');
% disp(x);
% 
% function x = gaussSeidel(A, b, max_iterations, tol)
%     % Gauss-Seidel method to solve Ax = b
%     % A: coefficient matrix
%     % b: right-hand side vector
%     % max_iterations: maximum number of iterations
%     % tol: tolerance for convergence
% 
%     n = length(b);
%     x = zeros(n, 1); % Initial guess
% 
%     for k = 1:max_iterations
%         x_old = x;
%         for i = 1:n
%             sum_ = 0;
%             for j = 1:n
%                 if j ~= i
%                     sum_ = sum_ + A(i, j) * x(j);
%                 end
%             end
%             x(i) = (b(i) - sum_) / A(i, i);
%         end
% 
%         % Check for convergence
%         if norm(x - x_old, Inf) < tol
%             disp(['Converged at iteration ', num2str(k)]);
%             break;
%         end
%     end
% 
%     if k == max_iterations
%         disp('Maximum iterations reached without convergence');
%     end
% end
% 
% Problem 5
% A5 = [5, -2, 3, 0, 6;
%      -3, 9, 1, -2, 7.4;
%      2, -1, -7, 1, 6.7;
%      4, 3, -5, 7, 9;
%      2, 3.5, 6.1, -4, -8.1];
% b5 = [-1; 2; 3; 0.5; 3.1];
% 
% tol = 1e-4;
% max_iterations = 1000;
% 
% disp('Problem 5:');
% x5 = gaussSeidel(A5, b5, max_iterations, tol);
% disp('Solution:');
% disp(x5);
% 
% % Problem 6
% A6 = [5, -2, 3, 6;
%      -3, 9, 1, -2;
%      2, -1, -7, 1;
%      4, 3, -5, 7];
% b6 = [-1; 2; 3; 0.5];
% 
% disp('Problem 6:');
% x6 = gaussSeidel(A6, b6, max_iterations, tol);
% disp('Solution:');
% disp(x6);
% function x = gaussSeidel(A, b, max_iterations, tol)
%     % Gauss-Seidel method to solve Ax = b
%     % A: coefficient matrix
%     % b: right-hand side vector
%     % max_iterations: maximum number of iterations
%     % tol: tolerance for convergence
% 
%     n = length(b);
%     x = zeros(n, 1); % Initial guess
% 
%     for k = 1:max_iterations
%         x_old = x;
%         for i = 1:n
%             sum1 = A(i,1:i-1) * x(1:i-1);
%             sum2 = A(i,i+1:end) * x_old(i+1:end);
%             x(i) = (b(i) - sum1 - sum2) / A(i,i);
%         end
% 
%         % Check for convergence
%         if norm(x - x_old, Inf) < tol
%             disp(['Converged at iteration ', num2str(k)]);
%             break;
%         end
%     end
% 
%     if k == max_iterations
%         disp('Maximum iterations reached without convergence');
%     end
% end