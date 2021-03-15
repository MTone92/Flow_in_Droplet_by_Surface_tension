function f = U_beta(R,mu,betac,alpha,beta)

    f1 = 3/2*(cosh(alpha)+cos(beta)).^(-0.5).*Ubeta1(R,mu,betac,alpha,beta);
    f2 = -(cosh(alpha)+cos(beta)).^0.5.*Ubeta2(R,mu,betac,alpha,beta);
    
    f = f1 + f2;
end