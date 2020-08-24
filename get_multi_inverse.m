function mI=get_multi_inverse(x,y)
 % get multiplicative inverse of x under modulo y
 [gcd mat] = get_gcd(x,y);
 if gcd ~= 1
     disp('There is no multiplicative inverse');
     mI=0;
 else
     v_ex = ext_eculidian2(mat);
    
     if x>y
        mI=v_ex(2); 
     else
         mI=v_ex(4);
     end
     
     if mI<0
         mI=mI+y;
     end
 end
end