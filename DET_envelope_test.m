Sy = 60;

theta = linspace(0, 2*pi);
rho = Sy .* sqrt(1./(1-sin(theta).*cos(theta)));

[x, y] = pol2cart(theta, rho);

plot(x, y)
axis square;
grid on;

xticks([-Sy, 0, Sy]);
xticklabels({'-Sy', '0', 'Sy'});

yticks([-Sy, 0, Sy]);
yticklabels({'-Sy', '0', 'Sy'});