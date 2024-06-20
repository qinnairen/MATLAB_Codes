theta = 0:0.05:2*pi ; 
f = cos(theta) + 1j*sin(theta) ; 
real_part = real(f) ; 
imag_part = imag(f) ;
plot3(theta, real_part, imag_part) 