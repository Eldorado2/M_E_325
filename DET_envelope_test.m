Sy = 60;
theta = linspace(0, 2*pi);
rho = Sy .* sqrt(1./(1-sin(theta).*cos(theta)));

[x, y] = pol2cart(theta, rho);

plot(x, y)

