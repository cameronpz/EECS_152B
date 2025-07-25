function [H,W] = dtft( h, N )
%DTFT   calculate DTFT at N equally spaced frequencies
%   usage:   H = dtft( h, N )
%      h: finite-length input vector, whose length is L
%      N: number of frequencies for evaluation over [-pi,pi)
%             ==> constraint: N >= L
%             if N not included, it is assumed to be equal to length of h
%      H: DTFT values (complex)
%      W: (2nd output) vector of freqs where DTFT is computed

if nargin < 2
    N=length(h);
end
N = fix(N);
L = length(h);  h = h(:);  %<-- for vectors ONLY !!!
if( N < L )
   error('DTFT: # data samples cannot exceed # freq samples')
end
W = (2*pi/N) * [ 0:(N-1) ]';
mid = ceil(N/2) + 1;
W(mid:N) = W(mid:N) - 2*pi;   % <--- move [pi,2pi) to [-pi,0)
W = fftshift(W);
H = fftshift( fft( h, N ) );  %<--- move negative freq components 
