x = 1.45:0.01:1.55 ; 
Qs = 140000 ; 
Qf = 130967 ;


for n = linspace(1.4910, 1.4640, 15)
y = (x-1.4890).*Qs + (n-x).*Qf ; 
plot(x,y,"b", "LineWidth",1);
hold on 
end 

