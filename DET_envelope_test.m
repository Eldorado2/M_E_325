Sy = 60; % Yield strength

% Create 100 values for theta from 0 to 2pi
theta = linspace(0, 2*pi);
% polar form of failure envelope
rho = Sy.*(1 - sin(theta).*cos(theta)).^-0.5;

% convert polar coordinates to matrix of cartesian coordinates
[x, y] = pol2cart(theta, rho);

plot(x, y)
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
axis square; % keep axes at same scale in window
grid on;

% Labels
xticks([-Sy, 0, Sy]);
xticklabels({'S_{y}', '0', 'S_{y}'});

yticks([-Sy, 0, Sy]);
yticklabels({'-S_{y}', '0', 'S_{y}'});