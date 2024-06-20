x = 0:1:15 ;
y1 = 100.*x.*x ;
y2 = 10.*x.*x.*x ;

figure(1)
plot(x,y1,"r-","Linewidth",2);
hold on
plot(x,y2,"b-","Linewidth",2);

