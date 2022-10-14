%%%%% Problems 4 to 5 %%%%%
% A solid round bar with a diameter of 1.63 in has a groove cut to a 
% diameter of 1.468 in, with a radius of 0.082 in. The bar is not rotating. 
% The bar is loaded with a repeated bending load that causes the bending 
% moment at the groove to fluctuate between 0 and 25,000 lbf·in. The bar is 
% hot-rolled AISI 1095, but the groove has been machined. Determine the 
% factor of safety for fatigue based on infinite life using the modified 
% Goodman criterion and the factor of safety for yielding.

D = 1.630; % in
d = 1.468; % in
r = 0.082; % in

% For AISI 1095 HR
S_ut = 120; % kpsi
S_y = 66; % kpsi

M_max = 25000; % lbf-in
M_min = 0; % lbf-in

%%%%% Problem 4 %%%%%
% Using the Goodman failure criterion, determine the factor of safety?

% Find the stress concentration factor
% From figure A-15-14:
Dd = D/d;
rd = r/d;

K_t = 2.1;

% Moment of inertia
I = (pi*d^4)/64; % in^4

% Nominal bending stress
c = d/2;

stress_nom_max = (M_max*c / I)/1000; % kpsi
stress_nom_min = (M_min*c / I)/1000; % kpsi

% Find the fatigue stress concentration factor

% Find the neuber's constant for bending
neuber_bending = 0.246 ...
                 - 3.08*(10^-3)*S_ut ...
                 + 1.51*(10^-5)*S_ut^2 ...
                 - 2.67*(10^-8)*S_ut^3; % in^(1/2)

% Find the notch sensitivity
q = 1/(1 + neuber_bending/sqrt(r));

% Fatigue stress concentration factor:
K_f = 1 + q*(K_t - 1);

stress_max = K_f * stress_nom_max; % kpsi
stress_min = K_f * stress_nom_min; % kpsi

% Calculate mean and alternating stress
stress_a = (stress_max-stress_min)/2;
stress_m = (stress_max+stress_min)/2;

% Calculate rotary-beam endurance limit
S_e_prime = 0.5 * S_ut; % kpsi

% Calculate Marin Factors

% For the surface factor, k_a, the groove is machined
a_surface = 2;
b_surface = -0.217;

k_a = a_surface*S_ut^b_surface;

% For the size factor, k_b, the bar is in bending and is not rotating
% because the specimen is not rotating, a critical diameter needs to be
% calculated
d_e = 0.370 * d; % in

% 0.3<d_e<2 in
k_b = 0.879*d_e^-0.107;

% For the loading factor, k_c, the loading is in bending
k_c = 1;

% Temperature factor, operating temperature assumed to not have effect on
% fatigue
k_d = 1;

% Reliability assumbed to be 50%
k_e = 1;

% Calculate endurance limit
S_e = k_a*k_b*k_c*k_d*k_e*S_e_prime; % kpsi

% Calculate factor of safety for fatigue using the goodman criterion
n_f = (stress_a/S_e + stress_m/S_ut)^-1;

%%%%% Problem 5 %%%%%
% Is the same as 4...
