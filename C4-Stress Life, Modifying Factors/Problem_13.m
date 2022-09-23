% ##### Problem 13 #####

% A pin in a knuckle joint is shown in part (a) of the figure. The joint is 
% subject to a repeatedly applied and released load of 6000 N in tension. 
% Assume the loading on the pin is modeled as concentrated forces as shown 
% in part (b) of the figure. The shaft is made from AISI 1018 hot-rolled 
% steel that has been machined to its final diameter. Based on a stress 
% element on the outer surface at the cross section A, determine a suitable 
% diameter of the pin to provide at least a factor of safety of 1.5 for 
% both infinite fatigue life and for yielding.

F = 6000; % N

% Material is AISI 1018 HR, from table A-20:
Sut = 400; % MPa
Sy = 220; % MPa

% FOS = 1.5 for both infinite fatigue life & yielding
stress_x_yield = Sy/1.5;

% Max bending moment
M = 45000;

% Suitable pin diameter for yielding
d_yield = ((32*M)/(pi*stress_x_yield))^(1/3);

%Marin Factors
% Surface factor, k_a
% machine surface:
a_surface = 3.04;
b_surface = -0.217;
k_a = a_surface*Sut^b_surface;

% Suitable pin diameter for infinite fatigue life
d_fatigue = ((pi*k_a*1.24)/(1.5*32*M))^(1/3.107);



