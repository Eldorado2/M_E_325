%%%%% Problems 2 to 5 %%%%%
% A certain application requires a ball bearing with the inner ring 
% rotating, with a design life of 18 kh at a speed of 470 rev/min. 
% The radial load is 2.5 kN and an application factor of 1.2 is 
% appropriate. The reliability goal is 0.95. Find the multiple of rating 
% life required, xD , and the catalog rating C10 with which to enter a 
% bearing table. Choose a 02-series deep-groove ball bearing from Table 
% 11–2 and estimate the reliability in use.
% 
% NOTE: This is a multi-part 
% question. Once an answer is submitted, you will be unable to return 
% to this part.

%%%%% Problem 2 %%%%%
% What is the C10 value in kN for this application and design factor?

L_d = 18 * 1000; % h
N_d = 470; % rev/min
L_10 =  1e6;

x_d = (60 * L_d * N_d)/L_10; % design life, h

% calculate catalog life

a_f = 1.2;
F_d = 2.5; % kN
x_0 = 0.02;
theta_x_0 = 4.439;
b = 1.483;
a = 3; % for ball bearing
R_d = 0.95;

C_10 = a_f*F_d*(x_d/(x_0 + (theta_x_0)*(log(1/R_d))^(1/b)))^(1/a);

%%%%% Problem 3 %%%%%
% For a C10 value of 33.2 kN, what is the reliability using the design 
% factor, force, speed, and desired life from part a?

% guess and check

%%%%% Problems 4 and 5 are copies %%%%%



