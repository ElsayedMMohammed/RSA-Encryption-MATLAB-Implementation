%% This function applies the sieve of Eratosthenes to get a prime number in a specific range
 % Input: The range (min, max)
 % Output: A prime number (p), if exits. Otherwise, 0;
 
function p=get_prime_erato(min,max)
%% The sieve of Eratosthenes
diff=max-min;
prime =0;
p=0; 
MAT = zeros(1);

% Handling the exceptions
if min<1 || max<2 || min>=max
   disp('Invalid range!');
   return 
end

% The normal way
while prime==0
 
 % Generate  a (unique) random number 
 p = fix(min+diff*abs(rand(1)));
 while is_new(MAT,p)==0
     p = fix(min+diff*abs(rand(1)));
 end
 MAT = [MAT p];
 
 for i=2:ceil(sqrt(p)) 
     if mod(p,i)==0
         prime=0; %means that it can't be prime
         break;
     end
     prime=1; % means that it still possible to be prime
 end
 
end
end