% This function is used to calculate (d^2 K)/(d b^2).

function f = dKdbetadbeta(R,mu,tau,betac,r,theta)
    sinb = sinbeta(R,r,theta);
    cosb = cosbeta(R,r,theta);
    b = real(acos(cosb));       % Just in case of some wired complex value.
    [k1,k2] = k1k2(R,mu,tau,betac);
    
    f1 = 2.*tau.*cosb.*cosh(tau.*b)+(tau.^2-1).*sinb.*sinh(tau.*b);
    f2 = (1+tau.^2).*cosb.*sinh(tau.*b)+(tau+tau.^3).*sinb.*cosh(tau.*b);
    f = k1.*f1-k2.*f2;
    
end