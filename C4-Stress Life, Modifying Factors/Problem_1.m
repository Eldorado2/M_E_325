% A 10-mm steel drill rod was heat-treated and ground. The measured 
% hardness was found to be 320 Brinell. Estimate the endurance strength, 
% Se, in MPa if the rod is used in rotating bending.

% Take the value of factor a and exponent b from Table 6–2.

% Loading types: rotating bending

d = 10;
hardness_brinell = 320;

%for steels, Su = 3.4 Hb
Sut = 3.4 * hardness_brinell;

% Sut < 1400 MPa, so Se = 0.5 Sut
Se_prime = 0.5*Sut;

% from table 6-2 (part is ground)
a = 1.38;
b = -0.067;

% find surface modifier
k_a = a*Sut^b;

% size factor, 7.62mm < d < 51mm, therefore:
k_b = 1.24*d^-0.107;

% Loading factor, k_c. bending load, therfore:
k_c = 1;

% Temperature factor, k_d assume 1, since no temp specified.
k_d = 1;

% reliability factor
k_e = 1;

% endurance limit
Se = k_a*k_b*k_c*k_d*k_e*Se_prime;



