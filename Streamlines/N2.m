% Explaination: Since the results keep same with additional interval x =
% (10,50), it's not necessary to add the rest small numbers.
% This N2 is to calculate the velocity distribution in real situation, with
% peak value appears at r = 1/3 R.

function f = N2(tau,betac)
    s = 0;                  % Initiate integration.
    st = 1000;              % Strength of Gaussian distribution. Exp(-st*(r-p1)^2).
    dalpha = 0.001;         % Integration step. Fine step for accuracy. If 'st<100', dx1=0.01.
    p1 = 1/3;               % Peak of the Gaussian distribution (Non-dimensional).

    for alpha = dalpha/2:dalpha:(12-dalpha/2)
        s = s+(sinh(alpha)/(cosh(alpha)+cos(betac))-(p1))...
            *((cosh(alpha)*cos(betac)+1)/(cosh(alpha)+cos(betac))^2.5)...
            *exp(-st*(sinh(alpha)/(cosh(alpha)+cos(betac))-(p1))^2)*GegenC_myself(tau,cosh(alpha))*dalpha;
    end
    
    f = -2*st*s;            % -2*st is coming for the derivatives (see derivation Notes).
end