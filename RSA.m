%% The main script to apply RSA encryption algorithm
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
  m = fix(1+26*abs(rand(1)));
  c = mod_exponentiation2(m,e,n);
  m2 = mod_exponentiation2(c,d,n);
  
  m==m2
