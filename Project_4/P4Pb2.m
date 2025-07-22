%impulse response of IIR filter

a = [1,-0.7,0.12];
b = [1,1.5,0.56];
%coefficients of the IIR filter
x = zeros(1,19);
x(10)= 1;
hi=filter(b,a,x);
%output of filter (desired output)
ni = -9:1:9;
stem(ni,hi,'r');
hold
%Generate impulse of adaptive filter
xx = -1 + (2).*rand(1,3000);
%noise signal generator xx from -1 to 1, size 3000

d=filter(b,a,xx);
%output of filter (desired output)
%Q1iii
N = 10;
delta1 = 0.01;
[hf,y] = lms1(xx,d,delta1,N);
%outputs the adaptive filter and output
n = 0:1:9;
stem(n,hf,'b'), xlabel('Discrete Time'), ylabel('Amplitude'),...
    title ('Impulse Responses of IIR and FIR of N = 10');
    grid