[B1,A1] = ellip(5,0.5,65,[0.375 0.625],'bandpass');
[B2,A2] = ellip(5,0.5,65,[0.24 0.37],'bandpass');
[B3,A3] = ellip(5,0.5,65,[0.63 0.76],'bandpass');
C1 = conv(A3,B1);
C11 = (10^(0.04))*conv(C1,A2); %first term in num
C2 = conv(A3,A1);
C22 = (10^(-0.155))*conv(C2,B2); % second term in num
C3 = conv(B3,A1);
C33 = (10^(-0.155))*conv(C3,A2); %third term in num
D1 = conv(A3,A1);
D11 = conv(D1, A2); % term in den
Num = C11 + C22 + C33; % total num
fvtool(Num, D11);