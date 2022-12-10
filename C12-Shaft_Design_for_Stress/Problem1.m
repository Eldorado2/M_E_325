%%%%% Problem 1 %%%%%
%
% A shaft is loaded in bending and torsion such that Ma = 60 N·m, 
% Ta = 38.633 N·m, Mm = 47.144 N·m, and Tm = 30 N·m. For the shaft, 
% Su = 700 MPa and Sy = 560 MPa, the true fracture strength is 1045 MPa, 
% and a fully corrected endurance limit of Se = 210 MPa is assumed. Let 
% Kf = 2.2 and Kfs = 1.8. With a design factor of 2.0, determine the 
% minimum acceptable diameter of the shaft using the methods mentioned in 
% the subsection.
%
% Determine the diameter of the shaft for the given loadings, material 
% properties, and fatigue stress concentration factors using the DE-Goodman 
% criterion.

M_a = 60;     % N-m
T_a = 38.633; % N-m
M_m = 47.144; % N-m
T_m = 30;     % N-m

S_ut = 700; % MPa
S_y = 560; % MPa

S_e = 210; % MPa

K_f = 2.2;
K_fs = 1.8;

n = 2;

A = sqrt(4*(K_f*M_a)^2 + 3*(K_fs*T_a)^2);
B = sqrt(4*(K_f*M_m)^2 + 3*(K_fs*T_m)^2);

d = (16*n/pi * (A/(S_e*10^6) + B/(S_ut*10^6)))^(1/3); % m
d = d * 1000; % mm