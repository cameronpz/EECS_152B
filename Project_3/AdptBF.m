%AngSt1 = -25, AngSt2 = 15, ad1 = 5
%n = 100,000 16 antennas
function OutputS = AdptBF(dang,iang1,iang2,slope,e)  
    %First 100 Samples
    load('ABF.mat');
    ad1 = linarr(16,dang,0.5); % column vector 16x1
    ai1 = linarr(16,iang1,0.5); % column vector 16x1
    ai2 = linarr(16,iang2,0.5); % column vector 16x1
    sd1 = nursie(1:100000).'; % row vector 1x100,000
    si1 = 100*(babble(1:100000).'); % row vector 1x100,000
    si2 = 100*(jetnoise(1:100000).'); % row vector 1x100,000
    noise = 0.05*(randn(16,100000)+1j*randn(16,100000));
    X = ad1*sd1+ai1*si1+ai2*si2+noise; %16x100,000

    A = ad1; %16x1
    c = 1; %1x1

    Rxx_np1 = zeros(16,16); %initialize
    M = 100;
    e1 = 1/M;
    
    for n=1:M
        Z = X(1:16,n)*X(1:16,n)'; %16x16
        Rxx_np1 = (1-e1)*Rxx_np1 + e1*Z; 
%this initializes the first value we will use in our calculations below
    end

%Update Beamformer: 
    IA1 = GetAng(slope, iang1); %(1x100000)
    IA2 = GetAng(slope, iang2); %(1x100000)

    Uai1 = zeros(16,100000); %allocate memory 
    Uai2 = zeros(16,100000); %allocate memory 
    UX = zeros(16,100000); %allocate memory
    adxsd=ad1*sd1;
    for k=M+1:100000
        Uai1(1:16,k) = linarr(16,IA1(k-M),0.5);
        Uai2(1:16,k) = linarr(16,IA2(k-M),0.5);
        UX(1:16,k) = adxsd(:,k)+Uai1(:,k)*si1(k)+Uai2(:,k)*si2(k)+noise(:,k); %16x1
    end
%now I have gathered all info on int angles for all time

    y = zeros(1,100000); %allocate memory for the output vector
    for n=M+1:100000
        Z = UX(1:16,n)*UX(1:16,n)'; %16x16
%sampling at only one time value at a time
        Rxx_np1 = (1-e)*Rxx_np1 + e*Z; 
%New value = (1-e)*old value + e*current value
%this creates an exponential window filter of past values
        Ri = inv(Rxx_np1); %16x16
        g = Ri*A*inv(A'*Ri*A)*c;
        h = conj(g);
        y(n) = h.'*UX(1:16, n); %puts in data into output vector
    end 
    OutputS = y;
end  %end of function
