n = 0:1:2;
x = 3*n; %1 row 3 columns
%[H,w] = dtft(h,1000); 
%plot(w/pi,20*log10(abs(H)));
%plot DTFT to determine what to draw for graph
Z = [x;zeros(2,3)]; % add 2 zeros in between each sample
z = Z(:); % convert to column vector
xe = z'; % convert to row vector 
m =[-14:14]+0.0001; 
hlp = 3*sin(0.2*pi*m)./(pi*m);
xi = conv(hlp,xe);
newvect=xi(15:21);
k = [0:6];
%stem(k,newvect);
stem(xi); 