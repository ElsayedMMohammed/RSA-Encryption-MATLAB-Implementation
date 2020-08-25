%% This function returns one of the coprime for a number (k) which also less than k ang greater than 1


function ss = get_coprime2(k)

% Handle the exceptions
 if k<2
    disp('k must be greater than 1');
    ss = -1;
    return 
 elseif k==2
    ss = 1;
    return 
 end


 nums = 0; % a vector hold all the tested numbers
 ss = 0; % a flag to check if no coprime number is found for k
 
% Run a while loop to catch all the numbers (s), where 1 < s < k
while length(nums)< k-1
    
% get a random number between 1 & k
 s =fix(2+(k-1)*abs(rand(1)));
 
% To avoid repeated numbers
  while ~is_new(nums,s) || s==k
     s =fix(2+(k-1)*abs(rand(1)));
  end
  nums = [nums s];
 
% Check the coprimality
if get_gcd(k,s)==1
    ss = s;
    return;
end

end
 disp('No coprime is found');
end