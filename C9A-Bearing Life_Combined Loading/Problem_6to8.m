%%%%% Problems 6 to 8 %%%%%
% An angular-contact, inner ring rotating, 02-series ball bearing is 
% required for an application in which the life requirement is 35 kh at 
% 600 rev/min. The design radial load is 725 lbf. The application factor 
% is 1.4. The reliability goal is 0.91.

%%%%% Problem 6 %%%%% 
L_d = 35 * 1000; % h
N_d = 600; % rev/min
L_10 =  1e6;

x_d = (60 * L_d * N_d)/L_10; % design life, h

% calculate catalog life

a_f = 1.4;
F_d = 725; % lbf
x_0 = 0.02;
theta_x_0 = 4.439;
b = 1.483;
a = 3; % for ball bearing
R_d = 0.91;

C_10 = (a_f*F_d*(x_d/(x_0 + (theta_x_0)*(log(1/R_d))^(1/b)))^(1/a)) ...
       / 224.8; % kN

%%%%% Problem 7 and 8 are copies%%%%%
% For a C10 value of 63.7 kN, what is the reliability using the design 
% factor, force, speed, and desired life from part a?

% Solve by tweeking value of R_d until C_10 values matches