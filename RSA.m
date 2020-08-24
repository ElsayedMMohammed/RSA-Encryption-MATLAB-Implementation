clear; clc;
%% RSA Algorithm
bits = 13;
% (1) Get 2 distinct prime numbers between min, max.
  min = 2^0; max=2^bits;
  N = get_primes(2,min,max);
  ISPRIME = isprime(N) %to check
  p = N(1); q= N(2);

% (2) Determine n,k
  n = p*q;
  k = (p-1)*(q-1);
  
% (3) get e , where 1 < e < k  and gcd(e,k)=1 [coprime]
  e = get_coprime2(k);
    %COPRIME = get_gcd(e,k) %to ckeck
  
% (4) get d , where d is multiplicative inverse of e under remuluo k
  d = get_multi_inverse(e,k);
     %Multiplicative_Inverse = rem(d*e,k) %to check
  %if Multiplicative_Inverse ==1
   %     d = get_multi_inverse(e,k);
  %end
    % GCD = get_gcd(d*e,k)  %to check
  
  %% TRIAL
  m = fix(1+26*abs(rand(1)));
  c = mod_exponentiation2(m,e,n);
%  c2 = powermod(m,e,n);
  
  m2 = mod_exponentiation2(c,d,n);
 % m3 = powermod(c2,d,n);
  m==m2
