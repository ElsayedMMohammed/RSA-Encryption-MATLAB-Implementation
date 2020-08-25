% A simple function to check if a number exist in a vector or not

function a = is_new(MAT,num)

len = length(MAT);
a=1;

for i=1:len
   if num==MAT(i)
       a = 0;
       return; 
   end
end

end