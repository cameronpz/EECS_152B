function IntAngle = GetAng(slope, AngSt)
%two input parameters: slope of angle change, starting angle
    n = 100000;
    IntAngle = zeros(1,n); %memory allocation
    for m=1:n
        IntAngle(m) = (m-1)*slope+AngSt; %(1x100000)
    end
end