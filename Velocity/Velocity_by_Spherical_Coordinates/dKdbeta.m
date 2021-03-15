% This function is used to calculate the value of (d K)/(d beta).

function f = dKdbeta(R,mu,tau,betac,r,theta)
    [k1,k2] = k1k2(R,mu,tau,betac);
    cosb = cosbeta(R,r,theta);
    sinb = sinbeta(R,r,theta);
    b = real(acos(cosb));
    
    f = k1.*(cosb.*sinh(tau.*b)+tau.*sinb.*cosh(tau.*b))-k2.*((1+tau.^2).*sinb.*sinh(tau.*b));
end
    