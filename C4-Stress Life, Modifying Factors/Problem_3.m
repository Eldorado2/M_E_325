% A steel rotating-beam test specimen has an ultimate strength, Sut, of 
% 1100 MPa (160 kpsi). Estimate the fatigue strength, Sf, corresponding to 
% a life of 130 kcycles of stress reversal. Take the value of the fatigue 
% strength fraction, f, from Fig. 6–23.

Sut = 1100;
N = 130000;

f = 1.06 - 4.1*(10^-4)*Sut + 1.5*(10^-7)*Sut^2;

Se_prime = 0.5 * Sut;

% Basquin parameters
a = ((f * Sut)^2)/Se_prime;
b = -1/3 * log10(f*Sut/Se_prime);

% Find Sf
Sf = a*N^b;