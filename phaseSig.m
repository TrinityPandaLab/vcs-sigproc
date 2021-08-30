function ang = phaseSig(obj)
%Takes signal processing object and gives arc tangent of RMS of signals in
%y and z

    zt = sqrt(sum(obj.tran.z.^2));
    yt = sqrt(sum(obj.tran.y.^2));
    
    ang = atan2(zt, yt);
end