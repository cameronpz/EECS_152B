function [A,D,D2,W,T]=linarr(m,ang,sep)
%function [A,D,D2,W,T]=linarr(m,ang,sep)

if nargin < 3
  sep=0.5;
end
d=length(ang);
rang=sin(ang(:)*pi/180);
cang=cos(ang(:)*pi/180);
j=sqrt(-1);
r=[0:m-1]';
T=2*pi*r*sep*rang';
A=exp(-j*T);
if nargout > 1  
  W=2*pi*r*sep*cang';
  D=-j*W.*A;
  D2=(j*T-W.*W).*A;
end
