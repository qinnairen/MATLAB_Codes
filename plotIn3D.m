t = 0:0.1:10 ; 
v = 10*exp((-0.2 + 1j*pi).*t) ; 
real_part = real(v);
imag_part = imag(v);

plot3(t,real_part, imag_part) ; 

