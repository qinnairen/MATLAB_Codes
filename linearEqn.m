syms x1 x2 x3 
eqn1 = x1 +2*x2 + 3*x3 == 5 ;
eqn2 = 2*x1 +5*x2 + 3*x3 ==3;
eqn3 = x1 + 8*x3 == 17 ; 
[A,B] = equationsToMatrix([eqn1,eqn2,eqn3], [x1,x2,x3]);
X = linsolve(A,B);
disp(X);
