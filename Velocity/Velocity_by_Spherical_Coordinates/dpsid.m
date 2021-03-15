% This function is use do calculate (d PSI)/(d theta).
% 
%As you can see that there are a lot of calculation, but we won't use spmd
% or parfor, which means that no parellel computing here, because nest spmd
% or nest parfor is not allowed.

function [dpsidtheta,dpsidr,dpsidthetadr] = dpsid(R,mu,betac,r,theta)
    cosha = coshalpha(R,r,theta);
    sinha = sinhalpha(R,r,theta);
    cosb = cosbeta(R,r,theta);
    dcoshadtheta = dcoshalphadtheta(R,r,theta);
    dcoshadr = dcoshalphadr(R,r,theta);
    dcosbdtheta = dcosbetadtheta(R,r,theta);
    dcosbdr = dcosbetadr(R,r,theta);
    dbdtheta = dbetadtheta(R,r,theta);
    dbdr = dbetadr(R,r,theta);
    beta = real(acos(cosb));        % Just in case of some wired complex value.
    dcosbdthetadr = dcosbetadthetadr(R,r,theta);
    dcoshadthetadr = dcoshalphadthetadr(R,r,theta);
    dbdthetadr = dbetadthetadr(R,r,theta);
    
    dtau = 0.1;
    s1 = 0;
    s2 = 0;
    s3 = 0;
    s4 = 0;
    s5 = 0;
    s6 = 0;
    
    nodes = 30;
    spmd(nodes)
    for tau = ((labindex-1)*10+0.05):dtau:(labindex*10-0.05)
        s1 = s1 + K(R,mu,tau,betac,beta).*GegenC_myself(tau,cosha).*dtau;
        s2 = s2 + dKdbeta(R,mu,tau,betac,r,theta).*GegenC_myself(tau,cosha).*dtau;
        s3 = s3 + K(R,mu,tau,betac,beta).*GegenP_myself(tau,cosha).*dtau;
        s4 = s4 + dKdbetadbeta(R,mu,tau,betac,r,theta).*GegenC_myself(tau,cosha).*dtau;
        s5 = s5 + dKdbeta(R,mu,tau,betac,r,theta).*GegenP_myself(tau,cosha).*dtau;
        s6 = s6 + K(R,mu,tau,betac,beta).*GegenC_myself(tau,cosha).*(tau^2+0.25)./sinha.^2.*dtau;
    end
    end
    f1 = 0;
    f2 = 0;
    f3 = 0;
    f4 = 0;
    f5 = 0;
    f6 = 0;
    for i = 1:1:nodes
        f1 = f1 + s1{i};
        f2 = f2 + s2{i};
        f3 = f3 + s3{i};
        f4 = f4 + s4{i};
        f5 = f5 + s5{i};
        f6 = f6 + s6{i};
    end
    
    dpsidtheta = (-1.5*(cosha+cosb).^(-2.5).*(dcosbdtheta+dcoshadtheta)).*f1+(cosha+cosb).^(-1.5).*(dbdtheta.*f2-dcoshadtheta.*f3);
    dpsidr = (-1.5*(cosha+cosb).^(-2.5).*(dcosbdr+dcoshadr)).*f1+(cosha+cosb).^(-1.5).*(dbdr.*f2-dcoshadr.*f3);
    dpsidthetadr = (15/4*(cosha+cosb).^(-3.5).*(dcoshadr+dcosbdr).*(dcoshadtheta+dcosbdtheta)-1.5*(cosha+cosb).^(-2.5).*(dcosbdthetadr+dcoshadthetadr)).*f1 ...
        -1.5*(cosha+cosb).^(-2.5).*(dcosbdtheta+dcoshadtheta).*(dbdr.*f2-dcoshadr.*f3) ...
        -1.5*(cosha+cosb).^(-2.5).*(dcosbdr+dcoshadr).*(dbdtheta.*f2-dcoshadtheta.*f3) ...
        +(cosha+cosb).^(-1.5).*(dbdr.*dbdtheta.*f4+dbdthetadr.*f2-dbdtheta.*dcoshadr.*f5-dbdr.*dcoshadtheta.*f5-dcoshadr.*dcoshadtheta.*f6-dcoshadthetadr.*f3);
    
end
    