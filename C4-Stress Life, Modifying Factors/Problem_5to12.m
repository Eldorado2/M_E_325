% A rotating shaft of 25-mm diameter is simply supported by bearing 
% reaction forces R1 and R2. The shaft is loaded with a transverse load of 
% 13 kN as shown in the figure. The shaft is made from AISI 1050 hot-rolled 
% steel. The surface has been machined.

% ##### Problem 5 #####
% Determine the minimum static factor of safety based on yielding.
F = 13;
d = 25;

R1 = (F * 50)/200;
R2 = F - R1;

M = 3.25*150;

c = d/2;
I = pi*d^4/64;
stress_bending = M*c/I;

% convert stress from GPa to MPa
stress_bending = stress_bending * 1000;

% look up yield strength for AISI 1050 HR from table A-20:
Sy = 340; %MPa

% Minimum factor of safety for static yielding
ny = Sy/stress_bending;

% ##### Problem 6 #####
% Determine the endurance limit, adjusted as necessary with Marin factors.

% find rotating endurance limit.
% for AISI 1050, Sut < 1400
Sut = 620; % MPa

%there fore
Se_prime = 0.5 * Sut;

% Find marin factors
% for the surface, it has been machined, therfore, from 6-2:
a_surface = 3.04;
b_surface = -0.217;

k_a = a_surface * Sut^b_surface;

% Size factor, rotating 7.62mm < d < 51
k_b = 1.24 * d^-0.107;

% Loading factor, bending
k_c = 1;

% Assume temperatur factor = 1
k_d = 1;

% Assume reliability = 50%
k_e = 1;

% Assume no misc effects
k_f = 1;

% calculate adjusted endurance limit
Se = k_a*k_b*k_c*k_d*k_e*k_f*Se_prime;

% ##### Problem 7 #####
% Determine the minimum fatigue factor of safety based on achieving 
% infinite life.

nf_infinite = Se/stress_bending;

% ##### Problem 8 #####
% If the fatigue factor of safety is less than 1, then estimate the life 
% of the part in number of rotations.

f = 1.06 - 4.1*(10^-4)*Sut + 1.5*(10^-7)*Sut^2;

% basquin parameters
a_basquin = (f*Sut)^2/Se;
b_basquin = (-1/3)*log10(f*Sut/Se);

N = (stress_bending/a_basquin)^(1/b_basquin);

% ##### Problem 9 #####
% Determine the minimum static factor of safety based on yielding.

% its the same as 5 lol....

% ##### Problem 10 #####

% same as 6... smh...

% ##### Problem 11 #####

% lucky number 7!!! it's 7...

% ##### Problem 12 #####

% I'm dying lol, these were all repeats... (see question 8)



