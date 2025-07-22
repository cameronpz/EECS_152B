%x = sin(2*pi*1000*t);
%this would be my signal in time 
n = 0:1000;
%Fs = 20 kHz, Ts = 
x = sin(2*pi*1000*n*5*10^(-5));
%x = sin(2*pi*n/20);
sound(x, 20000);

