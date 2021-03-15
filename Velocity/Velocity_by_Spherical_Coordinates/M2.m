function f = M2(tau,betac)
    M2 = (tau^2+1)*(cos(betac)*sinh(tau*betac)+tau*sin(betac)*cosh(tau*betac));
    f = M2;
end