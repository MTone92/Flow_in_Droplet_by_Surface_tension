% This function is used to calculate the value of (d K)/(d beta).

function f = dKdbeta(R,mu,tau,betac,beta)
    [k1,k2] = k1k2(R,mu,tau,betac);
    cosb = cos(beta);
    sinb = sin(beta);
    
    f = k1.*(cosb.*sinh(tau.*beta)+tau.*sinb.*cosh(tau.*beta))-k2.*((1+tau.^2).*sinb.*sinh(tau.*beta));
end
    