function [k1,k2] = k1k2(tau,betac)
    k1 = N1(tau)*N2(tau,betac)/(M1(tau,betac)+M2(tau,betac)*M3(tau,betac));
    k2 = -k1*M3(tau,betac);
end