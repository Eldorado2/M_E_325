%%%%% Problem 1 %%%%%
t = 20; % mm
H = 12.8; % mm, from A-31

L = 2*t + H; % mm
L = ceil(L/5) * 5; % mm


%%%%% Problem 2 %%%%%

d = 14; % mm
l = 40; % mm
E = 207; % GPa

A_d = pi*d^2/4; % mm^2
A_t = 115; % from table 8-1

L_t = 2*d+6; % mm

l_d = L - L_t;
l_t = l - l_d;

k_b = (A_d*A_t*E) / (A_d*l_t + A_t*l_d); % MN/m

%%%%% Problem 3 %%%%%

% For Steel, from table 8-8
A = 0.78715;
B = 0.62873;

k_m = E*d*A*exp(B*d/l);
 
