%%%%% Problems 10 to 11 %%%%%
% A 02-series single-row deep-groove ball bearing with a 65-mm bore 
% (see Tables 11–1 and 11–2 for specifications) is loaded with a 3-kN 
% axial load and a 7-kN radial load. The outer ring rotates at 650 rev/min.

%%%%% Problem 10 %%%%%
% What is the equivalent radial load, Fe?

F_a = 3; % kN
F_r = 7; % kN
C_0 = 34; % kN, From table 11-2, for 65 mm bore
V = 1.2; % Outer ring rotates

FaC0 = F_a/C_0;

% Find e with interpolation

e = lininterp(0.084, FaC0, 0.110, 0.28, 0.30);

FAVFR = F_a/(V*F_r);

% F_a/(V*F_r) > e

X_2 = 0.56;

% Interpolate to find Y_2

Y_2 = lininterp(0.084, FaC0, 0.110, 1.55, 1.45);

% Find F_e
F_e = X_2*V*F_r + Y_2*F_a;

%%%%% Problem 11 %%%%%
% Is this bearing expected to carry this load with a 95 percent reliability 
% for 10 kh? What is the required C10 based on results from part a?

L_d = 10 * 1000; % h
N_d = 650; % rev/min
L_10 =  1e6;

x_d = (60 * L_d * N_d)/L_10; % design life, h

% calculate catalog life

a_f = 1;
F_d = F_e; % lbf
x_0 = 0.02;
theta_x_0 = 4.439;
b = 1.483;
a = 3; % for ball bearing
R_d = 0.95;

C_10 = (a_f*F_d*(x_d/(x_0 + (theta_x_0)*(log(1/R_d))^(1/b)))^(1/a)); % kN

function y2 = lininterp(x1, x2, x3, y1, y3)
    y2 = ((x2 - x1)*(y3 - y1))/(x3 - x1) + y1;
end
