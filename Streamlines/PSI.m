% tau has to be integrate in this way, cause tau is in power and cannot use
% a matrix to represent it.
% Note that when doing the integration, upper bound of tau should be as
% large as possible. For betac = pi/20, tau_max = 1500; for betac = pi/2,
% tau_max = 450.
% Also, tau is dependent on the surface tension profile, steeper the
% profile, larger the tau_max.

function f = PSI(betac,beta,alpha)
    s = 0;
    dtau = 0.1;
    nodes = 30;                     % Number of nodes should equal or less than the size of parallel pool.
    spmd(nodes)
    for tau = ((labindex-1)*30+dtau/2):dtau:(30*labindex-dtau/2)           
        s = s + dtau*(K(tau,betac,beta).*GegenC_myself(tau,cosh(alpha)));
    end
    end
    g = 0;
    for i = 1:1:nodes
        g = g + s{i};
    end
    f = (cosh(alpha)+cos(beta)).^(-1.5).*g;
end