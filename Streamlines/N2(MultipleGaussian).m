% Superposition of Multiple Gaussian distributions.

function f = N2(tau,betac)
    s = 0;
    st = 1000;
    dalpha = 0.001;
    p1 = 0.15;
    p2 = 0.33;
    p3 = 0.55;
    p4 = 0.75;
    p5 = 0.95;
    
    for alpha = dalpha/2:dalpha:(12-dalpha/2)
        s = s+((sinh(alpha)/(cosh(alpha)+cos(betac))-(p1))*((cosh(alpha)*cos(betac)+1)/(cosh(alpha)+cos(betac))^2.5)*exp(-st*(sinh(alpha)/(cosh(alpha)+cos(betac))-(p1))^2)...
            +(sinh(alpha)/(cosh(alpha)+cos(betac))-(p2))*((cosh(alpha)*cos(betac)+1)/(cosh(alpha)+cos(betac))^2.5)*exp(-st*(sinh(alpha)/(cosh(alpha)+cos(betac))-(p2))^2)...
            +(sinh(alpha)/(cosh(alpha)+cos(betac))-(p3))*((cosh(alpha)*cos(betac)+1)/(cosh(alpha)+cos(betac))^2.5)*exp(-st*(sinh(alpha)/(cosh(alpha)+cos(betac))-(p3))^2)...
            +(sinh(alpha)/(cosh(alpha)+cos(betac))-(p4))*((cosh(alpha)*cos(betac)+1)/(cosh(alpha)+cos(betac))^2.5)*exp(-st*(sinh(alpha)/(cosh(alpha)+cos(betac))-(p4))^2)...
            +(sinh(alpha)/(cosh(alpha)+cos(betac))-(p5))*((cosh(alpha)*cos(betac)+1)/(cosh(alpha)+cos(betac))^2.5)*exp(-st*(sinh(alpha)/(cosh(alpha)+cos(betac))-(p5))^2))...
            *GegenC_myself(tau,cosh(alpha))*dalpha;
    end
    
    f = -2*st*s;
end