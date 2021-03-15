function f = Ualpha1(R,mu,betac,alpha,beta)
    
    nodes = 4;
    cosha = cosh(alpha);
    s1 = 0;
    dtau = 0.1;
    spmd(nodes)
        for tau = ((labindex-1)*3+0.05):dtau:(labindex*3-0.05)
            s1 = s1 + K(R,mu,tau,betac,beta).*GegenC_myself(tau,cosha).*dtau;
        end
    end
    
    f = 0
    for i = 1:1:nodes
        f = f + s1{i};
    end

end