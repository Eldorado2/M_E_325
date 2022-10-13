%%%%% Problems 1-3 %%%%%
% A 1.1-in-diameter solid round bar has a groove 0.1-in deep with a 0.1-in 
% radius machined into it. The bar is made of AISI 1020 CD steel and is 
% subjected to a purely reversing torque of 1700 lbf·in.

%%%%% Problem 1 %%%%%
% What are the values of the alternating and mean components of the 
% shear stress?

% For AISI 1020 CD Steel:
S_ut = 68; % kpsi
S_y = 57; % kpsi

S_su = 0.67*S_ut; % Replace S_ut with S_su
S_sy = 0.577*S_y; % Replace S_y with S_sy

T = 1700; % lbf-in, purely reversing

D = 1.1; % in
d = D - 2*0.1; % in
r = 0.1; % in

% polar moment of inertia
J = pi*d^4/32; % in^4

rd = r/d; 
Dd = D/d;

% From figure A-15-15
K_ts = 1.4;

% Find neubers constant
neuber_torsion = 0.190 ...
                 - 2.51*(10^-3)*S_ut ...
                 + 1.35*(10^-5)*S_ut^2 ...
                 - 2.67*(10^-8)*S_ut^3; % in^1/2

% Find notch sensitivity
q_s = (1 + neuber_torsion/sqrt(r))^-1;

% Find fatigue stress concentration factor
K_fs = 1 + q_s*(K_ts - 1);

% Find nominal shear stress
c = d/2;
shear_nom = ((T*c)/J) / 1000; % kpsi

% Find max shear stress
shear_max = K_fs * shear_nom; % kpsi

% Find alternating and mean components of stress
stress_a = (shear_max+shear_max)/2;
stress_m = (shear_max-shear_max)/2;

%%%%% Problem 2 %%%%%
% Is the same as problem 1....

%%%%% Problem 3 %%%%%
% Estimate the number of cycles to failure.

% Assume endurance limit is half of ultimate strength
S_e_prime = 0.5 * S_ut;

f = 1.06 - 2.8*(10^-3)*S_ut + 6.9*(10^-6)*S_ut^2;

% Marin Factors

% For surface factor, k_a, assume cold drawn
a_surface = 2;
b_surface = -0.217;

k_a = a_surface*S_ut^b_surface;

% For the size factor, k_b, 0.3<d<2in (d=0.9)
k_b = 0.879*d^-0.107;

% For load factor, k_c, loading is in torsion
k_c = 0.59;

% Assume temperature effects, reliability, and miscellaneous effects
% ignored

% Find endurance limit
S_se = k_a*k_b*k_c*S_e_prime;

a = ((f*S_su)^2)/S_se;
b = (-1/3)*log10((f*S_su)/S_se);

% Estimate cycles to failure
N = (shear_max/a)^(1/b);
