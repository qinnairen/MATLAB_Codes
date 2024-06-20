clf;
a = 0 ;
b = 2 ;
n= 16;
mat=zeros(n-1,n-1);
p=@(x) 0;
q=@(x) 0;
r=@(x) 6*x;
yo=0;
yn=8;
h=(b-a)/n ;
x = zeros(1, n-1) ;
for j = 1:n-1 
    x(j) = a + h*j ; 
end
%%
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
sol=b/mat;
disp(sol)
plot(x, sol) ; 
hold on
fplot(@(x) x^3, [0,2]) ;




