function ss = get_coprime2(k)

 nums = 0;
 ss = 0; % a flag to check if no coprime number is found for k
while length(nums)<k
    
% get a random number between 1 & k
 s =fix(1+(k-1)*abs(rand(1)));
 
% To avoid repeated numbers
  while ~is_new(nums,s)
     s =fix(1+(k-1)*abs(rand(1)));
  end
  nums = [nums s];
 
% Check the coprimality
if get_gcd(k,s)==1 && s > 1
    ss = s;
    break;
end

 end
end