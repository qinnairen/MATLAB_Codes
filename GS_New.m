
A = [5, -2, 3, 0, 6;
     -3, 9, 1, -2, 7.4;
     2, -1, -7, 1, 6.7;
     4, 3, -5, 7, 9;
     2, 3.5, 6.1, -4, -8.1];
 b = [-1; 2; 3; 0.5; 3.1];
x = rand(5,1) ; 
iters = 10000; 
y = gauss_seidel(A,b,x,iters) ;
disp(y)


function x = gauss_seidel(A, b, x, iters)
    for i = 1:iters
        for j = 1:size(A,1)
            x(j) = (b(j) - sum(A(j,:)'.*x) + A(j,j)*x(j)) / A(j,j);
        end
    end
end
