%%%%% Problem 11 %%%%%
% Two 20-mm steel plates are to be clamped together with a bolt and nut. 
% Specify the coarse thread metric bolt that provides the joint factor 
% closest to 0.2. Make sure to use standard length bolts as defined by 
% preferred sizes in A–17.
%
% Determine the bolt diameter, bolt length, and the joint constant.

d = 14; % mm %%%%%% CHANGE %%%%%
E_steel = 207; % GPa
l = 40; % mm
A = 0.78715; % for steel
B = 0.62873; % for steel
L = 55; % mm

if L <= 125
    L_t = 2*d + 6; % mm
elseif (125 < L) && (L <= 200)
    L_t = 2*d + 12; % mm
else
    L_t = 2*d + 25; % mm
end

l_d = L - L_t;
l_t = l - l_d;

A_d = pi*d^2/4; % mm^2
A_t = 115; % from table 8-1 %%%%%% CHANGE %%%%%

k_b = (A_d*A_t*E_steel) / (A_d*l_t + A_t*l_d);
k_m = E_steel*d*A*exp(B*d/l);

C = k_b/(k_b + k_m);
