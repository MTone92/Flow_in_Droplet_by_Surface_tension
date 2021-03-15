% Superposion of multiple step distributions.

function f = N2(tau,betac)
    
    r1 = 0.05;
    r2 = 0.15;
    r3 = 0.25;
    r4 = 0.35;
    r5 = 0.45;
    r6 = 0.55;
    r7 = 0.65;
    r8 = 0.75;
    r9 = 0.85;
    r10 = 0.95;
    
    coshalpha1 = (sqrt(cos(betac).^2-((1-r1.^(-2)).*(cos(betac).^2+r1.^(-2))))+cos(betac))./(r1.^(-2)-1);
    coshalpha2 = (sqrt(cos(betac).^2-((1-r2.^(-2)).*(cos(betac).^2+r2.^(-2))))+cos(betac))./(r2.^(-2)-1);
    coshalpha3 = (sqrt(cos(betac).^2-((1-r3.^(-2)).*(cos(betac).^2+r3.^(-2))))+cos(betac))./(r3.^(-2)-1);
    coshalpha4 = (sqrt(cos(betac).^2-((1-r4.^(-2)).*(cos(betac).^2+r4.^(-2))))+cos(betac))./(r4.^(-2)-1);
    coshalpha5 = (sqrt(cos(betac).^2-((1-r5.^(-2)).*(cos(betac).^2+r5.^(-2))))+cos(betac))./(r5.^(-2)-1);
    coshalpha6 = (sqrt(cos(betac).^2-((1-r6.^(-2)).*(cos(betac).^2+r6.^(-2))))+cos(betac))./(r6.^(-2)-1);
    coshalpha7 = (sqrt(cos(betac).^2-((1-r7.^(-2)).*(cos(betac).^2+r7.^(-2))))+cos(betac))./(r7.^(-2)-1);
    coshalpha8 = (sqrt(cos(betac).^2-((1-r8.^(-2)).*(cos(betac).^2+r8.^(-2))))+cos(betac))./(r8.^(-2)-1);
    coshalpha9 = (sqrt(cos(betac).^2-((1-r9.^(-2)).*(cos(betac).^2+r9.^(-2))))+cos(betac))./(r9.^(-2)-1);
    coshalpha10 = (sqrt(cos(betac).^2-((1-r10.^(-2)).*(cos(betac).^2+r10.^(-2))))+cos(betac))./(r10.^(-2)-1);
    
    f = ((coshalpha1+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha1)...
        -(coshalpha2+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha2)...
        +(coshalpha3+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha3)...
        -(coshalpha4+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha4)...
        +(coshalpha5+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha5)...
        -(coshalpha6+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha6)...
        +(coshalpha7+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha7)...
        -(coshalpha8+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha8)...
        +(coshalpha9+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha9)...
        -(coshalpha10+cos(betac)).^(-0.5).*GegenC_myself(tau,coshalpha10));
end