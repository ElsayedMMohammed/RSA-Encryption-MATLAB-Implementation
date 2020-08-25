%% This function calculates the multiplicative inverse of a number (x) under a specific modulo (y)
  % hence (r.x mod y = 1) --> This function calculate r (if exists)

function mI=get_multi_inverse(x,y)

 % First, make sure that the GCD between x,y equals 1, otherwise there is
 % no multiplicative inverse
 
 [gcd,mat] = get_gcd(x,y);
 
 if gcd ~= 1
     disp('There is no multiplicative inverse');
     mI=0;
     return
 end
 % Now, we are ready to run Extended Eculidien Algorithm to express the
 % gcd(x,y) as a linear combination of x and y
     v_ex = ext_eculidian2(mat);
 
% The multiplicative inverse of x under moduluo y is simply one of the
% coeefecients multiplied by the x 

%The following if condition is done due to the nature of get_gcd() function
%applied in ext_eculidian2() function as the arguments passed is reorderd
%in the function descendingly
     if x>y
        mI=v_ex(2); 
     else
         mI=v_ex(4);
     end
     
% If the answer is negative we add y, however the negative answer is not
% wrong.
     if mI<0
         mI=mI+y;
     end
 
end