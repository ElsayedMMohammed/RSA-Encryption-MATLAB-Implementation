%% The main script to apply RSA encryption algorithm and get the text
clear; clc;
bits = 13; %Specifiy the number of bits of the machine (MAX = 13)

%% (1) Get 2 distinct prime numbers between min, max.
  min = 2^(bits-1); max=2^bits;
  N = get_primes(2,min,max);
  p = N(1); q= N(2);

%% (2) Determine n,k
  n = p*q;
  k = (p-1)*(q-1);
  
%% (3) get e , where 1 < e < k  and gcd(e,k)=1 [coprime]
  e = get_coprime2(k);
  
%% (4) get d , where d is multiplicative inverse of e under remuluo k
  d = get_multi_inverse(e,k);
  
%%  Encryption DEMO 
  srcID = fopen('Input_Sample.txt','r'); %opens source txt
  dstnID = fopen('Output_Sample.txt','wt'); %opens destination file
  txt = fscanf(srcID,'%c'); %reads txt from source into matrix
  txt = double(txt); %converts txt char into asci
  [r,c] = size(txt);
  nums = zeros(r,c);
  
  for i=1:r
      for j=1:c
         m = txt(i,j);
         c = mod_exponentiation2(m,e,n);
         m2 = mod_exponentiation2(c,d,n);
         nums(i,j)=m2;
      end
  end
  
  fprintf(dstnID,'%s',nums); %writes txt to destination file (as string, so the ascii codes are converted to characters)
  fclose(srcID);
  fclose(dstnID);
