% A steel rotating-beam test specimen has an ultimate strength, 
% Sut, of 120 kpsi. Estimate the life of the specimen if it is 
% tested at a completely reversed stress amplitude, σrev, of 66 kpsi. 
% Take the value of the fatigue strength fraction, f, from Fig. 6-23.

Sut = 120;

stress_reverse = 66;

f = 1.06 - 2.8*(10^-3)*Sut + 6.9*(10^-6)*Sut^2;

% endurance limti rotating
Se_prime = 0.5 * Sut;

% Basquin parameters
a = ((f * Sut)^2)/Se_prime;
b = -1/3 * log10(f*Sut/Se_prime);

% Cycle life
N = (stress_reverse/a)^(1/b);
