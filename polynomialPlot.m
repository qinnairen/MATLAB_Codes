x = -7:1:10 ; 
y1 = x.*x.*x - 5.*x.*x -45.*x - 23 ;
f = [1 -5 -45 -23];
figure(1)
plot(x,y1,"r-", "LineWidth",2);

for i = 1:18
    if (polyval(f,x(i))  <0.25)
        disp("x = ");
        disp(x(i));
    end
end






