function f = M3(tau,betac)
    M3 = (sin(betac)*sinh(tau*betac))/(cos(betac)*sinh(tau*betac)-tau*sin(betac)*cosh(tau*betac));
    f = M3;
end