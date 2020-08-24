function p=get_prime_erato(min,max)
%% The sieve of Eratosthenes
diff=max-min;
prime =0;
MAT = zeros(1);

while prime==0
    
 p = fix(min+diff*abs(rand(1)));
 while is_new(MAT,p)==0
     p = fix(min+diff*abs(rand(1)));
 end
 MAT = [MAT p];
 
 for i=2:sqrt(p) 
     if mod(p,i)==0
         prime=0;
         break;
     end
     prime=1;
 end
 
end
end