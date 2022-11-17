% An M 14 × 2 hex-head bolt with a nut and a 14R washer under each of bolt 
% head and the nut is used to clamp together two 14-mm steel plates.

%%%%% Problem 4 %%%%%
% Determine a suitable length for the bolt, rounded up to the nearest 5 mm.

d = 14; % mm, nominal diameter
t = 14; % mm, plate thickness
H = 12.8; % mm, from A-31
w = 3.50; % mm, from table A-33, 14R washer
E = 207; % GPa, from table 8-8, Steel

% find bolt length, rounded up to nearest 5 mm
L = 2*t + 2*w + H; % mm
L = ceil(L/5) * 5; % mm

%%%%% Problem 5 %%%%%
% Determine the bolt stiffness.

l = 2*t + 2*w;

A_d = pi*d^2/4; % mm^2
A_t = 115; % from table 8-1

L_t = 2*d+6; % mm

l_d = L - L_t;
l_t = l - l_d;

k_b = (A_d*A_t*E) / (A_d*l_t + A_t*l_d); % MN/m

%%%%% Problem 6 %%%%%
% For Steel, from table 8-8
A = 0.78715;
B = 0.62873;

k_m = E*d*A*exp(B*d/l);