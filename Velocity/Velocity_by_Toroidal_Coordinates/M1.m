function f = M1(tau,betac)
    M1 = (tau^2-1)*sin(betac)*sinh(tau*betac)+2*tau*cos(betac)*cosh(tau*betac);
    f = M1;
end