%% This function computes the 2^n components whose sum to the passed input argument x
 % for example: 14 = 2+4+8
 %              111 = 1+2+4+8+32+64 

%Output: 
      %  - C : 1-row vector contains the 2^n components
      %  - len: How many bits represents x in binary 
      %         (Important in otherfunctions)
         
function [C,len] = get_binary_components2(x)
 
% Handling the exceptional cases
 len=1;
 if x<0
    C=-1;
    return
 elseif x==0
    C=0;
    return
 elseif x==1
     C=1;
     return
 end
 
% The normal way
 len = fix(log2(x))+1;
 C=zeros(1,len); % a vector to hold the original binary representation (10101)
 
 while 1
     l = fix(log2(x));
     C(len-l)=1; 
     x = x-2^l;
     if l==0 || x==0
        break; 
     end
 end

 C2= zeros(1,len);
 
% construct the vector, convert each bit of (1011) to their decimal
% equivelance

 for i=1:len
     C2(i) = 2^(i-1)*C(len-i+1);
 end
 
 C=C2(C2~=0); %remove the zeros

end