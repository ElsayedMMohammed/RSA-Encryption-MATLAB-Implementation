function a=ext_eculidian2(mat)
 % mat: the output matrix form (get_gcd function)
  r = size(mat,1);
  
  temp = zeros(r-2,4);
  a = [mat(r-1,2) -mat(r-1,3) mat(r-1,1) 1]; 

  for i=1:r-2
    temp(i,:) = [mat(r-2-(i-1),2) -mat(r-2-(i-1),3) mat(r-2-(i-1),1) 1]; 
    a = [a(3) temp(i,2)*a(2)+a(4) temp(i,3) a(2)]; 
  end
  
  %swap for better view
  temp2 = a;
  a = [temp2(3) temp2(4) temp2(1) temp2(2)];
end