%Q1i
x = -1 + (2).*rand(1,3000);
%noise signal generator x from -1 to 1, size 3000

%Q1ii
a = [1,-0.7,0.12];
b = [1,1.5,0.56];
%coefficients of IIR filter

d=filter(b,a,x);
%output of filter (desired output)

%Q1iii
N = 10;
delta1 = 0.55;
[h,y] = lms1(x,d,delta1,N);
%outputs the adaptive filter and output

%Q1a 
K = 10*N;
sqerr = zeros(1,K); %allocate memory for the output vector
SumSE = zeros(1,29); %allocate memory for the output vector
ASE = zeros(1,29); %allocate memory for the output vector

for n = 100:100:3000-K

    %Calculate Square Error
    for k=n+1:n+K 
    sqerr(k-n) = (d(k)-y(k)).^2;
    end 

    %Calculate Sum of SE
    temp = 0; %initialize
    for p=1:K
    temp = sqerr(p)+temp;
    end
SumSE(n/K)=temp;

ASE(n/K)=(1/K).*SumSE(n/K);
end
m=1:29;
plot(m,ASE), xlabel('n/100 values'), ylabel('Avg Sq Error'),...
    title ('Avg Sq Error for N = 10 & K = 100 & delta = 0.55');
    grid


