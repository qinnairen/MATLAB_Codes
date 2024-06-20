f = @(x) x^3; 
a = 1 ; 
b = 2 ;
answer = gauss(f,a,b) ;
disp(answer)
%function one_point = gauss(f,a,b)
 %     w0 = 2; 
  %    x0 = 0;
   %   sum = 0 ;
    %  factor = (b-a)/2 ;
     % constant = (a+b)/2 ; 
     % sum = sum + w0*f(x0*factor + constant) ; 
     % sum = sum*factor ; 
     % one_point = sum ; 
%end 


function two_point = gauss(f,a,b)  
     w0 = 1 ; 
     w1 = 1; 
     x0 = -1/sqrt(3) ;
     x1 =  1/sqrt(3) ;
     sum = 0 ;
     factor = (b-a)/2 ;
     constant = (a+b)/2 ;
     sum = sum + w0*f(x0*factor + constant) ;
     sum = sum + w1*f(x1*factor + constant) ;
     sum = sum*factor ; 
     two_point = sum ; 
end 


