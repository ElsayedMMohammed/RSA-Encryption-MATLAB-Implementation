function [C len] = get_binary_components2(x)
 
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
 C=zeros(1,len); % a vector to hold the representation
 while 1
     l = fix(log2(x));
     C(len-l)=1; 
     x = x-2^l;
     if l==0 || x==0
        break; 
     end
 end

 C2= zeros(1,len);
 
% construct the vector
 for i=1:len
     C2(i) = 2^(i-1)*C(len-i+1);
 end
 C=C2(C2~=0);

end