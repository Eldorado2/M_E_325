%%%%% Problem 12 %%%%%
% A ¾ in-16 UNF series SAE grade 5 bolt has a ¾-in ID steel tube 8 in 
% long (h), clamped between washer faces of bolt and nut by turning the nut 
% snug and adding one-third of a turn. The tube OD is the washer-face 
% diameter dw = 1.5d = 1.5 (0.75 in) = 1.125 in = OD. Choose the 
% appropriate bolt length from Table A–17.
%
% Determine the bolt stiffness, the tube stiffness, and the joint 
% constant C.

d = 3/4; % in
d_o = 1.5 * d;
E_steel = 30; % Mpsi
l = 8; % in
H = 41/64; % in
A = 0.78715; % for steel
B = 0.62873; % for steel

L = l + H;
L = ceil(L / 0.5) * 0.5; % round to nearest half inch

if L <= 6
    L_t = 2*d + 0.25; % in
else
    L_t = 2*d + 0.5;  % in
end

l_d = L - L_t; % in
l_t = l - l_d; % in

A_d = pi*d^2/4; % in^2
A_t = 0.373;    % in^2 (Table 8-2 UNF)

k_b = (A_d*A_t*E_steel) / (A_d*l_t + A_t*l_d);

A_m = pi*(d_o^2 - d^2) / 4; % in^2

k_m = A_m * E_steel / l;

C = k_b/(k_b + k_m);
