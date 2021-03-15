function f = U_alpha(R,mu,betac,alpha,beta)

    f1 = 3/2*(cosh(alpha)+cos(beta)).^(-0.5).*sin(beta)./sinh(alpha).*Ualpha1(R,mu,betac,alpha,beta);
    f2 = (cosh(alpha)+cos(beta)).^0.5./sinh(alpha).*Ualpha2(R,mu,betac,alpha,beta);
    
    f = f1 + f2;
end