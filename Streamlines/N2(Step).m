% This function is used to calculate PSI with a surface tension ring
% distribution.

function f = N2(tau,betac)
    
    r1 = 0.4;
    r2 = 0.6;
    coshalpha1 = (sqrt(cos(betac).^2+((r1.^(-2)-1).*(cos(betac).^2+r1.^(-2))))+cos(betac))./(r1.^(-2)-1);
    coshalpha2 = (sqrt(cos(betac).^2+((r2.^(-2)-1).*(cos(betac).^2+r2.^(-2))))+cos(betac))./(r2.^(-2)-1);
    
    f =((coshalpha1+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha1)-...
       (coshalpha2+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha2));
    
   %When r2>1:
   %f = (coshalpha1+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha1);
   %When r1=0:
   %f = -(coshalpha2+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha2);
    
end