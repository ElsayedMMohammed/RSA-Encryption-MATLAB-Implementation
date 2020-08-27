%% This function computes the modular exponentiation for (x^y mod z)

function product = mod_exponentiation2(x,y,z) 

   [P,len_P] = get_binary_components2(y);
   C = zeros(len_P,2);
   
  % The first row
  C(1,1) = 1; C(1,2)= mod(x,z);
  
  % The remaining rows
  if len_P>1  %to avoid the case where there is one binary component (at y=0 | 1)
    for i=2:len_P
      C(i,1) = 2*C(i-1,1); 
      C(i,2) = mod(C(i-1,2)^2,z);
    end
  end
  
powers = ones(len_P,1);
for i=1:length(P)
    tt = C(:,1)==P(i);
    powers(i+1)=  C(tt,2);
end

product =1;
for i=2:length(powers)
   product=mod(product*powers(i),z); 
end
  
end
