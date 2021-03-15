function f = K(tau,betac,beta)
    [k1,k2] = k1k2(tau,betac);
    K = k1.*sin(beta).*sinh(tau*beta)+k2.*(cos(beta).*sinh(tau.*beta)-tau.*sin(beta).*cosh(tau*beta));
    f = K;
end