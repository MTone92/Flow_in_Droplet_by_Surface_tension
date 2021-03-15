% This function is used to calculate Legendre Polynomial
% P_-1/2+itau(cosh(alpha)).

function f = GegenP_myself(tau,x)
    da = pi/10000;
    s = 0;
    for a = 0.5*da:da:(pi-0.5*da)
        s = s + da.*(x+sqrt(x.^2-1).*cos(a)).^(-0.5-1i*tau);
    end
    
    f = real(1./pi.*s);
end