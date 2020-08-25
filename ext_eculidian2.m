%% This function performs the Extended Eculidian algorithm
 % to express the GCD between 2 numbers as a linear combination between the
 % two numbers
 
% Input: The matrix output from the Eculidian algorithm where the GCD is
% calculated

% Output: 1-row vector contains
    % [ x , coeff. multipied by x, y ,  coeff. multipied by y ]
    % where x,y are the 2 numbers with the GCD and x > y
    
function a=ext_eculidian2(mat)

  r = size(mat,1); %The number of rows
  
% In case of x,y are multiple of each other
  if r==1
     a = [ mat(1,2) mat(1,3) mat(1,1) mat(1,4)];
     return 
  end
  
% The general case
% (a) is the output vector contains the x,y and their coeffecients.

  temp = zeros(r-2,4);
  a = [mat(r-1,2) -mat(r-1,3) mat(r-1,1) 1]; 
  for i=1:r-2
    temp(i,:) = [mat(r-1-i,2) -mat(r-1-i,3) mat(r-1-i,1) 1]; 
    a = [a(3) temp(i,2)*a(2)+a(4) temp(i,3) a(2)]; 
  end


 %Just swapping for a better view
  temp2 = a;
  a = [temp2(3) temp2(4) temp2(1) temp2(2)];
end