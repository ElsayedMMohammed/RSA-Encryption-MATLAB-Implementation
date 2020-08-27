%% The main script to apply RSA encryption algorithm and get the text
clear; clc;
bits = 8; %Specifiy the number of bits of the machine (MAX = 8) in this case..

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
  srcID = fopen('Original_Input.txt','r'); %opens source txt
  dstnID = fopen('Encrypted_Text.txt','wt'); %opens destination file
  txt_string = fscanf(srcID,'%c'); %reads txt from source into matrix
  txt = double(txt_string); %converts txt char into asci
  [rows,cols] = size(txt);
  nums = zeros(rows,cols);

  
  for i=1:rows
      for j=1:cols
         m = txt(i,j);
         c = mod_exponentiation2(m,e,n);
         %m2 = mod_exponentiation2(c,d,n);
         nums(i,j)=c;
         
      end
  end
  
  fprintf(dstnID,'%s',char(nums)); %writes txt to destination file (as string, so the ascii codes are converted to characters)
  fclose(srcID);
  fclose(dstnID);
%% Decryption DEMO
  srcID = fopen('Encrypted_Text.txt','r'); %opens source txt
  dstnID = fopen('Decrypted_Text.txt','wt'); %opens destination file
  txt_e_string = fscanf(srcID,'%c'); %reads txt from source into matrix
  txt_e = double(txt_e_string); %converts txt char into asci
  [rows,cols] = size(txt_e);
  nums_d = zeros(rows,cols);
  
  for i=1:rows
      for j=1:cols
         m = txt_e(i,j);
         m2 = mod_exponentiation2(m,d,n);
         nums_d(i,j)=m2;
        
      end
  end
  
  fprintf(dstnID,'%s',char(nums_d)); %writes txt to destination file (as string, so the ascii codes are converted to characters)
  fclose(srcID);
  fclose(dstnID);
