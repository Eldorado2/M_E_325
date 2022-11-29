%%%%% Problems 7 to 9 %%%%%
% A 2-in. steel plate and a 1.25-in. cast-iron plate are compressed with one 
% bolt and nut. The bolt is ½ in-13 UNC. 

%%%%% Problem 7 %%%%%
% Determine a suitable length for the bolt, rounded up to the nearest ¼ in.

d = 1/2;
t_steel = 2; % in
t_cast_iron = 1.25; % in
H = 7/16; % in, from A-31 (d = 1/2)
W = 3/4; % in, from A-29 (d = 1/2)
E_steel = 30; % Mpsi
E_cast_iron = 14.5; % Mpsi

L = t_cast_iron + t_steel + H;
L = ceil(L / 0.25) * 0.25;

%%%%% Problem 8 %%%%%
% Determine the bolt stiffness.

l = t_steel + t_cast_iron; % in, grip

A_d = pi*d^2/4; % mm^2
A_t = 0.1419; % in^2, from table 8-2

if L <= 6
    L_t = 2*d + 0.25; % in
else
    L_t = 2*d + 0.5; % in
end

l_d = L - L_t;
l_t = l - l_d;

k_b = (A_d*A_t*E_steel) / (A_d*l_t + A_t*l_d); % Mlb/in

%%%%% Problem 9 %%%%%
% Determine the material stiffness

D_1 = W;
D_2 = D_1 + 2*t_cast_iron*tand(30);
D_3 = D_1 + 2*l/2*tand(30);

% stiffness of frustra:
% Stiffness cast iron section:
k_1 = stiffness(d, D_1, t_cast_iron, E_cast_iron);
% Stiffness of 1st steel section
k_2 = stiffness(d, D_2, l/2-t_cast_iron, E_steel);
% Stiffness of 2nd steel section
k_3 = stiffness(d, D_1, l/2, E_steel);

k_m = (1/k_1 + 1/k_2 + 1/k_3)^-1;

function k = stiffness(d, D, t, E)
    k = 0.5774*pi*E*d / log(((1.155*t+D-d)*(D+d)) / ((1.155*t+D+d)*(D-d)));
end