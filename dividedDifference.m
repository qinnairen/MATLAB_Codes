test = evalDiv([ 3.2 2.7 1.0 4.8 5.6],[22.0 17.8 14.2 38.3 51.7]) ;

function difference = evalDiv(x,y)
difference = y;
for j=2:length(y)
    temp = difference;
    for i=j:length(y)
        difference(i) = (temp(i) - temp(i-1)) / (x(i) - x(i-(j-1)));                                                       
    end
end
disp(difference)
end
