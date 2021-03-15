function f = Ubeta2(R,mu,betac,alpha,beta)
    
    nodes = 4;
    cosha = cosh(alpha);
    s2 = 0;
    dtau = 0.1;
    spmd(nodes)
        for tau = ((labindex-1)*3+0.05):dtau:(labindex*3-0.05)
            s2 = s2 - K(R,mu,tau,betac,beta).*GegenP_myself(tau,cosha).*dtau;
        end
    end
    
    f = 0
    for i = 1:1:nodes
        f = f + s2{i};
    end
end