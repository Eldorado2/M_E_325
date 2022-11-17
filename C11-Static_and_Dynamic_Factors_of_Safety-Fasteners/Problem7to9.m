%%%%% Problems 7 to 9 %%%%%
% A 2-in. steel plate and a 1.25-in. cast-iron plate are compressed with one 
% bolt and nut. The bolt is ½ in-13 UNC. 

%%%%% Problem 7 %%%%%
% Determine a suitable length for the bolt, rounded up to the nearest ¼ in.

d = 1/2;
t_steel = 2; % in
t_cast_iron = 1.25; % in
H = 7/16; % in, from A-31 (d = 1/2)
E_bolt = 30; % Mpsi

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

k_b = (A_d*A_t*E_bolt) / (A_d*l_t + A_t*l_d); % Mlb/in

function k_m = stiffness()