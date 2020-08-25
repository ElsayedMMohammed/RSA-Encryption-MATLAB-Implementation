%% A simple function returns n prime numbers > 2 within a specific range

function nums=get_primes(n,min,max)

%Handle the expections
 c=get_prime_erato(min,max);
if c==0
    nums=0; % a flag to say that there is no prime number in that range or invalid range
   return 
end

% The normal way
diff = max-min;
nums = zeros(1,n);

for i=1:n
  counter=0;
  while ~is_new(nums,c) 
    c=get_prime_erato(min,max);
    
    % To avoid too many runs with no new prime number found
    counter = counter+1;
    if counter >= 10
        return
    end
  end
   nums(i)=c;
  c=get_prime_erato(min,max);
  
end
  
 
end