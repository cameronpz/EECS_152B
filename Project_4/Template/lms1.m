function [h,y] = lms1(x,d,delta1,N)
% LMS Algorithm for Coefficient Adjustment
% -----------------------------------------------------------
% [h,y] = lms(x,d,delta1,N)
%     h = estimated FIR filter
%     y = output array y(n)
%     x = input array x(n)
%     d = desired array d(n), length must be same as x
%delta1 = step size
%     N = length of the FIR filter
%
M = length(x); y = zeros(1,M);
h = ones(1,N);
for n = N:M
   x1 = x(n:-1:n-N+1);
    y(n) = h*x1';
    e = d(n)-y(n);
    h = h + delta1*e*x1;
end


