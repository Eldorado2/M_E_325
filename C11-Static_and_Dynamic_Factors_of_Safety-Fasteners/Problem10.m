%%%%% Problem 10 %%%%%
% A 1.5-in. steel plate and a 0.75-in. gray cast iron plate are compressed 
% with one bolt and nut. The bolt is ½ in-13 UNC. A ½ N American Standard 
% plain washer is used under the head of the bolt and under the nut.
%
% Determine the material stiffness.

t_steel = 1.5; % in
t_cast_iron = 0.75; % in
t_washer = 0.095; % in, 1/2 N washer thickness
d = 1/2; % in
W = 0.75; % in
E_steel = 30; % Mpsi
E_cast_iron = 14.5; % Mpsi

l = t_steel + t_cast_iron + 2*t_washer;

D_1 = W;                            % in
D_2 = D_1 + 2*t_washer*tand(30);    % in
D_3 = D_2 + 2*t_cast_iron*tand(30); % in

% washer frustrum stiffness
k_1 = stiffness(d, D_1, t_washer, E_steel);
% cast iron frustrum stiffness
k_2 = stiffness(d, D_2, t_cast_iron, E_cast_iron);
% 1st steel frustrum stiffness
k_3 = stiffness(d, D_3, l/2 - t_washer - t_cast_iron, E_steel);
% washer and steel frustrum stiffness
k_4 = stiffness(d, D_1, t_washer + t_steel, E_steel);

% Material stiffness
k_m = (1/k_1 + 1/k_2 + 1/k_3 + 1/k_4)^-1;

function k = stiffness(d, D, t, E)
    k = 0.5774*pi*E*d / log(((1.155*t+D-d)*(D+d)) / ((1.155*t+D+d)*(D-d)));
end