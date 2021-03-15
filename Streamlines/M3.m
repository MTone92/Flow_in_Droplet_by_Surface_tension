function f = M3(tau,betac)
    M3 = 1./(cot(betac)-tau.*coth(tau.*betac));
    f = M3;
end