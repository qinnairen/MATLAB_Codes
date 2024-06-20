a = 0 ;
b = pi/2 ;
h = pi/16 ;
n = (b-a)/h ;
mat=zeros(n-1,n-1);
p=@(x) 0;
q=@(x) -1;
r=@(x) 1;
yo=1;
yn=0;
x = zeros(1, n-1) ;
for j = 1:n-1 
    x(j) = a + h*j ; 
end
% We know that for each node point, considering it's neighbourhood points,
% we can find y' and y'' by using Taylor's series , which kind of gives us
% the derivative as (y_i - y_(i-1))/h and then the derivative as [y_(i+1) - 2y_i + y_(i-1)]/h^2 ; combining these and putting them into our equation
% we get n-1 linear equations wtih general form of [2+(h.^2)*q(x(i))]*y_i +
% [(h/2)*p(x(i))-1]*y_i+1 + -(1+(h/2)*p(x(i)))*y_i-1 = b_i = (-(h.^2)*r(x(i)))
% Hence we form our A matrix, which we solve to get y_i for different node
% points 
for i=1:n-1
    if i==1
        mat(1,1)=2+(h.^2)*q(x(i));
        mat(1,2)=(h/2)*p(x(i))-1;
    elseif i==n-1
        mat(n-1,n-1)=2+(h.^2)*q(x(n-1));
        mat(n-1,n-2)=-(1+(h/2)*p(x(n-1)));
    else
        mat(i,i)=2+(h.^2)*q(x(i));
        mat(i,i+1)=(h/2)*p(x(i))-1;
        mat(i,i-1)=-(1+(h/2)*p(x(i)));
    end
end
b=zeros(1,n-1);


for i=1:n-1
    if i==1
        b(i)=(-(h.^2)*r(x(i)))+((1+(h/2)*p(x(i)))*yo);
    elseif i==n-1
        b(i)=(-(h.^2)*r(x(i)))-((h/2)*p(x(i))-1)*yn;
    else
        b(i)=(-(h.^2)*r(x(i)));
    end
end
d = inv(mat) ;
sol=d*transpose(b);
disp("Approximated Values by the Finite Differences Method : ")
disp(sol)

% Since this has n = (pi/2)/(pi/8) = 4 , this must have 3 nodes at pi/8,
% pi/4, and 3pi/8 
% We must therefore calculate values at these points and thence calculate
% true errors 
