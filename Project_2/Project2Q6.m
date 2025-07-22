n = 1:1000; %size [1 1000]
x = sin(2*pi*n/20); %size [1 1000]

%Downsample w/ no Filter
xd = downsample(x,12); %size [1 84]
size(xd)
nd = 1:84;
sound(xd,1667);