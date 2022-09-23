% A 1.1-in-diameter solid round bar has a groove 0.1-in deep with a 0.1-in 
% radius machined into it. The bar is made of AISI 1020 CD steel and is 
% subjected to a purely reversing torque of 1600 lbf·in.

% ##### Problem 14 #####
r = 0.1;
d = 0.9;

% AISI 1020 CD, table A-20:
Sut = 68;
Sy = 57;

% frome e fatigue
K_t = 1.4;

% ##### Problem 15 #####

% neuber for torsion
neuber_torsion = 0.190-2.51*(10^-3)*Sut + 1.35*(10^-5)*Sut^2 - 2.67*(10^-8)*Sut^3;

% notch sensitivity
q = 1/(1+(neuber_torsion/sqrt(r)));

% kf
K_f = 1 + q*(K_t-1);

% ##### Problem 16 #####
T = 1600;

shear_o = (T*d/2)/((pi*d^4)/32);
shear_max = K_f*shear_o;
shear_min = -shear_max;

stress_a = (shear_max-shear_min)/2;
stress_m = (shear_max+shear_min)/2;

% ##### Problem 17 #####

% marin factors
% surface
a_surface = 2;
b_surface = -0.217;

k_a = a_surface* Sut ^b_surface;

%size
k_b = 0.879*d^-0.107;

%Loading (torsion)
k_c = 0.59;

% ##### Problem 18 #####
% Determine the estimated endurance limit of the rotating beam specimen Se' 
% and fatigue strength for the conditions and materials in this 
% application. Also, determine the ultimate strength in shear for the 
% material, Ssu. Assume N = 1 million cycles.

Se_prime = 0.5* Sut;

Sf_1million = k_a*k_b*k_c*Se_prime;

Ssu = 0.67 * Sut;

% ##### Problem 19 #####
% Estimate the number of cycles to failure.

f = 1.06 - 2.8*(10^-3)*Ssu + 6.9*(10^-6)*Ssu^2;

% basquin parameters
a_basquin = (f*Ssu)^2/Sf_1million;
b_basquin = (-1/3)*log10(f*Ssu/Sf_1million);

N = ((Sf_1million)/a_basquin)^(1/b_basquin);

