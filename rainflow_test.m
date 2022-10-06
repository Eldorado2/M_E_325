fs = 512;

X = [-2 1 -3 5 -1 3 -4 4 -2];
lX = length(X)-1;

Y = -diff(X)/2.*cos(pi*(0:1/fs:1-1/fs)') + (X(1:lX)+X(2:lX+1))/2;
Y = [Y(:);X(end)];

plot(0:lX,X,'o',0:1/fs:lX,Y)

[c,hist,edges,rmm,idx] = rainflow(Y,fs);

T = array2table(c,'VariableNames',{'Count','Range','Mean','Start','End'})