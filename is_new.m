function a = is_new(MAT,num)
len = length(MAT);

for i=1:len
   if num==MAT(i)
       a = 0;
      break; 
   end
  a = 1;
end

end