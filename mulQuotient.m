f = [9,-5,3,7];
g = [6,-1,2];
mul = conv(f,g);
[q,r] = deconv(f,g);

disp(mul);
disp(q);
disp(r);
